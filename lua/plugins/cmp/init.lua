local function config()
    -- Set up nvim-cmp.
    local cmp_status_ok, cmp = pcall(require, "cmp")
    if not cmp_status_ok then
        return
    end

    local snip_status_ok, luasnip = pcall(require, "luasnip")
    if not snip_status_ok then
        return
    end
    -- vim.g.UltiSnipsSnippetDirectories = { "UltiSnips", "snippets/ultisnips" }
    -- vim.g.UltiSnipsExpandTrigger = "<tab>"

    require("luasnip.loaders.from_vscode")
        .load({ paths = "~/.config/nvim/lua/plugins/cmp/snippets/vscode" })

    require("luasnip.loaders.from_vscode").load()

    local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    local has_words_before_new = function()
        if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
    end

    local lspkind = require 'lspkind'

    local function get_snippet()
        return {
            expand = function(args)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        }
    end

    local function get_custom_window_bordered()
        local default = cmp.config.window.bordered()
        default.pumheight = 450
        default.max_width = 450
        default.max_height = 900
        return default
    end

    local function get_mapping()
        -- default behavior
        local cr = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = true
        })

        -- copilot behavior
        if conf.user.copilot.enabled then
            cr = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Insert,
                select = true,
            })
        end

        return cmp.mapping.preset.insert({
            ["<C-k>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-j>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
            ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-5), { "i", "c" }),
            ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(5), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
            ["<C-x>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ["<C-e>"] = cr,
            ["<Tab>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                    -- vim.cmd('startinsert')
                elseif cmp.visible() and has_words_before_new() then
                    -- cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    -- cmp.complete()
                    cr()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),
        })
    end

    local function get_sources()
        local firstGroup = {
            { name = 'nvim_lsp',                group_index = 0 },
            { name = 'luasnip',                 group_index = 1 },
            { name = 'vsnip',                   group_index = 1 },
            { name = 'snippy',                  group_index = 1 },
            -- { name = 'lsp',                     group_index = 3 },
            { name = 'path',                    group_index = 2 },
            { name = 'nvim_lsp_signature_help', group_index = 3 },
            { name = 'buffer',                  group_index = 3 },
            { name = 'emoji',                   group_index = 3 },
            { name = 'calc',                    group_index = 3 },
            { name = 'treesitter',              group_index = 3 },
        }

        if conf.user.copilot.enabled then
            table.insert(firstGroup, 2, { name = 'copilot', group_index = 2 })
        end
        if conf.user.codeium.enabled then
            table.insert(firstGroup, 2, { name = 'codeium', group_index = 2 })
        end

        return cmp.config.sources(firstGroup)
    end

    local function get_format()
        return {
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
                symbol_map = { Copilot = "", Codeium = "" },
                mode = 'symbol_text',
                max_width = 80,
                ellipsis_char = '...',
                show_labelDetails = true,
                menu = {},
            }),
        }
    end

    local function get_sorting()
        local comparators = {
            -- Below is the default comparitor list and order for nvim-cmp
            cmp.config.compare.offset,
            -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
            cmp.config.compare.exact,
            cmp.config.compare.score,
            cmp.config.compare.recently_used,
            function(a1, a2)
                if a1 == "Codeium" and a2 == "Method" then
                    return false
                end
                return true
            end,
            function(a1, a2)
                if a1 == "Method" and a2 == "Variable" or a2 == "Function" or a2 == "Class" or a2 == "Interface" then
                    return true
                end
                return false
            end,
            cmp.config.compare.locality,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        }

        if conf.user.copilot.enabled then
            table.insert(comparators, require("copilot_cmp.comparators").prioritize)
        end


        return {
            priority_weight = 2,
            comparators = comparators
        }
    end


    local function get_confirm_opts()
        local opts = {
            select = true,
        }
        if conf.user.copilot.enabled then
            opts.behavior = cmp.ConfirmBehavior.Replace
        end
        return opts
    end


    cmp.setup({
        completion = {
            completeopt = table.concat(vim.opt.completeopt:get(), ","),
            -- autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged }
            --BUG: Workaround for autocomplete not displaying all options
            autocomplete = false
        },
        --BUG: Workaround for autocomplete not displaying all options
        -- performance = {
        --     debounce = 1000,
        --     throttle = 1000
        -- },
        experimental = {
            -- ghost_text = { hl_group = "CmpGhostText" }
            ghost_text = false
        },
        snippet = get_snippet(),
        mapping = get_mapping(),
        sources = get_sources(),
        formatting = get_format(),
        sorting = get_sorting(),
        confirm_opts = get_confirm_opts(),
        window = {
            completion = get_custom_window_bordered(),
            documentation = get_custom_window_bordered(),
        },
    })
    --BUG: Workaround for autocomplete not displaying all options
    vim.cmd([[
        augroup CmpDebounceAuGroup
            au!
            au TextChangedI * lua require("plugins.cmp.debounce").debounce()
        augroup end
    ]])
end

return {
    { 'hrsh7th/cmp-nvim-lsp' }, -- lsp completions
    { 'hrsh7th/cmp-buffer' },   -- buffer completions
    { 'hrsh7th/cmp-path' },     -- path completions
    { 'hrsh7th/cmp-cmdline' },  -- cmdline completions
    {
        'L3MON4D3/LuaSnip',
        version = "v2.*",
        build = "make install_jsregexp"
    },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'dcampos/nvim-snippy' },
    { 'dcampos/cmp-snippy' },
    { "rafamadriz/friendly-snippets" },
    { 'hrsh7th/nvim-cmp',            config = config }, -- completion plugin
}

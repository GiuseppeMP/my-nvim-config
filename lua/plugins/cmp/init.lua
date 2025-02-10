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

    require("luasnip.loaders.from_vscode").load()
    require("luasnip.loaders.from_vscode")
        .load({ paths = "~/.config/nvim/lua/plugins/cmp/snippets/vscode" })

    require("plugins.cmp.snippets.luasnips")

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
        -- return {
        --     expand = function(fallback)
        --         local suggestion = require('supermaven-nvim.completion_preview')
        --         if suggestion.has_suggestion() then
        --             suggestion.on_accept_suggestion()
        --         elseif luasnip.expandable() then
        --             luasnip.expand()
        --             fallback()
        --         end
        --     end
        -- }
        return {
            expand = function(args)
                -- vim.snippet.expand(args.body)
                luasnip.lsp_expand(args.body) -- For `luasnip` users.
            end,
        }
    end

    local function get_custom_window_bordered()
        local default = cmp.config.window.bordered()
        default.pumheight = 650
        default.max_width = 350
        default.max_height = 650
        return default
    end

    local function get_mapping()
        -- default behavior
        local cr = cmp.mapping.confirm({
            behavior = cmp.SelectBehavior.Insert,
            select = true
        })
        local select = cmp.mapping.confirm({
            behavior = cmp.SelectBehavior.Select,
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
            ["<C-;>"] = cmp.mapping(function(_)
                -- close CMP
                cmp.close()
                -- Request completions immediately.
                require('codeium.virtual_text').complete()
            end, { "i", "c" }),
            ["<Tab>"] = cmp.mapping(function(fallback)
                -- I known, you're reading this 1 == 2 now thinking I'm crazy.
                if 1 == 2 then
                elseif cmp.visible() and has_words_before_new() and not luasnip.expand_or_jumpable() then
                    select()
                elseif luasnip.jumpable(1) then
                    luasnip.jump(1)
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_locally_jump()
                elseif cmp.visible() and luasnip.jumpable() then
                    select()
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
        local mainGroup = {
            { name = 'nvim_lsp', group_index = 0, max_item_count = 10 },
            { name = 'path',     group_index = 1, max_item_count = 5 },
            {
                name = 'luasnip',
                option = {
                    show_autosnippets = true,
                    use_show_condition = true,
                },
                group_index = 1,
                max_item_count = 5
            },
            -- { name = 'vsnip',                   group_index = 2, max_item_count = 2 },
            -- { name = 'snippy',                  group_index = 2, max_item_count = 2 },
            { name = "dotenv",                  group_index = 2, max_item_count = 5 },
            { name = 'emoji',                   group_index = 0, max_item_count = 5 },
            { name = 'calc',                    group_index = 0, max_item_count = 5 },
            { name = 'nvim_lsp_signature_help', group_index = 1, max_item_count = 5 },
            { name = 'buffer',                  group_index = 2, max_item_count = 5 },
            { name = 'treesitter',              group_index = 3, max_item_count = 5 },
        }

        if conf.user.copilot.enabled then
            table.insert(mainGroup, 1, { name = 'copilot', group_index = 1 })
        end
        if conf.user.supermaven.enabled then
            table.insert(mainGroup, 1, { name = 'supermaven', group_index = 1, max_item_count = 5 })
        end
        if conf.user.codeium.enabled then
            table.insert(mainGroup, 1, { name = 'codeium', group_index = 1, max_item_count = 3 })
        end

        return cmp.config.sources(mainGroup)
    end

    local ELLIPSIS_CHAR = '…'
    local MAX_LABEL_WIDTH = 40
    local MIN_LABEL_WIDTH = 40

    local function fixLspKindWidth(entry, vim_item)
        local label = vim_item.abbr
        local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
        if truncated_label ~= label then
            vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
        elseif string.len(label) < MIN_LABEL_WIDTH then
            local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
            vim_item.abbr = label .. padding
        end
        return vim_item
    end

    local function get_format()
        return {
            -- fields = { "kind", "abbr", "menu" },
            fields = { "kind", "abbr" },
            format = lspkind.cmp_format({
                symbol_map = {
                    Copilot = "",
                    Supermaven = "",
                    Codeium = "",
                },
                -- mode = 'symbol_text',
                mode = 'symbol',
                maxwidth = 60,
                ellipsis_char = '...',
                show_labelDetails = false,
                menu = {},
                before = fixLspKindWidth
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
            -- Codeium ranker
            function(a1, a2)
                if a2 == "Codeium" and a1 == "Method" then
                    return true
                end
                return false
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

    -- `/` `?` cmdline setup.
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        completion = { completeopt = 'menu,menuone,noselect' },
        sources = {
            { name = 'buffer' },
        },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        completion = { completeopt = 'menu,menuone,noselect' },
        sources = cmp.config.sources(
            { { name = 'path' } },
            { { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } } }
        ),
    })

    cmp.setup({
        enabled = function()
            local buftype = vim.api.nvim_buf_get_option(0, "buftype")
            local ft = vim.bo.filetype

            if buftype == "prompt" then
                return false
            end

            if ft == "chatgpt-input" then
                return false
            end

            return true
        end,
        -- Causes fetchin_timeout in snippets (maybe open PR)
        -- performance = {
        --     max_view_entries = 25,
        --     fetchin_timeout = 500,
        --     debounce = 1000
        -- },
        completion = {
            completeopt = "menu,menuone,noselect",
        },
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
    { "SergioRibera/cmp-dotenv" },
    { 'hrsh7th/nvim-cmp',            config = config, dependencies = { "hrsh7th/cmp-emoji" } }
}

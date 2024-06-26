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
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-2), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(2), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete()),
            ["<C-d>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- ['<CR>'] = cmp.mapping.confirm({ select = false }),
            ["<C-e>"] = cr,
            ["<Tab>"] = cmp.mapping(function(fallback)
                if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                    vim.cmd('startinsert')
                elseif cmp.visible() and has_words_before_new() then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    -- cmp.complete()
                else
                    -- vim.diagnostic.goto_next()
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    -- vim.diagnostic.goto_prev()
                    fallback()
                end
            end, { "i", "s" }),
        })
    end

    local function get_sources()
        local snip_sources = {
            { name = 'nvim_lsp', keyword_length = 3 }, -- For nvim lsp users
            { name = 'luasnip' },                      -- For luasnip users.
            { name = 'vsnip' },                        -- For vsnip users.
            -- { name = 'ultisnips' },                    -- For ultisnips users.
            { name = 'snippy' },                       -- For snippy users.
        }

        local other_sources = {
            { name = 'buffer' },
            { name = 'path' },
            { name = 'lsp',   keyword_length = 3 },
        }

        if conf.user.copilot.enabled then
            table.insert(snip_sources, 1, { name = 'copilot', group_index = 2 })
        end
        if conf.user.codeium.enabled then
            table.insert(snip_sources, 1, { name = 'codeium', group_index = 2 })
        end


        return cmp.config.sources(snip_sources, other_sources)
    end



    -- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "green" })

    local function get_format()
        return {
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
                symbol_map = { Copilot = "", Codeium = "" },
                mode = 'symbol',
                max_width = 80,
                ellipsis_char = '...',
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
            completeopt = "menu,menuone,noinsert",
            -- autocomplete = true
        },
        experimental = {
            ghost_text = {
                hl_group = "CmpGhostText",
            },
        },
        snippet = get_snippet(),
        mapping = get_mapping(),
        sources = get_sources(),
        formatting = get_format(),
        sorting = get_sorting(),
        confirm_opts = get_confirm_opts(),
        window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
        },
    })
end



return {
    -- cmp for autocompletion
    { 'hrsh7th/cmp-nvim-lsp' },                 -- lsp completions
    { 'hrsh7th/cmp-buffer' },                   -- buffer completions
    { 'hrsh7th/cmp-path' },                     -- path completions
    { 'hrsh7th/cmp-cmdline' },                  -- cmdline completions
    { 'hrsh7th/nvim-cmp',    config = config }, -- completion plugin
    -- cmp vsnip users
    -- {
    --     'hrsh7th/cmp-vsnip',
    --         lazy = false,
    --         config = lazy_rtp
    -- },
    -- {
    --     'hrsh7th/vim-vsnip',
    --         lazy = false,
    --         event = 'VeryLazy',
    --         config = lazy_rtp
    -- },
    -- cmp  luasnip users
    {
        'L3MON4D3/LuaSnip',
        version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        build = "make install_jsregexp"
    },
    { 'saadparwaiz1/cmp_luasnip' },
    -- cmp ultisnips users
    -- { 'SirVer/ultisnips' },
    -- { 'quangnguyen30192/cmp-nvim-ultisnips' },
    -- cmp snippy users
    { 'dcampos/nvim-snippy' },
    { 'dcampos/cmp-snippy' },
    -- cmp snippet collections
    { "rafamadriz/friendly-snippets" },
}

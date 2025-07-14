local drawWithMiniIcons = function()
    return {
        -- border = 'single',
        border = 'rounded',
        draw = {
            components = {
                kind_icon = {
                    text = function(ctx)
                        local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                        return kind_icon
                    end,
                    -- (optional) use highlights from mini.icons
                    highlight = function(ctx)
                        local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                        return hl
                    end,
                },
                kind = {
                    -- (optional) use highlights from mini.icons
                    highlight = function(ctx)
                        local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                        return hl
                    end,
                }
            },
        },
    }
end

local drawWithDevIcons = function()
    return {
        -- border = 'single',
        border = 'rounded',
        draw = {
            components = {
                kind_icon = {
                    text = function(ctx)
                        local icon = ctx.kind_icon
                        if vim.tbl_contains({ "Path" }, ctx.source_name) then
                            local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                            if dev_icon then
                                icon = dev_icon
                            end
                        else
                            icon = require("lspkind").symbolic(ctx.kind, {
                                mode = "symbol",
                            })
                        end

                        return icon .. ctx.icon_gap
                    end,

                    -- Optionally, use the highlight groups from nvim-web-devicons
                    -- You can also add the same function for `kind.highlight` if you want to
                    -- keep the highlight groups in sync with the icons.
                    highlight = function(ctx)
                        local hl = ctx.kind_hl
                        if vim.tbl_contains({ "Path" }, ctx.source_name) then
                            local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                            if dev_icon then
                                hl = dev_hl
                            end
                        end
                        return hl
                    end,
                }
            },
        }
    }
end

return {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets', 'L3MON4D3/LuaSnip' },
    version = '1.*',
    config = function()
        -- require("luasnip.loaders.from_vscode").load()
        require("luasnip.loaders.from_vscode")
            .load({ paths = "~/.config/nvim/lua/plugins/cmp/snippets/vscode" })

        require("plugins.cmp.snippets.luasnips")

        require("blink.cmp").setup(
            {
                enabled    = function()
                    -- print(vim.bo.filetype)
                    return not vim.tbl_contains({ "chatgpt-input", "AvanteInput", "AvantePromptInput" }, vim.bo.filetype)
                end,
                -- keymap = { preset = 'default' },
                keymap     = {
                    -- set to 'none' to disable the 'default' preset
                    preset = 'none',
                    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
                    ['<C-e>'] = { 'hide', 'fallback' },

                    ['<Tab>'] = {
                        function(cmp)
                            if cmp.snippet_active() then
                                return cmp.accept()
                            else
                                return cmp.select_and_accept()
                            end
                        end,
                        'snippet_forward',
                        'fallback'
                    },
                    ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

                    ['<Up>'] = { 'select_prev', 'fallback' },
                    ['<Down>'] = { 'select_next', 'fallback' },
                    ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
                    ['<C-n>'] = { 'show', 'select_next', 'fallback_to_mappings' },
                },

                appearance = {
                    nerd_font_variant = 'mono'
                },

                completion = {
                    trigger       = {
                        show_in_snippet = true
                    },
                    list          = {
                        selection = {
                            preselect = function(ctx) return not require('blink.cmp').snippet_active({ direction = 1 }) end,
                        }
                    },
                    menu          = drawWithDevIcons(),
                    -- Show documentation when selecting a completion item
                    documentation = { auto_show = true, auto_show_delay_ms = 500, window = { border = 'rounded' } },

                    -- Display a preview of the selected item on the current line
                    ghost_text    = { enabled = false },
                },
                signature  = { enabled = true, window = { border = 'rounded' } },

                -- Default list of enabled providers defined so that you can extend it
                -- elsewhere in your config, without redefining it, due to `opts_extend`
                -- sources = {
                --     default = { 'lsp', 'path', 'snippets', 'buffer' },
                -- },
                snippets   = { preset = 'luasnip' },
                sources    = {
                    default = { 'lsp', 'path', 'snippets', 'buffer', 'codeium' },
                    providers = {
                        codeium = {
                            name = 'Codeium',
                            module = 'codeium.blink',
                            async = true,
                            transform_items = function(ctx, items)
                                for _, item in ipairs(items) do
                                    item.kind_icon = ''
                                    item.kind_name = 'Codeium'
                                end
                                return items
                            end
                        },
                    },
                },

                -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
                -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
                -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
                --
                -- See the fuzzy documentation for more information
                fuzzy      = { implementation = "prefer_rust_with_warning" },
                cmdline    = {
                    keymap = { preset = 'inherit' },
                    completion = { menu = { auto_show = true } },
                },
            }
        )
    end
}

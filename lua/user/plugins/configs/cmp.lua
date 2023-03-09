-- Set up nvim-cmp.
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    return
end
vim.g.UltiSnipsSnippetDirectories={"UltiSnips", "snippets/ultisnips"}
vim.g.UltiSnipsExpandTrigger="<tab>"

require("luasnip.loaders.from_vscode").load({ paths = "~/.config/nvim/snippets/vscode" })
require("luasnip.loaders.from_vscode").lazy_load()


local lspkind = require'lspkind'

local function get_snippet()
    return {
        expand = function(args)
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    }
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function get_mapping()
    return cmp.mapping.preset.insert({
        -- ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        },
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "v", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "v", "s" }),
    })
end

local function get_sources()
    return cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'vsnip' }, -- For vsnip users.
            { name = 'luasnip' }, -- For luasnip users.
            { name = 'ultisnips' }, -- For ultisnips users.
            { name = 'snippy' }, -- For snippy users.
        }, {
            { name = 'buffer' },
            { name = 'path' },
            { name = 'lsp' },
        })
end



local function get_format()
    return {
        fields = { "kind", "abbr", "menu" },
        format = lspkind.cmp_format({
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        }),
    }
end


cmp.setup({
    snippet = get_snippet(),
    mapping = get_mapping(),
    sources = get_sources(),
    formatting = get_format(),
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
})

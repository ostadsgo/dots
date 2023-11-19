local lspconfig = require('lspconfig')

local keymap = vim.keymap
local on_attach = function(client, bufnr)
    local opts = { noremap = true, silent = true, buffer = bufnr }
    keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    keymap.set("n", "gr", vim.lsp.buf.references, opts)
    keymap.set("n", "K", vim.lsp.buf.hover, opts)
    keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
    keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
    keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
end
-- Lua
lspconfig.lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local servers = { 'ruff_lsp', 'pyright', 'gopls', 'rust_analyzer', 'taplo' }

for _, server in ipairs(servers) do
    lspconfig[server].setup {}
end

-- Mason
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = servers,
    automatic_installation = true,
})

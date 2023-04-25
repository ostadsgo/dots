local setup, lspconfig = pcall(require, "lspconfig")
if not setup then
	return
end

local keymap = vim.keymap
local format = function()
	vim.lsp.buf.format({ async = true })
end

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	keymap.set("n", "gr", vim.lsp.buf.references, opts)
	keymap.set("n", "K", vim.lsp.buf.hover, opts)
	keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	keymap.set("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "<leader>=", format, opts)
end
local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

-- LSP config for languages
-- Lua
lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Python
lspconfig["pyright"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

--  Javascript / Typescript
lspconfig["tsserver"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

--  Go lang
lspconfig["gopls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
})
--  Rust
lspconfig["rust_analyzer"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
	settings = {
		["rust-analyzer"] = {},
	},
})

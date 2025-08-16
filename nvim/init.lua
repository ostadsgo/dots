-- ------------------
-- options
-- -------------------
-- File handling --
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- UI/Display --
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.guicursor = ""
vim.g.netrw_banner = 0
vim.opt.winborder = "single"
vim.opt.cmdheight = 0
vim.opt.laststatus = 0
vim.opt.scrolloff = 5

-- Search --
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation --
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Completion --
vim.opt.completeopt = { "menuone", "noselect" }

-- Window management --
vim.opt.splitbelow = true
vim.opt.splitright = true

-- color
vim.opt.background = "dark"

-- -------------
-- COMMANDS
-- -------------
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- ------------------
-- Keybindings
-- ------------------
-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move & dup line
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("n", "<A-.>", ":t.<CR>")
-- Select
vim.keymap.set({ "n", "v" }, "<Leader>;", "V")
vim.keymap.set({ "n", "n" }, "<Leader>a", "ggVG")
-- buffer
vim.keymap.set("n", "<Leader>e", ":Hex<CR>")
vim.keymap.set("n", "<Leader>q", ":bd!<CR>")
vim.keymap.set("n", "<Leader>w", ":w<CR>")
-- paste from sys clipboard
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+P')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')
vim.keymap.set({ "n", "v" }, "<Leader>y", [["+y]])
vim.keymap.set("n", "<Leader>Y", [["+y$]])

-- INSERT --
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<A-k>", "<C-o>O")
vim.keymap.set("i", "<A-j>", "<C-o>o")
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")

-- Move line
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- -----------------------
-- LAZY PACKAGE MANAGER
-- -----------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- -----------------------
-- PLUGINS
-- -----------------------
-- List of Plugins
local plugins = {
	{ "neovim/nvim-lspconfig" },
	{ "mason-org/mason.nvim", opts = {} },
	{ "echasnovski/mini.pick", version = "*", opts = {} },
	{ "karb94/neoscroll.nvim", opts = {} },
	{ "sphamba/smear-cursor.nvim", opts = {} },
	{ "mg979/vim-visual-multi", branch = "master" },
	-- colors
	{ "aktersnurra/no-clown-fiesta.nvim" },
} -- end of list of plugins
require("lazy").setup({ spec = plugins, checker = { enabled = false } })

-- -----------------------
-- Mini Picker
-- -----------------------
vim.keymap.set("n", "<Leader>ff", "<cmd>Pick files<CR>")
vim.keymap.set("n", "<Leader>fg", "<cmd>Pick grep<CR>")
vim.keymap.set("n", "<Leader>fs", "<cmd>Pick grep_live<CR>")
vim.keymap.set("n", "<Leader>fb", "<cmd>Pick buffers<CR>")
vim.keymap.set("n", "<Leader>fh", "<cmd>Pick help<CR>")

-- -----------------------
-- LSP
-- -----------------------
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- keys
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>=", vim.lsp.buf.format)

-- activate lsps
vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "html", "cssls", "emmet_language_server", "djlsp", "bashls" })

-- Lua config
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

-- html config
vim.lsp.config("html", { capabilities = capabilities })

-- css config
vim.lsp.config("cssls", { capabilities = capabilities })

-- debug
vim.diagnostic.config({ virtual_text = true })
vim.lsp.set_log_level("debug")

-- -----------------------
-- Colorscheme
-- -----------------------
vim.cmd.colorscheme("no-clown-fiesta")

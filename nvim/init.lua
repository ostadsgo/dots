--- ------------------
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
vim.keymap.set("n", "<A-.>", ":t.<CR>")
-- Selec
vim.keymap.set({ "n", "v" }, "<Leader>;", "V")
vim.keymap.set({ "n", "v" }, "<Leader>a", "ggVG")
-- buffer
vim.keymap.set("n", "<Leader>e", ":Hex<CR>")
vim.keymap.set("n", "<Leader>q", ":bd!<CR>")
vim.keymap.set("n", "<Leader>w", ":w<CR>")
-- paste from sys clipboard
vim.keymap.set("n", "<Leader>Y", '"+y$')
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+P')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- INSERT --
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<A-k>", "<C-o>O")
vim.keymap.set("i", "<A-j>", "<C-o>o")
-- copy line down
vim.keymap.set("i", "<A-.>", "<C-o>:t.<CR>")

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
	{
		"dmtrKovalenko/fff.nvim",
		build = function()
            require("fff.download").download_or_build_binary()
        end,
    },
	{ "karb94/neoscroll.nvim", opts = {} },
	{ "sphamba/smear-cursor.nvim", opts = {} },
	{ "mg979/vim-visual-multi", branch = "master" },
	-- colors
	{ "ostadsgo/dark-clown" },
} -- end of list of plugins
require("lazy").setup({ spec = plugins, checker = { enabled = false } })

-- -----------------------
-- FFF
-- -----------------------
vim.keymap.set("n", "<Leader>ff", "<cmd>FFFFind<CR>")
require('fff').setup({
    layout = {
        height = 0.5,
        width = 0.4,
        prompt_position = 'top',
    },
    preview = {
        enabled = false,
    }
})

-- -----------------------
-- LSP
-- -----------------------
-- keys
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<Leader>=", vim.lsp.buf.format)

-- activate lsps
vim.lsp.enable({ "lua_ls", "ty", "ts_ls", "emmet_language_server", "djlsp", "bashls" })

-- Lua config
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

-- debug
vim.diagnostic.config({ virtual_text = true })
vim.lsp.set_log_level("debug")

-- -----------------------
-- Colorscheme
-- -----------------------
vim.cmd.colorscheme("no-clown-fiesta")

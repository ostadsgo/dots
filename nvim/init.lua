-- ------------------
-- options
-- -------------------
-- File handling
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- UI/Display
vim.opt.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showcmd = false
vim.opt.wrap = false
vim.opt.guicursor = ""
vim.opt.syntax = "on"
vim.g.netrw_banner = 0

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Completion
vim.opt.completeopt = { "menuone", "noselect" }

-- Window management
vim.opt.splitbelow = true
vim.opt.splitright = true

-- color
vim.opt.background = "dark"
vim.cmd.colorscheme("default")
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000"})
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#000000" })
vim.api.nvim_set_hl(0, "StatusLine", { bg = nil})
vim.api.nvim_set_hl(0, "StatusLineNC", { bg = nil})

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
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Nav window
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-j>", "<C-w>j")
-- dup line
vim.keymap.set("n", "<A-.>", ":t.<CR>")
-- Move cursor to end and beginning
vim.keymap.set("n", "<A-l>", "$")
vim.keymap.set("n", "<A-h>", "^")
-- move up and down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
-- V-Line
vim.keymap.set("n", "<Leader>;", "V")
-- Select whole file
vim.keymap.set("n", "<Leader>a", "ggVG")
-- buffer
vim.keymap.set("n", "<Leader>W", ":wa<CR>")
vim.keymap.set("n", "<Leader>e", ":Hex<CR>")
vim.keymap.set("n", "<Leader>q", ":bd<CR>")
vim.keymap.set("n", "<Leader>r", ":source $MYVIMRC<CR>")
vim.keymap.set("n", "<Leader>w", ":w<CR>")
-- paste from sys clipboard
vim.keymap.set("n", "<Leader>p", '"+p')
vim.keymap.set("n", "<Leader>P", '"+P')
-- delete without change register
vim.keymap.set("n", "<leader>d", '"_d')
-- keep cursor pos after yank
vim.keymap.set("n", "<Leader>y", '"+yy<ESC>')
vim.keymap.set("n", "<Leader>Y", '"+y$<ESC>')
-- Exec lua code
vim.keymap.set("n", "<Leader>x", ":.lua<CR>")
vim.keymap.set("n", "<C-Space>", ":silent !tmux neww tmuxer<CR>", { noremap = true, silent = true })

-- Insert
vim.keymap.set("i", "jk", "<Esc>")
-- Move cursor to end and beginning
vim.keymap.set("i", "<A-l>", "<C-o>$")
vim.keymap.set("i", "<A-h>", "<C-o>^")
vim.keymap.set("i", "<A-j>", "<C-o>o")
vim.keymap.set("i", "<A-k>", "<C-o>O")
vim.keymap.set("i", "<C-Space>", "<C-x><C-o>")

-- Visual Mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
-- keyp cur pos
vim.keymap.set("v", "y", "y<ESC>")
-- exec Lua code
vim.keymap.set("v", "<Leader>X", ":lua<CR>")
-- V-Line
vim.keymap.set("v", "<Leader>;", "V")
-- Select whole file
vim.keymap.set("v", "<Leader>a", "ggVG")
-- paste from sys clipboard
vim.keymap.set("v", "<Leader>p", '"+p')
-- delete without change register
vim.keymap.set("v", "<leader>d", '"_d')
-- keep cursor pos after yank
vim.keymap.set("v", "<Leader>y", '"+ygv<ESC>')

-- Move highlighted lines up / down
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

-- lsp
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "<leader>=", vim.lsp.buf.format)

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
  -- fuzzy finder
  {
    "ibhagwan/fzf-lua",
    opts = {
      winopts = { row = 1, col = 0, height = 0.4, width = 1, preview = { hidden = true } },
      files = {
        find_opts = [[-type f \! -path '*/.git/*' \! -path '*/.venv/*' \! -path '*/__pycache__/*' \! -path '*/node_modules/*' ]],
      },
    },
    keys = {
      { "<Leader>f", ":lua require('fzf-lua').files()<CR>" },
      { "<Leader>b", ":lua require('fzf-lua').buffers()<CR>" },
      { "<Leader>g", ":lua require('fzf-lua').grep()<CR>" },
      { "<Leader>s", ":lua require('fzf-lua').live_grep()<CR>" },
    },
  },
  -- lsp
  { "neovim/nvim-lspconfig" },
  -- Mason to install tools
  {"mason-org/mason.nvim", opts = {}},
  -- multicusor
  { "mg979/vim-visual-multi", branch = "master" },
} -- end of list of plugins
require("lazy").setup({ spec = plugins, checker = { enabled = false } })

-- -----------------------
-- LSP
-- -----------------------
vim.lsp.enable({ "lua_ls", "pyright", "ruff", "emmet_language_server" })
vim.diagnostic.config({ virtual_text = true })
vim.lsp.set_log_level("debug")
vim.lsp.config("lua_ls", { settings = { Lua = { diagnostics = { globals = { "vim" } } } } })

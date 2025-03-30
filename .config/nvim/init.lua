-- ------------------
-- options
-- -------------------
-- vim.hl = vim.highlight
vim.opt.backup = false
vim.opt.cmdheight = 0
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.mouse = "a"
vim.opt.writebackup = false
vim.opt.termguicolors = true
vim.opt.wrap = false
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.timeoutlen = 1000
vim.opt.updatetime = 5
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.cursorline = true
vim.opt.colorcolumn = "89"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shortmess:append("c")
vim.opt.numberwidth = 2
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 10
vim.opt.guicursor = ""
vim.opt.showmode = true
vim.opt.signcolumn = "no"
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.cmd.colorscheme("darkland")

-- ------------------
-- Keybindings
-- ------------------
function map(m, n, k, o)
  vim.keymap.set(m, n, k, o)
end

local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- remap ESC
map("i", "jk", "<Esc>", opts)
map({ "n", "v" }, "<Leader>a", "ggVG", opts)
map({ "n", "v" }, "<Leader>;", "V", opts)
map("n", "<Leader>e", ":Rex<CR>", opts)
map("n", "<Leader>x", ":luafile %<CR>", opts)

-- Move lines
map({ "n", "v" }, "<A-j>", ":m .+1<CR>==", opts)
map({ "n", "v" }, "<A-k>", ":m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Indent
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move to end & begining of line
map({ "n", "v" }, "<A-l>", "$", opts)
map({ "n", "v" }, "<A-h>", "^", opts)
map("i", "<A-l>", "<C-o>$", opts)
map("i", "<A-h>", "<C-o>^", opts)

-- buffer (waq --> save all quit  qa! --> close all buf quit vim)
map("n", "<Leader>l", ":bn<CR>", opts)
map("n", "<Leader>h", ":bp<CR>", opts)
map("n", "<Leader>w", ":w<CR>", opts)
map("n", "<Leader>W", ":wa<CR>", opts)
map("n", "<Leader>q", ":bd<CR>", opts)

-- Split
map("n", "<C-Up>", ":resize +2<CR>", opts)
map("n", "<C-Down>", ":resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize -2<CR>", opts)
map("n", "<C-Left>", ":vertical resize +2<CR>", opts)

-- register
map({ "n", "v", "x" }, "<Leader>y", '"+ygv<ESC>', opts)
map({ "n", "v" }, "<Leader>p", '"+p', opts)
map({ "n", "v" }, "<leader>d", '"_d', opts)
map("n", "x", '"_x', opts)
map("n", "X", '"_X', opts)
map("v", "y", "ygv<ESC>", opts)

-- Newline below in insert mode
map("i", "<C-Return>", "<C-o>o", opts)
map("i", "<S-Return>", "<C-o>O", opts)
map("i", "<C-BS>", "<C-w>", opts)

-- new line in normal mode without going to insert mode
map("n", "<C-Return>", "o<ESC>", opts)
map("n", "<S-Return>", "O<ESC>", opts)

-- Plugins
map({ "n", "v" }, "<Leader>ff", ":Pick files<CR>")
map({ "n", "v" }, "<Leader>fb", ":Pick buffers<CR>")
map({ "n", "v" }, "<Leader>fs", ":Pick grep_live<CR>")

-- inc and dec
map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- reload neovim -- not working beacuse lazy is here!!!
map("n", "<Leader>r", ":source $MYVIMRC<CR>", opts)

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
plugins = {
  { "echasnovski/mini.pick", version = false, config = true },
}

require("lazy").setup({
  spec = plugins,
  checker = { enabled = false },
})

-- -------------
-- COMMANDS
-- -------------
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    pcall(vim.treesitter.stop)
  end,
})


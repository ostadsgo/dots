-- ------------------
-- options
-- -------------------
-- hellow
local options = {
  backup = false,
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  mouse = "a",
  writebackup = false,
  termguicolors = true,
  wrap = false,
  conceallevel = 0,
  fileencoding = "utf-8",
  encoding = "utf-8",
  timeoutlen = 1000,
  updatetime = 5,
  hlsearch = false,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  autoindent = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  expandtab = true,
  cindent = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  scrolloff = 3,
  number = true,
  relativenumber = true,
  guicursor = "",
}

for key, value in pairs(options) do
  vim.opt[key] = value
end

vim.g.netrw_banner = 0
vim.cmd.colorscheme("darkland")

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

function remap(mode, maps)
  local o = { noremap = true, silent = mode ~= "c" }
  for _, key in ipairs(maps) do
    vim.keymap.set(mode, key[1], key[2])
  end
end

local nmaps = {
  -- centerize workflow
  { "<C-d>", "<C-d>zz" },
  { "<C-u>", "<C-u>zz" },
  { "<C-f>", "<C-f>zz" },
  { "<C-b>", "<C-b>zz" },
  { "<C-o>", "<C-o>zz" },
  { "<C-i>", "<C-i>zz" },
  { "*", "*zz" },
  { "#", "#zz" },
  { "n", "nzz" },
  { "N", "Nzz" },
  { "g;", "g;zz" },
  { "g,", "g,zz" },
  -- Resize window
  { "<C-Down>", ":resize -2<CR>" },
  { "<C-Left>", ":vertical resize +2<CR>" },
  { "<C-Right>", ":vertical resize -2<CR>" },
  { "<C-Up>", ":resize +2<CR>" },
  -- create empty line
  { "<C-Return>", "o<ESC>" },
  { "<S-Return>", "O<ESC>" },
  -- dup line
  { "<C-,>", ":t.<CR>" },
  -- Move cursor to end and beginning
  { "<C-l>", "$" },
  { "<C-h>", "^" },
  -- move up and down
  { "<C-n>", ":m .+1<CR>==" },
  { "<C-p>", ":m .-2<CR>==" },
  -- V-Line
  { "<Leader>;", "V" },
  -- Select whole file
  { "<Leader>a", "ggVG" },
  -- buffer
  { "<Leader>W", ":wa<CR>" },
  { "<Leader>e", ":Sexplore<CR>" },
  { "<Leader>q", ":bd<CR>" },
  { "<Leader>r", ":source $MYVIMRC<CR>" },
  { "<Leader>w", ":w<CR>" },
  -- paste from sys clipboard
  { "<Leader>p", '"+p' },
  { "<Leader>P", '"+P' },
  -- delete without change register
  { "<leader>d", '"_d' },
  -- keep cursor pos after yank
  { "<Leader>y", '"+ygv<ESC>' },
  -- Exec lua code 
  { "<Leader>x", ":.lua<CR>" },
  { "X", '"_X' },
  { "x", '"_x' },
  -- mini picker
  { "<Leader>fb", ":Pick buffers<CR>" },
  { "<Leader>ff", ":Pick files<CR>" },
  { "<Leader>fs", ":Pick grep_live<CR>" },
}

local imaps = {
  { "jk", "<Esc>" },
  { "<C-BS>", "<C-w>" },
  { "<C-l>", "<C-o>x" },
  { "<C-Return>", "<C-o>o" },
  { "<S-Return>", "<C-o>O" },
}

local vmaps = {
  -- better indent
  { ">", ">gv" },
  { "<", "<gv" },
  -- keyp cur pos
  { "y", "ygv<ESC>" },
  -- move up and down
  { "<C-j>", ":move '>+1<CR>gv=gv" },
  { "<C-k>", ":move '<-2<CR>gv=gv" },
  -- exec Lua code
  { "<Leader>X", ":lua<CR>" },
  -- V-Line
  { "<Leader>;", "V" },
  -- Select whole file
  { "<Leader>a", "ggVG" },
  -- paste from sys clipboard
  { "<Leader>p", '"+p' },
  -- delete without change register
  { "<leader>d", '"_d' },
  -- keep cursor pos after yank
  { "<Leader>y", '"+ygv<ESC>' },
}

local cmaps = {
  { "<A-b>", "<Left>" },
  { "<A-f>", "<Right>" },
  { "<C-n>", "<Down>" },
  { "<C-p>", "<Up>" },
}

remap("n", nmaps)
remap("i", imaps)
remap("v", vmaps)
remap("c", cmaps)

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

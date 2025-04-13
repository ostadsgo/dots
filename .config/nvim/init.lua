-- ------------------
-- options
-- -------------------
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

local function paste_preserve_cursor()
  local col = vim.fn.col(".")
  vim.api.nvim_feedkeys("p", "n", false)
  vim.defer_fn(function()
    vim.fn.cursor(vim.fn.line("."), col)
  end, 10)
end

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
  { "<C-i>", "<C-i>zz" },
  { "<C-o>", "<C-o>zz" },
  { "{", "{zz" },
  { "}", "}zz" },
  { "n", "nzz" },
  { "N", "Nzz" },
  { "*", "*zz" },
  { "#", "#zz" },
  { "%", "%zz" },
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
  { "<A-,>", ":t.<CR>" },
  -- to end and begin
  { "<A-h>", "^" },
  { "<A-l>", "$" },
  -- move up and down
  { "<A-j>", ":m .+1<CR>==" },
  { "<A-k>", ":m .-2<CR>==" },
  -- V-Line
  { "<Leader>;", "V" },
  -- Select whole file
  { "<Leader>a", "ggVG" },
  -- buffer
  { "<Leader>W", ":wa<CR>" },
  { "<Leader>e", ":Rex<CR>" },
  { "<Leader>q", ":bd<CR>" },
  { "<Leader>r", ":source $MYVIMRC<CR>" },
  { "<Leader>w", ":w<CR>" },
  -- smart paste
  { "p", paste_preserve_cursor },
  -- paste from sys clipboard
  { "<Leader>p", '"+p' },
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
  { "<A-h>", "<Left>" },
  { "<A-l>", "<Right>" },
  { "<C-BS>", "<C-w>" },
  { "<A-BS>", "<C-o>diw" },
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
  { "<A-j>", ":move '>+1<CR>gv=gv" },
  { "<A-k>", ":move '<-2<CR>gv=gv" },
  -- to end and begin
  { "<A-h>", "^" },
  { "<A-l>", "$" },
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
  { "<M-h>", "<Left>" },
  { "<M-j>", "<Down>" },
  { "<M-k>", "<Up>" },
  { "<M-l>", "<Right>" },
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

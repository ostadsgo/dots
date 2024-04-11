local options = {
  -- general
  backup = false,
  cmdheight = 1,
  completeopt = { "menuone", "noselect" },
  mouse = "a",
  pumheight = 10,
  writebackup = false,
  termguicolors = true,
  wrap = false,
  conceallevel = 0,
  fileencoding = "utf-8",
  encoding = "utf-8",
  timeoutlen = 1000,
  undofile = true,
  updatetime = 50,

  -- Search
  hlsearch = false,
  incsearch = true,
  ignorecase = true,

  -- indent / tabs
  smartcase = true,
  autoindent = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,

  -- side column
  cursorline = true,
  colorcolumn = "89",
  number = true,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  scrolloff = 10,
  sidescrolloff = 10,
  guicursor = "",
  background = "dark",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- map leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

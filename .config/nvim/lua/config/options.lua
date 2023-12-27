local options = {
  backup = false,
  cmdheight = 1,
  -- mostly just for cmp
  completeopt = { "menuone", "noselect" },
  -- so that `` is visible in markdown files
  conceallevel = 0,
  -- the encoding written to a file
  fileencoding = "utf-8",
  -- highlight all matches on previous search pattern
  hlsearch = false,
  -- highligh search term as typing
  incsearch = true,
  -- ignore case in search patterns
  ignorecase = true,
  -- allow the mouse to be used in neovim
  mouse = "a",
  -- pop up menu height
  pumheight = 10,
  -- we don't need to see things like -- INSERT -- anymore
  showmode = false,
  -- always show tabs
  --showtabline = 4,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  -- time to wait for a mapped sequence to complete (in milliseconds)
  timeoutlen = 1000,
  -- enable persistent undo
  undofile = true,
  -- more colors
  termguicolors = true,
  -- faster completion (4000ms default)
  updatetime = 50,
  -- if a file is being edited by another program
  writebackup = false,
  -- convert tabs to spaces
  expandtab = true,
  -- the number of spaces inserted for each indentation
  shiftwidth = 4,
  tabstop = 4,
  cursorline = true,
  colorcolumn = "89",
  number = true,
  relativenumber = true,
  numberwidth = 2,
  signcolumn = "yes",
  wrap = false,
  scrolloff = 8,
  sidescrolloff = 8,
  guicursor = "",
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- vim.g.cursorshape["insert"] = "block"
-- netrw tree like directory view
vim.g.netrw_liststyle = 3
-- transparent background
vim.opt.shortmess:append("F")
vim.cmd("set shortmess+=F")
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

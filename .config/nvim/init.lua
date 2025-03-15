-- ------------------
-- options
-- -------------------
vim.hl = vim.highlight
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
vim.opt.shortmess:append('c')
vim.opt.numberwidth = 2
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10
vim.opt.guicursor = ""
vim.opt.showmode = true
vim.opt.signcolumn = "no"
vim.cmd.colorscheme("darkland")

-- ------------------
-- Keybindings
-- ------------------
local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- remap ESC
vim.keymap.set("i", "jk", "<Esc>", opts)
vim.keymap.set({ "n", "v" }, "<Leader>a", "gg<S-v>G", opts)
vim.keymap.set({ "n", "v" }, "<Leader>;", "V", opts)
vim.keymap.set("n", "<Leader>e", ":Exp<CR>", opts)
vim.keymap.set("n", "<Leader>x", ":so<CR>", opts)

-- Center on vertical movement
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-i>", "<C-i>zz", opts)
vim.keymap.set("n", "<C-o>", "<C-o>zz", opts)
vim.keymap.set("n", "g;", "g;zz", opts)
vim.keymap.set("n", "g,", "g,zz", opts)
vim.keymap.set("n", "G", "Gzz", opts)
vim.keymap.set("n", "N", "Nzz", opts)
vim.keymap.set("n", "n", "nzz", opts)
vim.keymap.set("n", "}", "}zz", opts)
vim.keymap.set("n", "{", "{zz", opts)
vim.keymap.set("n", "*", "*zz", opts)
vim.keymap.set("n", "#", "#zz", opts)
vim.keymap.set("n", "%", "%zz", opts)

-- 
-- Move lines
vim.keymap.set({ "n", "v" }, "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set({ "n", "v" }, "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Indent
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move to end & begining of line
vim.keymap.set({ "n", "i", "v" }, "<A-h>", "^", opts)
vim.keymap.set({ "n", "i", "v" }, "<A-l>", "$", opts)

-- buffer (waq --> save all quit  qa! --> close all buf quit vim)
vim.keymap.set("n", "<S-l>", ":bn<CR>", opts)
vim.keymap.set("n", "<S-h>", ":bp<CR>", opts)
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<Leader>W", ":wa<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":bd<CR>", opts)

-- Split
vim.keymap.set("n", "<Tab>", "<C-w>w", opts) -- switch split
vim.keymap.set("n", "<A-Up>", ":resize +3<CR>", opts)
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<A-Left>", ":vertical resize +2<CR>", opts)

-- register
vim.keymap.set({ "n", "v", "x" }, "<Leader>y", '"+ygv<ESC>', opts)
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p', opts)
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d', opts)
vim.keymap.set("n", "x", '"_x', opts)
vim.keymap.set("n", "X", '"_X', opts)
vim.keymap.set("v", "y", "ygv<ESC>", opts) 

-- Newline below in insert mode
vim.keymap.set("i", "<C-Return>", "<C-o>o", opts)
vim.keymap.set("i", "<S-Return>", "<C-o>O", opts)
vim.keymap.set("i", "<C-BS>", "<C-w>", opts)

-- new line in normal mode without going to insert mode
vim.keymap.set("n", "<C-Return>", "o<ESC>", opts)
vim.keymap.set("n", "<S-Return>", "O<ESC>", opts)

-- Plugins
vim.keymap.set({ "n", "v" }, "<Leader>ff", ":Pick files<CR>")
vim.keymap.set({ "n", "v" }, "<Leader>fb", ":Pick buffers<CR>")
vim.keymap.set({ "n", "v" }, "<Leader>fs", ":Pick grep_live<CR>")

-- inc and dec
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- -------------
-- Commands
-- -------------
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.stop)
    end
})

-- -----------------------
-- Lazy package manager
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
-- Plugins
-- -----------------------
require("lazy").setup({
  -- Install plugin here.
  spec = {
    -- Mini Picker
    { "echasnovski/mini.pick", version = false, config = true },
  }, -- end of spec

  -- Lazy Config
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})


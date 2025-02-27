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
vim.keymap.set({ "n", "v" }, "<Leader>;", "<S-V>", opts)
vim.keymap.set("n", "<Leader>e", ":Exp<CR>", opts)

-- move highlighted lines
vim.keymap.set({ "n", "v" }, "<A-j>", ":m .+1<CR>==", opts)
vim.keymap.set({ "n", "v" }, "<A-k>", ":m .-2<CR>==", opts)
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- move to end or begining of line
vim.keymap.set({ "n", "i", "v" }, "<A-h>", "^", opts)
vim.keymap.set({ "n", "i", "v" }, "<A-l>", "$", opts)

-- buffer
vim.keymap.set("n", "<Leader>w", ":w<CR>", opts)
vim.keymap.set("n", "<Leader>l", ":bn<CR>", opts)
vim.keymap.set("n", "<Leader>h", ":bp<CR>", opts)
vim.keymap.set("n", "<Leader>q", ":bd<CR>", opts)
vim.keymap.set("n", "<Leader>Q", ":bd!<CR>", opts)

-- resize
vim.keymap.set("n", "<A-Up>", ":resize +3<CR>", opts)
vim.keymap.set("n", "<A-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<A-Left>", ":vertical resize +2<CR>", opts)

-- copy/past to/from system clipboard
vim.keymap.set({ "n", "v", "x" }, "<Leader>y", '"+y', opts)
vim.keymap.set({ "n", "v", "x" }, "<Leader>Y", '"+Y', opts)
vim.keymap.set({ "n", "v", "x" }, "<Leader>p", '"+p', opts)
vim.keymap.set({ "n", "v", "x" }, "<Leader>P", '"+P', opts)
vim.keymap.set({ "n", "v", "x" }, "<Leader>d", '"_d', opts)
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

vim.keymap.set("n", "<Leader>x", ":so<CR>")

-- newline below in insert mode
vim.keymap.set("i", "<S-Return>", "<C-o>o")
vim.keymap.set("i", "<C-S-Return>", "<C-o>O")
-- vim.keymap.set("i", "<C-S-l>", "<C-o>de")
-- char oper to the right side
vim.keymap.set("i", "<C-l>", "<Delete>") -- del a char
vim.keymap.set("i", "<C-S-l>", "<C-o>de") -- del a rest of the word
vim.keymap.set("i", "<C-k>", "<C-o>S") -- del a rest of the word
vim.keymap.set("i", "<C-d>", "<C-o>D") -- delete line

-- command mode keymap
vim.cmd("cnoremap <A-k> <up>")
vim.cmd("cnoremap <A-j> <down>")

-- Plugin specifics
vim.keymap.set({ "n", "v" }, "<Leader>ff", ":Pick files<CR>")
vim.keymap.set({ "n", "v" }, "<Leader>fb", ":Pick buffers<CR>")
vim.keymap.set({ "n", "v" }, "<Leader>fs", ":Pick grep_live<CR>")

-- -------------
-- Commands
-- -------------
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
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

    -- another plugin goes here ...
  }, -- end of spec

  -- Lazy Config
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = false },
})



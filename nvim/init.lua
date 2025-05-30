-- ------------------
-- options
-- -------------------
-- File handling
vim.opt.backup = false          
vim.opt.writebackup = false     
vim.opt.swapfile = false        

-- UI/Display
vim.opt.termguicolors = true    
vim.opt.laststatus = 0          
vim.opt.number = true           
vim.opt.relativenumber = true   
vim.opt.ruler = false           
vim.opt.showcmd = false         
vim.opt.cmdheight = 1           
vim.opt.wrap = false            
vim.opt.guicursor = ""          
vim.opt.syntax = "on"          

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

-- Text display
vim.opt.conceallevel = 0      

vim.g.netrw_banner = 0
vim.cmd.colorscheme("darkland")
vim.treesitter.stop()

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

-- Resize window
vim.keymap.set("n", "<C-Down>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>")
vim.keymap.set("n",  "<C-Right>", ":vertical resize -2<CR>")
vim.keymap.set("n",  "<C-Up>", ":resize +2<CR>")
-- create empty line
vim.keymap.set("n", "<A-j>", "o<ESC>")
vim.keymap.set("n", "<A-k>", "O<ESC>")
-- dup line
vim.keymap.set("n", "<A-,>", ":t.<CR>")
-- Move cursor to end and beginning
vim.keymap.set("n", "<A-l>", "$")
vim.keymap.set("n", "<A-h>", "^")
-- move up and down
vim.keymap.set("n", "<A-n>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-p>", ":m .-2<CR>==")
-- V-Line
vim.keymap.set("n", "<Leader>;", "V")
-- Select whole file
vim.keymap.set("n", "<Leader>a", "ggVG")
-- buffer
vim.keymap.set("n", "<Leader>W", ":wa<CR>")
vim.keymap.set("n", "<Leader>e", ":Exp<CR>")
vim.keymap.set("n", "<Leader>q", ":bd<CR>")
vim.keymap.set("n", "<Leader>r", ":source $MYVIMRC<CR>" )
vim.keymap.set("n", "<Leader>w", ":w<CR>")
-- paste from sys clipboard
vim.keymap.set("n", "<Leader>p", '"+p')
vim.keymap.set("n", "<Leader>P", '"+P')
-- delete without change register
vim.keymap.set("n", "<leader>d", '"_d')
-- keep cursor pos after yank
vim.keymap.set("n", "<Leader>y", '"+ygv<ESC>')
-- Exec lua code 
vim.keymap.set("n", "<Leader>x", ":.lua<CR>")
-- Mini picker
vim.keymap.set("n", "<Leader>ff", ":lua require('fzf-lua').files()<CR>" )
vim.keymap.set("n", "<Leader>fb", ":lua require('fzf-lua').buffers()<CR>" )
vim.keymap.set("n", "<Leader>fg", ":lua require('fzf-lua').grep()<CR>" )
vim.keymap.set("n", "<Leader>fs", ":lua require('fzf-lua').live_grep()<CR>" )


-- Insert
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "<A-BS>", "<C-w>")
-- delete char in the right side of the cursor
vim.keymap.set("i", "<C-l>", "<C-o>x")
-- Create empty line above / below
vim.keymap.set("i", "<A-j>", "<C-o>o")
vim.keymap.set("i", "<A-k>", "<C-o>O")
-- Move cursor to end and beginning
vim.keymap.set("i", "<A-l>", "<C-o>$")
vim.keymap.set("i", "<A-h>", "<C-o>^")
-- Visual Mode
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
-- keyp cur pos
vim.keymap.set("v", "y", "ygv<ESC>")
-- move up and down
vim.keymap.set("v", "<C-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<C-k>", ":move '<-2<CR>gv=gv")
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

-- Command Mode
vim.keymap.set("c", "<A-b>", "<Left>")
vim.keymap.set("c", "<A-f>", "<Right>")
vim.keymap.set("c", "<A-n>", "<Down>")
vim.keymap.set("c", "<A-p>", "<Up>")


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
  { "ibhagwan/fzf-lua", opts = { winopts = { row=1, col=0, height=.4, width=1, preview={ hidden=true } } } },
}
require("lazy").setup({ spec = plugins, checker = { enabled = false }, })


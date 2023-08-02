-- imports
local telescope = require("telescope.builtin")

-- Variables
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
local keyset = vim.keymap.set

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --------------------
--      NORMAL
-- -------------------
-- LEADER
keymap("n", "<leader>a", "gg<S-v>G", opts) -- select entire file
keymap("n", "<leader>;", "<S-V>", opts) -- visual line activate
keymap("x", "<leader>;", "<S-V>", opts) -- visual line deactive
keymap("n", "<leader>e", ":Exp<CR>", opts) -- open explorer
keymap("n", "<leader>l", ":bnext<CR>", opts) -- next buffer
keymap("n", "<leader>h", ":bprevious<CR>", opts) -- previous buffer
keymap("n", "<leader>q", ":bd<CR>", opts) -- delete buffer

-- copy/past to/from system clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)
keymap("v", "<leader>p", '"+p', opts)

-- delete without saving at clipboard
keymap("n", "<leader>d", '"_d', opts)
keymap("v", "<leader>d", '"_d', opts)

-- CTRL
keymap("n", "<C-h>", "<C-w>h", opts) -- focus left split
keymap("n", "<C-j>", "<C-w>j", opts) -- focus bottom split
keymap("n", "<C-k>", "<C-w>k", opts) -- focus top split
keymap("n", "<C-l>", "<C-w>l", opts) -- focus right split
keymap("n", "<C-d>", "<C-d>zz", opts) -- focus right split
keymap("n", "<C-u>", "<C-u>zz", opts) -- focus right split
-- resize split
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- Telescope
keyset("n", "<leader>ff", telescope.find_files, {})
keyset("n", "<leader>fg", telescope.git_files, {})
keyset("n", "<leader>ft", telescope.tags, {})
keyset("n", "<leader>fc", telescope.grep_string, {})
keyset("n", "<leader>fs", telescope.live_grep, {})
keyset("n", "<leader>fb", telescope.buffers, {})
keyset("n", "<leader>fh", telescope.help_tags, {})

----------------------
-- INSERT
----------------------
keymap("i", "jk", "<ESC>", opts) -- switch mode
keymap("i", "<C-BACKSPACE>", "<C-w>", opts) -- delete word 
keymap("i", "<C-Enter>", "<C-o>o", opts) -- delete word 

-------------------
-- VISUAL
-------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

--------------------
-- TERMINAL
--------------------
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

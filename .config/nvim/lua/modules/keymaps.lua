local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap
local keyset = vim.keymap.set
local telescope = require('telescope.builtin')

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- --------------------
--      NORMAL      
-- -------------------
-- LEADER
keymap("n", "<Leader>h", "<C-w>h", opts) -- focus left split
keymap("n", "<Leader>j", "<C-w>j", opts) -- focus bottom split
keymap("n", "<Leader>k", "<C-w>k", opts) -- focus top split
keymap("n", "<Leader>l", "<C-w>l", opts) -- focus right split
keymap("n", "<Leader>a", "gg<S-v>G", opts) -- select entire file

keymap("n", "<leader>o", "o<ESC>", opts) -- Empty line blow
keymap("n", "<leader>O", "O<ESC>", opts) -- Empty line above
keymap("n", "<Leader>,", ":nohl<CR>", opts) -- No highlight
keymap("n", "<leader>e", ":Lex 20<cr>", opts) -- open explorer

-- CTRL
keymap("n", "<C-Up>", ":resize +2<CR>", opts) -- resize split
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- SHIFT
keymap("n", "<S-l>", ":bnext<CR>", opts) -- next buffer
keymap("n", "<S-h>", ":bprevious<CR>", opts) -- previous buffer

-- Telescope
keyset('n', '<leader>ff', telescope.find_files, {})
keyset('n', '<leader>fg', telescope.live_grep, {})
keyset('n', '<leader>fb', telescope.buffers, {})
keyset('n', '<leader>fh', telescope.help_tags, {})
----------------------
-- INSERT      
----------------------

keymap("i", "jk", "<ESC>", opts)  -- switch mode 

-- CTRL
keymap("i", "<C-BACKSPACE>", "<C-o>diw", opts) -- delete word backword
keymap("i", "<C-RETURN>", "<C-o>o", opts) -- Create line below
keymap("i", "<C-DELETE>", "<C-o>J", opts) -- Create line below

keymap("i", "<C-j>", "<C-o>j", opts) -- move cursor down
keymap("i", "<C-k>", "<C-o>k", opts) -- move cursor up
keymap("i", "<C-h>", "<C-o>h", opts) -- move cursor left 
keymap("i", "<C-l>", "<C-o>l", opts) -- move cursor right

-- ALT
keymap("i", "<A-RETURN>", "<C-o>O", opts) -- Create line above
keymap("i", "<A-k>", "<C-o>dd", opts) -- delete line
keymap("i", "<A-h>", "<C-o>B", opts) -- Move by word backword
keymap("i", "<A-l>", "<C-o>W", opts) -- Move by word forward
keymap("i", "<A-j>", "<C-o><S-v>y<C-o>p", opts) -- duplicate line



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


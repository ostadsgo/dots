-- Variables
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("", "<Space>", "<Nop>", opts)
-- --------------------
--      NORMAL
-- -------------------
-- Better vertical movment
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "<C-i>", "<C-i>zz", opts)
keymap("n", "<C-o>", "<C-o>zz", opts)
keymap("n", "g;", "g;zz", opts)
keymap("n", "g,", "g,zz", opts)
keymap("n", "G", "Gzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "}", "}zz", opts)
keymap("n", "{", "{zz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "%", "%zz", opts)

-- LEADER
keymap("n", "<leader>a", "gg<S-v>G", opts)
keymap("n", "<leader>;", "<S-V>", opts)
keymap("n", "<leader>ww", ":w<CR>", opts)
keymap("n", "<leader>ee", ":Exp<CR>", opts)
keymap("n", "<leader>so", ":source ~/.config/nvim/init.lua<cr>", opts)

-- copy/past to/from system clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", '"+Y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>p", '"+p', opts)
keymap("n", "<leader>P", '"+P', opts)
keymap("v", "<leader>p", '"+p', opts)
keymap("n", "<leader>d", '"_d', opts)

-- Buffer
keymap("n", "<leader>bl", ":bnext<CR>", opts)
keymap("n", "<leader>bh", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bd<CR>", opts)

-- Window
keymap("n", "<leader>wh", "<C-w>h", opts)
keymap("n", "<leader>wj", "<C-w>j", opts)
keymap("n", "<leader>wk", "<C-w>k", opts)
keymap("n", "<leader>wl", "<C-w>l", opts)
keymap("n", "<leader>w=", "<C-w>=", opts)

-- resize splited windows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)

-- Tabs
keymap("n", "<leader>tn", ":tabnew<CR>", opts)
keymap("n", "<leader>tx", ":tabclose<CR>", opts)
keymap("n", "<Leader>tn", ":tabnext<CR>", opts)
keymap("n", "<leader>tp", ":tabprevious<CR>", opts)

-- Quick fix list
keymap("n", "cn", ":cnext<CR>zz", opts)
keymap("n", "cp", ":cprevious<CR>zz", opts)
keymap("n", "co", ":copen<CR>zz", opts)
keymap("n", "cc", ":cclose<CR>zz", opts)

-- comment
keymap("n", "<C-/>", "gcc", { noremap = false })

-- Format
vim.keymap.set("n", "<space>f=", function()
    vim.lsp.buf.format({ async = true })
end, {})


----------------------
-- INSERT
----------------------
-- Escape
keymap("i", "jk", "<ESC>", opts)            -- switch mode
-- Delete word
keymap("i", "<C-BACKSPACE>", "<C-w>", opts) -- delete word
keymap("i", "<A-BACKSPACE>", "<C-w>", opts) -- delete word
-- create new line above and below
keymap("i", "<C-Enter>", "<C-o>o", opts)    -- create new line below
keymap("i", "<C-S-Enter>", "<C-o>M", opts)  -- create new line above
-- Move to begining and end of line
keymap("i", "<C-^>", "<C-o>^", opts)
keymap("i", "<C-$>", "<C-o>$", opts)
-- comment a code
keymap("i", "<C-/>", "<C-o>gcc", { noremap = false })

-------------------
-- VISUAL
-------------------
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<leader>d", '"_d', opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<leader>;", "<S-V>", opts) -- visual line activate
keymap("x", "<leader>a", "gg<S-v>G", opts)

-- comment
keymap("v", "<C-/>", "gcc", { noremap = false })

-- highlight on copy
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

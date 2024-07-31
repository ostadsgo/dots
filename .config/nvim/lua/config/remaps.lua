-- Variables
local opts = { noremap = true, silent = true }
local remap = vim.api.nvim_set_keymap
remap("", "<Space>", "<Nop>", opts)

-- --------------------
--      NORMAL
-- -------------------
-- Better vertical movement
remap("n", "<C-d>", "<C-d>zz", opts)
remap("n", "<C-u>", "<C-u>zz", opts)
remap("n", "<C-i>", "<C-i>zz", opts)
remap("n", "<C-o>", "<C-o>zz", opts)
remap("n", "g;", "g;zz", opts)
remap("n", "g,", "g,zz", opts)
remap("n", "G", "Gzz", opts)
remap("n", "N", "Nzz", opts)
remap("n", "n", "nzz", opts)
remap("n", "}", "}zz", opts)
remap("n", "{", "{zz", opts)
remap("n", "*", "*zz", opts)
remap("n", "#", "#zz", opts)
remap("n", "%", "%zz", opts)

-- Shortcuts
remap("n", "<Leader>a", "gg<S-v>G", opts)
remap("n", "<Leader>;", "<S-V>", opts)
remap("n", "<C-Enter>", "o<Esc>", opts)
remap("n", "<A-Enter>", "O<Esc>", opts)

-- copy/past to/from system clipboard
remap("n", "<Leader>y", '"+ygv', opts)
remap("n", "<Leader>Y", '"+Y', opts)
remap("n", "<Leader>p", '"+p', opts)
remap("n", "<Leader>P", '"+P', opts)
remap("n", "<Leader>d", '"_d', opts)

-- Editor
remap("n", "<Leader>er", ":source ~/.config/nvim/init.lua<cr>", opts)
remap("n", "<Leader>ee", ":Exp<CR>", opts)

-- Buffer (Current File)
remap("n", "<Leader>fl", ":bnext<CR>", opts)
remap("n", "<Leader>fh", ":bprevious<CR>", opts)
remap("n", "<Leader>fw", ":w<CR>", opts)
remap("n", "<Leader>fx", ":bd<CR>", opts)
remap("n", "<Leader>fq", ":bd!<CR>", opts)
remap("n", "<Leader>fe", ":Exp<CR>", opts)
-- Run python file
remap("n", "<Leader>fr", ":!python %<cr>", opts)
remap("n", "<Leader>f[", "<C-^>", opts)

-- Window / split
remap("n", "<Leader>wh", "<C-w>h", opts)
remap("n", "<Leader>wj", "<C-w>j", opts)
remap("n", "<Leader>wk", "<C-w>k", opts)
remap("n", "<Leader>wl", "<C-w>l", opts)
remap("n", "<Leader>w=", "<C-w>=", opts)
remap("n", "<Leader>wr", "<C-w>r", opts)
remap("n", "<Leader>wq", "<C-w>q", opts)
remap("n", "<Leader>wo", "<C-w>o", opts)
remap("n", "<Leader>ss", ":split<CR>", opts)
remap("n", "<Leader>sv", ":vsplit<CR>", opts)
remap("n", "<Leader>sx", ":close<CR>", opts)

-- resize splited windows
remap("n", "<C-Up>", ":resize +2<CR>", opts)
remap("n", "<C-Down>", ":resize -2<CR>", opts)
remap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
remap("n", "<C-Left>", ":vertical resize -1<CR>", opts)

-- Tabs
remap("n", "<Leader>tt", ":tabnew<CR>", opts)
remap("n", "<Leader>tx", ":tabclose<CR>", opts)
remap("n", "<Leader>tn", ":tabnext<CR>", opts)
remap("n", "<Leader>tp", ":tabprevious<CR>", opts)
remap("n", "<Leader>to", ":tabnew %<CR>", opts)
remap("n", "<Leader>1", "1gt", opts)
remap("n", "<Leader>2", "2gt", opts)
remap("n", "<Leader>3", "3gt", opts)
remap("n", "<Leader>4", "4gt", opts)
remap("n", "<Leader>5", "5gt", opts)
remap("n", "<Leader>6", "6gt", opts)
remap("n", "<Leader>7", "7gt", opts)
remap("n", "<Leader>8", "8gt", opts)
remap("n", "<Leader>9", "9gt", opts)

-- Quick fix list
remap("n", "<Leader>co", ":copen<CR>zz", opts)
remap("n", "<Leader>cn", ":cnext<CR>zz", opts)
remap("n", "<Leader>cp", ":cprevious<CR>zz", opts)
remap("n", "<Leader>cc", ":cclose<CR>zz", opts)

-- comment
remap("n", "<C-/>", "gcc", { noremap = false })

-- Format
vim.keymap.set("n", "<space>f=", function()
  vim.lsp.buf.format({ async = true })
end, {})

----------------------
-- INSERT
----------------------
-- Escape
remap("i", "jk", "<ESC>", opts)
remap("i", "<C-Enter>", "<C-o>o", opts)
remap("i", "<A-Enter>", "<C-o>O", opts)
remap("i", "<C-BACKSPACE>", "<C-w>", opts)
remap("i", "<A-BACKSPACE>", "<C-w>", opts)
remap("i", "<C-6>", "<C-o>^", opts)
remap("i", "<C-4>", "<C-o>$", opts)
remap("i", "<C-/>", "<C-o>gcc", { noremap = false })

-------------------
-- VISUAL
-------------------
-- copy/paste from/to sys clipbord
remap("v", "<Leader>y", '"+ygv<Esc>', opts)
remap("v", "<Leader>p", '"+p`]', opts)
remap("v", "<Leader>d", '"_d', opts)

-- Stay in indent mode
remap("v", "<", "<gv", opts)
remap("v", ">", ">gv", opts)

-- Move text up and down
remap("v", "<A-j>", ":m .+1<CR>==", opts)
remap("v", "<A-k>", ":m .-2<CR>==", opts)

-- keep cursor at yanked position.
remap("v", "y", "ygv<Esc>", opts)
remap("v", "<C-/>", "gcc", { noremap = false })

-- Move text up and down
remap("x", "J", ":move '>+1<CR>gv-gv", opts)
remap("x", "K", ":move '<-2<CR>gv-gv", opts)
remap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
remap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
remap("x", "<Leader>;", "<S-V>", opts) -- visual line activate
remap("x", "<Leader>a", "gg<S-v>G", opts)

-- highlight on copy
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

--- ------------------
-- options
-- -------------------
-- File handling --
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- number line
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.wrap = false
vim.opt.guicursor = ""
vim.g.netrw_banner = 0

vim.opt.cmdheight = 0
vim.opt.statusline = "[%{toupper(mode())}]  %f  %m"

-- scroll
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true

-- Search --
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Indentation --
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.cindent = true

-- Completion --
vim.opt.completeopt = { "menuone", "noselect" }

-- Window management --
vim.opt.splitbelow = true
vim.opt.splitright = true

-- color
vim.treesitter.stop()
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.cmd.colorscheme("darkshade")


-- ----------------------
-- COMMANDS / FUNCTIONS
-- ----------------------
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "YankHighlight", timeout = 150 })
	end,
})

local function format_file()
	local ft = vim.bo.filetype

	if ft == "python" then
		vim.cmd("silent !black --quiet %")
	elseif ft == "lua" then
		vim.cmd("silent !stylua %")
	else
		vim.notify("No formatter for filetype: " .. ft, vim.log.levels.ERROR)
	end
	vim.cmd("edit!")
end
-- ------------------
-- Keybindings
-- ------------------

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Duplicated line
vim.keymap.set("n", "<A-.>", ":copy .<CR>")
vim.keymap.set("v", "<A-.>", ":copy . -1<CR>gv")
vim.keymap.set("i", "<A-.>", "<C-o>:copy .<CR>")

-- Select
vim.keymap.set({ "n", "v" }, "<Leader>;", "V")
vim.keymap.set({ "n", "v" }, "<Leader>a", "ggVG")

-- Buffer
vim.keymap.set("n", "<Leader>e", ":Hex<CR>")
vim.keymap.set("n", "<Leader>q", ":bd!<CR>")
vim.keymap.set("n", "<Leader>w", ":wa<CR>")
vim.keymap.set("n", "<Leader>b", ":buffers<CR>")
vim.keymap.set("n", "<Leader>=", format_file)

-- Center me
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")

-- Copy / Past
vim.keymap.set("n", "<Leader>Y", '"+y$')
vim.keymap.set({ "n", "v" }, "<Leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<Leader>p", '"+p')
vim.keymap.set({ "n", "v" }, "<Leader>P", '"+P')
vim.keymap.set({ "n", "v" }, "<leader>d", '"_d')

-- INSERT --
vim.keymap.set("i", "jk", "<Esc>")

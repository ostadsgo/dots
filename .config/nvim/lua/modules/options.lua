local options = {
	-- creates a backup file
	backup = false,
	-- more space in the neovim command line for displaying messages
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
	-- smart case
	smartcase = true,
	-- make indenting smarter again
	smartindent = true,
	-- force all horizontal splits to go below current window
	splitbelow = true,
	-- force all vertical splits to go to the right of current window
	splitright = true,
	-- creates a swapfile
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
	-- insert 2 spaces for a tab
	tabstop = 4,
	-- highlight the current line
	cursorline = true,
	-- column indicator
	colorcolumn = "90",
	-- set numbered lines
	number = true,
	-- set relative numbered lines
	relativenumber = true,
	-- set number column width to 2 {default 4}
	numberwidth = 4,
	-- always show the sign column, otherwise it would shift the text each time
	-- signcolumn = "yes",
	-- display lines as one long line
	wrap = false,
	-- is one of my fav
	scrolloff = 8,
	-- side scroll
	sidescrolloff = 8,
}

vim.opt.shortmess:append("c")

for k, v in pairs(options) do
	vim.opt[k] = v
end

-- transparent background
vim.cmd("highlight Normal ctermbg=NONE guibg=NONE")
vim.cmd("set whichwrap+=<,>,[,],h,l")
vim.cmd([[set iskeyword+=-]])
vim.cmd([[set formatoptions-=cro]]) -- TODO: this doesn't seem to work

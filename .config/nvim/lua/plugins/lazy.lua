local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

-- Plugin list
local opts = {}
local plugins = {
    -- common plugins
    { 'nvim-lua/plenary.nvim' },

    -- theming
    { "rebelot/kanagawa.nvim" },
    { "catppuccin/nvim",          name = "catppuccin" },
    { 'bluz71/vim-moonfly-colors' },
    { "folke/tokyonight.nvim" },
    { "ellisonleao/gruvbox.nvim"},
    { 'rose-pine/neovim', name = 'rose-pine' },

    { 'nvim-lualine/lualine.nvim' },
    -- tools
    { 'numToStr/Comment.nvim',    opts = {} },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },

    -- telescope
    { 'nvim-telescope/telescope.nvim',              branch = '0.1.x' },
    { 'nvim-telescope/telescope-fzf-native.nvim',   build = 'make' },

    -- lsp
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- treesitter
    { 'nvim-treesitter/nvim-treesitter' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },

}

require("lazy").setup(plugins, opts)

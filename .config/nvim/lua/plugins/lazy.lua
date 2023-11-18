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
opts = {}
plugins = {
    -- common plugins
    { 'nvim-lua/plenary.nvim' },

    -- theming
    { "rebelot/kanagawa.nvim" },
    { 'nvim-lualine/lualine.nvim' },
    { 'numToStr/Comment.nvim',                      opts = {} },

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

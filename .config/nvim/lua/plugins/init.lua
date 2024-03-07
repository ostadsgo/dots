return {
  -- core
  { "nvim-lua/plenary.nvim" },
  {
    "ostadsgo/no-clown-fiesta.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme no-clown-fiesta")
    end,
  },
  {
    "kdheepak/monochrome.nvim",
    config = function()
      -- vim.cmd("colorscheme monochrome")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
    end,
  },
  {
    "mg979/vim-visual-multi",
  },
}

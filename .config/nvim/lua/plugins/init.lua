return {
  -- core
  { "nvim-lua/plenary.nvim" },
  {
    "ostadsgo/no-clown-fiesta.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- vim.cmd("colorscheme no-clown-fiesta")
    end,
  },
  {
    "ostadsgo/darkland",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme darkland")
    end,
  },
}

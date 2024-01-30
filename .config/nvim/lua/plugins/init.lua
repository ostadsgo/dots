return {
  -- core
  { "nvim-lua/plenary.nvim" },
  -- colors
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "ostadsgo/no-clown-fiesta.nvim",
    lazy = false,
    priority = 1000,
    config = function()
     vim.cmd("colorscheme no-clown-fiesta")
    end,
  },
}

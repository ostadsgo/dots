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
    "mg979/vim-visual-multi",
    config = function()
      vim.cmd("let g:VM_highlight_matches = 'hi! link Search PmenuSel'")
    end,
  },
}

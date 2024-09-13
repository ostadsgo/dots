return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f=",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      sh = { "beautysh" },
      bash = { "beautysh" },
      zsh = { "beautysh" },
      fish = { "beautysh" },
      c = { "clang-format" },
      htmldjango = { "djlint" },
    },
    formatters = {
      c = {
        command = "clang-format",
        args = '--style="{BasedOnStyle: llvm, IndentWidth: 4}"',
      },
    },
  },
}

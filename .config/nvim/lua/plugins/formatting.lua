return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>=",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { { "prettierd", "prettier" } },
      bash = { "beautysh" },
      zsh = { "beautysh" },
      fish = { "beautysh" },
    },
  },
}

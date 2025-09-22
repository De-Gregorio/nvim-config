return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      rust = { "rustfmt" },
      toml = { "taplo" },   -- optional if you like formatting Cargo.toml
    },
    format_on_save = { timeout_ms = 2000, lsp_fallback = true },
  },
}

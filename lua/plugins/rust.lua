
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    ft = { "rust" },
    init = function()
      local ra_path = "/usr/bin/rust-analyzer"

      -- Try Mason codelldb first, else fall back to system lldb-vscode
      local mason = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/"
      local codelldb = mason .. "adapter/codelldb"
      local liblldb = mason .. "lldb/lib/liblldb.so"  -- adjust for macOS/Windows if needed
      local adapter
      if vim.uv.fs_stat(codelldb) then
        adapter = require("rustaceanvim.config").get_codelldb_adapter(codelldb, liblldb)
      else
        adapter = { type = "server", port = "${port}", executable = { command = "lldb-vscode" } }
      end

      vim.g.rustaceanvim = {
        tools = {
          hover_actions = { auto_focus = true },
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            highlight = "Comment",
          },
        },
        server = {
          cmd = { ra_path },
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              check = { command = "clippy" },
            },
          },
        },
        dap = { adapter = adapter },  -- <-- IMPORTANT: table, not function
      }
    end,
  },
}


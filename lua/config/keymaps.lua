-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<esc>")
vim.keymap.set("n", "Q", "gg0vG$", { desc = "highlight all file" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
-- ONE DAY ADD THE RENAME FUNCTIONALITY
-- vim.keymap.set("n", "<leaden>rN", vim.lsp.buf.rename, {desc = "Rename symbol"});
-- ONE DAY automatically run debug with the right file on f5 press

local dap = require("dap")

vim.keymap.set("n", "<F5>", function() dap.continue() end)
vim.keymap.set("n", "<leader>b", function() dap.toggle_breakpoint() end)
vim.keymap.set("n", "<F8>", function() dap.step_into() end)
vim.keymap.set("n", "<F9>", function() dap.step_over() end)
vim.keymap.set("n", "<F10>", function() dap.step_out() end)

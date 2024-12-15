-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set

map("n", "<leader>Nn", "A<CR>", { desc = "New line from end", silent = true })
map("n", "<leader>Nb", "i<CR>", { desc = "New line in place", silent = true })

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Tab switch buffer
-- keymap("n", "<Tab>", ":bnext<CR>", opts)
-- keymap("n", "<S-Tab>", ":bprevious<CR>", opts)

-- Misc operations group
keymap("n", "<leader>m", "/", { desc = "misc" })

if vim.fn.executable("lazydocker") == 1 then
  keymap("n", "<leader>md", function()
    Snacks.terminal("lazydocker", { esc_esc = false, ctrl_hjkl = false })
  end,
    {desc = "Lazydocker"})
end

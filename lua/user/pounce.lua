local ok, pounce = pcall(require, "pounce")
if not ok then
print("pounce failed")
  return
end

pounce.setup{
  accept_keys = "JFKDLSAHGNUVRBYTMICEOWPQZ",
  accept_best_key = "<leader>",
  multi_window = true,
  debug = false,
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "s", ":Pounce<CR>", opts)
keymap("v", "s", "<cmd>Pounce<CR>", opts)

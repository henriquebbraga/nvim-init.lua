local ok, pounce = pcall(require, "pounce")
if not ok then
print("pounce failed")
  return
end

pounce.setup{
  accept_keys = "JFKDLSA;HGNUVRBYTMICEOXWPQZ",
  accept_best_key = "<leader>",
  multi_window = true,
  debug = false,

}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>f", ":Pounce<CR>", opts)

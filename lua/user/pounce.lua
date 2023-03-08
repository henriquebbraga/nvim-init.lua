local ok, pounce = pcall(require, "pounce")
if not ok then
print("pounce failed")
  return
end

pounce.setup{
  accept_keys = ">TSRADCLNEIOHUMGJYZBQWFPXKV",
  accept_best_key = " ",
  multi_window = true,
  debug = false,
}

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "s", ":Pounce<CR>", opts)
keymap("v", "s", "<cmd>Pounce<CR>", opts)

vim.cmd [[ highlight PounceMatch guibg=#2c5e32 gui=bold guifg=#999999]] --  Characters that match the fuzzy search pattern.
--[[ vim.cmd [[ highlight PounceUnmatched guifg=#999999 ]]--  Characters that don't match the fuzzy search pattern. ]]
vim.cmd [[ highlight PounceGap guibg=#000000 guifg=#777777]] --  Characters inside a match that are not part of the pattern.
vim.cmd [[ highlight PounceAccept guifg=#000000 guibg=#00FF00 gui=bold ]] --  "Accept keys" that can be used to jump to the match.
vim.cmd [[ highlight PounceAcceptBest guifg=#000000 guibg=#FF00FF gui=bold ]] --  "Accept keys" that can be used to jump to the match.



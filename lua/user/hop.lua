local ok, hop = pcall(require, "hop")
if not ok then
print("hop failed")
  return
end

-- M.keys = 'asdghklqwertyuiopzxcvbnmfj'
hop.setup({
  -- reverse_distribution = true,
  teasing = false,
  keys = 'fjdkslweioa;gh'
  -- uppercase_labels = true,
})

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "s", ":HopWord<CR>", opts)
keymap("n", "<leader>l", ":HopLineStart<CR>", opts)
keymap("n", "<leader>f", ":HopChar2<CR>", opts)

keymap("v", "s", "<cmd>HopChar2<CR>", opts)
keymap("v", "<leader>hw", "<cmd>HopWord<CR>", opts)
keymap("v", "<leader>hl", "<cmd>HopLine<CR>", opts)

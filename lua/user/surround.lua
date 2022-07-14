local opts = { noremap = false, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>aw", "ysw", opts)
keymap("n", "<leader>ac", "cs", opts)
keymap("n", "<leader>al", "yss", opts)

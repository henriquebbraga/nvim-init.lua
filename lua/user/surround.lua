local opts = { noremap = false, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>sw", "ysw", opts)
keymap("n", "<leader>sc", "cs", opts)
keymap("n", "<leader>sl", "yss", opts)

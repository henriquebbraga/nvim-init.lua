require("harpoon").setup({
    menu = {
        width = vim.api.nvim_win_get_width(0) - 20,
    }
})

Global_telescope.load_extension('harpoon')

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "ga", ":lua require(\"harpoon.mark\").add_file()<Cr>", opts)
keymap("n", "gm", ":lua require(\"harpoon.ui\").toggle_quick_menu()<Cr>", opts)
keymap("n", "<leader>th", ":Telescope harpoon marks<Cr><leader>;", opts)


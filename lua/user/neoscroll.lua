Neoscroll = require('neoscroll')

Neoscroll.setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    mappings = {},
    hide_cursor = true,          -- Hide cursor while scrolling
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil,       -- Default easing function
    pre_hook = nil,              -- Function to run before the scrolling animation starts
    post_hook = nil,             -- Function to run after the scrolling animation ends
    performance_mode = false,    -- Disable "Performance Mode" on all buffers.
})

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

--[[ keymap("n", "<leader>j", ":lua Neoscroll.scroll(vim.api.nvim_win_get_height(0)/2, true, 300)<Cr>", opts) ]]
--[[ keymap("n", "<leader>k", ":lua Neoscroll.scroll(-vim.api.nvim_win_get_height(0)/2, true, 300)<Cr>", opts) ]]

keymap("n", "gj", ":lua Neoscroll.scroll(math.ceil(vim.api.nvim_win_get_height(0)*0.4), true, 300)<Cr>", opts)
keymap("n", "gk", ":lua Neoscroll.scroll(math.ceil(-vim.api.nvim_win_get_height(0)*0.4), true, 300)<Cr>", opts)

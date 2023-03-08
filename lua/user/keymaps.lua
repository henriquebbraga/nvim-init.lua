local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<Cr>", "<Nop>", opts)
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Normal --
-- Better window navigation
keymap("n", "<leader>rn", "<C-w>h", opts)
keymap("n", "<leader>ru", "<C-w>j", opts)
keymap("n", "<leader>re", "<C-w>k", opts)
keymap("n", "<leader>ri", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-0>", ":resize +2<CR>", opts)
keymap("n", "<C-9>", ":resize -2<CR>", opts)
keymap("n", "<C-8>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-7>", ":vertical resize -2<CR>", opts)

-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
--
keymap("n", "<C-f>", "<Esc>:call search('[>)\\]}\"'']', 'W')<Cr>a", opts)

-- Telescope
keymap("n", "<leader>p", ":Telescope find_files<CR>", opts)
keymap("n", "<C-p>", ":Telescope live_grep<CR>", opts)

-- Window crud
keymap("n", "<leader>ws", "<C-w>s", opts)
keymap("n", "<leader>wv", "<C-w>v", opts)
keymap("n", "<leader>wo", "<C-w>o", opts)
keymap("n", "<leader>wq", ":Bdelete<CR>:q<CR>", opts)
keymap("n", "<leader>wx", ":Bdelete<CR>", opts)

-- Terminal crud
keymap("n", "<leader>wt", ":tabnew<CR>:term<CR>i", opts)

-- Insert --
-- changed
--[[ keymap("i", "<leader>;", "<ESC>", opts) ]]
keymap("i", "<leader><space>", " ", opts)

keymap("i", "<C-a>", "<C-o>A", opts)

-- delete current word backwards
keymap("i", "<C-d>", "<C-o>vbd", opts)

keymap("i", "<C-f>", "<Esc>:call search('[>)\\]}\"'']', 'W')<Cr>a", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-u>", ":m .+1<CR>", opts)
keymap("v", "<C-e>", ":m .-2<CR>", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<C-u>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-e>", ":move '<-2<CR>gv-gv", opts)

-- Global yank
keymap("v", "<leader>y", '"*y', opts)
keymap("x", "<leader>y", '"*y', opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<Esc>", "<C-\\><C-N>", term_opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>gi", ":Git<cr>", opts)


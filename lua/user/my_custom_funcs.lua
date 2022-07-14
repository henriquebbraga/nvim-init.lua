local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

function MyCustomSearchAndReplace()
  local current_word = vim.call('expand', '<cword>')
  local left_key = vim.api.nvim_replace_termcodes("<Left>", true, true, "<Left>")

  vim.api.nvim_feedkeys(
    ":%s/" .. current_word .. "//g" .. left_key .. left_key,
    "m",
    true
  )
end

keymap("n", "<leader>rep", ":lua MyCustomSearchAndReplace()<CR>", opts)



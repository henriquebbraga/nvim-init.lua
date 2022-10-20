local fileExists = vim.fn.system('rg -g \'*.java*\' --files .', true);

if fileExists == "" then
  print("no java files");
  return;
end

local opts = { noremap = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>jao", "<Cmd>lua require('jdtls').organize_imports()<CR>", opts)
keymap("n", "<leader>jaev", "<Cmd>lua require('jdtls').extract_variable()<CR>", opts)
keymap("n", "<leader>jaec", "<Cmd>lua require('jdtls').extract_constant()<CR>", opts)
keymap("n", "<leader>jaem", "<Cmd>lua require('jdtls').extract_method()<CR>", opts)

keymap("v", "<leader>jaev", "<Cmd>lua require('jdtls').extract_variable(true)<CR>", opts)
keymap("v", "<leader>jaec", "<Cmd>lua require('jdtls').extract_constant(true)<CR>", opts)
keymap("v", "<leader>jaem", "<Cmd>lua require('jdtls').extract_method(true)<CR>", opts)

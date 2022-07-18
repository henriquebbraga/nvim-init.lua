vim.cmd [[
try
  colorscheme tokyonight
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]

vim.cmd [[ highlight WinSeparator guibg=#204458 guifg=#204458 ]]
vim.cmd [[ highlight Conditional guifg=#FFFFFF ]]

-- vim.cmd [[ highlight DiagnosticUnderlineError cterm=underline gui=underline guisp=#db4b4b ]]
-- vim.cmd [[ highlight DiagnosticUnderlineWarn cterm=underline gui=underline guisp=#e0af68 ]]
-- vim.cmd [[ highlight DiagnosticUnderlineInfo cterm=underline gui=underline guisp=#0db9d7 ]]
-- vim.cmd [[ highlight DiagnosticUnderlineHint cterm=underline gui=underline guisp=#1abc9c ]]
--
-- vim.cmd [[ highlight StatusLineNC	guibg=#204458 guifg=#ffffff ]]

-- vim.api.nvim_command('highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
-- vim.api.nvim_command('highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')
-- vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')

vim.api.nvim_command('highlight HopNextKey  guifg=#000000 guibg=#ff007c gui=bold ctermfg=198 cterm=bold')
vim.api.nvim_command('highlight HopNextKey1 guifg=#000000 guibg=#00dfff gui=bold ctermfg=45 cterm=bold')
vim.api.nvim_command('highlight HopNextKey2 guifg=#000000 guibg=#2b8db3 ctermfg=33')


require("nvim-treesitter.configs").setup {
  highlight = {},
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}

require("indent_blankline").setup {
    show_current_context = true,
    -- show_current_context_start = true,
}

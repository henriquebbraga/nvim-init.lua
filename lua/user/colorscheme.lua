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
vim.cmd	[[ set winhighlight=Normal:MyNormal,NormalNC:MyNormalNC ]]

vim.cmd [[ highlight StatusLineNC	guibg=#204458 guifg=#ffffff ]]

-- vim.cmd [[ highlight PounceMatch guibg=#000 ]] --  Characters that match the fuzzy search pattern.
-- vim.cmd [[ highlight PounceUnmatched guifg=#333 ]]--  Characters that don't match the fuzzy search pattern.
-- vim.cmd [[ highlight PounceGap ]] --  Characters inside a match that are not part of the pattern.
-- vim.cmd [[ highlight PounceAccept ]] --  "Accept keys" that can be used to jump to the match.
-- vim.cmd [[ highlight PounceAcceptBest ]] --  Highlights the accept key for the best match.

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

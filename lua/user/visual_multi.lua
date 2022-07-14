vim.cmd[[
    let g:VM_maps = {}
    let g:VM_maps["Add Cursor Up"] = '<C-k>'
    let g:VM_maps["Add Cursor Down"] = '<C-j>'
    let g:VM_maps["Select All"] = '<C-m>'
    highlight MultiCursorNormal guifg=blue guibg=#bbbbbb
    highlight MultiCursorInsert guifg=red guibg=#bbbbbb
    let g:VM_Mono_hl   = 'MultiCursorNormal'
    let g:VM_Insert_hl   = 'MultiCursorInsert'
]]

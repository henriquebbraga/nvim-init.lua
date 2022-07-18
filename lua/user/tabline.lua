vim.cmd[[
    highlight TabHelperSelected guifg=#7aa2f7 guibg=#1f2335
    highlight TabHelperNotSelected guifg=#111111 guibg=#1f2335
    highlight TabLine guibg=#111111
]]

function TabEdge(active, left)
  local edge_text = ""

  if active then
      edge_text = edge_text .. "%#TabHelperSelected#"
  else
      edge_text = edge_text .. "%#TabHelperNotSelected#"
  end

  if left then
    edge_text = edge_text .. ""
  else
    edge_text = edge_text .. ""
  end

  return edge_text
end

function MyTabLine()
  local tab_text = ""

  local total_tab = vim.fn.tabpagenr('$')
  local active_tab = vim.fn.tabpagenr()

  for i=1, total_tab  do

    if active_tab == i then
      tab_text = tab_text .. TabEdge(true, true)
      tab_text = tab_text .. "%#TabLineSel#"
    else
      tab_text = tab_text .. TabEdge(false, true)
      tab_text = tab_text .. "%#TabLine#"
    end

    local buflist = vim.fn.tabpagebuflist(i)
    local bufnumber = buflist[vim.fn.tabpagewinnr(i)]
    local bufs_in_window = #buflist

    local long_tab_name = vim.fn.bufname(bufnumber)
    local tab_name

    for str in string.gmatch(long_tab_name, "([^\\/]+)") do
      if str ~= nil then
        tab_name = str
      end
    end

    if tab_name == nil then
      tab_name = ""
    end

    tab_text = tab_text .. "  " .. i .. ": " .. tab_name .. " <" .. bufs_in_window .. ">  "

    if active_tab == i then
      tab_text = tab_text .. TabEdge(true, false)
    else
      tab_text = tab_text .. TabEdge(false, false)
    end

  end

  tab_text = tab_text .. "%#TabHelperNotSelected#"

  return tab_text
end

vim.cmd[[
  set tabline=%!v:lua.MyTabLine()
]]

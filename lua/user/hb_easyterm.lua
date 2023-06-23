_Hbeasy = {}

function HbEasyTermStart()
    local width = vim.api.nvim_win_get_width(0)
    vim.cmd("tabnew")
    vim.cmd("e /Users/henriquebraga/development/hb_easyterm_commands.txt")
    _Hbeasy.command_window = vim.api.nvim_get_current_win()
    vim.cmd("vsplit")
    vim.cmd("vertical resize +" .. (width/2)*.5)
    vim.cmd("term")
    _Hbeasy.term_window = vim.api.nvim_get_current_win()
    vim.api.nvim_set_current_win(_Hbeasy.command_window)
end

local function getRegister(char)
    return vim.api.nvim_exec([[echo getreg(']]..char..[[')]], true):gsub("[\n\r]", "^J")
end

local function setRegister(char, content)
    return vim.api.nvim_exec([[call setreg(']]..char..[[', ']]..content..[[')]], true)
end

function HbEasyTermSend()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if not string.find(buffer_name, 'hb_easyterm_commands') then
        return
    end
    local currentReg = getRegister('"')
    vim.cmd("norm vipy")
    vim.api.nvim_set_current_win(_Hbeasy.term_window)
    vim.cmd("norm pi")
    local returnKeycode = vim.api.nvim_replace_termcodes('<Cr><Esc><C-w>h', true, false, true)
    vim.api.nvim_feedkeys(returnKeycode, 't', false)
    setRegister('"', currentReg)
end


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>wt", ":lua HbEasyTermStart()<Cr>", opts)
keymap("n", "<leader>t", ":lua HbEasyTermSend()<Cr>", opts)

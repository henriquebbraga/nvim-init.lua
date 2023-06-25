local async = require "plenary.async"

_Hbeasy = {}

function HbEasyTermStart()
    local width = vim.api.nvim_win_get_width(0)
    vim.cmd("tabnew")
    vim.cmd("e ~/development/hb_easyterm_commands.txt")
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

function HbEasyTermSendLine()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if not string.find(buffer_name, 'hb_easyterm_commands') then
        return
    end
    local currentReg = getRegister('"')

    vim.cmd("norm yy")
    vim.api.nvim_set_current_win(_Hbeasy.term_window)
    vim.cmd("norm pi")
    local returnKeycode = vim.api.nvim_replace_termcodes('<Cr><Esc><C-w>h', true, false, true)
    vim.api.nvim_feedkeys(returnKeycode, 't', false)

    setRegister('"', currentReg)
end

function HbEasyTermSendKey()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if not string.find(buffer_name, 'hb_easyterm_commands') then
        return
    end
    local currentReg = getRegister('"')

    vim.cmd("norm yy")
    local command = getRegister('"')
    vim.api.nvim_set_current_win(_Hbeasy.term_window)
    command = string.sub(command,1, string.len(command)-2)
    print(command)
    local keys_to_send = vim.api.nvim_replace_termcodes('i' .. command, true, false, true)
    vim.api.nvim_feedkeys(keys_to_send, 't', false)
    local move_back_keycode = vim.api.nvim_replace_termcodes('<Esc><C-w>h', true, false, true)
    vim.api.nvim_feedkeys(move_back_keycode, 't', false)

    setRegister('"', currentReg)
end

function HbEasyTermTab()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if not string.find(buffer_name, 'hb_easyterm_commands') then
        return
    end

    vim.cmd("norm yy")
    local command = getRegister('"')
    vim.api.nvim_set_current_win(_Hbeasy.term_window)
    vim.cmd("norm i")
    local cleanline_code = vim.api.nvim_replace_termcodes('<C-u>', true, false, true)
    vim.api.nvim_feedkeys(cleanline_code, 't', false)
    vim.api.nvim_feedkeys(command, 't', false)
    local tab_keycode = vim.api.nvim_replace_termcodes('<BS><BS><Tab><Esc><C-w>h', true, false, true)
    vim.api.nvim_feedkeys(tab_keycode, 't', false)
end

function HbEasyTermGetCommand()
    local buffer_name = vim.api.nvim_buf_get_name(0)
    if not string.find(buffer_name, 'hb_easyterm_commands') then
        return
    end

    vim.api.nvim_set_current_win(_Hbeasy.term_window)
    local get_command = vim.api.nvim_replace_termcodes('i<Esc>vBy<C-w>h$vBlplx', true, false, true)
    vim.api.nvim_feedkeys(get_command, 't', false)
end


local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>wt", ":lua HbEasyTermStart()<Cr>", opts)
keymap("n", "<leader>c", ":lua HbEasyTermSend()<Cr>", opts)
keymap("n", "<leader>l", ":lua HbEasyTermSendLine()<Cr>", opts)
keymap("n", "<leader>t", ":lua HbEasyTermTab()<Cr>", opts)
keymap("n", "<leader>g", ":lua HbEasyTermGetCommand()<Cr>", opts)
keymap("n", "<leader>k", ":lua HbEasyTermSendKey()<Cr>", opts)


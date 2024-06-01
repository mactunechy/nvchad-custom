---@type ChadrcConfig
local M = {}
M.ui = {theme = 'one_light'}
M.plugins = "custom.plugins"



-- Custom options  will move them letter to another module
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
keymap('n', '<Up>', '<Nop>', opts)
keymap('n', '<Down>', '<Nop>', opts)
keymap('n', '<Left>', '<Nop>', opts)
keymap('n', '<Right>', '<Nop>', opts)

return M

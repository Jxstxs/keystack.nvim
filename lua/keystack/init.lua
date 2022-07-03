
local M = {
    -- Plugin Informations
    _VERSION = "0.1",
    _DESCRIPTION = "KeyStack is a Plugin to add diffrent Keybindings to the Key map and Pop them when you dont need them anymore.",
    _AUTHOR = "Jxstxs",
    _LICENSE = "MIT",
    _URL = "https://github.com/Jxstxs/keystack.nvim",

    -- Functions
    config = require("keystack.config").config,
    push = require("keystack.functions").pushMapToStack,
    pop = require("keystack.functions").popMapFromStack,

    -- Variables
    options = require("keystack.config").options,
    stack = require("keystack.functions")._stack,
}

return M

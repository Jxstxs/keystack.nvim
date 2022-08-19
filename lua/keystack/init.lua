
local M = {
    -- Functions
    config = require("keystack.config").config,
    push = require("keystack.functions").pushMapToStack,
    pop = require("keystack.functions").popMapFromStack,

    -- Variables
    options = require("keystack.config").options,
    stack = require("keystack.functions")._stack,
}

return M

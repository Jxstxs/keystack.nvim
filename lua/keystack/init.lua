local M = {
	-- Functions
	setup = require("keystack.config").setup,
	push = require("keystack.functions").pushMapToStack,
	pop = require("keystack.functions").popMapFromStack,

	-- Variables
	options = require("keystack.config").options,
	stack = require("keystack.functions")._stack,
}

return M

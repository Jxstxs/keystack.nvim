local M = {
	-- Functions
	setup = require("keystack.config").setup,
	config = require("keystack.config").setup, -- deprecated
	push = require("keystack.functions").pushMapToStack,
	pop = require("keystack.functions").popMapFromStack,

	-- Variables
	options = require("keystack.config").options,
	stack = require("keystack.functions")._stack,
}

return M

local M = {}

-- default options
M.options = {
	default_opts = { silent = true },
	default_exit_key = "q",
	default_mode = "n",
}

-- add a new option to the list
M.config = function(opts)
    M.options = vim.tbl_deep_extend("keep", opts, M.options)
end

return M

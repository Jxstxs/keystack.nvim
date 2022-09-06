local M = {}

-- default options
M.options = {
	default_opts = { silent = true },
	default_exit_key = "q",
	default_mode = "n",
}

-- add a new option to the list
M.setup = function(opts)
    for k,v in pairs(opts) do
        M.options[k] = v
    end
end

return M

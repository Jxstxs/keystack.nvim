local M = {}

M._stack = {}

local options = require("keystack.config").options

local findExistingKey = function(key, current)
	for _, value in ipairs(current) do
		if value.lhs == key then
			return value
		end
	end
end

M.pushMapToStack = function(map_name)
	-- check if map exists in options
	if options.mappings[map_name] == nil then
		print("Map " .. map_name .. " not found in options")
		return
	end

	-- check if map is already in stack
	for _, v in ipairs(M._stack) do
		if v == map_name then
			print("Map " .. map_name .. " is already in stack")
			return
		end
	end

	-- check which mode to use
	local mode = ""
	if options.mappings[map_name].mode then
		mode = options.mappings[map_name].mode
	else
		mode = options.default_mode
	end

	-- check for default opts
	local opts = {}
	if options.mappings[map_name].default_opts then
		opts = options.mappings[map_name].default_opts
	else
		opts = options.default_opts
	end

	-- check for exit key
	local exit_key = nil
	if options.mappings[map_name].exit_key then
		exit_key = options.mappings[map_name].exit_key
	else
		exit_key = options.default_exit_key
	end

	-- Check exit_key is a table or string
	if type(exit_key) == "table" then
		-- add the exit key to the new map
		for _, v in ipairs(exit_key) do
			options.mappings[map_name].maps[v] = function()
				require("keystack").pop(map_name)
			end
		end
	else
		options.mappings[map_name].maps[exit_key] = function()
			require("keystack").pop(map_name)
		end
	end

	-- loop through new map and check if key exists in current map (backup of the duplicated keys)
	local current_map = vim.api.nvim_get_keymap(mode)
	local existing_keys = {}
	local non_existing_keys = {}

	for k, _ in pairs(options.mappings[map_name].maps) do
		local existing_key = findExistingKey(k, current_map)
		if existing_key then
			existing_keys[k] = existing_key
		else
			table.insert(non_existing_keys, k)
		end
	end

	-- update the keymap
	for k, v in pairs(options.mappings[map_name].maps) do
		-- print("Adding key " .. k .. " to map " .. map_name)
		vim.keymap.set(mode, k, v, opts)
	end

	-- remove the exit key from the given map to prevent overloading
	options.mappings[map_name].maps[exit_key] = nil

	-- push existing and non existing keys to stack
	local stack_map = {
		existing_keys = existing_keys,
		non_existing_keys = non_existing_keys,
		mode = mode,
	}
	M._stack[map_name] = stack_map

	print("Map " .. map_name .. " pushed to stack and activated")
end

M.popMapFromStack = function(map_name)
	-- check if map is in stack
	if M._stack[map_name] == nil then
		print("Map " .. map_name .. " not found in stack")
		return
	end

	-- get the map from stack
	local stack_map = M._stack[map_name]
	M._stack[map_name] = nil

	-- loop through map and restore the keys
	for k, v in ipairs(stack_map.existing_keys) do
		-- print("Restoring key " .. k .. " to " .. v.rhs .. " in mode " .. stack_map.mode .. " with opts " .. vim.inspect(v.opts))
		vim.keymap.set(stack_map.mode, k, v.rhs, v.opts or {})
	end

	-- loop through map and remove the keys
	for _, v in pairs(stack_map.non_existing_keys) do
		-- print("Removing key " .. v .. " in mode " .. stack_map.mode)
		vim.keymap.del(stack_map.mode, v)
	end

	print("Map " .. map_name .. " popped from stack and deactivated")
end

return M

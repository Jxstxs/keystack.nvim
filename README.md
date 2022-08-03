# keystack.nvim

a Simple Neovim Plugin which let you remap Keys on the Fly based on Groups

## Demo

![Demo](./demo-keystack.gif)

## Usage/Examples

```lua
local keystack = require("keystack")

keystack.config({
    -- the options which will be used when no options were given inside the mapping
    default_opts = { silent = true },
    -- the key to exit the "Group" when no exit key is given inside the mapping
    default_exit_key = "q",
    -- the mode which will be used when no mode is given inside the mapping 
    default_mode = "n",

    -- where the "Groups" are defined
    mappings = {
        -- name of the Group
        ["page_moving"] = {
            exit_key = "<C-H>",
            mode = "n",
            opts = { silent = true },
            maps = {
                -- key = command
                ["j"] = "<C-D>",
                ["k"] = "<C-U>",
            }
        },
        ...
    }
})

-- Example Binding for page_moving
vim.api.nvim_set_keymap("n", "<leader>m", ":lua require('keystack').push('page_moving')")
```

## Features

- switch between Key Bindings on the Fly
<!--- - show the new Keys in a floating Window ---!>

## Documentation

Type `:help keystack` in Neovim
> This is not working by now (See Issue [#1](/../../issues/1))

## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "Jxstxs/keystack.nvim" }
```
    
## Contributing

Contributions are always welcome! Just remember to be Kind

## License

This Project uses the MIT License, as mentioned [here](./LICENSE).

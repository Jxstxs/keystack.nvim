# keystack.nvim

a Simple Neovim Plugin which let you remap Keys on the Fly based on Groups

## Demo

Insert gif or link to demo

## Usage/Examples

```lua
local keystack = require("keystack")

keystack.config({
    default_opts = { silent = true },
    default_exit_key = "q",
    default_mode = "n",

    mappings = {
        ["page_moving"] = {
            exit_key = "<C-H>",
            mode = "n",
            opts = { silent = true },
            maps = {
                ["<C-J>"] = "<C-D>",
                ["<C-K>"] = "<C-U>",
            }
        },
        ...
    }
})
```

## Features

- switch between Key Bindings on the Fly
- show the new Keys in a floating Window

## Documentation

Type `:help keystack` in Neovim
## Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "Jxstxs/keystack" }
```
    
## Contributing

Contributions are always welcome!

See `contributing.md` for ways to get started.

Please adhere to this project's `code of conduct`.

## License

This Project uses the MIT License, as mentionet [here](./LICENSE).

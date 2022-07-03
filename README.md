## keystack.nvim

a Neovim Plugin to Map different Keys to your normal Key map on the Fly.

### Installation

Using [packer.nvim](https://github.com/wbthomason/packer.nvim)

```lua
use { "Jxstxs/keystack.nvim" }
```

### Configuration

Create a keystack.lua file in your lua Folder and edit it like you want.
Here's an example

```lua
local keystack = require("keystack")

keystack.config({
    mappings = {
        maps = {

        },
    },
    default_opts = { silent = true },
    default_exit_key = "q",
    default_mode = "n",
})
```

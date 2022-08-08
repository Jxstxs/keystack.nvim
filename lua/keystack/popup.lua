
local M = {}

-- get the options
local opts = require("keystack").options

-- load nui.popup
local status_nui_popup, nui_popup = pcall(require, "nui.popup")
if not status_nui_popup then
    print("[keystack] requirement is not satisfied: nui.popup")
end

-- Popup Definition
local preview_opts = opts.preview_popup or {
    enter = false,
    focusable = false,
    border = {
        style = "rounded",
        text = { top = "[Preview of page_moving]", top_align = "left" }
    },
    relative = "win",
    position = {
        row = "95%",
        col = "10%",
    },
    size = {
        width = "90%", height = "10%"
    },
}
print(vim.inspect(preview_opts))
local preview_popup = nui_popup(preview_opts)

M.showPreview = function()
    preview_popup:mount()
end

M.closePreview = function()
    preview_popup:unmount()
end

return M

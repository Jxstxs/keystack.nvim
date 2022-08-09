
local M = {}

-- Get the options
local status_opts, keystack_config = pcall(require, "keystack.config")
if not status_opts then
    print("[keystack] Error loading keystack options")
    return {}
end

-- Load nui.popup
local status_nui_popup, nui_popup = pcall(require, "nui.popup")
if not status_nui_popup then
    print("[keystack] requirement is not satisfied: nui.popup")
    return {}
end

-- Preview Stuff
M.preview = nui_popup(keystack_config.options.preview_opts)

-- Toggles the mount of Preview
M.toggleMount = function()
    if M.preview["_"].mounted == false then
        M.preview:mount()
    else
        M.preview:unmount()
    end
end

-- Toggles the Visibility of the Preview
M.togglePreview = function()
    -- check if the popup is mounted if not mount it
    if M.preview["_"].mounted == false then print("[keystack] cannot toggle view of Preview Popup! its not mounted") end

    -- check if the popup have a window id, so if its visible
    if M.preview.winid then
        M.preview:hide()
    else
        M.preview:show()
    end
end

-- Sets the Title of the Preview
-- @param title {string} The Title of the Preview
M.setTitle = function(title)
    M.preview.border:set_text(keystack_config.options.preview_edge, string.format(keystack_config.options.preview_title, title), keystack_config.options.preview_align)
end

-- Sets the Text of the Preview
-- @param text {table} The Text of the Preview
M.setText = function(text)
    vim.api.nvim_buf_set_lines(M.preview.bufnr, 0, 1, false, text)
end

return M

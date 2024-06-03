local utils = {}

---@param name string: The name of the command.
---@param cb function: The callback function to execute when the command is called.
---@param desc string: A description of what the command does.
function utils.create_user_command(name, cb, desc)
    vim.api.nvim_create_user_command(name, cb, {
        desc = desc,
    })
end

return utils

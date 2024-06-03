---@class Charon
---@field win_id number
---@field buf_id string
local Charon = {}
Charon.__index = Charon

local function create_window()
    local buf_id = vim.api.nvim_create_buf(false, true) -- A scratch buffer
    local win_id = vim.api.nvim_open_win(buf_id, false, {
        relative='win',
        row=3,
        col=3,
        anchor='NW',
        height=12,
        width=100,
        border='rounded',
        title='Charon',
        title_pos='center',
        style='minimal'
    }); -- A floating window
    return buf_id, win_id
end

local function close_window()
end

function Charon:toggle()
    if self.buf_id == nil then
        buf_id, win_id = create_window()
        self.win_id = win_id
        self.buf_id = buf_id
    end
end

---@return Charon
function Charon:new()
    local instance = setmetatable({
        win_id = nil,
        buf_id = nil
    }, Charon)
    return instance
end

local charon =  Charon:new()

charon:toggle()

return charon

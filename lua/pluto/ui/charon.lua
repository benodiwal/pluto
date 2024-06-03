---@class Charon
---@field win_id number
---@field buf_id number
local Charon = {}
Charon.__index = Charon

---@return number buf_id Buffer Id
---@return number win_id Window Id
local function create_window()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)

    local buf_id = vim.api.nvim_create_buf(false, true) -- A scratch buffer
    local win_id = vim.api.nvim_open_win(buf_id, false, {
        relative='editor',
        row=math.floor((vim.o.lines - height) / 2),
        col=math.floor((vim.o.columns - width) / 2),
        height=height,
        width=width,
        border='rounded',
        title='Charon',
        title_pos='center',
        style='minimal'
    }); -- A floating window
    return buf_id, win_id
end

---@param buf_id number Buffer Id
---@param win_id number Window Id
local function close_window(buf_id, win_id)
    if vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_win_close(win_id, true)
    end
    if vim.api.nvim_buf_is_valid(buf_id) then
        vim.api.nvim_buf_delete(buf_id, { force = true })
    end
end

function Charon:land()
    if self.buf_id == nil then
        local buf_id, win_id = create_window()
        self.win_id = win_id
        self.buf_id = buf_id
    else
        print("Oooops!! Someone is already there")
    end
end

function Charon:takeOff()
    if self.buf_id ~= nil then
        close_window(self.buf_id, self.win_id)
        self.buf_id = nil
        self.win_id = nil
    else
        print("Huh? You are not on Charon !!")
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

local charon = Charon:new()
return charon

local charon = require("pluto.ui.charon")
local utils = require("pluto.utils")

---@class Pluto
local Pluto = {}
Pluto.__index = Pluto

function Pluto:takeOff()
    local name = "TakeOff"
    local desc = "Heading towards Charon"
    utils.create_user_command(name, function ()
        charon:land()
    end,
    desc
)
end

function Pluto:land()
    local name = "Land"
    local desc = "Heading back towards Pluto"
    utils.create_user_command(name, function ()
        charon:takeOff()
    end, desc)
end

function Pluto:hide()
    local name = "Hide"
    local desc = "Hide Charon"
    utils.create_user_command(name, function ()
        charon:hide()
    end, desc)
end

function Pluto:restore()
    local name = "Restore"
    local desc = "Restore Charon"
    utils.create_user_command(name, function ()
        charon:restore()
    end, desc)
end

function Pluto:setUpCommands()
    self:takeOff()
    self:land()
    self:hide()
    self:restore()
end

---@return Pluto
function Pluto:new()
    local instance = setmetatable({}, Pluto)
    self:setUpCommands()
    return instance
end

return Pluto:new()

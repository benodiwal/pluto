local charon = require("pluto.ui.charon")
local utils = require("pluto.utils")

---@class Pluto
local Pluto = {}
Pluto.__index = Pluto

function Pluto:takeOff()
    local name = "TakeOff"
    local desc = "Heading towards Charon"
    utils.create_user_command(name, charon.land, desc)
end

function Pluto:land()
    local name = "Land"
    local desc = "Heading back towards Pluto"
    utils.create_user_command(name, charon.takeOff, desc)
end

function Pluto:setUpCommands()
    self:takeOff()
    self:land()
end

---@return Pluto
function Pluto:new()
    local instance = setmetatable({}, Pluto)
    self:setUpCommands()
    return instance
end

return Pluto:new()

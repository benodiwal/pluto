local charon = require("pluto.ui.charon")

---@class Pluto
local Pluto = {}
Pluto.__index = Pluto

---@return Pluto
function Pluto:new()
    local instance = setmetatable({}, Pluto)
    return instance
end

return Pluto:new()

---@class TimeManager : Object
---@field public Instance TimeManager
local TimeManager = {}
---@public
---@param value TimeManager
---@return void
function TimeManager.SetInstance(value) end
---@public
---@param _cb Action
---@param _luacb LuaFunction
---@param _delayTime Single
---@param _updateCount Int32
---@return Int32
function TimeManager:Add(_cb, _luacb, _delayTime, _updateCount) end

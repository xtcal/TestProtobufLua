---@class LuaBehaviour : View
local LuaBehaviour = {}
---@public
---@param go GameObject
---@param luafunc LuaFunction
---@return void
function LuaBehaviour:AddClick(go, luafunc) end
---@public
---@param go GameObject
---@return void
function LuaBehaviour:RemoveClick(go) end
---@public
---@return void
function LuaBehaviour:ClearClick() end

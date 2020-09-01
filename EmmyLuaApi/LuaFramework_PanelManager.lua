---@class PanelManager : Manager
local PanelManager = {}
---@public
---@param name string
---@param func LuaFunction
---@return void
function PanelManager:CreatePanel(name, func) end
---@public
---@param name string
---@return void
function PanelManager:ClosePanel(name) end

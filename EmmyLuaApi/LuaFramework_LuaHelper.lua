---@class LuaHelper : Object
local LuaHelper = {}
---@public
---@param classname string
---@return Type
function LuaHelper.GetType(classname) end
---@public
---@return PanelManager
function LuaHelper.GetPanelManager() end
---@public
---@return ResourceManager
function LuaHelper.GetResManager() end
---@public
---@return NetworkManager
function LuaHelper.GetNetManager() end
---@public
---@return SoundManager
function LuaHelper.GetSoundManager() end
---@public
---@return LuaManager
function LuaHelper.GetLuaManager() end
---@public
---@param data LuaByteBuffer
---@param func LuaFunction
---@return void
function LuaHelper.OnCallLuaFunc(data, func) end
---@public
---@param data string
---@param func LuaFunction
---@return void
function LuaHelper.OnJsonCallFunc(data, func) end

---@class LuaComponent : MonoBehaviour
---@field public components Dictionary
local LuaComponent = {}
---@public
---@param name string
---@return LuaTable
function LuaComponent:Get(name) end
---@public
---@param name string
---@param table LuaTable
---@return bool
function LuaComponent:Add(name, table) end
---@public
---@param name string
---@return bool
function LuaComponent:Remove(name) end
---@public
---@return void
function LuaComponent:Clear() end

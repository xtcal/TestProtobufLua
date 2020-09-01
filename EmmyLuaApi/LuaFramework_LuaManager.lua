---@class LuaManager : Manager
local LuaManager = {}
---@public
---@return void
function LuaManager:InitStart() end
---@public
---@param filename string
---@return void
function LuaManager:DoFile(filename) end
---@public
---@param funcName string
---@param args Object[]
---@return Object[]
function LuaManager:CallFunction(funcName, args) end
---@public
---@return void
function LuaManager:LuaGC() end
---@public
---@return void
function LuaManager:Close() end

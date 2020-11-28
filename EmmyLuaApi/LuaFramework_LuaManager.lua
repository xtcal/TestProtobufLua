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
---@public
---@return void
function LuaManager:EnterGame() end
---@public
---@param url string
---@return void
function LuaManager:AddSearchBundle(url) end
---@public
---@param name string
---@param bundle AssetBundle
---@return void
function LuaManager:AddSearchBundle(name, bundle) end
---@public
---@param name string
---@param bytes Byte[]
---@return void
function LuaManager:AddSearchBundle(name, bytes) end
---@public
---@param bundleName string
---@return void
function LuaManager:UnloadModule(bundleName) end

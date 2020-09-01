---@class ResourceManager : Manager
local ResourceManager = {}
---@public
---@param manifestName string
---@param initOK Action
---@return void
function ResourceManager:Initialize(manifestName, initOK) end
---@public
---@param abName string
---@param assetName string
---@param func Action
---@return void
function ResourceManager:LoadPrefab(abName, assetName, func) end
---@public
---@param abName string
---@param assetNames String[]
---@param func Action
---@return void
function ResourceManager:LoadPrefab(abName, assetNames, func) end
---@public
---@param abName string
---@param assetNames String[]
---@param func LuaFunction
---@return void
function ResourceManager:LoadPrefab(abName, assetNames, func) end
---@public
---@param abName string
---@param isThorough bool
---@return void
function ResourceManager:UnloadAssetBundle(abName, isThorough) end
---@public
---@param abName string
---@param assetName string
---@param func LuaFunction
---@return void
function ResourceManager:LoadSprite(abName, assetName, func) end
---@public
---@param abName string
---@param assetName string
---@param func LuaFunction
---@return void
function ResourceManager:LoadMaterial(abName, assetName, func) end
---@public
---@param abName string
---@param assetName string
---@param func LuaFunction
---@return void
function ResourceManager:LoadAnimation(abName, assetName, func) end

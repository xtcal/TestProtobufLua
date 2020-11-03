---@class GameObjectPool : Object
local GameObjectPool = {}
---@public
---@return GameObject
function GameObjectPool:NextAvailableObject() end
---@public
---@param pool string
---@param po GameObject
---@return void
function GameObjectPool:ReturnObjectToPool(pool, po) end

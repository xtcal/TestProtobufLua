---@class ObjectPoolManager : Manager
local ObjectPoolManager = {}
---@public
---@param poolName string
---@param initSize Int32
---@param maxSize Int32
---@param prefab GameObject
---@return GameObjectPool
function ObjectPoolManager:CreatePool(poolName, initSize, maxSize, prefab) end
---@public
---@param poolName string
---@return GameObjectPool
function ObjectPoolManager:GetPool(poolName) end
---@public
---@param poolName string
---@return GameObject
function ObjectPoolManager:Get(poolName) end
---@public
---@param poolName string
---@param go GameObject
---@return void
function ObjectPoolManager:Release(poolName, go) end

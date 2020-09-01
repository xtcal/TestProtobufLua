---@class Dictionary : Object
---@field public Count Int32
---@field public Item Object
---@field public Comparer IEqualityComparer
---@field public Keys KeyCollection
---@field public Values ValueCollection
local Dictionary = {}
---@public
---@param key string
---@param value Object
---@return void
function Dictionary:Add(key, value) end
---@public
---@return void
function Dictionary:Clear() end
---@public
---@param key string
---@return bool
function Dictionary:ContainsKey(key) end
---@public
---@param value Object
---@return bool
function Dictionary:ContainsValue(value) end
---@public
---@param info SerializationInfo
---@param context StreamingContext
---@return void
function Dictionary:GetObjectData(info, context) end
---@public
---@param sender Object
---@return void
function Dictionary:OnDeserialization(sender) end
---@public
---@param key string
---@return bool
function Dictionary:Remove(key) end
---@public
---@param key string
---@param value Object
---@return bool
function Dictionary:TryGetValue(key, value) end
---@public
---@return Enumerator
function Dictionary:GetEnumerator() end

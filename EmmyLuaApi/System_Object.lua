---@class Object
local Object = {}
---@public
---@param obj Object
---@return bool
function Object:Equals(obj) end
---@public
---@param objA Object
---@param objB Object
---@return bool
function Object.Equals(objA, objB) end
---@public
---@return Int32
function Object:GetHashCode() end
---@public
---@return Type
function Object:GetType() end
---@public
---@return string
function Object:ToString() end
---@public
---@param objA Object
---@param objB Object
---@return bool
function Object.ReferenceEquals(objA, objB) end

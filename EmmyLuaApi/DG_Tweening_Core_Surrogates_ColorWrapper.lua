---@class ColorWrapper : ValueType
---@field public value Color
local ColorWrapper = {}
---@public
---@param v ColorWrapper
---@return Color
function ColorWrapper.op_Implicit(v) end
---@public
---@param v Color
---@return ColorWrapper
function ColorWrapper.op_Implicit(v) end

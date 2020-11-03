---@class Color32 : ValueType
---@field public r Byte
---@field public g Byte
---@field public b Byte
---@field public a Byte
local Color32 = {}
---@public
---@param c Color
---@return Color32
function Color32.op_Implicit(c) end
---@public
---@param c Color32
---@return Color
function Color32.op_Implicit(c) end
---@public
---@param a Color32
---@param b Color32
---@param t Single
---@return Color32
function Color32.Lerp(a, b, t) end
---@public
---@param a Color32
---@param b Color32
---@param t Single
---@return Color32
function Color32.LerpUnclamped(a, b, t) end
---@public
---@return string
function Color32:ToString() end
---@public
---@param format string
---@return string
function Color32:ToString(format) end

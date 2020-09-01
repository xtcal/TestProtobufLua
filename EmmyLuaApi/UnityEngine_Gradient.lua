---@class Gradient : Object
---@field public colorKeys GradientColorKey[]
---@field public alphaKeys GradientAlphaKey[]
---@field public mode number
local Gradient = {}
---@public
---@param time Single
---@return Color
function Gradient:Evaluate(time) end
---@public
---@param colorKeys GradientColorKey[]
---@param alphaKeys GradientAlphaKey[]
---@return void
function Gradient:SetKeys(colorKeys, alphaKeys) end

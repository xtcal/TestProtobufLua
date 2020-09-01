---@class Random : Object
---@field public seed Int32
---@field public state State
---@field public value Single
---@field public insideUnitSphere Vector3
---@field public insideUnitCircle Vector2
---@field public onUnitSphere Vector3
---@field public rotation Quaternion
---@field public rotationUniform Quaternion
local Random = {}
---@public
---@param seed Int32
---@return void
function Random.InitState(seed) end
---@public
---@param min Single
---@param max Single
---@return Single
function Random.Range(min, max) end
---@public
---@param min Int32
---@param max Int32
---@return Int32
function Random.Range(min, max) end
---@public
---@param min Single
---@param max Single
---@return Single
function Random.RandomRange(min, max) end
---@public
---@param min Int32
---@param max Int32
---@return Int32
function Random.RandomRange(min, max) end
---@public
---@return Color
function Random.ColorHSV() end
---@public
---@param hueMin Single
---@param hueMax Single
---@return Color
function Random.ColorHSV(hueMin, hueMax) end
---@public
---@param hueMin Single
---@param hueMax Single
---@param saturationMin Single
---@param saturationMax Single
---@return Color
function Random.ColorHSV(hueMin, hueMax, saturationMin, saturationMax) end
---@public
---@param hueMin Single
---@param hueMax Single
---@param saturationMin Single
---@param saturationMax Single
---@param valueMin Single
---@param valueMax Single
---@return Color
function Random.ColorHSV(hueMin, hueMax, saturationMin, saturationMax, valueMin, valueMax) end
---@public
---@param hueMin Single
---@param hueMax Single
---@param saturationMin Single
---@param saturationMax Single
---@param valueMin Single
---@param valueMax Single
---@param alphaMin Single
---@param alphaMax Single
---@return Color
function Random.ColorHSV(hueMin, hueMax, saturationMin, saturationMax, valueMin, valueMax, alphaMin, alphaMax) end

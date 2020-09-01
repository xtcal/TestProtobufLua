---@class Texture : Object
---@field public masterTextureLimit Int32
---@field public anisotropicFiltering number
---@field public width Int32
---@field public height Int32
---@field public dimension number
---@field public filterMode number
---@field public anisoLevel Int32
---@field public wrapMode number
---@field public mipMapBias Single
---@field public texelSize Vector2
local Texture = {}
---@public
---@param forcedMin Int32
---@param globalMax Int32
---@return void
function Texture.SetGlobalAnisotropicFilteringLimits(forcedMin, globalMax) end
---@public
---@return IntPtr
function Texture:GetNativeTexturePtr() end
---@public
---@return Int32
function Texture:GetNativeTextureID() end

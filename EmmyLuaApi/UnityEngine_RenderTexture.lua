---@class RenderTexture : Texture
---@field public width Int32
---@field public height Int32
---@field public vrUsage number
---@field public depth Int32
---@field public isPowerOfTwo bool
---@field public sRGB bool
---@field public format number
---@field public useMipMap bool
---@field public autoGenerateMips bool
---@field public dimension number
---@field public isCubemap bool
---@field public isVolume bool
---@field public volumeDepth Int32
---@field public antiAliasing Int32
---@field public enableRandomWrite bool
---@field public colorBuffer RenderBuffer
---@field public depthBuffer RenderBuffer
---@field public active RenderTexture
---@field public enabled bool
---@field public generateMips bool
local RenderTexture = {}
---@public
---@param width Int32
---@param height Int32
---@param depthBuffer Int32
---@param format number
---@param readWrite number
---@param antiAliasing Int32
---@param vrUsage number
---@return RenderTexture
function RenderTexture.GetTemporary(width, height, depthBuffer, format, readWrite, antiAliasing, vrUsage) end
---@public
---@param width Int32
---@param height Int32
---@param depthBuffer Int32
---@param format number
---@param readWrite number
---@param antiAliasing Int32
---@return RenderTexture
function RenderTexture.GetTemporary(width, height, depthBuffer, format, readWrite, antiAliasing) end
---@public
---@param width Int32
---@param height Int32
---@param depthBuffer Int32
---@param format number
---@param readWrite number
---@return RenderTexture
function RenderTexture.GetTemporary(width, height, depthBuffer, format, readWrite) end
---@public
---@param width Int32
---@param height Int32
---@param depthBuffer Int32
---@param format number
---@return RenderTexture
function RenderTexture.GetTemporary(width, height, depthBuffer, format) end
---@public
---@param width Int32
---@param height Int32
---@param depthBuffer Int32
---@return RenderTexture
function RenderTexture.GetTemporary(width, height, depthBuffer) end
---@public
---@param width Int32
---@param height Int32
---@return RenderTexture
function RenderTexture.GetTemporary(width, height) end
---@public
---@param temp RenderTexture
---@return void
function RenderTexture.ReleaseTemporary(temp) end
---@public
---@return bool
function RenderTexture:Create() end
---@public
---@return void
function RenderTexture:Release() end
---@public
---@return bool
function RenderTexture:IsCreated() end
---@public
---@return void
function RenderTexture:DiscardContents() end
---@public
---@param discardColor bool
---@param discardDepth bool
---@return void
function RenderTexture:DiscardContents(discardColor, discardDepth) end
---@public
---@return void
function RenderTexture:MarkRestoreExpected() end
---@public
---@return void
function RenderTexture:GenerateMips() end
---@public
---@return IntPtr
function RenderTexture:GetNativeDepthBufferPtr() end
---@public
---@param propertyName string
---@return void
function RenderTexture:SetGlobalShaderProperty(propertyName) end
---@public
---@return Vector2
function RenderTexture:GetTexelOffset() end
---@public
---@param rt RenderTexture
---@return bool
function RenderTexture.SupportsStencil(rt) end
---@public
---@param color Color
---@return void
function RenderTexture:SetBorderColor(color) end

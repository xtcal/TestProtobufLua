---@class Light : Behaviour
---@field public type number
---@field public color Color
---@field public colorTemperature Single
---@field public intensity Single
---@field public bounceIntensity Single
---@field public shadows number
---@field public shadowStrength Single
---@field public shadowResolution number
---@field public shadowCustomResolution Int32
---@field public shadowBias Single
---@field public shadowNormalBias Single
---@field public shadowNearPlane Single
---@field public shadowSoftness Single
---@field public shadowSoftnessFade Single
---@field public range Single
---@field public spotAngle Single
---@field public cookieSize Single
---@field public cookie Texture
---@field public flare Flare
---@field public renderMode number
---@field public alreadyLightmapped bool
---@field public bakedIndex Int32
---@field public isBaked bool
---@field public cullingMask Int32
---@field public areaSize Vector2
---@field public lightmapBakeType number
---@field public commandBufferCount Int32
---@field public pixelLightCount Int32
---@field public shadowConstantBias Single
---@field public shadowObjectSizeBias Single
---@field public attenuate bool
---@field public lightmappingMode number
local Light = {}
---@public
---@param evt number
---@param buffer CommandBuffer
---@return void
function Light:AddCommandBuffer(evt, buffer) end
---@public
---@param evt number
---@param buffer CommandBuffer
---@param shadowPassMask number
---@return void
function Light:AddCommandBuffer(evt, buffer, shadowPassMask) end
---@public
---@param evt number
---@param buffer CommandBuffer
---@return void
function Light:RemoveCommandBuffer(evt, buffer) end
---@public
---@param evt number
---@return void
function Light:RemoveCommandBuffers(evt) end
---@public
---@return void
function Light:RemoveAllCommandBuffers() end
---@public
---@param evt number
---@return CommandBuffer[]
function Light:GetCommandBuffers(evt) end
---@public
---@param type number
---@param layer Int32
---@return Light[]
function Light.GetLights(type, layer) end

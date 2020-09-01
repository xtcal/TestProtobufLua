---@class QualitySettings : Object
---@field public names String[]
---@field public pixelLightCount Int32
---@field public shadows number
---@field public shadowProjection number
---@field public shadowCascades Int32
---@field public shadowDistance Single
---@field public shadowResolution number
---@field public shadowNearPlaneOffset Single
---@field public shadowCascade2Split Single
---@field public shadowCascade4Split Vector3
---@field public masterTextureLimit Int32
---@field public anisotropicFiltering number
---@field public lodBias Single
---@field public maximumLODLevel Int32
---@field public particleRaycastBudget Int32
---@field public softParticles bool
---@field public softVegetation bool
---@field public realtimeReflectionProbes bool
---@field public billboardsFaceCameraPosition bool
---@field public maxQueuedFrames Int32
---@field public vSyncCount Int32
---@field public antiAliasing Int32
---@field public desiredColorSpace number
---@field public activeColorSpace number
---@field public blendWeights number
---@field public asyncUploadTimeSlice Int32
---@field public asyncUploadBufferSize Int32
---@field public currentLevel number
local QualitySettings = {}
---@public
---@return Int32
function QualitySettings.GetQualityLevel() end
---@public
---@param index Int32
---@param applyExpensiveChanges bool
---@return void
function QualitySettings.SetQualityLevel(index, applyExpensiveChanges) end
---@public
---@param index Int32
---@return void
function QualitySettings.SetQualityLevel(index) end
---@public
---@param applyExpensiveChanges bool
---@return void
function QualitySettings.IncreaseLevel(applyExpensiveChanges) end
---@public
---@return void
function QualitySettings.IncreaseLevel() end
---@public
---@param applyExpensiveChanges bool
---@return void
function QualitySettings.DecreaseLevel(applyExpensiveChanges) end
---@public
---@return void
function QualitySettings.DecreaseLevel() end

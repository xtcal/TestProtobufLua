---@class SkinnedMeshRenderer : Renderer
---@field public bones Transform[]
---@field public rootBone Transform
---@field public quality number
---@field public sharedMesh Mesh
---@field public updateWhenOffscreen bool
---@field public skinnedMotionVectors bool
---@field public localBounds Bounds
local SkinnedMeshRenderer = {}
---@public
---@param mesh Mesh
---@return void
function SkinnedMeshRenderer:BakeMesh(mesh) end
---@public
---@param index Int32
---@return Single
function SkinnedMeshRenderer:GetBlendShapeWeight(index) end
---@public
---@param index Int32
---@param value Single
---@return void
function SkinnedMeshRenderer:SetBlendShapeWeight(index, value) end

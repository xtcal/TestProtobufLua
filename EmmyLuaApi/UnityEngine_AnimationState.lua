---@class AnimationState : TrackedReference
---@field public enabled bool
---@field public weight Single
---@field public wrapMode number
---@field public time Single
---@field public normalizedTime Single
---@field public speed Single
---@field public normalizedSpeed Single
---@field public length Single
---@field public layer Int32
---@field public clip AnimationClip
---@field public name string
---@field public blendMode number
local AnimationState = {}
---@public
---@param mix Transform
---@param recursive bool
---@return void
function AnimationState:AddMixingTransform(mix, recursive) end
---@public
---@param mix Transform
---@return void
function AnimationState:AddMixingTransform(mix) end
---@public
---@param mix Transform
---@return void
function AnimationState:RemoveMixingTransform(mix) end

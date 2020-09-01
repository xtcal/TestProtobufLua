---@class CanvasGroup : Component
---@field public alpha Single
---@field public interactable bool
---@field public blocksRaycasts bool
---@field public ignoreParentGroups bool
local CanvasGroup = {}
---@public
---@param sp Vector2
---@param eventCamera Camera
---@return bool
function CanvasGroup:IsRaycastLocationValid(sp, eventCamera) end

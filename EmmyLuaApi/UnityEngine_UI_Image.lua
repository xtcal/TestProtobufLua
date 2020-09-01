---@class Image : MaskableGraphic
---@field public sprite Sprite
---@field public overrideSprite Sprite
---@field public type number
---@field public preserveAspect bool
---@field public fillCenter bool
---@field public fillMethod number
---@field public fillAmount Single
---@field public fillClockwise bool
---@field public fillOrigin Int32
---@field public eventAlphaThreshold Single
---@field public alphaHitTestMinimumThreshold Single
---@field public defaultETC1GraphicMaterial Material
---@field public mainTexture Texture
---@field public hasBorder bool
---@field public pixelsPerUnit Single
---@field public material Material
---@field public minWidth Single
---@field public preferredWidth Single
---@field public flexibleWidth Single
---@field public minHeight Single
---@field public preferredHeight Single
---@field public flexibleHeight Single
---@field public layoutPriority Int32
local Image = {}
---@public
---@return void
function Image:OnBeforeSerialize() end
---@public
---@return void
function Image:OnAfterDeserialize() end
---@public
---@return void
function Image:SetNativeSize() end
---@public
---@return void
function Image:CalculateLayoutInputHorizontal() end
---@public
---@return void
function Image:CalculateLayoutInputVertical() end
---@public
---@param screenPoint Vector2
---@param eventCamera Camera
---@return bool
function Image:IsRaycastLocationValid(screenPoint, eventCamera) end

---@class ScrollRect : UIBehaviour
---@field public content RectTransform
---@field public horizontal bool
---@field public vertical bool
---@field public movementType number
---@field public elasticity Single
---@field public inertia bool
---@field public decelerationRate Single
---@field public scrollSensitivity Single
---@field public viewport RectTransform
---@field public horizontalScrollbar Scrollbar
---@field public verticalScrollbar Scrollbar
---@field public horizontalScrollbarVisibility number
---@field public verticalScrollbarVisibility number
---@field public horizontalScrollbarSpacing Single
---@field public verticalScrollbarSpacing Single
---@field public onValueChanged ScrollRectEvent
---@field public velocity Vector2
---@field public normalizedPosition Vector2
---@field public horizontalNormalizedPosition Single
---@field public verticalNormalizedPosition Single
---@field public minWidth Single
---@field public preferredWidth Single
---@field public flexibleWidth Single
---@field public minHeight Single
---@field public preferredHeight Single
---@field public flexibleHeight Single
---@field public layoutPriority Int32
local ScrollRect = {}
---@public
---@param executing number
---@return void
function ScrollRect:Rebuild(executing) end
---@public
---@return void
function ScrollRect:LayoutComplete() end
---@public
---@return void
function ScrollRect:GraphicUpdateComplete() end
---@public
---@return bool
function ScrollRect:IsActive() end
---@public
---@return void
function ScrollRect:StopMovement() end
---@public
---@param data PointerEventData
---@return void
function ScrollRect:OnScroll(data) end
---@public
---@param eventData PointerEventData
---@return void
function ScrollRect:OnInitializePotentialDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function ScrollRect:OnBeginDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function ScrollRect:OnEndDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function ScrollRect:OnDrag(eventData) end
---@public
---@return void
function ScrollRect:CalculateLayoutInputHorizontal() end
---@public
---@return void
function ScrollRect:CalculateLayoutInputVertical() end
---@public
---@return void
function ScrollRect:SetLayoutHorizontal() end
---@public
---@return void
function ScrollRect:SetLayoutVertical() end

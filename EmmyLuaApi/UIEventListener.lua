---@class UIEventListener : EventTrigger
---@field public aniClickDown LuaFunction
---@field public aniClickUp LuaFunction
---@field public soundClick LuaFunction
---@field public onClickDown LuaFunction
---@field public onClickUp LuaFunction
---@field public onClick LuaFunction
---@field public onEnter LuaFunction
---@field public onExit LuaFunction
---@field public onInitializePotentialDrag LuaFunction
---@field public onBeginDrag LuaFunction
---@field public onDrag LuaFunction
---@field public onEndDrag LuaFunction
---@field public onDrop LuaFunction
---@field public onSelect LuaFunction
---@field public onUpdateSelected LuaFunction
---@field public onDeselect LuaFunction
---@field public onSubmit LuaFunction
---@field public onCancel LuaFunction
---@field public onScroll LuaFunction
---@field public onMove LuaFunction
local UIEventListener = {}
---@public
---@param _bool bool
---@return void
function UIEventListener:SetClickLock(_bool) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnPointerDown(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnPointerUp(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnPointerClick(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnPointerEnter(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnPointerExit(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnInitializePotentialDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnBeginDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnEndDrag(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnDrop(eventData) end
---@public
---@param eventData BaseEventData
---@return void
function UIEventListener:OnSelect(eventData) end
---@public
---@param eventData BaseEventData
---@return void
function UIEventListener:OnUpdateSelected(eventData) end
---@public
---@param eventData BaseEventData
---@return void
function UIEventListener:OnDeselect(eventData) end
---@public
---@param eventData BaseEventData
---@return void
function UIEventListener:OnSubmit(eventData) end
---@public
---@param eventData BaseEventData
---@return void
function UIEventListener:OnCancel(eventData) end
---@public
---@param eventData PointerEventData
---@return void
function UIEventListener:OnScroll(eventData) end
---@public
---@param eventData AxisEventData
---@return void
function UIEventListener:OnMove(eventData) end
---@public
---@param go GameObject
---@return UIEventListener
function UIEventListener.Get(go) end

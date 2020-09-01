---@class EventSystem : UIBehaviour
---@field public current EventSystem
---@field public sendNavigationEvents bool
---@field public pixelDragThreshold Int32
---@field public currentInputModule BaseInputModule
---@field public firstSelectedGameObject GameObject
---@field public currentSelectedGameObject GameObject
---@field public lastSelectedGameObject GameObject
---@field public isFocused bool
---@field public alreadySelecting bool
local EventSystem = {}
---@public
---@return void
function EventSystem:UpdateModules() end
---@public
---@param selected GameObject
---@param pointer BaseEventData
---@return void
function EventSystem:SetSelectedGameObject(selected, pointer) end
---@public
---@param selected GameObject
---@return void
function EventSystem:SetSelectedGameObject(selected) end
---@public
---@param eventData PointerEventData
---@param raycastResults List
---@return void
function EventSystem:RaycastAll(eventData, raycastResults) end
---@public
---@return bool
function EventSystem:IsPointerOverGameObject() end
---@public
---@param pointerId Int32
---@return bool
function EventSystem:IsPointerOverGameObject(pointerId) end
---@public
---@return string
function EventSystem:ToString() end

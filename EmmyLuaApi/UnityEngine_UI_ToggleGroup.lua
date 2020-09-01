---@class ToggleGroup : UIBehaviour
---@field public allowSwitchOff bool
local ToggleGroup = {}
---@public
---@param toggle Toggle
---@return void
function ToggleGroup:NotifyToggleOn(toggle) end
---@public
---@param toggle Toggle
---@return void
function ToggleGroup:UnregisterToggle(toggle) end
---@public
---@param toggle Toggle
---@return void
function ToggleGroup:RegisterToggle(toggle) end
---@public
---@return bool
function ToggleGroup:AnyTogglesOn() end
---@public
---@return IEnumerable
function ToggleGroup:ActiveToggles() end
---@public
---@return void
function ToggleGroup:SetAllTogglesOff() end

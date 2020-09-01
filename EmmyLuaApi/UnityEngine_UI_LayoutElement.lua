---@class LayoutElement : UIBehaviour
---@field public ignoreLayout bool
---@field public minWidth Single
---@field public minHeight Single
---@field public preferredWidth Single
---@field public preferredHeight Single
---@field public flexibleWidth Single
---@field public flexibleHeight Single
---@field public layoutPriority Int32
local LayoutElement = {}
---@public
---@return void
function LayoutElement:CalculateLayoutInputHorizontal() end
---@public
---@return void
function LayoutElement:CalculateLayoutInputVertical() end

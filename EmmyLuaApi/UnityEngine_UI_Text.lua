---@class Text : MaskableGraphic
---@field public cachedTextGenerator TextGenerator
---@field public cachedTextGeneratorForLayout TextGenerator
---@field public mainTexture Texture
---@field public font Font
---@field public text string
---@field public supportRichText bool
---@field public resizeTextForBestFit bool
---@field public resizeTextMinSize Int32
---@field public resizeTextMaxSize Int32
---@field public alignment number
---@field public alignByGeometry bool
---@field public fontSize Int32
---@field public horizontalOverflow number
---@field public verticalOverflow number
---@field public lineSpacing Single
---@field public fontStyle number
---@field public pixelsPerUnit Single
---@field public minWidth Single
---@field public preferredWidth Single
---@field public flexibleWidth Single
---@field public minHeight Single
---@field public preferredHeight Single
---@field public flexibleHeight Single
---@field public layoutPriority Int32
local Text = {}
---@public
---@return void
function Text:FontTextureChanged() end
---@public
---@param extents Vector2
---@return TextGenerationSettings
function Text:GetGenerationSettings(extents) end
---@public
---@param anchor number
---@return Vector2
function Text.GetTextAnchorPivot(anchor) end
---@public
---@return void
function Text:CalculateLayoutInputHorizontal() end
---@public
---@return void
function Text:CalculateLayoutInputVertical() end
---@public
---@return void
function Text:OnRebuildRequested() end

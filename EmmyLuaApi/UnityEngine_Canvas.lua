---@class Canvas : Behaviour
---@field public renderMode number
---@field public isRootCanvas bool
---@field public worldCamera Camera
---@field public pixelRect Rect
---@field public scaleFactor Single
---@field public referencePixelsPerUnit Single
---@field public overridePixelPerfect bool
---@field public pixelPerfect bool
---@field public planeDistance Single
---@field public renderOrder Int32
---@field public overrideSorting bool
---@field public sortingOrder Int32
---@field public targetDisplay Int32
---@field public sortingGridNormalizedSize Int32
---@field public normalizedSortingGridSize Single
---@field public sortingLayerID Int32
---@field public cachedSortingLayerValue Int32
---@field public additionalShaderChannels number
---@field public sortingLayerName string
---@field public rootCanvas Canvas
local Canvas = {}
---@public
---@return Material
function Canvas.GetDefaultCanvasMaterial() end
---@public
---@return Material
function Canvas.GetETC1SupportedCanvasMaterial() end
---@public
---@return Material
function Canvas.GetDefaultCanvasTextMaterial() end
---@public
---@param value WillRenderCanvases
---@return void
function Canvas.add_willRenderCanvases(value) end
---@public
---@param value WillRenderCanvases
---@return void
function Canvas.remove_willRenderCanvases(value) end
---@public
---@return void
function Canvas.ForceUpdateCanvases() end

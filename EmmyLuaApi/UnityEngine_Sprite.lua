---@class Sprite : Object
---@field public bounds Bounds
---@field public rect Rect
---@field public pixelsPerUnit Single
---@field public texture Texture2D
---@field public associatedAlphaSplitTexture Texture2D
---@field public textureRect Rect
---@field public textureRectOffset Vector2
---@field public packed bool
---@field public packingMode number
---@field public packingRotation number
---@field public pivot Vector2
---@field public border Vector4
---@field public vertices Vector2[]
---@field public triangles UInt16[]
---@field public uv Vector2[]
local Sprite = {}
---@public
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit Single
---@param extrude UInt32
---@param meshType number
---@param border Vector4
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude, meshType, border) end
---@public
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit Single
---@param extrude UInt32
---@param meshType number
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude, meshType) end
---@public
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit Single
---@param extrude UInt32
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit, extrude) end
---@public
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@param pixelsPerUnit Single
---@return Sprite
function Sprite.Create(texture, rect, pivot, pixelsPerUnit) end
---@public
---@param texture Texture2D
---@param rect Rect
---@param pivot Vector2
---@return Sprite
function Sprite.Create(texture, rect, pivot) end
---@public
---@param vertices Vector2[]
---@param triangles UInt16[]
---@return void
function Sprite:OverrideGeometry(vertices, triangles) end

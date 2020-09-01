---@class Texture2D : Texture
---@field public mipmapCount Int32
---@field public format number
---@field public whiteTexture Texture2D
---@field public blackTexture Texture2D
---@field public alphaIsTransparency bool
local Texture2D = {}
---@public
---@param width Int32
---@param height Int32
---@param format number
---@param mipmap bool
---@param linear bool
---@param nativeTex IntPtr
---@return Texture2D
function Texture2D.CreateExternalTexture(width, height, format, mipmap, linear, nativeTex) end
---@public
---@param nativeTex IntPtr
---@return void
function Texture2D:UpdateExternalTexture(nativeTex) end
---@public
---@param x Int32
---@param y Int32
---@param color Color
---@return void
function Texture2D:SetPixel(x, y, color) end
---@public
---@param x Int32
---@param y Int32
---@return Color
function Texture2D:GetPixel(x, y) end
---@public
---@param u Single
---@param v Single
---@return Color
function Texture2D:GetPixelBilinear(u, v) end
---@public
---@param colors Color[]
---@return void
function Texture2D:SetPixels(colors) end
---@public
---@param colors Color[]
---@param miplevel Int32
---@return void
function Texture2D:SetPixels(colors, miplevel) end
---@public
---@param x Int32
---@param y Int32
---@param blockWidth Int32
---@param blockHeight Int32
---@param colors Color[]
---@param miplevel Int32
---@return void
function Texture2D:SetPixels(x, y, blockWidth, blockHeight, colors, miplevel) end
---@public
---@param x Int32
---@param y Int32
---@param blockWidth Int32
---@param blockHeight Int32
---@param colors Color[]
---@return void
function Texture2D:SetPixels(x, y, blockWidth, blockHeight, colors) end
---@public
---@param colors Color32[]
---@return void
function Texture2D:SetPixels32(colors) end
---@public
---@param colors Color32[]
---@param miplevel Int32
---@return void
function Texture2D:SetPixels32(colors, miplevel) end
---@public
---@param x Int32
---@param y Int32
---@param blockWidth Int32
---@param blockHeight Int32
---@param colors Color32[]
---@return void
function Texture2D:SetPixels32(x, y, blockWidth, blockHeight, colors) end
---@public
---@param x Int32
---@param y Int32
---@param blockWidth Int32
---@param blockHeight Int32
---@param colors Color32[]
---@param miplevel Int32
---@return void
function Texture2D:SetPixels32(x, y, blockWidth, blockHeight, colors, miplevel) end
---@public
---@param data Byte[]
---@param markNonReadable bool
---@return bool
function Texture2D:LoadImage(data, markNonReadable) end
---@public
---@param data Byte[]
---@return bool
function Texture2D:LoadImage(data) end
---@public
---@param data Byte[]
---@return void
function Texture2D:LoadRawTextureData(data) end
---@public
---@param data IntPtr
---@param size Int32
---@return void
function Texture2D:LoadRawTextureData(data, size) end
---@public
---@return Byte[]
function Texture2D:GetRawTextureData() end
---@public
---@return Color[]
function Texture2D:GetPixels() end
---@public
---@param miplevel Int32
---@return Color[]
function Texture2D:GetPixels(miplevel) end
---@public
---@param x Int32
---@param y Int32
---@param blockWidth Int32
---@param blockHeight Int32
---@param miplevel Int32
---@return Color[]
function Texture2D:GetPixels(x, y, blockWidth, blockHeight, miplevel) end
---@public
---@param x Int32
---@param y Int32
---@param blockWidth Int32
---@param blockHeight Int32
---@return Color[]
function Texture2D:GetPixels(x, y, blockWidth, blockHeight) end
---@public
---@param miplevel Int32
---@return Color32[]
function Texture2D:GetPixels32(miplevel) end
---@public
---@return Color32[]
function Texture2D:GetPixels32() end
---@public
---@param updateMipmaps bool
---@param makeNoLongerReadable bool
---@return void
function Texture2D:Apply(updateMipmaps, makeNoLongerReadable) end
---@public
---@param updateMipmaps bool
---@return void
function Texture2D:Apply(updateMipmaps) end
---@public
---@return void
function Texture2D:Apply() end
---@public
---@param width Int32
---@param height Int32
---@param format number
---@param hasMipMap bool
---@return bool
function Texture2D:Resize(width, height, format, hasMipMap) end
---@public
---@param width Int32
---@param height Int32
---@return bool
function Texture2D:Resize(width, height) end
---@public
---@param highQuality bool
---@return void
function Texture2D:Compress(highQuality) end
---@public
---@param textures Texture2D[]
---@param padding Int32
---@param maximumAtlasSize Int32
---@param makeNoLongerReadable bool
---@return Rect[]
function Texture2D:PackTextures(textures, padding, maximumAtlasSize, makeNoLongerReadable) end
---@public
---@param textures Texture2D[]
---@param padding Int32
---@param maximumAtlasSize Int32
---@return Rect[]
function Texture2D:PackTextures(textures, padding, maximumAtlasSize) end
---@public
---@param textures Texture2D[]
---@param padding Int32
---@return Rect[]
function Texture2D:PackTextures(textures, padding) end
---@public
---@param sizes Vector2[]
---@param padding Int32
---@param atlasSize Int32
---@param results List
---@return bool
function Texture2D.GenerateAtlas(sizes, padding, atlasSize, results) end
---@public
---@param source Rect
---@param destX Int32
---@param destY Int32
---@param recalculateMipMaps bool
---@return void
function Texture2D:ReadPixels(source, destX, destY, recalculateMipMaps) end
---@public
---@param source Rect
---@param destX Int32
---@param destY Int32
---@return void
function Texture2D:ReadPixels(source, destX, destY) end
---@public
---@return Byte[]
function Texture2D:EncodeToPNG() end
---@public
---@param quality Int32
---@return Byte[]
function Texture2D:EncodeToJPG(quality) end
---@public
---@return Byte[]
function Texture2D:EncodeToJPG() end
---@public
---@param flags number
---@return Byte[]
function Texture2D:EncodeToEXR(flags) end
---@public
---@return Byte[]
function Texture2D:EncodeToEXR() end

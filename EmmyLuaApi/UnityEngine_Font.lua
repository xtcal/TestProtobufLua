---@class Font : Object
---@field public material Material
---@field public fontNames String[]
---@field public characterInfo CharacterInfo[]
---@field public textureRebuildCallback FontTextureRebuildCallback
---@field public dynamic bool
---@field public ascent Int32
---@field public lineHeight Int32
---@field public fontSize Int32
local Font = {}
---@public
---@return String[]
function Font.GetOSInstalledFontNames() end
---@public
---@param fontname string
---@param size Int32
---@return Font
function Font.CreateDynamicFontFromOSFont(fontname, size) end
---@public
---@param fontnames String[]
---@param size Int32
---@return Font
function Font.CreateDynamicFontFromOSFont(fontnames, size) end
---@public
---@param c Char
---@return bool
function Font:HasCharacter(c) end
---@public
---@param characters string
---@param size Int32
---@param style number
---@return void
function Font:RequestCharactersInTexture(characters, size, style) end
---@public
---@param characters string
---@param size Int32
---@return void
function Font:RequestCharactersInTexture(characters, size) end
---@public
---@param characters string
---@return void
function Font:RequestCharactersInTexture(characters) end
---@public
---@param value Action
---@return void
function Font.add_textureRebuilt(value) end
---@public
---@param value Action
---@return void
function Font.remove_textureRebuilt(value) end
---@public
---@param str string
---@return Int32
function Font.GetMaxVertsForString(str) end
---@public
---@param ch Char
---@param info CharacterInfo
---@param size Int32
---@param style number
---@return bool
function Font:GetCharacterInfo(ch, info, size, style) end
---@public
---@param ch Char
---@param info CharacterInfo
---@param size Int32
---@return bool
function Font:GetCharacterInfo(ch, info, size) end
---@public
---@param ch Char
---@param info CharacterInfo
---@return bool
function Font:GetCharacterInfo(ch, info) end

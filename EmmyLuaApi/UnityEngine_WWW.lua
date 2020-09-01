---@class WWW : Object
---@field public responseHeaders Dictionary
---@field public text string
---@field public data string
---@field public bytes Byte[]
---@field public size Int32
---@field public error string
---@field public texture Texture2D
---@field public textureNonReadable Texture2D
---@field public audioClip Object
---@field public movie Object
---@field public isDone bool
---@field public progress Single
---@field public uploadProgress Single
---@field public bytesDownloaded Int32
---@field public oggVorbis Object
---@field public url string
---@field public assetBundle AssetBundle
---@field public threadPriority number
local WWW = {}
---@public
---@return void
function WWW:Dispose() end
---@public
---@param url string
---@param postData Byte[]
---@param iHeaders String[]
---@return void
function WWW:InitWWW(url, postData, iHeaders) end
---@public
---@param s string
---@return string
function WWW.EscapeURL(s) end
---@public
---@param s string
---@param e Encoding
---@return string
function WWW.EscapeURL(s, e) end
---@public
---@param s string
---@return string
function WWW.UnEscapeURL(s) end
---@public
---@param s string
---@param e Encoding
---@return string
function WWW.UnEscapeURL(s, e) end
---@public
---@param tex Texture2D
---@return void
function WWW:LoadImageIntoTexture(tex) end
---@public
---@param url string
---@return string
function WWW.GetURL(url) end
---@public
---@param url string
---@return Texture2D
function WWW.GetTextureFromURL(url) end
---@public
---@return void
function WWW:LoadUnityWeb() end
---@public
---@param url string
---@param version Int32
---@return WWW
function WWW.LoadFromCacheOrDownload(url, version) end
---@public
---@param url string
---@param version Int32
---@param crc UInt32
---@return WWW
function WWW.LoadFromCacheOrDownload(url, version, crc) end
---@public
---@param url string
---@param hash Hash128
---@return WWW
function WWW.LoadFromCacheOrDownload(url, hash) end
---@public
---@param url string
---@param hash Hash128
---@param crc UInt32
---@return WWW
function WWW.LoadFromCacheOrDownload(url, hash, crc) end

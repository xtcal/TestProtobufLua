---@class Encoding : Object
---@field public IsReadOnly bool
---@field public IsSingleByte bool
---@field public DecoderFallback DecoderFallback
---@field public EncoderFallback EncoderFallback
---@field public BodyName string
---@field public CodePage Int32
---@field public EncodingName string
---@field public HeaderName string
---@field public IsBrowserDisplay bool
---@field public IsBrowserSave bool
---@field public IsMailNewsDisplay bool
---@field public IsMailNewsSave bool
---@field public WebName string
---@field public WindowsCodePage Int32
---@field public ASCII Encoding
---@field public BigEndianUnicode Encoding
---@field public Default Encoding
---@field public UTF7 Encoding
---@field public UTF8 Encoding
---@field public Unicode Encoding
---@field public UTF32 Encoding
local Encoding = {}
---@public
---@param srcEncoding Encoding
---@param dstEncoding Encoding
---@param bytes Byte[]
---@return Byte[]
function Encoding.Convert(srcEncoding, dstEncoding, bytes) end
---@public
---@param srcEncoding Encoding
---@param dstEncoding Encoding
---@param bytes Byte[]
---@param index Int32
---@param count Int32
---@return Byte[]
function Encoding.Convert(srcEncoding, dstEncoding, bytes, index, count) end
---@public
---@param value Object
---@return bool
function Encoding:Equals(value) end
---@public
---@param chars Char[]
---@param index Int32
---@param count Int32
---@return Int32
function Encoding:GetByteCount(chars, index, count) end
---@public
---@param s string
---@return Int32
function Encoding:GetByteCount(s) end
---@public
---@param chars Char[]
---@return Int32
function Encoding:GetByteCount(chars) end
---@public
---@param chars Char[]
---@param charIndex Int32
---@param charCount Int32
---@param bytes Byte[]
---@param byteIndex Int32
---@return Int32
function Encoding:GetBytes(chars, charIndex, charCount, bytes, byteIndex) end
---@public
---@param s string
---@param charIndex Int32
---@param charCount Int32
---@param bytes Byte[]
---@param byteIndex Int32
---@return Int32
function Encoding:GetBytes(s, charIndex, charCount, bytes, byteIndex) end
---@public
---@param s string
---@return Byte[]
function Encoding:GetBytes(s) end
---@public
---@param chars Char[]
---@param index Int32
---@param count Int32
---@return Byte[]
function Encoding:GetBytes(chars, index, count) end
---@public
---@param chars Char[]
---@return Byte[]
function Encoding:GetBytes(chars) end
---@public
---@param bytes Byte[]
---@param index Int32
---@param count Int32
---@return Int32
function Encoding:GetCharCount(bytes, index, count) end
---@public
---@param bytes Byte[]
---@return Int32
function Encoding:GetCharCount(bytes) end
---@public
---@param bytes Byte[]
---@param byteIndex Int32
---@param byteCount Int32
---@param chars Char[]
---@param charIndex Int32
---@return Int32
function Encoding:GetChars(bytes, byteIndex, byteCount, chars, charIndex) end
---@public
---@param bytes Byte[]
---@param index Int32
---@param count Int32
---@return Char[]
function Encoding:GetChars(bytes, index, count) end
---@public
---@param bytes Byte[]
---@return Char[]
function Encoding:GetChars(bytes) end
---@public
---@return Decoder
function Encoding:GetDecoder() end
---@public
---@return Encoder
function Encoding:GetEncoder() end
---@public
---@param codepage Int32
---@return Encoding
function Encoding.GetEncoding(codepage) end
---@public
---@return Object
function Encoding:Clone() end
---@public
---@param codepage Int32
---@param encoderFallback EncoderFallback
---@param decoderFallback DecoderFallback
---@return Encoding
function Encoding.GetEncoding(codepage, encoderFallback, decoderFallback) end
---@public
---@param name string
---@param encoderFallback EncoderFallback
---@param decoderFallback DecoderFallback
---@return Encoding
function Encoding.GetEncoding(name, encoderFallback, decoderFallback) end
---@public
---@return EncodingInfo[]
function Encoding.GetEncodings() end
---@public
---@return bool
function Encoding:IsAlwaysNormalized() end
---@public
---@param form number
---@return bool
function Encoding:IsAlwaysNormalized(form) end
---@public
---@param name string
---@return Encoding
function Encoding.GetEncoding(name) end
---@public
---@return Int32
function Encoding:GetHashCode() end
---@public
---@param charCount Int32
---@return Int32
function Encoding:GetMaxByteCount(charCount) end
---@public
---@param byteCount Int32
---@return Int32
function Encoding:GetMaxCharCount(byteCount) end
---@public
---@return Byte[]
function Encoding:GetPreamble() end
---@public
---@param bytes Byte[]
---@param index Int32
---@param count Int32
---@return string
function Encoding:GetString(bytes, index, count) end
---@public
---@param bytes Byte[]
---@return string
function Encoding:GetString(bytes) end
---@public
---@param chars Char*
---@param count Int32
---@return Int32
function Encoding:GetByteCount(chars, count) end
---@public
---@param bytes Byte*
---@param count Int32
---@return Int32
function Encoding:GetCharCount(bytes, count) end
---@public
---@param bytes Byte*
---@param byteCount Int32
---@param chars Char*
---@param charCount Int32
---@return Int32
function Encoding:GetChars(bytes, byteCount, chars, charCount) end
---@public
---@param chars Char*
---@param charCount Int32
---@param bytes Byte*
---@param byteCount Int32
---@return Int32
function Encoding:GetBytes(chars, charCount, bytes, byteCount) end

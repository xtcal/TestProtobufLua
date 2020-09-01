---@class ByteBuffer : Object
local ByteBuffer = {}
---@public
---@return void
function ByteBuffer:Close() end
---@public
---@param v Byte
---@return void
function ByteBuffer:WriteByte(v) end
---@public
---@param v Int32
---@return void
function ByteBuffer:WriteInt(v) end
---@public
---@param v UInt16
---@return void
function ByteBuffer:WriteShort(v) end
---@public
---@param v Int64
---@return void
function ByteBuffer:WriteLong(v) end
---@public
---@param v Single
---@return void
function ByteBuffer:WriteFloat(v) end
---@public
---@param v number
---@return void
function ByteBuffer:WriteDouble(v) end
---@public
---@param v string
---@return void
function ByteBuffer:WriteString(v) end
---@public
---@param v Byte[]
---@return void
function ByteBuffer:WriteBytes(v) end
---@public
---@param strBuffer LuaByteBuffer
---@return void
function ByteBuffer:WriteBuffer(strBuffer) end
---@public
---@return Byte
function ByteBuffer:ReadByte() end
---@public
---@return Int32
function ByteBuffer:ReadInt() end
---@public
---@return UInt16
function ByteBuffer:ReadShort() end
---@public
---@return Int64
function ByteBuffer:ReadLong() end
---@public
---@return Single
function ByteBuffer:ReadFloat() end
---@public
---@return number
function ByteBuffer:ReadDouble() end
---@public
---@return string
function ByteBuffer:ReadString() end
---@public
---@return Byte[]
function ByteBuffer:ReadBytes() end
---@public
---@return LuaByteBuffer
function ByteBuffer:ReadBuffer() end
---@public
---@return Byte[]
function ByteBuffer:ToBytes() end
---@public
---@return void
function ByteBuffer:Flush() end

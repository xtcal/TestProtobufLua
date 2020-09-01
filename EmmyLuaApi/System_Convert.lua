---@class Convert : Object
---@field public DBNull Object
local Convert = {}
---@public
---@param inArray Char[]
---@param offset Int32
---@param length Int32
---@return Byte[]
function Convert.FromBase64CharArray(inArray, offset, length) end
---@public
---@param s string
---@return Byte[]
function Convert.FromBase64String(s) end
---@public
---@param value Object
---@return number
function Convert.GetTypeCode(value) end
---@public
---@param value Object
---@return bool
function Convert.IsDBNull(value) end
---@public
---@param inArray Byte[]
---@param offsetIn Int32
---@param length Int32
---@param outArray Char[]
---@param offsetOut Int32
---@return Int32
function Convert.ToBase64CharArray(inArray, offsetIn, length, outArray, offsetOut) end
---@public
---@param inArray Byte[]
---@return string
function Convert.ToBase64String(inArray) end
---@public
---@param inArray Byte[]
---@param offset Int32
---@param length Int32
---@return string
function Convert.ToBase64String(inArray, offset, length) end
---@public
---@param inArray Byte[]
---@param options number
---@return string
function Convert.ToBase64String(inArray, options) end
---@public
---@param inArray Byte[]
---@param offset Int32
---@param length Int32
---@param options number
---@return string
function Convert.ToBase64String(inArray, offset, length, options) end
---@public
---@param inArray Byte[]
---@param offsetIn Int32
---@param length Int32
---@param outArray Char[]
---@param offsetOut Int32
---@param options number
---@return Int32
function Convert.ToBase64CharArray(inArray, offsetIn, length, outArray, offsetOut, options) end
---@public
---@param value bool
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Byte
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Char
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value DateTime
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Decimal
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value number
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Single
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Int32
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Int64
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value SByte
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Int16
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value string
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return bool
function Convert.ToBoolean(value, provider) end
---@public
---@param value UInt32
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value UInt64
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value UInt16
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Object
---@return bool
function Convert.ToBoolean(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return bool
function Convert.ToBoolean(value, provider) end
---@public
---@param value bool
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Byte
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Char
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value DateTime
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Decimal
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value number
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Single
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Int32
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Int64
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value SByte
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Int16
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value string
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Byte
function Convert.ToByte(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return Byte
function Convert.ToByte(value, fromBase) end
---@public
---@param value UInt32
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value UInt64
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value UInt16
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Object
---@return Byte
function Convert.ToByte(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Byte
function Convert.ToByte(value, provider) end
---@public
---@param value bool
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Byte
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Char
---@return Char
function Convert.ToChar(value) end
---@public
---@param value DateTime
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Decimal
---@return Char
function Convert.ToChar(value) end
---@public
---@param value number
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Int32
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Int64
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Single
---@return Char
function Convert.ToChar(value) end
---@public
---@param value SByte
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Int16
---@return Char
function Convert.ToChar(value) end
---@public
---@param value string
---@return Char
function Convert.ToChar(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Char
function Convert.ToChar(value, provider) end
---@public
---@param value UInt32
---@return Char
function Convert.ToChar(value) end
---@public
---@param value UInt64
---@return Char
function Convert.ToChar(value) end
---@public
---@param value UInt16
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Object
---@return Char
function Convert.ToChar(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Char
function Convert.ToChar(value, provider) end
---@public
---@param value string
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return DateTime
function Convert.ToDateTime(value, provider) end
---@public
---@param value bool
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Byte
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Char
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value DateTime
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Decimal
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value number
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Int16
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Int32
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Int64
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Single
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Object
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return DateTime
function Convert.ToDateTime(value, provider) end
---@public
---@param value SByte
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value UInt16
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value UInt32
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value UInt64
---@return DateTime
function Convert.ToDateTime(value) end
---@public
---@param value bool
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Byte
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Char
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value DateTime
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Decimal
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value number
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Single
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Int32
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Int64
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value SByte
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Int16
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value string
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Decimal
function Convert.ToDecimal(value, provider) end
---@public
---@param value UInt32
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value UInt64
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value UInt16
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Object
---@return Decimal
function Convert.ToDecimal(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Decimal
function Convert.ToDecimal(value, provider) end
---@public
---@param value bool
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Byte
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Char
---@return number
function Convert.ToDouble(value) end
---@public
---@param value DateTime
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Decimal
---@return number
function Convert.ToDouble(value) end
---@public
---@param value number
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Single
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Int32
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Int64
---@return number
function Convert.ToDouble(value) end
---@public
---@param value SByte
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Int16
---@return number
function Convert.ToDouble(value) end
---@public
---@param value string
---@return number
function Convert.ToDouble(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return number
function Convert.ToDouble(value, provider) end
---@public
---@param value UInt32
---@return number
function Convert.ToDouble(value) end
---@public
---@param value UInt64
---@return number
function Convert.ToDouble(value) end
---@public
---@param value UInt16
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Object
---@return number
function Convert.ToDouble(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return number
function Convert.ToDouble(value, provider) end
---@public
---@param value bool
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Byte
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Char
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value DateTime
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Decimal
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value number
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Single
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Int32
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Int64
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value SByte
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Int16
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value string
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Int16
function Convert.ToInt16(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return Int16
function Convert.ToInt16(value, fromBase) end
---@public
---@param value UInt32
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value UInt64
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value UInt16
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Object
---@return Int16
function Convert.ToInt16(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Int16
function Convert.ToInt16(value, provider) end
---@public
---@param value bool
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Byte
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Char
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value DateTime
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Decimal
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value number
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Single
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Int32
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Int64
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value SByte
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Int16
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value string
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Int32
function Convert.ToInt32(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return Int32
function Convert.ToInt32(value, fromBase) end
---@public
---@param value UInt32
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value UInt64
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value UInt16
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Object
---@return Int32
function Convert.ToInt32(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Int32
function Convert.ToInt32(value, provider) end
---@public
---@param value bool
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Byte
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Char
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value DateTime
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Decimal
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value number
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Single
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Int32
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Int64
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value SByte
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Int16
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value string
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Int64
function Convert.ToInt64(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return Int64
function Convert.ToInt64(value, fromBase) end
---@public
---@param value UInt32
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value UInt64
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value UInt16
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Object
---@return Int64
function Convert.ToInt64(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Int64
function Convert.ToInt64(value, provider) end
---@public
---@param value bool
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Byte
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Char
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value DateTime
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Decimal
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value number
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Single
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Int32
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Int64
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value SByte
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Int16
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value string
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return SByte
function Convert.ToSByte(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return SByte
function Convert.ToSByte(value, fromBase) end
---@public
---@param value UInt32
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value UInt64
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value UInt16
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Object
---@return SByte
function Convert.ToSByte(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return SByte
function Convert.ToSByte(value, provider) end
---@public
---@param value bool
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Byte
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Char
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value DateTime
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Decimal
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value number
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Single
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Int32
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Int64
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value SByte
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Int16
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value string
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return Single
function Convert.ToSingle(value, provider) end
---@public
---@param value UInt32
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value UInt64
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value UInt16
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Object
---@return Single
function Convert.ToSingle(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return Single
function Convert.ToSingle(value, provider) end
---@public
---@param value bool
---@return string
function Convert.ToString(value) end
---@public
---@param value bool
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Byte
---@return string
function Convert.ToString(value) end
---@public
---@param value Byte
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Byte
---@param toBase Int32
---@return string
function Convert.ToString(value, toBase) end
---@public
---@param value Char
---@return string
function Convert.ToString(value) end
---@public
---@param value Char
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value DateTime
---@return string
function Convert.ToString(value) end
---@public
---@param value DateTime
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Decimal
---@return string
function Convert.ToString(value) end
---@public
---@param value Decimal
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value number
---@return string
function Convert.ToString(value) end
---@public
---@param value number
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Single
---@return string
function Convert.ToString(value) end
---@public
---@param value Single
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Int32
---@return string
function Convert.ToString(value) end
---@public
---@param value Int32
---@param toBase Int32
---@return string
function Convert.ToString(value, toBase) end
---@public
---@param value Int32
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Int64
---@return string
function Convert.ToString(value) end
---@public
---@param value Int64
---@param toBase Int32
---@return string
function Convert.ToString(value, toBase) end
---@public
---@param value Int64
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Object
---@return string
function Convert.ToString(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value SByte
---@return string
function Convert.ToString(value) end
---@public
---@param value SByte
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value Int16
---@return string
function Convert.ToString(value) end
---@public
---@param value Int16
---@param toBase Int32
---@return string
function Convert.ToString(value, toBase) end
---@public
---@param value Int16
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value string
---@return string
function Convert.ToString(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value UInt32
---@return string
function Convert.ToString(value) end
---@public
---@param value UInt32
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value UInt64
---@return string
function Convert.ToString(value) end
---@public
---@param value UInt64
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value UInt16
---@return string
function Convert.ToString(value) end
---@public
---@param value UInt16
---@param provider IFormatProvider
---@return string
function Convert.ToString(value, provider) end
---@public
---@param value bool
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Byte
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Char
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value DateTime
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Decimal
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value number
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Single
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Int32
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Int64
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value SByte
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Int16
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value string
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return UInt16
function Convert.ToUInt16(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return UInt16
function Convert.ToUInt16(value, fromBase) end
---@public
---@param value UInt32
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value UInt64
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value UInt16
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Object
---@return UInt16
function Convert.ToUInt16(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return UInt16
function Convert.ToUInt16(value, provider) end
---@public
---@param value bool
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Byte
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Char
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value DateTime
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Decimal
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value number
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Single
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Int32
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Int64
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value SByte
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Int16
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value string
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return UInt32
function Convert.ToUInt32(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return UInt32
function Convert.ToUInt32(value, fromBase) end
---@public
---@param value UInt32
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value UInt64
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value UInt16
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Object
---@return UInt32
function Convert.ToUInt32(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return UInt32
function Convert.ToUInt32(value, provider) end
---@public
---@param value bool
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Byte
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Char
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value DateTime
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Decimal
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value number
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Single
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Int32
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Int64
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value SByte
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Int16
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value string
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value string
---@param provider IFormatProvider
---@return UInt64
function Convert.ToUInt64(value, provider) end
---@public
---@param value string
---@param fromBase Int32
---@return UInt64
function Convert.ToUInt64(value, fromBase) end
---@public
---@param value UInt32
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value UInt64
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value UInt16
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Object
---@return UInt64
function Convert.ToUInt64(value) end
---@public
---@param value Object
---@param provider IFormatProvider
---@return UInt64
function Convert.ToUInt64(value, provider) end
---@public
---@param value Object
---@param conversionType Type
---@return Object
function Convert.ChangeType(value, conversionType) end
---@public
---@param value Object
---@param typeCode number
---@return Object
function Convert.ChangeType(value, typeCode) end
---@public
---@param value Object
---@param conversionType Type
---@param provider IFormatProvider
---@return Object
function Convert.ChangeType(value, conversionType, provider) end
---@public
---@param value Object
---@param typeCode number
---@param provider IFormatProvider
---@return Object
function Convert.ChangeType(value, typeCode, provider) end

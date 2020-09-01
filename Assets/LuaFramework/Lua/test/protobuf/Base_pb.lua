MsgData.base = {}
local base = MsgData.base
---@class base.GIPEndPoint 
---@field public Ip number 这是ip
---@field public Port string 
---@return base.GIPEndPoint
function base.GIPEndPoint(code)
	---@type base.GIPEndPoint
	local _new = {}
	_new._desc = "base.GIPEndPoint"
	if code then
		_new = protobuf.decode("base.GIPEndPoint", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("base.GIPEndPoint", _new)
	end
	return _new
end

---@class base.GVector3 
---@field public X number 
---@field public Y number 
---@field public Z number 
---@return base.GVector3
function base.GVector3(code)
	---@type base.GVector3
	local _new = {}
	_new._desc = "base.GVector3"
	if code then
		_new = protobuf.decode("base.GVector3", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("base.GVector3", _new)
	end
	return _new
end

---@class base.MessageData 
---@field public ret number 
---@field public desc string 
---@field public com number 
---@field public tsak number 
---@field public data string 
---@return base.MessageData
function base.MessageData(code)
	---@type base.MessageData
	local _new = {}
	_new._desc = "base.MessageData"
	if code then
		_new = protobuf.decode("base.MessageData", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("base.MessageData", _new)
	end
	return _new
end


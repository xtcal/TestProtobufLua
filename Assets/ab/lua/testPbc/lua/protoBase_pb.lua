MsgData.protoBase = {}
local protoBase = MsgData.protoBase
---@class protoBase.GIPEndPoint 
---@field public Ip number 这是ip
---@field public Port string 
---@return protoBase.GIPEndPoint
function protoBase.GIPEndPoint(code)
	---@type protoBase.GIPEndPoint
	local _new = {}
	_new._desc = "protoBase.GIPEndPoint"
	if code then
		_new = protobuf.decode("protoBase.GIPEndPoint", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoBase.GIPEndPoint", _new)
	end
	return _new
end

---@class protoBase.GVector3 
---@field public X number 
---@field public Y number 
---@field public Z number 
---@return protoBase.GVector3
function protoBase.GVector3(code)
	---@type protoBase.GVector3
	local _new = {}
	_new._desc = "protoBase.GVector3"
	if code then
		_new = protobuf.decode("protoBase.GVector3", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoBase.GVector3", _new)
	end
	return _new
end

---@class protoBase.MessageData 
---@field public ret number 
---@field public desc string 
---@field public com number 
---@field public tsak number 
---@field public data string 
---@return protoBase.MessageData
function protoBase.MessageData(code)
	---@type protoBase.MessageData
	local _new = {}
	_new._desc = "protoBase.MessageData"
	if code then
		_new = protobuf.decode("protoBase.MessageData", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoBase.MessageData", _new)
	end
	return _new
end

---@class protoBase.Corpus 
protoBase.Corpus = {}
protoBase.Corpus.UNIVERSAL = 0
protoBase.Corpus.WEB = 1
protoBase.Corpus.IMAGES = 2
protoBase.Corpus.LOCAL = 3
protoBase.Corpus.NEWS = 4
protoBase.Corpus.PRODUCTS = 5
protoBase.Corpus.VIDEO = 6

---@class protoBase.PhoneType 
protoBase.PhoneType = {}
protoBase.PhoneType.MOBILE = 0
protoBase.PhoneType.HOME = 1
protoBase.PhoneType.WORK = 2

---@class protoBase.PhoneNumber 
---@field public number string 
---@field public type protoBase.PhoneType 
---@return protoBase.PhoneNumber
function protoBase.PhoneNumber(code)
	---@type protoBase.PhoneNumber
	local _new = {}
	_new._desc = "protoBase.PhoneNumber"
	if code then
		_new = protobuf.decode("protoBase.PhoneNumber", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoBase.PhoneNumber", _new)
	end
	return _new
end

---@class protoBase.Person 
---@field public name string 
---@field public id number 
---@field public email string 
---@field public phone protoBase.PhoneNumber[] 
---@return protoBase.Person
function protoBase.Person(code)
	---@type protoBase.Person
	local _new = {}
	_new._desc = "protoBase.Person"
	if code then
		_new = protobuf.decode("protoBase.Person", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoBase.Person", _new)
	end
	return _new
end

---@class protoBase.AddressBook 
---@field public person protoBase.Person[] 
---@return protoBase.AddressBook
function protoBase.AddressBook(code)
	---@type protoBase.AddressBook
	local _new = {}
	_new._desc = "protoBase.AddressBook"
	if code then
		_new = protobuf.decode("protoBase.AddressBook", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoBase.AddressBook", _new)
	end
	return _new
end


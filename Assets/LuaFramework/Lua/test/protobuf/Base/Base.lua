local this = {}
---@class Base.GIPEndPoint 
---@field public Ip number 这是ip
---@field public Port string 
---@return Base.GIPEndPoint
function this.GIPEndPoint(_data)
	local o = {
		_desc = "Base.GIPEndPoint"
	}
	if _data then
		o = protobuf.decode("Base.GIPEndPoint", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("Base.GIPEndPoint", o)
	end
	return o
end

---@class Base.GVector3 
---@field public X number 
---@field public Y number 
---@field public Z number 
---@return Base.GVector3
function this.GVector3(_data)
	local o = {
		_desc = "Base.GVector3"
	}
	if _data then
		o = protobuf.decode("Base.GVector3", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("Base.GVector3", o)
	end
	return o
end

---@class Base.MessageData 
---@field public ret number 
---@field public desc string 
---@field public com number 
---@field public tsak number 
---@field public data string 
---@return Base.MessageData
function this.MessageData(_data)
	local o = {
		_desc = "Base.MessageData"
	}
	if _data then
		o = protobuf.decode("Base.MessageData", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("Base.MessageData", o)
	end
	return o
end

---@class Base.Corpus 
this.Corpus = {
	UNIVERSAL = 0,
	WEB = 1,
	IMAGES = 2,
	LOCAL = 3,
	NEWS = 4,
	PRODUCTS = 5,
	VIDEO = 6,
}

---@class Base.PhoneType 
this.PhoneType = {
	MOBILE = 0,
	HOME = 1,
	WORK = 2,
}

---@class Base.PhoneNumber 
---@field public number string 
---@field public type Base.PhoneType 
---@return Base.PhoneNumber
function this.PhoneNumber(_data)
	local o = {
		_desc = "Base.PhoneNumber"
	}
	if _data then
		o = protobuf.decode("Base.PhoneNumber", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("Base.PhoneNumber", o)
	end
	return o
end

---@class Base.Person 
---@field public name string 
---@field public id number 
---@field public email string 
---@field public phone Base.PhoneNumber[] 
---@return Base.Person
function this.Person(_data)
	local o = {
		_desc = "Base.Person"
	}
	if _data then
		o = protobuf.decode("Base.Person", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("Base.Person", o)
	end
	return o
end

---@class Base.AddressBook 
---@field public person Base.Person[] 
---@return Base.AddressBook
function this.AddressBook(_data)
	local o = {
		_desc = "Base.AddressBook"
	}
	if _data then
		o = protobuf.decode("Base.AddressBook", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("Base.AddressBook", o)
	end
	return o
end

return this

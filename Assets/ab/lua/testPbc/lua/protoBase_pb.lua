MsgData.protoBase = {
	---@class protoBase.GIPEndPoint
	---@field public Ip number 这是ip
	---@field public Port string
	---@return protoBase.GIPEndPoint
	GIPEndPoint = function(code)
		return MsgData.GenData("protoBase.GIPEndPoint", code)
	end,

	---@class protoBase.GVector3
	---@field public X number
	---@field public Y number
	---@field public Z number
	---@return protoBase.GVector3
	GVector3 = function(code)
		return MsgData.GenData("protoBase.GVector3", code)
	end,

	---@class protoBase.MessageData
	---@field public ret number
	---@field public desc string
	---@field public com number
	---@field public tsak number
	---@field public data string
	---@return protoBase.MessageData
	MessageData = function(code)
		return MsgData.GenData("protoBase.MessageData", code)
	end,

	---@class protoBase.Corpus
	Corpus = {
		UNIVERSAL = 0,
		---测试
		WEB = 1,
		IMAGES = 2,
		LOCAL = 3,
		NEWS = 4,
		PRODUCTS = 5,
		VIDEO = 6,
	},

	---@class protoBase.PhoneType
	PhoneType = {
		MOBILE = 0,
		HOME = 1,
		WORK = 2,
	},

	---@class protoBase.PhoneNumber
	---@field public number string
	---@field public type protoBase.PhoneType
	---@return protoBase.PhoneNumber
	PhoneNumber = function(code)
		return MsgData.GenData("protoBase.PhoneNumber", code)
	end,

	---@class protoBase.Person
	---@field public name string
	---@field public id number
	---@field public email string
	---@field public phone protoBase.PhoneNumber[]
	---@return protoBase.Person
	Person = function(code)
		return MsgData.GenData("protoBase.Person", code)
	end,

	---@class protoBase.AddressBook
	---@field public person protoBase.Person[]
	---@return protoBase.AddressBook
	AddressBook = function(code)
		return MsgData.GenData("protoBase.AddressBook", code)
	end,

}
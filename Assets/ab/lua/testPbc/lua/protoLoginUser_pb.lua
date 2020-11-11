MsgData.protoLoginUser = {}
local protoLoginUser = MsgData.protoLoginUser
---@class protoLoginUser.CS_LoginUser 
---@field public uid string 
---@field public userName string 
---@field public passWord string 
---@return protoLoginUser.CS_LoginUser
function protoLoginUser.CS_LoginUser(code)
	---@type protoLoginUser.CS_LoginUser
	local _new = {}
	_new._desc = "protoLoginUser.CS_LoginUser"
	if code then
		_new = protobuf.decode("protoLoginUser.CS_LoginUser", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoLoginUser.CS_LoginUser", _new)
	end
	return _new
end

---@class protoLoginUser.SC_LoginUser 用户信息
---@field public Ret number 信息
---@field public Sex number 
---@field public Nick string 
---@field public Uid number 
---@field public Token string 
---@field public vet protoBase.GVector3 
---@return protoLoginUser.SC_LoginUser
function protoLoginUser.SC_LoginUser(code)
	---@type protoLoginUser.SC_LoginUser
	local _new = {}
	_new._desc = "protoLoginUser.SC_LoginUser"
	if code then
		_new = protobuf.decode("protoLoginUser.SC_LoginUser", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("protoLoginUser.SC_LoginUser", _new)
	end
	return _new
end


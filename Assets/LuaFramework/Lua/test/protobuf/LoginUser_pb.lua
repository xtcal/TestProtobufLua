MsgData.LoginUser = {}
local LoginUser = MsgData.LoginUser
---@class LoginUser.CS_LoginUser 
---@field public uid number 
---@field public userName string 
---@field public passWord string 
---@return LoginUser.CS_LoginUser
function LoginUser.CS_LoginUser(code)
	---@type LoginUser.CS_LoginUser
	local _new = {}
	_new._desc = "LoginUser.CS_LoginUser"
	if code then
		_new = protobuf.decode("LoginUser.CS_LoginUser", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("LoginUser.CS_LoginUser", _new)
	end
	return _new
end

---@class LoginUser.SC_LoginUser 用户信息
---@field public Ret number 信息
---@field public Sex number 
---@field public Nick string 
---@field public Uid number 
---@field public Token string 
---@return LoginUser.SC_LoginUser
function LoginUser.SC_LoginUser(code)
	---@type LoginUser.SC_LoginUser
	local _new = {}
	_new._desc = "LoginUser.SC_LoginUser"
	if code then
		_new = protobuf.decode("LoginUser.SC_LoginUser", code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode("LoginUser.SC_LoginUser", _new)
	end
	return _new
end


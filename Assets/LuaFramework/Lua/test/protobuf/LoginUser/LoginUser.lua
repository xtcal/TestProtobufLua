local this = {}
---@class LoginUser.CS_LoginUser 
---@field public uid number 
---@field public userName string 
---@field public passWord string 
---@return LoginUser.CS_LoginUser
function this.CS_LoginUser(_data)
	local o = {
		_desc = "LoginUser.CS_LoginUser"
	}
	if _data then
		o = protobuf.decode("LoginUser.CS_LoginUser", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("LoginUser.CS_LoginUser", o)
	end
	return o
end

---@class LoginUser.SC_LoginUser 用户信息
---@field public Ret number 信息
---@field public Sex number 
---@field public Nick string 
---@field public Uid number 
---@field public Token string 
---@field public vet Base.GVector3 
---@return LoginUser.SC_LoginUser
function this.SC_LoginUser(_data)
	local o = {
		_desc = "LoginUser.SC_LoginUser"
	}
	if _data then
		o = protobuf.decode("LoginUser.SC_LoginUser", _data)
	end
	function o.Encode()
		o.Encode = nil
		o._desc = nil
		return protobuf.encode("LoginUser.SC_LoginUser", o)
	end
	return o
end

return this

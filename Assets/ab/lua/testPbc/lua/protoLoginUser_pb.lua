MsgData.protoLoginUser = {
	---@class protoLoginUser.CS_LoginUser 
	---@field public uid string 
	---@field public userName string 
	---@field public passWord string 
	---@return protoLoginUser.CS_LoginUser
	CS_LoginUser = function (code)
		return MsgData.GenData("protoLoginUser.CS_LoginUser",code)
	end,

	---@class protoLoginUser.SC_LoginUser 用户信息
	---@field public Ret number 信息
	---@field public Sex number 
	---@field public Nick string 
	---@field public Uid number 
	---@field public Token string 
	---@field public vet protoBase.GVector3 
	---@return protoLoginUser.SC_LoginUser
	SC_LoginUser = function (code)
		return MsgData.GenData("protoLoginUser.SC_LoginUser",code)
	end,

}
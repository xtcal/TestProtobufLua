CtrlNames = {
    Prompt = "PromptCtrl",
    Message = "MessageCtrl"
}

PanelNames = {
    "PromptPanel",
    "MessagePanel",
}

--协议类型--
ProtocalType = {
    BINARY = 0,
    PB_LUA = 1,
    PBC = 2,
    SPROTO = 3
}

--Buildin Table
Protocal = {
    Connect = "101", --连接服务器
    Exception = "102", --异常掉线
    Disconnect = "103", --正常断线
    Message = "104" --接收消息
}

--当前使用的协议类型--
TestProtoType = ProtocalType.BINARY

Util = LuaFramework.Util
AppConst = LuaFramework.AppConst
LuaHelper = LuaFramework.LuaHelper
ByteBuffer = LuaFramework.ByteBuffer

resMgr = LuaHelper.GetResManager()
panelMgr = LuaHelper.GetPanelManager()
soundMgr = LuaHelper.GetSoundManager()
networkMgr = LuaHelper.GetNetManager()
luaMgr = LuaHelper.GetLuaManager()

WWW = UnityEngine.WWW
GameObject = UnityEngine.GameObject
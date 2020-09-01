require "Common/tools"
require "Common/define"
require "3rd/pbc/protobuf"
require "test/MsgData_pb"

--管理器--
Game = {}
local this = Game

local game
local transform
local gameObject
local WWW = UnityEngine.WWW

function this.InitViewPanels()
    for i = 1, #PanelNames do
        require("View/" .. tostring(PanelNames[i]))
    end
end

--初始化完成，发送链接服务器信息--
function this.OnInitOK()
    local _mData = MsgData.base.MessageData()
    local _user = MsgData.LoginUser.CS_LoginUser()
    _user.passWord = "1234"
    _user.uid = 12345
    _user.userName = "5555"
    _mData.desc = _user._desc
    _mData.data = _user.Encode()

    log(table_tostring(_mData))





    if true then
        return
    end
    AppConst.SocketPort = 2012
    AppConst.SocketAddress = "127.0.0.1"
    networkMgr:SendConnect()

    TimeTick.Create() --创建计时器
    this.InitViewPanels()

    logWarn("LuaFramework InitOK--->>>")
    this.Init()

    MessageCtrl.Show()

    -- resMgr:LoadPrefab
    resMgr:LoadSprite(
        "prompt_asset",
        "1.png",
        function(o)
            local b = o[0]

            local img = find("Test"):GetComponent("Image")
            log("img == " .. tostring(img))
            img.sprite = b
            log("o == " .. (b.triangles[0]))
        end
    )
end

--销毁--
function this.OnDestroy()
    logWarn("OnDestroy--->>>")
end

function this.Init()
    log("MsgData == " .. table_tostring(MsgData))

    local _mData = MsgData.base.MessageData()

    local _user = MsgData.LoginUser.CS_LoginUser()
    _user.passWord = "1234"
    _user.uid = 12345
    _user.userName = "5555"

    _mData.desc = _user._desc
    _mData.data = _user.Encode()

    -- local hData = protobuf.decode("base.MessageData", _mData.Encode()) ---@type base.MessageData

    -- local user = protobuf.decode(hData.desc, hData.data)	---@type LoginUser.CS_LoginUser
    -- log("_mData == " , table_tostring(_mData))

    Event.AddListener(
        "LoginUser.CS_LoginUser",
        function(user)
            log("user.uid == ", table_tostring(user))
        end
    )

    -- this.GetData(_mData.Encode())

    ---@type File
    System.IO.File.WriteAllText("e:/1.txt", System.Convert.ToString(_mData.Encode()))

    -- this.GetData(System.Convert.FromBase64String(System.IO.File.ReadAllText("e:/1.txt")))
end

function this.GetData(code)
    log("code == " .. tostring(code))
    local hData = MsgData.base.MessageData(code)
    log("hData == " .. table_tostring(hData))
    if hData.desc then
        local mData = MsgData[hData.desc](hData.data)
        Event.Brocast(hData.desc, mData)
    else
        local key = hData.com .. "_" .. hData.task
        Event.Brocast(key, DellTab[key]())
    end
end

function this.Send(data)
    local _mData = MsgData.base.MessageData()
    _mData.desc = data._desc
    _mData.data = data.Encode()
    _mData.Encode()
end

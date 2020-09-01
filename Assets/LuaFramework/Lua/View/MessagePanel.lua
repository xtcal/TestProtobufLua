--[[ ************************
XXX的面板
*************************** ]]
MessagePanel = {}
local this = MessagePanel
this.Ctrl = require "Controller/MessageCtrl"

local gameObject = nil
local transform = nil

--面板卸载
function this.UnLoad()
    if gameObject ~= nil then
        gameObject = nil
        transform = nil
    end
end

--控件声明
this.btn_xxx = nil

--控件初始化
function this.Init(_obj)
    gameObject = _obj
    transform = _obj.transform

    this.btnClose = transform:Find("Button").gameObject

    this.BindUIEvent()
end

--绑定控件事件
function this.BindUIEvent()
    UiClickHelper.AddClick(this.btnClose, this.Ctrl.OnCloseClick)
end

---------------- Item Class ----------------

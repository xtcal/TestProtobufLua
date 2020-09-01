--[[ ************************
XXX的控制器
*************************** ]]
MessageCtrl = {}
local this = MessageCtrl
this.Panel = MessagePanel

local gameObject = nil
local transform = nil
local event_tb = {}
local taskArr = {}
local isLoading = false

--获取面板的可见性
function this.GetVisible()
    local ret = false
    if gameObject ~= nil then
        ret = gameObject.activeSelf
    end
    return ret
end

--设置面板的可见性
function this.SetVisible(_bool)
    if gameObject ~= nil then
        gameObject:SetActive(_bool)
    end
end

--初始化监听事件 （该事件的 strKey 需要定义xxxEvent）
local function InitEvents()
    -- event_tb = {
    -- {strkey1, this.OnXXXEvent},
    -- {strkey2, this.OnXXXEvent2}
    -- }
    --event_tb[1] = {strkey1, this.OnXXXEvent};
    --event_tb[2] = {strkey2, this.OnXXXEvent2};
end

--预加载资源
function this.PreLoad(callback)
    if isLoading then
        return
    end
    if gameObject == nil then
        isLoading = true
        panelMgr:CreatePanel(
            "Message",
            function(obj)
                gameObject = obj
                transform = obj.transform
                isLoading = false
                this.Panel.Init(obj)
                InitEvents()
                --Awake:
                this.PreLoad(callback)
            end
        )
    else
        if callback then
            callback()
        end
        for i, v in ipairs(taskArr) do
            v[1](unpack(v[2]))
        end
        taskArr = {}
    end
end

--面板显示
function this.Show()
    if gameObject == nil then
        local task = {this.Show, {}}
        table.insert(taskArr, task)
        this.PreLoad()
    else
        --TODO:
        Tools.AddEventListener(event_tb)
        this.SetVisible(true)
    end
end

--面板隐藏
function this.Hide()
    if gameObject == nil then
        local task = {this.Hide, {}}
        table.insert(taskArr, task)
        this.PreLoad()
    else
        --TODO:
        Tools.RemoveEventListener(event_tb)
        this.SetVisible(false)
    end
end

--面板卸载
function this.UnLoad()
    if gameObject ~= nil then
        Tools.RemoveEventListener(event_tb)
        destroy(gameObject)
        gameObject = nil
        transform = nil
        this.Panel.UnLoad()
    --TODO:
    end
end

---------------- 所有控件事件 ----------------
function this.OnCloseClick(go)
    this.Hide()
end

---------------- 其他业务逻辑 ----------------
--对外访问函数的标准模板
function this.OnXXXEvent(para1, para2)
    if gameObject == nil then
        local task = {this.OnXXXEvent, {para1, para2}}
        table.insert(taskArr, task)
        this.PreLoad()
    else
        --业务逻辑主体
        this.Show()
    end
end

return this

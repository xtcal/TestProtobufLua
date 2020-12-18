--[[ ********************
UI按钮点击帮助
********************** ]]
UiClickHelper = {}
local this = UiClickHelper

local anitime = 0.1 --动画运行时间
local aniscale = 1.1 --缩放值
local anioffect = -5 --偏移值
this.AniType = {
    none = 0,
    scale = 1,
    offset = 2,
    both = 3
} --动画类型枚举
local clickRecordTable = {} --点击按钮时间记录

function this.Init()
end

--添加缩放动画
function this.AddScale(go)
    local uel = UIEventListener.Get(go)
    local tran = go.transform
    local tweenDown = nil

    uel.aniClickDown = function()
        tweenDown = tran:DOScale(aniscale, anitime):SetUpdate(true)
    end

    uel.aniClickUp = function()
        if tweenDown then
            tweenDown:Kill()
        end
        tran:DOScale(1, anitime):SetUpdate(true)
    end
end

--添加偏移动画
function this.AddOffset(go)
    local uel = UIEventListener.Get(go)
    local tran = go.transform
    local startPos = nil
    local endPos = nil
    local tweenDown = nil

    uel.aniClickDown = function()
        if startPos == nil then
            startPos = tran.localPosition
            endPos = startPos + Vector3.New(0, anioffect, 0)
        end
        tweenDown = tran:DOLocalMove(endPos, anitime):SetUpdate(true)
    end

    uel.aniClickUp = function()
        if tweenDown then
            tweenDown:Kill()
        end
        tran:DOLocalMove(startPos, anitime):SetUpdate(true)
    end
end

--添加缩放加偏移动画
function this.AddScaleAndOffect(go)
    local uel = UIEventListener.Get(go)
    local tran = go.transform
    local startPos = nil
    local endPos = nil
    local tweenDown1, tweenDown2 = nil, nil

    uel.aniClickDown = function()
        if startPos == nil then
            startPos = tran.localPosition
            endPos = startPos + Vector3.New(0, anioffect, 0)
        end
        tweenDown1 = tran:DOScale(aniscale, anitime):SetUpdate(true)
        tweenDown2 = tran:DOLocalMove(endPos, anitime):SetUpdate(true)
    end

    uel.aniClickUp = function()
        if tweenDown1 then
            tweenDown1:Kill()
        end
        if tweenDown2 then
            tweenDown2:Kill()
        end
        tran:DOScale(1, anitime):SetUpdate(true)
        tran:DOLocalMove(startPos, anitime):SetUpdate(true)
    end
end

--添加点击音效
function this.AddSound(go, name)
    -- name = name or LuaAppConst.defaultClickSound
    UIEventListener.Get(go).soundClick = function()
        -- LyxTools.PlaySound(name, 2);
    end
end

--添加点击事件
--@para go gameObject按钮
--@para clickEvent function事件
--@para isUseCD 是否加入冷却时间
--@para aniType 动画类型的枚举(UiClickHelper.AniType)
--@para isDefaultSound 是否添加默认点击音效
function this.AddClick(go, clickEvent, isUseCD, aniType, isDefaultSound, UseCD)
    if isUseCD == nil then
        isUseCD = false
    end
    if aniType == nil then
        aniType = this.AniType.both
    end
    if isDefaultSound == nil then
        isDefaultSound = true
    end
    UseCD = UseCD or 1
    UIEventListener.Get(go).onClick = function(o)
        if isUseCD then
            local tempGUID = o:GetInstanceID()
            local lastTime = clickRecordTable[tempGUID] or 0
            if os.time() - lastTime > UseCD then
                if clickEvent then
                    clickEvent(o)
                end
                clickRecordTable[tempGUID] = os.time()
            end
        else
            if clickEvent then
                clickEvent(o)
            end
        end
    end

    if isDefaultSound then
        this.AddSound(go)
    end

    if aniType == this.AniType.scale then
        this.AddScale(go)
    elseif aniType == this.AniType.offset then
        this.AddOffset(go)
    elseif aniType == this.AniType.both then
        this.AddScaleAndOffect(go)
    end
end

--添加点击事件
function this.AddClickDown(go, clickDownEvent, aniType, isDefaultSound)
    if aniType == nil then
        aniType = this.AniType.both
    end
    if isDefaultSound == nil then
        isDefaultSound = true
    end

    UIEventListener.Get(go).onClickDown = function()
        if clickDownEvent then
            clickDownEvent()
        end
        if isDefaultSound then
        -- LyxTools.PlaySound(LuaAppConst.defaultClickSound, 2);
        end
    end

    if aniType == this.AniType.scale then
        this.AddScale(go)
    elseif aniType == this.AniType.offset then
        this.AddOffset(go)
    elseif aniType == this.AniType.both then
        this.AddScaleAndOffect(go)
    end
end

--添加点击事件
function this.AddClickUp(go, clickUpEvent, aniType, isDefaultSound)
    if aniType == nil then
        aniType = this.AniType.both
    end
    if isDefaultSound == nil then
        isDefaultSound = true
    end

    UIEventListener.Get(go).onClickUp = function()
        if clickUpEvent then
            clickUpEvent()
        end
        if isDefaultSound then
        -- LyxTools.PlaySound(LuaAppConst.defaultClickSound, 2);
        end
    end

    if aniType == this.AniType.scale then
        this.AddScale(go)
    elseif aniType == this.AniType.offset then
        this.AddOffset(go)
    elseif aniType == this.AniType.both then
        this.AddScaleAndOffect(go)
    end
end

--设定点击锁定（包含：click, down, up）
--@go: 按钮的gameObject
--@_bool: true：上锁， false：解锁
function this.SetClickLock(go, _bool)
    local uel = UIEventListener.Get(go)
    uel:SetClickLock(_bool)
end

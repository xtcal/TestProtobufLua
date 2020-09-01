---@class TimerManager : Manager
---@field public Interval Single
local TimerManager = {}
---@public
---@param value Single
---@return void
function TimerManager:StartTimer(value) end
---@public
---@return void
function TimerManager:StopTimer() end
---@public
---@param info TimerInfo
---@return void
function TimerManager:AddTimerEvent(info) end
---@public
---@param info TimerInfo
---@return void
function TimerManager:RemoveTimerEvent(info) end
---@public
---@param info TimerInfo
---@return void
function TimerManager:StopTimerEvent(info) end
---@public
---@param info TimerInfo
---@return void
function TimerManager:ResumeTimerEvent(info) end

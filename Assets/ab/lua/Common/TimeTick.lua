TimeTick = {};
local this = TimeTick;

local coTimeTick = nil;
local listTimer = {}; --计时器列表
local Timer = {}; --计时器对象
local controlKeyArr = {}; --监控队列key

local function Update()
	for _, beat in pairs(listTimer) do
		if beat ~= nil then
			beat:Update();
		end
	end
end

--创建计时管理器
function this.Create()
	if coTimeTick == nil then
		coTimeTick = TimeManager.Instance:Add(nil, Update, 0, -1);
	end
end

--添加计时托管
--@para   key          键值
--@para   callback     回调
--@para   rate         频率（间隔时间）
--@para   repeatTime   重复次数（0为无限）
--@para   saveKey	   是否保存key值
function this.Add(key, callback, rate, repeatTime, saveKey)
	if rate == nil or rate < 0 then
		rate = 0;
	end
	if repeatTime == nil or repeatTime < 0 then
		repeatTime = 0;
	end
	if saveKey == nil then
		saveKey = false;
	end
	if listTimer[key] == nil then
		local timer = Timer.New(key, callback, rate, repeatTime);
		listTimer[key] = timer;
		if saveKey then
			local tempWaitRemove = {};
			for i, v in ipairs(controlKeyArr) do
				if listTimer[v] == nil then
					table.insert(tempWaitRemove, 1, i);
				end
			end
			for _, v in ipairs(tempWaitRemove) do
				table.remove(controlKeyArr, v);
			end
			table.insert(controlKeyArr, key);
		end
	end
end

--添加计时托管
--@para   callback     回调
--@para   rate         频率（间隔时间）
--@para   repeatTime   重复次数（0为无限）
--@para   saveKey	   是否保存key值
function this.Exe(callback, rate, repeatTime, saveKey)
	math.randomseed(tostring(os.time()):reverse():sub(1, 6));
	local tempKey = math.random(100);
	while listTimer[tempKey] ~= nil do
		tempKey = tempKey + 1;
	end
	this.Add(tempKey, callback, rate, repeatTime, saveKey);
end

--删除计时
--@para key 键值
--@para isExe 是否同时执行
function this.Remove(key, isExe)
	if isExe == nil then
		isExe = false
	end
	if listTimer[key] ~= nil then
		if isExe == true then
			listTimer[key]:Exe();
		end
		listTimer[key] = nil;
	end
end

--当前key是否正在运行
function this.IsWaiting(key)
	return listTimer[key] ~= nil;
end

--清理所有托管的监控队列key
function this.ClearRandowKey()
	for _, v in ipairs(controlKeyArr) do
		this.Remove(v);
	end
	controlKeyArr = {};
end

--==================== 计时器类 ====================
--创建计时器
--@param   key         关键key
--@param   callback    回调
--@param   rate        频率
--@param   repeatTime  执行次数
function Timer.New(key, callback, rate, repeatTime)
	local newObject = {}
	setmetatable(newObject, { __index = Timer });
	newObject:Init(key, callback, rate, repeatTime);
	return newObject;
end

--初始化
--@param   key         关键key
--@param   callback    回调
--@param   rate        频率
--@param   repeatTime  执行次数
function Timer:Init(key, callback, rate, repeatTime)
	self.key = key;
	self.callback = callback;
	self.deltaTime = rate;
	self.repeatTime = repeatTime;
	self.totalTime = Time.realtimeSinceStartup; --总时间
	self.excuteTime = 0; --执行总次数
end

--定时帧检测
function Timer:Update()
	if Time.realtimeSinceStartup - self.totalTime >= self.deltaTime then
		self.totalTime = Time.realtimeSinceStartup;
		self.excuteTime = self.excuteTime + 1;
		if self.repeatTime > 0 and self.excuteTime >= self.repeatTime then
			TimeTick.Remove(self.key);
		end
		if self.callback ~= nil then
			self.callback();
		end
	end
end

--直接执行一次
function Timer:Exe()
	self.totalTime = Time.realtimeSinceStartup;
	self.excuteTime = self.excuteTime + 1;
	if self.repeatTime > 0 and self.excuteTime >= self.repeatTime then
		TimeTick.Remove(self.key);
	end
	if self.callback ~= nil then
		self.callback();
	end
end 
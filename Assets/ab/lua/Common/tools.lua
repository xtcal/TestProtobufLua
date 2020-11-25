Event = require "events"
local cJson = require "cjson"
local luabit = require "bit"

require "common/TimeTick"
require "common/UiClickHelper"

--Json字符串 转 table对象
function CJson_ToObject(jsonStr)
	local ret, data = pcall(
			function(s)
				return cJson.decode(s)
			end,
			jsonStr
	)
	if ret then
		return data
	else
		error("参数 json 字符串格式有误！\n" .. tostring(jsonStr) .. "\n" .. debug.traceback())
		return nil
	end
end

--table对象 转 Json字符串
function CJson_ToString(jsonObj)
	jsonObj = CloneJsonData(jsonObj)
	local ret, str = pcall(
			function(o)
				return cJson.encode(o)
			end,
			jsonObj
	)
	if ret then
		return str
	else
		error("参数 jsonObj 有误！\n" .. debug.traceback())
		return nil
	end
end

local function Concat(_table)
	if type(_table) == "table" then
		local ret = ""
		for i, v in ipairs(_table) do
			if v ~= nil then
				if i == 1 then
					ret = tostring(v)
				else
					ret = ret .. "\t" .. tostring(v)
				end
			end
		end
		return ret
	end
	error("Concat(_table) not table!")
	return ""
end

--输出日志--
function log(...)
	local a = { ... }
	local str = Concat(a)
	Util.Log(str)
end

--警告日志--
function logWarn(...)
	local a = { ... }
	local str = Concat(a)
	Util.LogWarning(str)
end
function warn(...)
	logWarn(...)
end

--错误日志--
function logError(...)
	local a = { ... }
	local str = Concat(a)
	Util.LogError(str)
end
function error(...)
	logError(...)
end

--调用堆栈
function callstack(name)
	name = name or ""
	error(debug.traceback(name))
end

--查找对象--
function find(str)
	return GameObject.Find(str)
end

function destroy(obj)
	GameObject.Destroy(obj)
end

function newObject(prefab, parent)
	if parent == nil then
		return GameObject.Instantiate(prefab)
	else
		local o = newObject(prefab)
		o.transform:SetParent(parent.transform, false)
		o:SetActive(true)
		return o
	end
end

--四舍五入
--@parameter decimal 要处理的数
--@parameter n 有效的小数位
function Round(decimal, n)
	n = n or 0
	local decimalTemp = decimal * (10 ^ n)
	if decimalTemp % 1 >= 0.5 then
		decimalTemp = math.ceil(decimalTemp)
	else
		decimalTemp = math.floor(decimalTemp)
	end
	return decimalTemp / (10 ^ n)
end

--真实随机
function RealRandom(...)
	math.randomseed(tostring(os.time()):reverse():sub(1, 6))
	return math.random(...)
end

--@desc UNIX时间戳转字符串 Timestamp
--@parameter timeAmount 时间值(秒)
--@parameter format 格式化参数
function TimestampToString(timeAmount, format)
	if format == nil then
		format = "%Y-%m-%d %H:%M:%S"
	end
	return os.date(format, timeAmount)
end

--@desc 返回UNIX时间戳的值(距离1970.1.1的秒数)
--@parameter _table 时间table的格式顺序：年 月 日 时 分 秒
function TableToTimestamp(_table)
	local Y = tonumber(_table[1]) or 0
	local m = tonumber(_table[2]) or 0
	local d = tonumber(_table[3]) or 0
	local H = tonumber(_table[4]) or 0
	local M = tonumber(_table[5]) or 0
	local S = tonumber(_table[6]) or 0
	return os.time({ year = Y, month = m, day = d, hour = H, min = M, sec = S })
end

--@desc 获取当前时间
--@return 字符串格式：%Y-%m-%d %H:%M:%S
function GetCurrentTime()
	return os.date("%Y-%m-%d %H:%M:%S")
end

local function _list_table(tb, table_list, level, isMetatable)
	local ret = ""
	local indent = string.rep(" ", level * 4)

	for k, v in pairs(tb) do
		local quo = type(k) == "string" and '"' or ""
		ret = ret .. indent .. "[" .. quo .. tostring(k) .. quo .. "] = "

		if type(v) == "table" then
			local t_name = table_list[v]
			if t_name then
				ret = ret .. tostring(v) .. ' -- > ["' .. t_name .. '"]\n'
			else
				table_list[v] = tostring(k)
				ret = ret .. "{\n"
				ret = ret .. _list_table(v, table_list, level + 1, isMetatable)
				ret = ret .. indent .. "},\n"
			end
		elseif type(v) == "string" then
			ret = ret .. '"' .. tostring(v) .. '",\n'
		else
			ret = ret .. tostring(v) .. ",\n"
		end
	end

	if isMetatable == true then
		local mt = getmetatable(tb)
		if mt then
			ret = ret .. "\n"
			local t_name = table_list[mt]
			ret = ret .. indent .. "<metatable> = "
			if t_name then
				ret = ret .. tostring(mt) .. ' -- > ["' .. t_name .. '"]\n'
			else
				ret = ret .. "{\n"
				ret = ret .. _list_table(mt, table_list, level + 1, true)
				ret = ret .. indent .. "}\n"
			end
		end
	end
	return ret
end
--将table转换为字符串显示
function table_tostring(tb, isMetatable, table_list)
	-- if not(GlobalData.PackageInfo.packagetype == 1 or GlobalData.PackageInfo.packagetype == 2) and --外网不开启
	--    (Application.isMobilePlatform ==true)
	-- then
	-- 	   return "";
	-- end
	if type(tb) ~= "table" then
		error("Sorry 1, it's not table, it is " .. type(tb) .. ".\n" .. debug.traceback())
		return ""
	end
	if isMetatable == nil then
		isMetatable = false
	end
	local ret = "{\n"
	table_list = table_list or {}
	table_list[tb] = "root table"
	ret = ret .. _list_table(tb, table_list, 1, isMetatable)
	ret = ret .. "}"
	return ret
end

--计算table的长度
function table_len(tb)
	if type(tb) ~= "table" then
		error("Sorry 2, it's not table, it is " .. type(tb) .. ".\n" .. debug.traceback())
		return -1
	end
	local leng = 0
	for _, v in pairs(tb) do
		leng = leng + 1
	end
	return leng
end

--判断一个table是否为空表
-- @return (true：为空，false：不为空)
function table_empty(tb)
	if type(tb) ~= "table" then
		error("Sorry 3, it's not table, it is " .. type(tb) .. ".\n" .. debug.traceback())
		return nil
	end
	return _G.next(tb) == nil
end

--判断一个table是否包含该key
function table_conKey(tb, key)
	if type(tb) ~= "table" then
		error("Sorry 4, it's not table, it is " .. type(tb) .. ".\n" .. debug.traceback())
		return nil
	end
	for k, v in pairs(tb) do
		if k == key then
			return true
		end
	end
	return false
end

--判断一个table是否包含该value
function table_conValue(tb, value)
	if type(tb) ~= "table" then
		error("Sorry 5, it's not table, it is " .. type(tb) .. ".\n" .. debug.traceback())
		return nil
	end
	for k, v in pairs(tb) do
		if v == value then
			return true
		end
	end
	return false
end

--数组合并（仅限于纯数组）
function array_combine(...)
	local tempTable = { ... }
	local result = tempTable[1]
	if #tempTable < 1 then
		error("There is no incoming array!\n" .. debug.traceback())
		return nil
	end
	for i = 2, #tempTable do
		for _, v in ipairs(tempTable[i]) do
			table.insert(result, v)
		end
	end
	return result
end

--数组添加元素组（仅限于纯数组）
function array_addRange(oriArr, addArr)
	if type(oriArr) ~= "table" or type(addArr) ~= "table" then
		error("Sorry 6, it's not table.\n" .. debug.traceback())
		return nil
	end
	oriArr = array_combine(oriArr, addArr)
end

--深度拷贝
--@object: 原始数据 ("nil", "number", "string", "boolean", "table", "function", "thread", "userdata")
function DataClone(object)
	if object == nil then
		error("1 复制的原始数据为 nil，堆栈如下：\n" .. debug.traceback())
		return nil
	end
	local lookup_table = {}
	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end
		local newObject = {}
		lookup_table[object] = newObject
		for key, value in pairs(object) do
			newObject[_copy(key)] = _copy(value)
		end
		return setmetatable(newObject, getmetatable(object))
	end
	return _copy(object)
end

--json拷贝
--@object: 原始数据
function CloneJsonData(object)
	if object == nil then
		error("2 复制的原始数据为 nil，堆栈如下：" .. "\n" .. debug.traceback())
		return nil
	end
	local withOutType = { "nil", "function", "thread", "userdata" }
	local lookup_table = {}
	local function _copy(object)
		if type(object) ~= "table" then
			return object
		elseif lookup_table[object] then
			return lookup_table[object]
		end
		local newObject = {}
		lookup_table[object] = newObject
		for key, value in pairs(object) do
			if not table_conValue(withOutType, type(value)) then
				newObject[_copy(key)] = _copy(value)
			end
		end
		return setmetatable(newObject, getmetatable(object))
	end
	return _copy(object)
end

--设置table的默认值
local metas = {}
setmetatable(metas, { __mode = "v" })
function setDefault(t, d)
	local mt = metas[d]
	if mt == nil then
		mt = {
			__index = function()
				return d
			end
		}
		metas[d] = mt
	end
	return setmetatable(t, mt)
end

--只读table
function readOnly(t)
	local proxy = {}
	local mt = {
		__index = t,
		__newindex = function(t, k, v)
			error("attept to update a read-only table")
		end
	}
	setmetatable(proxy, mt)
	return proxy
end

local function GetByteCount(inputstr, i)
	local curByte = string.byte(inputstr, i)
	local byteCount = 1
	if curByte > 0 and curByte <= 191 then
		byteCount = 1 --1字节字符
	elseif curByte >= 192 and curByte <= 223 then
		byteCount = 2 --双字节字符
	elseif curByte >= 224 and curByte <= 239 then
		byteCount = 3 --汉字
	elseif curByte >= 240 and curByte <= 247 then
		byteCount = 4 --4字节字符
	end
	return byteCount
end

--计算字符串长度,可以计算出字符宽度，用于显示使用
--@return 长度，字节数
function lua_string_length(inputstr)
	if type(inputstr) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return -1
	end
	local lenInByte = #(inputstr)
	local width = 0
	local i = 1
	while (i <= lenInByte) do
		local byteCount = GetByteCount(inputstr, i)
		i = i + byteCount -- 重置下一字节的索引
		width = width + 1 -- 字符的个数（长度）
	end
	return width, i - 1
end

--分割指定长度字符串（从前到后截取，支持中文）
--@para num 长度目标点
--@return 目标字符串，目标字节数，剩余的字符串
function lua_string_cut_start(inputstr, num)
	if type(inputstr) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	inputstr = inputstr:trim()
	local lenInByte = #(inputstr)
	local i = 1
	local n = 0
	local targetstr
	local byteCount
	while (i <= lenInByte) do
		if n >= num then
			break
		end
		byteCount = GetByteCount(inputstr, i)
		i = i + byteCount --重置下一字节的索引
		n = n + 1
	end
	targetstr = string.sub(inputstr, 1, i - 1)
	return targetstr, i - 1, string.sub(inputstr, i, lenInByte)
end

--分割指定长度字符串（从后到前截取，支持中文）
--@para num 字符长度目标点
--@return 目标字符串，目标字节数，剩余的字符串
function lua_string_cut_end(inputstr, num)
	if type(inputstr) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	inputstr = inputstr:trim()
	local lenInStr, lenInByte = lua_string_length(inputstr)
	local topStr, topLeng, targetstr = lua_string_cut_start(inputstr, lenInStr - num)
	return targetstr, lenInByte - topLeng, topStr
end

--@desc 截取字符串（支持中文）
--@start_c: 开始索引（从1开始）
--@end_c: 结束索引
function lua_string_sub(inputstr, start_c, end_c)
	if type(inputstr) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	return utf8.sub(inputstr, start_c, end_c + 1)
end

-- 检查一个字符串是否包含特殊字符（做检测名字用:只能使用中文，数字，英文）
-- 有返回true，否则返回false
function CheckSpecialChar(inputstr)
	if type(inputstr) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return true
	end
	local k = 1
	while k <= #inputstr do
		local c = string.byte(inputstr, k)
		if not c then
			error("CheckSpecialChar() 字符串异常：" .. inputstr .. "\n" .. debug.traceback())
			break
		end
		if (c >= 48 and c <= 57) or (c >= 65 and c <= 90) or (c >= 97 and c <= 122) then
			--英文和数字
			-- log("英文数字");
		elseif c >= 228 and c <= 233 then
			--检测是否中文
			local c1 = string.byte(inputstr, k + 1)
			local c2 = string.byte(inputstr, k + 2)
			if c1 and c2 then
				local a1, a2, a3, a4 = 128, 191, 128, 191
				if c == 228 then
					a1 = 184
				elseif c == 233 then
					a2, a4 = 190, c1 ~= 190 and 191 or 165
				end
				if c1 >= a1 and c1 <= a2 and c2 >= a3 and c2 <= a4 then
					--中文
					k = k + 2
				else
					--非中文，特殊符号
					return true
				end
			end
		else
			--特殊符号
			return true
		end
		k = k + 1
	end
	return false
end

--过滤一个字符串的特殊字符
--@inputstr 需要处理的字符串
--@isSplit 是否分割的字符串
function FilterSpecialChar(inputstr, isSplit)
	if type(inputstr) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	isSplit = AndB(isSplit == nil, false, isSplit)
	local strRet = {}
	local k, isok = 1, 1
	while k <= #inputstr do
		local c = string.byte(inputstr, k)
		if not c then
			error("FilterSpecialChar() 字符串异常：" .. inputstr .. "\n" .. debug.traceback())
			break
		end
		isok = 1
		if (c >= 48 and c <= 57) or (c >= 65 and c <= 90) or (c >= 97 and c <= 122) then
			--英文和数字
			-- log("英文数字");
		elseif c >= 228 and c <= 233 then
			--检测是否中文
			local c1 = string.byte(inputstr, k + 1)
			local c2 = string.byte(inputstr, k + 2)
			if c1 and c2 then
				local a1, a2, a3, a4 = 128, 191, 128, 191
				if c == 228 then
					a1 = 184
				elseif c == 233 then
					a2, a4 = 190, c1 ~= 190 and 191 or 165
				end
				if c1 >= a1 and c1 <= a2 and c2 >= a3 and c2 <= a4 then
					--中文
					k = k + 2
					isok = 2
				else
					--非中文，特殊符号
					isok = 0
				end
			end
		else
			--特殊符号
			isok = 0
		end
		if isok == 1 then
			table.insert(strRet, string.sub(inputstr, k, k))
		elseif isok == 2 then
			table.insert(strRet, string.sub(inputstr, k - 2, k))
		end
		k = k + 1
	end
	if isSplit == false then
		return table.concat(strRet, "")
	else
		return strRet
	end
end

--把字符串转字符数组（支持中文）
function StringToArray(_str)
	return FilterSpecialChar(_str, true)
end

--按给定字符分割字符串（不支持中文）
function string.split(str, split_char)
	if type(str) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return {}
	end
	local sub_str_tab = {}
	while true do
		local pos = string.find(str, split_char)
		if not pos then
			sub_str_tab[#sub_str_tab + 1] = str
			break
		end
		local sub_str = string.sub(str, 1, pos - 1)
		sub_str_tab[#sub_str_tab + 1] = sub_str
		str = string.sub(str, pos + 1, #str)
	end
	return sub_str_tab
end

--字符替换（不支持中文）
function string.replace(str, replace_target, replace_string)
	if type(str) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	local ss = str:split(replace_target)
	local _s = ss[1]
	if #ss > 1 then
		for i = 2, #ss do
			_s = _s .. replace_string .. ss[i]
		end
	end
	return _s
end

--去除字符串两边的空格
function string.trim(s)
	if type(s) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	local ret = string.gsub(s, "^%s*(.-)%s*$", "%1")
	return ret
end

--将字符串转为unicode的数组
function string.utf2unicode(input)
	local strUnicode = {}
	local len = string.len(input)
	local left = len
	while left ~= 0 do
		local hight = string.byte(input, -left)
		if hight > 0x00 and hight <= 0x7f then
			table.insert(strUnicode, hight)
		elseif luabit.band(hight, 0xe0) == 0xc0 then
			left = left - 1
			local low = string.byte(input, -left)
			if luabit.band(low, 0xc0) ~= 0x80 then
				break
			end
			local uniHigh = luabit.band(luabit.band(luabit.rshift(hight, 2), 0x07), 0xff)
			local uniLow = luabit.band(luabit.lshift(hight, 6) + luabit.band(low, 0x3f), 0xff)
			local unicode = luabit.bor(luabit.lshift(uniHigh, 8), luabit.band(uniLow, 0xff))
			table.insert(strUnicode, unicode)
		elseif luabit.band(hight, 0xf0) == 0xe0 then
			left = left - 1
			local mid = string.byte(input, -left)
			left = left - 1
			local low = string.byte(input, -left)
			if (luabit.band(mid, 0xc0) ~= 0x80) or (luabit.band(low, 0xc0) ~= 0x80) then
				break
			end
			local uniHigh = luabit.band(luabit.lshift(hight, 4) + luabit.band(luabit.rshift(mid, 2), 0x0f), 0xff)
			local uniLow = luabit.band(luabit.lshift(mid, 6) + luabit.band(low, 0x7f), 0xff)
			local unicode = luabit.bor(luabit.lshift(uniHigh, 8), luabit.band(uniLow, 0xff))
			table.insert(strUnicode, unicode)
		else
			break
		end
		left = left - 1
	end
	return strUnicode
end

--字符串截断设置
--content 原字符串
--index 需要把第几个字及后面的字符都变成...
function SetStringDot(content, index)
	if type(content) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	content = content:trim()
	local lenInByte = #(content)
	local width = 0
	local i = 1
	local byteCount
	while (i <= lenInByte) do
		byteCount = GetByteCount(content, i)
		i = i + byteCount -- 重置下一字节的索引
		width = width + 1
		if width >= index then
			return string.sub(content, 1, i - 1) .. "..."
		end
	end
	return content
end

--获取文件名
function GetFileName(str)
	if type(str) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	local ret = str:split("/")
	return ret[#ret]
end

--获取不带后缀的完整文件名
function GetFullFileNameWhithoutExtension(str)
	if type(str) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	local idx = str:match(".+()%.%w+$")
	if idx then
		return str:sub(1, idx - 1)
	else
		return str
	end
end

--获取不带后缀的文件名
function GetFileNameWhithoutExtension(str)
	if type(str) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	local ret = GetFileName(str)
	return GetFullFileNameWhithoutExtension(ret)
end

--获取扩展名
function GetExtension(str)
	if type(str) ~= "string" then
		warn("it's not string \n" .. debug.traceback())
		return ""
	end
	local ret = str:match(".+%.(%w+)$")
	if ret then
		return "." .. ret
	else
		return ""
	end
end

--判断一个字符串是否为nil or ""
--@para     inputstr        需要判断的内容
--@return   ture 为 nil or "", false 有内容
function lua_str_isNullOrEmpty(inputstr)
	local ret = true
	if inputstr ~= nil and inputstr ~= "" then
		ret = false
	end
	return ret
end

--三目运算
function AndB(a, b, c)
	return (a and { b } or { c })[1]
end

function unrequire(filename)
	filename = filename:replace("/", ".")
	package.loaded[filename] = nil
end

function re_require(filename)
	unrequire(filename) --重新加载 文件
	return require(filename)
end

-- **************************位运算begin*******************************
do
	bit = { data32 = {} } --目前值只要 4个字节
	for i = 1, 32 do
		bit.data32[i] = 2 ^ (32 - i)
	end

	--bit:d2b 十进制转二进制
	function bit:d2b(arg)
		local num = tonumber(arg)
		local tr = {}

		if num ~= nil then
			if num >= 0 then
				for i = 1, 32 do
					if num >= bit.data32[i] then
						num = num - bit.data32[i]
						tr[i] = 1
					else
						tr[i] = 0
					end
				end
				return tr
			else
				return tr
			end
		else
			return tr
		end
	end

	--bit:b2d 二进制转十进制
	function bit:b2d(arg)
		local num = 0
		if arg ~= nil then
			for i = 1, 32 do
				if arg[i] == 1 then
					num = num + bit.data32[i]
				elseif arg[i] ~= 0 then
					return num
				end
			end
			return num
		else
			return num
		end
	end

	--bit:xor
	function bit:_xor(a, b)
		local op1 = self:d2b(a)
		local op2 = self:d2b(b)
		local r = {}

		for i = 1, 32 do
			if op1[i] == op2[i] then
				r[i] = 0
			else
				r[i] = 1
			end
		end
		return self:b2d(r)
	end

	--bit:_and
	function bit:_and(arg1, arg2)
		local num1 = tonumber(arg1)
		local num2 = tonumber(arg2)

		if num1 == nil then
			return 0
		end

		if num2 == nil then
			return 0
		end

		local tr1 = bit:d2b(num1)
		local tr2 = bit:d2b(num2)
		local tr3 = {}

		for i = 1, 32 do
			if tr1[i] == 1 and tr2[i] == 1 then
				tr3[i] = 1
			else
				tr3[i] = 0
			end
		end
		return bit:b2d(tr3)
	end

	--bit:_or
	function bit:_or(arg1, arg2)
		local num1 = tonumber(arg1)
		local num2 = tonumber(arg2)

		if num1 == nil then
			return 0
		end

		if num2 == nil then
			return 0
		end

		local tr1 = bit:d2b(num1)
		local tr2 = bit:d2b(num2)
		local tr3 = {}

		for i = 1, 32 do
			if tr1[i] == 0 and tr2[i] == 0 then
				tr3[i] = 0
			else
				tr3[i] = 1
			end
		end
		return bit:b2d(tr3)
	end

	--bit:_not
	function bit:_not(arg1)
		local a = tonumber(arg1)

		if a == nil then
			return 0
		end

		local op1 = self:d2b(a)
		local r = {}

		for i = 1, 32 do
			if op1[i] == 1 then
				r[i] = 0
			else
				r[i] = 1
			end
		end
		return self:b2d(r)
	end
	--用法：
	-- print(bit:_or(15, 10)) --结果15
	-- print(bit:_or(0xA, 0xF)) --结果15
end
-- **************************位运算end*******************************
-- **************************双向队列begin*******************************
do
	List = {}

	function List:New()
		return setmetatable({ first = 0, last = -1 }, { __index = self })
	end

	function List:PushFirst(value)
		local tfirst = self.first - 1
		self.first = tfirst
		self[tfirst] = value
	end

	function List:PushLast(value)
		local tlast = self.last + 1
		self.last = tlast
		self[tlast] = value
	end

	function List:PopFirst()
		local tfirst = self.first
		if tfirst > self.last then
			warn("list is empty")
			return nil
		end
		local value = self[tfirst]
		self[tfirst] = nil
		self.first = self.first + 1
		return value
	end

	function List:PopLast()
		local tlast = self.last
		if self.first > tlast then
			warn("list is empty")
			return nil
		end
		local value = self[tlast]
		self[tlast] = nil
		self.last = self.last - 1
		return value
	end

	function List:Count()
		local length = self.last - self.first + 1
		return AndB(length < 0, 0, length)
	end
end
-- **************************双向队列end*******************************
-- **************************事件缓存机制begin*******************************
do
	EventCache = {}
	local eventCacheArr = {}
	local excludeClear = {}

	--缓存待处理事件
	--@para exclude 全清（Clear()）时，是否忽略
	function EventCache.Add(key, event, exclude)
		exclude = AndB(exclude == nil, false, exclude)
		if type(event) == "function" then
			if not exclude then
				excludeClear[key] = true
			end
			if eventCacheArr[key] == nil then
				eventCacheArr[key] = event
			else
				local tempEvent = eventCacheArr[key]
				eventCacheArr[key] = function(...)
					tempEvent(...)
					event(...)
				end
			end
		end
	end

	--执行待处理事件
	function EventCache.Exe(key, ...)
		if eventCacheArr[key] then
			eventCacheArr[key](...)
			eventCacheArr[key] = nil
		else
			warn("EventCache.Exe() key: " .. key .. " not Exists")
		end
	end

	--清理待处理的缓存事件
	function EventCache.Clear(key)
		if key == nil then
			for k, v in pairs(excludeClear) do
				eventCacheArr[k] = nil
			end
			excludeClear = {}
		else
			eventCacheArr[key] = nil
		end
	end

	--判断是否包含该事件
	function EventCache.Contain(key)
		return eventCacheArr[key] ~= nil
	end
end
-- **************************事件缓存机制end*******************************
-- **************************try catch begin*******************************
do
	local option = require "Common/option"

	-- traceback
	function _traceback(errors)
		-- not verbose?
		if not option.get("backtrace") then
			if errors then
				-- remove the prefix info
				local _, pos = errors:find(":%d+: ")
				if pos then
					return errors:sub(pos + 1)
				end
			end
			return errors
		end

		-- init results
		local results = ""
		if errors then
			results = errors .. "\n"
		end
		results = results .. "stack traceback:\n"

		-- make results
		local level = 2
		while true do
			-- get debug info
			local info = debug.getinfo(level, "Sln")

			-- end?
			if not info or (info.name and info.name == "xpcall") then
				break
			end

			-- function?
			if info.what == "C" then
				results = results .. string.format("    [C]: in function '%s'\n", info.name)
			elseif info.name then
				results = results ..
						string.format("    [%s:%d]: in function '%s'\n", info.short_src, info.currentline, info.name)
			elseif info.what == "main" then
				results = results .. string.format("    [%s:%d]: in main chunk\n", info.short_src, info.currentline)
				break
			else
				results = results .. string.format("    [%s:%d]:\n", info.short_src, info.currentline)
			end

			-- next
			level = level + 1
		end
		-- ok?
		return results
	end

	local join = function(...)
		local result = {}
		for _, t in ipairs({ ... }) do
			if type(t) == "table" then
				for k, v in pairs(t) do
					if type(k) == "number" then
						table.insert(result, v)
					else
						result[k] = v
					end
				end
			else
				table.insert(result, t)
			end
		end
		return result
	end

	-- try
	function try(block)
		-- get the try function
		local try = block[1]
		assert(try)

		-- get catch and finally functions
		local funcs = join(block[2] or {}, block[3] or {})

		-- try to call it
		local ok, errors = xpcall(try, _traceback)
		if not ok then
			-- run the catch function
			if funcs and funcs.catch then
				funcs.catch(errors)
			end
		end
		-- run the finally function
		if funcs and funcs.finally then
			funcs.finally(ok, errors)
		end
		-- ok?
		return option.ifelse(ok, errors, nil)
	end

	function catch(block)
		return { catch = block[1] }
	end

	function finally(block)
		return { finally = block[1] }
	end
end
------------try catch end-------------------

Tools = {}
local this = Tools

--UIPanel的事件绑定
function this.AddEventListener(event_tb)
	for _, v in pairs(event_tb) do
		if v ~= nil and not v[3] then
			Event.AddListener(tostring(v[1]), v[2])
			v[3] = true
		end
	end
end

--UIPanel的事件移除
function this.RemoveEventListener(event_tb)
	for _, v in pairs(event_tb) do
		if v ~= nil and v[3] then
			Event.RemoveListener(tostring(v[1]), v[2])
			v[3] = false
		end
	end
end

function this.isWindows( ... )
	
	if Application.platform == UnityEngine.RuntimePlatform.WindowsEditor or
	Application.platform ==  UnityEngine.RuntimePlatform.WindowsPlayer then
		return true
	end
	return false
end
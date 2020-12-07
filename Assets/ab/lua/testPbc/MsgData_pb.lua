require "3rd/pbc/protobuf"

MsgData = {}
local this = MsgData

local Directory = System.IO.Directory
local Path = System.IO.Path

--初始化 消息proto
function this.InitProtos(callback)
	local lua_protobuf_dir = LuaFramework.Util.DataPath .. "files/proto/"
	local allProtos = require("testPbc.allPb")
	local protosFiles = {}
	local needUpdate = {}
	for i, v in pairs(allProtos) do
		require("testPbc/lua/" .. v .. "_pb")
		local file = lua_protobuf_dir .. v .. ".proto"
		log("proto file path:" .. file)
		if System.IO.File.Exists(file) then
			table.insert(protosFiles, v .. ".proto")
		else
			table.insert(needUpdate, v .. ".proto")
		end
	end

	local parser = require "3rd/pbc/parser"
	main.StartCoroutine(function()
		coroutine.step()
		local _allBuffs = {}
		for i, v in pairs(needUpdate) do
			local url = "http://192.168.20.234/zxUpdate/TestProtobufLua/proto/" .. v
			local www = UnityEngine.WWW(url)
			coroutine.www(www)
			table.insert(_allBuffs, {
				filename = v,
				buffer = www.text,
			})
			local fileUrl = lua_protobuf_dir .. v;
			local path = System.IO.Path.GetDirectoryName(fileUrl)
			if not System.IO.Directory.Exists(path) then
				System.IO.Directory.CreateDirectory(path)
			end
			System.IO.File.WriteAllBytes(lua_protobuf_dir .. v, www.bytes)
		end
		--log("_allBuffs:"..table_tostring(_allBuffs))
		parser.register(protosFiles, lua_protobuf_dir, _allBuffs)
		if callback then
			callback()
		end
	end)
end

function this.GenData(str, code)
	local _new = {}
	_new._desc = str
	if code then
		_new = protobuf.decode(str, code)
	end
	function _new.Encode()
		_new.Encode = nil
		_new._desc = nil
		return protobuf.encode(str, _new)
	end
	return _new
end 
require "3rd/pbc/protobuf"

MsgData = {}
local this = MsgData

local Directory = System.IO.Directory
local Path = System.IO.Path

--初始化 消息proto
function this.InitProtos()
	local lua_protobuf_dir = UnityEngine.Application.dataPath .. "/ab/files/proto"
	if UnityEngine.Application.isMobilePlatform then
		lua_protobuf_dir = UnityEngine.Application.dataPath .. "/" .. AppConst.AssetDir .. "/files/proto"
	end
	local allProtos = require("testPbc.allPb")
	for i, v in pairs(allProtos) do
		require("testPbc/lua/" .. v .. "_pb")
	end

	local parser = require "3rd/pbc/parser"
	parser.register(allProtos, lua_protobuf_dir)
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
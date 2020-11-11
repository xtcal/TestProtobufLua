MsgData = {}
local this = MsgData

local Directory = System.IO.Directory
local Path = System.IO.Path

--初始化 消息proto
function this.InitProtos()
	local protos = {}
	local lua_protobuf_dir = UnityEngine.Application.dataPath .. "/ab/lua/testPbc/proto"

	local imp = function(dir)
		local ret = Directory.GetFiles(dir) --取所有文件
		local iter = ret:GetEnumerator()
		while iter:MoveNext() do
			local cur = iter.Current
			cur = string.gsub(cur,"\\","/")

			local file_name = Path.GetFileNameWithoutExtension(cur)
			local ext = Path.GetExtension(cur)
			if ext == ".lua" and file_name ~= "MsgData_tab" then
				--lua脚本导入引用
				require("testPbc/lua/" .. file_name)
			elseif ext == ".proto" then
				--proto 注册引用
				local file_name = Path.GetFileName(cur)
				table.insert(protos, file_name)
			end
		end
	end
	imp( UnityEngine.Application.dataPath .. "/ab/lua/testPbc/proto")
	imp( UnityEngine.Application.dataPath .. "/ab/lua/testPbc/lua")


	warn("MsgData.InitProtos() protos==", table_tostring(protos))

	if #protos > 0 then
		local parser = require "3rd/pbc/parser"
		parser.register(protos, lua_protobuf_dir)
	end

	--require "testPbc/MsgData_tab"

	warn("MsgData :" .. table_tostring(MsgData))
end
MsgData = {}
local this = MsgData

local Directory = System.IO.Directory
local Path = System.IO.Path

--初始化 消息proto
function this.InitProtos()
    local protos = {}
	local lua_protobuf_dir = AppConst.FrameworkRoot .. "/Lua/test/protobuf/"

    local ret = Directory.GetFiles(lua_protobuf_dir) --取所有文件
    local iter = ret:GetEnumerator()
    while iter:MoveNext() do
		local cur = iter.Current
		local file_name = Path.GetFileNameWithoutExtension(cur)
        local ext = Path.GetExtension(cur)
		if ext == ".lua" and file_name ~= "MsgData_tab" then   --lua脚本导入引用
			log("cur == " , cur)
            require(cur)
        elseif ext == ".proto" then     --proto 注册引用
            local file_name = Path.GetFileName(cur)
            table.insert(protos, file_name)
        end
    end

	log("protos==",table_tostring(protos))

    if #protos > 0 then
        local parser = require "3rd/pbc/parser"
        parser.register(protos, lua_protobuf_dir)
    end

    require "test/protobuf/MsgData_tab"

    log("MsgData ===========" .. table_tostring(MsgData))
end

this.InitProtos()
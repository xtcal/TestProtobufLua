local parser = require "3rd/pbc/parser"

parser.register({
	"t.proto",
	"ttt.proto"
}, AppConst.FrameworkRoot .. "/Lua/test/protobuf/")
local old = {
	Arr = {
		{
			Sex = 2,
			Nick = "牛逼啊"
		}, {
			Sex = 3,
			Nick = "牛逼啊!!!!"
		}
	}
}

require "test/protobuf/t_pb"

local code = protobuf.encode("t.TT", old)
local _new = t.TT(code) ---@type t.TT

log("code == " .. code)
log(_new.Arr[2].Nick)
log(_new.Arr[1].Nick)
log(_new.Arr[1].Sex)
log(_new.Arr[2].Sex)

function register_all()
	local ret = System.IO.Directory.GetFiles(AppConst.FrameworkRoot .. "/Lua/test/protobuf/", "*.proto")
	log(tostring(ret))
end

register_all()

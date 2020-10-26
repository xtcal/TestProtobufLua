local sproto = require "3rd/sproto/sproto"
local core = require "sproto.core"
local print_r = require "3rd/sproto/print_r"

require "test/ttt"
require "test/testEmmy"

local this = {}
function this.Start()
	this.test_class_func()
	this.test_pblua_func()
	this.test_cjson_func()
	this.test_pbc_func()
	this.test_lpeg_func()
	this.test_sproto_func()
	coroutine.start(this.test_coroutine)
end

--测试协同--
function this.test_coroutine()
	logWarn("1111")
	coroutine.wait(1)
	logWarn("2222")

	local www = WWW("http://bbs.ulua.org/readme.txt")
	coroutine.www(www)
	logWarn(www.text)
end

--测试sproto--
function this.test_sproto_func()
	logWarn("test_sproto_func-------->>")
	local sp = sproto.parse [[
    .Person {
        name 0 : string
        id 1 : integer
        email 2 : string

        .PhoneNumber {
            number 0 : string
            type 1 : integer
        }

        phone 3 : *PhoneNumber
    }

    .AddressBook {
        person 0 : *Person(id)
        others 1 : *Person
    }
    ]]

	local ab = {
		person = {
			[10000] = {
				name = "Alice",
				id = 10000,
				phone = {
					{ number = "123456789", type = 1 },
					{ number = "87654321", type = 2 }
				}
			},
			[20000] = {
				name = "Bob",
				id = 20000,
				phone = {
					{ number = "01234567890", type = 3 }
				}
			}
		},
		others = {
			{
				name = "Carol",
				id = 30000,
				phone = {
					{ number = "9876543210" }
				}
			}
		}
	}
	local code = sp:encode("AddressBook", ab)
	local addr = sp:decode("AddressBook", code)
	print_r(addr)
end

--测试lpeg--
function this.test_lpeg_func()
	logWarn("test_lpeg_func-------->>")
	-- matches a word followed by end-of-string
	local p = lpeg.R "az" ^ 1 * -1

	print(p:match("hello")) --> 6
	print(lpeg.match(p, "hello")) --> 6
	print(p:match("1 hello")) --> nil
end

--测试lua类--
function this.test_class_func()
	LuaClass:New(10, 20):test()
end

--测试pblua--
function this.test_pblua_func()
	local login = login_pb.LoginRequest()
	login.id = 2000
	login.name = "game"
	login.email = "jarjin@163.com"

	local msg = login:SerializeToString()
	logError("msg ===========" .. msg)
	logError("msg type ====   " .. type(msg))
	LuaHelper.OnCallLuaFunc(msg, this.OnPbluaCall)
end

--pblua callback--
function this.OnPbluaCall(data)
	local msg = login_pb.LoginRequest()
	msg:ParseFromString(data)
	print("OnPbluaCall ")
	print(msg)
	print(msg.id .. " " .. msg.name)
	print("OnPbluaCall over")
end

--测试pbc--
function this.test_pbc_func()
	local path = Util.DataPath .. "lua/3rd/pbc/addressbook.pb"
	log("io.open--->>>" .. path)

	local addr = io.open(path, "rb")
	local buffer = addr:read("*a")
	addr:close()
	protobuf.register(buffer)

	local addressbook = {
		name = "Alice",
		id = 12345,
		phone = {
			{ number = "1301234567" },
			{ number = "87654321", type = "WORK" }
		}
	}
	local code = protobuf.encode("tutorial.Person", addressbook)
	LuaHelper.OnCallLuaFunc(code, this.OnPbcCall)
end

--pbc callback--
function this.OnPbcCall(data)
	local path = Util.DataPath .. "lua/3rd/pbc/addressbook.pb"

	local addr = io.open(path, "rb")
	local buffer = addr:read "*a"
	addr:close()
	protobuf.register(buffer)
	local decode = protobuf.decode("tutorial.Person", data)

	print(decode.name)
	print(decode.id)
	for _, v in ipairs(decode.phone) do
		print("\t" .. v.number, v.type)
	end
end

--测试cjson--
function this.test_cjson_func()
	local path = Util.DataPath .. "lua/3rd/cjson/example2.json"
	local text = util.file_load(path)
	LuaHelper.OnJsonCallFunc(text, this.OnJsonCall)
end

--cjson callback--
function this.OnJsonCall(data)
	local obj = json.decode(data)
	print(obj["menu"]["id"])
end

return this

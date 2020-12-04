Game = {}
local this = Game

--初始化完成，发送链接服务器信息--
function this.OnInitOK()
	this.testPbc()
	--this.testProtobuf()
end

--销毁--
function this.OnDestroy()
	logWarn("OnDestroy--->>>")
end

function this.testGame()
	Util.ShowList({ "1", "2", "3", "44" })  --通过"{}"来传递数组给c#
	FixedUpdate:Add(function()
		local Input = UnityEngine.Input;
		local horizontal = Input.GetAxis("Horizontal");
		local verticla = Input.GetAxis("Vertical");
		local x = go.transform.position.x + horizontal
		local z = go.transform.position.z + verticla
		go.transform.position = Vector3.New(x, 0, z)
	end, self)

	local obj = GameObject.New()---@type GameObject
	obj.name = "newobj"
	local coms = obj:AddComponent(typeof(LuaComponent))---@type LuaComponent
	function NewInfo(_obj)
		local o = {}
		o.obj = _obj
		o.money = 1
		function o.GetMoney()
			log("o.money=", o.money)
		end
		function o.Update()
			if o.enabled then
				log(o.obj.name .. " o.money ==", o.money)
			end
		end
		UpdateBeat:Add(o.Update, o)
		return o
	end
	function NewHero(_obj, name)
		local o = {}
		o.name = name
		o.Info = NewInfo(_obj)
		return o
	end
	coms:Add("Hero", NewHero(obj, "test"))
	local cms = find("newobj"):GetComponent(typeof(LuaComponent))---@type LuaComponent
	log("get", table_tostring(cms:Get("Hero")))

	UpdateBeat:Add(function()
		if UnityEngine.Input.GetKeyDown(UnityEngine.KeyCode.W) then
			local cms = find("newobj"):GetComponent(typeof(LuaComponent))---@type LuaComponent
			local h = cms:Get("Hero")
			h.Info.enabled = not h.Info.enabled
		end
	end, self)
end

--lua <-> c# 都可以，但是 int 类型最大值只能到 127,超过这个值就会溢出。可以使用string类型，暂时无法解决 https://stackoverflow.com/questions/7100306/protobuf-net-serialize-only-a-few-properties
--要先转pb，提示要生成
function this.testProtobuf()
	require("testProtobuf.protoLoginUser_pb")
	local _user = protoLoginUser_pb.CS_LoginUser()
	_user.uid = "11111"
	_user.userName = "夏老湿"
	_user.passWord = "1234"
	local data = _user:SerializeToString() --这里出来的是string
	error("_user:SerializeToString() data :", data)
	UDPClient.SendMsg(data)

	local _data = {}
	_data = UDPClient.GetData();  --这里只能解utf8 string
	log("UDPClient.GetData() _data :", _data)
	local _user = protoLoginUser_pb.CS_LoginUser()
	_user:ParseFromString(_data)

	log("ParseFromString _user:", _user.userName, _user.uid, table_tostring(_user))
	log("ParseFromString uid:", _user.uid)
end

--lua -> c# 可以，c# -> lua 字节顺序有问题 (https://github.com/cloudwu/pbc/issues/95) (用string似乎没这问题)
--有提示功能，可以直接读.proto文件
function this.testPbc()
	--初始化
	require "testPbc/MsgData_pb"
	MsgData.InitProtos(function()
		local _mData = MsgData.protoBase.MessageData()
		local _user = MsgData.protoLoginUser.CS_LoginUser()
		_user.uid = "12345"
		_user.userName = "夏老湿"
		_user.passWord = "1234"
		_mData.desc = _user._desc
		--_mData.data = _user.Encode()
		--log("_mData111", table_tostring(_mData))
		local data = _user.Encode()
		log("encode data:", data)
		UDPClient.SendMsg(data)

		local u = MsgData.protoLoginUser.CS_LoginUser(data)
		log("lua decode :", table_tostring(u))

		data = UDPClient.GetData();
		local _user = MsgData.protoLoginUser.CS_LoginUser(data)
		log("c# _user decode _user:", table_tostring(_user))

		function this.Init()
			log("MsgData == " .. table_tostring(MsgData))

			local _mData = MsgData.base.MessageData()

			local _user = MsgData.LoginUser.CS_LoginUser()
			_user.passWord = "1234"
			_user.uid = "12345"
			_user.userName = "5555"

			_mData.desc = _user._desc
			_mData.data = _user.Encode()

			-- local hData = protobuf.decode("base.MessageData", _mData.Encode()) ---@type base.MessageData

			-- local user = protobuf.decode(hData.desc, hData.data)	---@type LoginUser.CS_LoginUser
			-- log("_mData == " , table_tostring(_mData))

			Event.AddListener("LoginUser.CS_LoginUser", function(user)
				log("user.uid == ", table_tostring(user))
			end)

			-- this.GetData(_mData.Encode())

			---@type File
			System.IO.File.WriteAllText("e:/1.txt", System.Convert.ToString(_mData.Encode()))

			-- this.GetData(System.Convert.FromBase64String(System.IO.File.ReadAllText("e:/1.txt")))
		end
		function this.GetData(code)
			log("code == " .. tostring(code))
			local hData = MsgData.base.MessageData(code)
			log("hData == " .. table_tostring(hData))
			if hData.desc then
				local mData = MsgData[hData.desc](hData.data)
				Event.Brocast(hData.desc, mData)
			else
				local key = hData.com .. "_" .. hData.task
				Event.Brocast(key, DellTab[key]())
			end
		end

		function this.Send(data)
			local _mData = MsgData.base.MessageData()
			_mData.desc = data._desc
			_mData.data = data.Encode()
			_mData.Encode()
		end
	end)

end

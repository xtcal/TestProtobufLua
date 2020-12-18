require "main.define"
require "common.tools"
main = {}
local this = main
this.dps = {
	"lua/logic.unity3d",
	"lua/testpbc.unity3d",
}
function this.Init()
	if not AppConst.UpdateMode then
		if AppConst.LuaLoadMode == AppConst.LuaLoadMode.ToAb then
			for i, v in pairs(this.dps) do
				luaMgr:AddSearchBundle(v)
			end
		end
		require "logic.Game"
		Game.OnInitOK()
	else
		this.CheckDps(this.dps, function()
			require "logic.Game"
			Game.OnInitOK()
		end)
	end
end

this.netVers = nil
function this.CheckDps(dps, callback)
	this.StartCoroutine(function()
		if this.netVers == nil then
			local www = UnityEngine.WWW("http://192.168.20.234/zxUpdate/TestProtobufLua/vers.json")
			coroutine.www(www)
			log("netVers:" .. www.text)
			this.netVers = CJson_ToObject(www.text)
			www:Dispose()
		end
		local localVers = UnityEngine.PlayerPrefs.GetString("vers", "{}")
		log("localVers:" .. localVers)
		localVers = CJson_ToObject(localVers);
		local needUpdates = {}
		for k, v in pairs(this.netVers) do
			local file = LuaFramework.Util.DataPath .. k
			log("file:" .. file)
			if not System.IO.File.Exists(file) then
				localVers[k] = nil
			end
			if not localVers[k] or localVers[k] < v then
				needUpdates[k] = v
			end
		end
		log("needUpdates:" .. table_tostring(needUpdates))

		for k, v in pairs(dps) do
			if needUpdates[v] then
				local url = "http://192.168.20.234/zxUpdate/TestProtobufLua/vers/" .. needUpdates[v] .. "/" .. v
				log("download url:" .. url)
				local www = UnityEngine.WWW(url)
				coroutine.www(www)
				local name = System.IO.Path.GetFileNameWithoutExtension(url)
				name = string.lower(name)
				luaMgr:AddSearchBundle(name, www.bytes)
				System.IO.File.WriteAllBytes(LuaFramework.Util.DataPath .. v, www.bytes)
				www:Dispose()
				localVers[v] = needUpdates[v] --TODO 下载完毕保存版本
			else
				luaMgr:AddSearchBundle(v)
			end
		end
		local str = CJson_ToString(localVers)
		log("save vers:" .. str)
		UnityEngine.PlayerPrefs.SetString("vers", str)
		if callback then
			callback()
		end
	end)
end

this.cors = {}
function this.StartCoroutine(func)
	if type(func) == "function" then
		local cor = coroutine.start(func)
		table.insert(this.cors, cor)
		return cor
	end
end

function this.StopAllCoroutine()
	for i, v in pairs(this.cors) do
		if v then
			coroutine.stop(v)
		end
	end
	this.cors = {}
end
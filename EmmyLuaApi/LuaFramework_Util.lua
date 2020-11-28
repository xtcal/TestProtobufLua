---@class Util : Object
---@field public DataPath string
---@field public NetAvailable bool
---@field public IsWifi bool
---@field public AppContentPath string
local Util = {}
---@public
---@param o Object
---@return Int32
function Util.Int(o) end
---@public
---@param o Object
---@return Single
function Util.Float(o) end
---@public
---@param o Object
---@return Int64
function Util.Long(o) end
---@public
---@param min Int32
---@param max Int32
---@return Int32
function Util.Random(min, max) end
---@public
---@param min Single
---@param max Single
---@return Single
function Util.Random(min, max) end
---@public
---@param uid string
---@return string
function Util.Uid(uid) end
---@public
---@return Int64
function Util.GetTime() end
---@public
---@param go GameObject
---@param subnode string
---@return GameObject
function Util.Child(go, subnode) end
---@public
---@param go Transform
---@param subnode string
---@return GameObject
function Util.Child(go, subnode) end
---@public
---@param go GameObject
---@param subnode string
---@return GameObject
function Util.Peer(go, subnode) end
---@public
---@param go Transform
---@param subnode string
---@return GameObject
function Util.Peer(go, subnode) end
---@public
---@param source string
---@return string
function Util.md5(source) end
---@public
---@param file string
---@return string
function Util.md5file(file) end
---@public
---@param file string
---@param length Int64
---@return string
function Util.SHA1file(file, length) end
---@public
---@param file string
---@return string
function Util.SHA1file(file) end
---@public
---@param buffer Byte[]
---@return string
function Util.SHA1file(buffer) end
---@public
---@param go Transform
---@return void
function Util.ClearChild(go) end
---@public
---@return void
function Util.ClearMemory() end
---@public
---@return string
function Util.GetRelativePath() end
---@public
---@param path string
---@return string
function Util.GetFileText(path) end
---@public
---@param str string
---@return void
function Util.Log(str) end
---@public
---@param str string
---@return void
function Util.LogWarning(str) end
---@public
---@param str string
---@return void
function Util.LogError(str) end
---@public
---@return Int32
function Util.CheckRuntimeFile() end
---@public
---@param module string
---@param func string
---@param args Object[]
---@return Object[]
function Util.CallMethod(module, func, args) end
---@public
---@return bool
function Util.CheckEnvironment() end
---@public
---@param strs String[]
---@return void
function Util.ShowList(strs) end
---@public
---@param ss Dictionary
---@return void
function Util.ShowListss(ss) end
---@public
---@return Object
function Util.Dic() end

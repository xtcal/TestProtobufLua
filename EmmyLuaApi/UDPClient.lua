---@class UDPClient : MonoBehaviour
---@field public ServerPoint IPEndPoint
---@field public ReceiveThread Thread
---@field public Client Socket
local UDPClient = {}
---@public
---@return void
function UDPClient.Init() end
---@public
---@return void
function UDPClient.UnInit() end
---@public
---@param str string
---@param ip EndPoint
---@return void
function UDPClient.SendMsg(str, ip) end
---@public
---@param name string
---@param data Byte[]
---@param ip EndPoint
---@return void
function UDPClient.SendMsg(name, data, ip) end
---@public
---@param data Byte[]
---@param ip EndPoint
---@return void
function UDPClient.SendMsg(data, ip) end
---@public
---@return string
function UDPClient.GetData() end
---@public
---@param _str string
---@param _codeing string
---@return Byte[]
function UDPClient.StringConvertToBytes(_str, _codeing) end
---@public
---@param bytes Byte[]
---@param _codeing string
---@return string
function UDPClient.BytesConvertToString(bytes, _codeing) end
---@public
---@param data Byte[]
---@return void
function UDPClient.ShowData(data) end
---@public
---@return void
function UDPClient.GetRoomList() end

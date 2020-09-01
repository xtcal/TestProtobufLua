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
---@param data Byte[]
---@param ip EndPoint
---@return void
function UDPClient.SendMsg(data, ip) end
---@public
---@return void
function UDPClient.GetRoomList() end

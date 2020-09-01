---@class NetworkManager : Manager
local NetworkManager = {}
---@public
---@return void
function NetworkManager:OnInit() end
---@public
---@return void
function NetworkManager:Unload() end
---@public
---@param func string
---@param args Object[]
---@return Object[]
function NetworkManager:CallMethod(func, args) end
---@public
---@param _event Int32
---@param data ByteBuffer
---@return void
function NetworkManager.AddEvent(_event, data) end
---@public
---@return void
function NetworkManager:SendConnect() end
---@public
---@param buffer ByteBuffer
---@return void
function NetworkManager:SendMessage(buffer) end

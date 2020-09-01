---@class PlayerPrefs : Object
local PlayerPrefs = {}
---@public
---@param key string
---@param value Int32
---@return void
function PlayerPrefs.SetInt(key, value) end
---@public
---@param key string
---@param defaultValue Int32
---@return Int32
function PlayerPrefs.GetInt(key, defaultValue) end
---@public
---@param key string
---@return Int32
function PlayerPrefs.GetInt(key) end
---@public
---@param key string
---@param value Single
---@return void
function PlayerPrefs.SetFloat(key, value) end
---@public
---@param key string
---@param defaultValue Single
---@return Single
function PlayerPrefs.GetFloat(key, defaultValue) end
---@public
---@param key string
---@return Single
function PlayerPrefs.GetFloat(key) end
---@public
---@param key string
---@param value string
---@return void
function PlayerPrefs.SetString(key, value) end
---@public
---@param key string
---@param defaultValue string
---@return string
function PlayerPrefs.GetString(key, defaultValue) end
---@public
---@param key string
---@return string
function PlayerPrefs.GetString(key) end
---@public
---@param key string
---@return bool
function PlayerPrefs.HasKey(key) end
---@public
---@param key string
---@return void
function PlayerPrefs.DeleteKey(key) end
---@public
---@return void
function PlayerPrefs.DeleteAll() end
---@public
---@return void
function PlayerPrefs.Save() end

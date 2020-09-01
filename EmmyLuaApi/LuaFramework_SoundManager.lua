---@class SoundManager : Manager
local SoundManager = {}
---@public
---@param path string
---@return AudioClip
function SoundManager:LoadAudioClip(path) end
---@public
---@return bool
function SoundManager:CanPlayBackSound() end
---@public
---@param name string
---@param canPlay bool
---@return void
function SoundManager:PlayBacksound(name, canPlay) end
---@public
---@return bool
function SoundManager:CanPlaySoundEffect() end
---@public
---@param clip AudioClip
---@param position Vector3
---@return void
function SoundManager:Play(clip, position) end

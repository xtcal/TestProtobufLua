---@class Screen : Object
---@field public resolutions Resolution[]
---@field public currentResolution Resolution
---@field public width Int32
---@field public height Int32
---@field public dpi Single
---@field public fullScreen bool
---@field public autorotateToPortrait bool
---@field public autorotateToPortraitUpsideDown bool
---@field public autorotateToLandscapeLeft bool
---@field public autorotateToLandscapeRight bool
---@field public orientation number
---@field public sleepTimeout Int32
---@field public GetResolution Resolution[]
---@field public showCursor bool
---@field public lockCursor bool
local Screen = {}
---@public
---@param width Int32
---@param height Int32
---@param fullscreen bool
---@param preferredRefreshRate Int32
---@return void
function Screen.SetResolution(width, height, fullscreen, preferredRefreshRate) end
---@public
---@param width Int32
---@param height Int32
---@param fullscreen bool
---@return void
function Screen.SetResolution(width, height, fullscreen) end

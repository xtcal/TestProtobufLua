ObjPoolManager = {}
local this = ObjPoolManager

local initConfig = {
    {abName = "TestGameObject", assetName = "TestGameObjectPrefab", count = 10}
} 

local cacheTab = {}

function this.Init()
	for _, v in pairs(initConfig) do
		resMgr.LoadPrefab()
	end
end

function this.Get(name)
	if not cacheTab[name] then
		cacheTab = {}
	end
end

function this.UnLoad(name)
	if not cacheTab[name] then
		cacheTab = {}
	end
end
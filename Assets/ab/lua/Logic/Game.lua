Game = {}
local this = Game

function this.OnInitOK()
	---@param go GameObject
	panelMgr:CreatePanel("prefab_login","Login", function(go)
		go.name = "Login_OK"
	end)
end
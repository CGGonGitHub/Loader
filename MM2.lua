--[[
	Made by No.8#9194 // CGG // CoolGermanGuy
	Unprotected by nothing v2

	you can use the loadstring: to get updates (recommended)
	loadstring(game:HttpGet("https://raw.githubusercontent.com/CGGonGitHub/Loader/main/Main.lua"))()
	
	Discord invite: https://discord.gg/dpy8s5dbPZ
]]

for i, v in next, game.CoreGui:GetChildren() do
    if v.Name:find("Vynixius UI Library") then
        v:Destroy()
    end
end

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/UI-Libraries/main/Vynixius/Source.lua"))()
local Window = Library:AddWindow({
	title = {"Murder Mystery 2", "No.8#9194"},
	theme = {
		Accent = Color3.fromRGB(0, 255, 0)
	},
	key = Enum.KeyCode.RightControl,
	default = true
})
-- Main
local MainTab = Window:AddTab("Main", {default = false})
-- Localplayer
local Local_Player = Window:AddTab("Local player", {default = false})
local Local_PlayerSection = Local_Player:AddSection("Basic Shit", {default = false})
local previousWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local WalkSpeedSlider = Local_PlayerSection:AddSlider("Walkspeed", 1, 300, 16, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val, bool)
	if bool then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = val
	end
	if bool == false then
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = previousWalkSpeed
	end
end)
local previousJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local JumpPowerSlider = Local_PlayerSection:AddSlider("JumpPower", 1, 3000, 50, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val2, bool2)
	if bool2 then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = val2
	end
	if bool2 == false then
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = previousJumpPower
	end
end)
local previousGravity = game.Workspace.Gravity
local Slider = Local_PlayerSection:AddSlider("Gravity", 0, 300, previousGravity, {toggleable = true, default = false, flag = "Slider_Flag", fireontoggle = true, fireondrag = true, rounded = true}, function(val3, bool3)
	if bool3 then
		game.Workspace.Gravity = val3
	end
	if bool3 == false then
		game.Workspace.Gravity = previousGravity
	end
end)
-- Utilities
local UtilitiesTab = Window:AddTab("Utilities", {default = false})
local UtilitiesSection = UtilitiesTab:AddSection("Utilities", {default = false})
local CandyFarmToggle = UtilitiesSection:AddToggle("Candy Auto Farm", {flag = "Toggle_Flag", default = false}, function(bool)
    looping = bool 
    
    task.spawn(function() 
        while looping == true do
            local CoinContainer
            for i,v in pairs(workspace:GetChildren()) do
                CoinContainer = v:FindFirstChild("CoinContainer")
                if CoinContainer then
                    break
                end
            end
            for i,v in pairs (CoinContainer:GetChildren()) do
                if v.Name =="Coin_Server" then
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Coin.CFrame
                    task.wait(2)
                end
            end
        end
    end)
end)
-- Teleports
local TeleportsTab = Window:AddTab("Teleports", {default = false})
local LocationSection = TeleportsTab:AddSection("Locations", {default = false})
local Dropdown = LocationSection:AddDropdown("Locations", {"Lobby", "Map", "Item3"}, {default = "Item1"}, function(selected)
	if selected ==  "Lobby" then 
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0.35,172,-13.5)
	elseif selected == "Map" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1846, -9, 840)
	end
end)
local PlayerTPSection = TeleportsTab:AddSection("Players", {default = false})
function getAllPlayers()
	local playertable =  {}
	for i, v in next, game.Players:GetPlayers() do
		table.insert(playertable, v.Name)
	end
	return playertable
end
function Teleport(CFrame)
	game.Players.LocalPlayer.Character.PrimaryPart:PivotTo(CFrame)
end
local Dropdown = PlayerTPSection:AddDropdown("Players", getAllPlayers(), {default = ""}, function(selected)
	Teleport(game.Players[selected].Character.HumanoidRootPart.CFrame)
end)

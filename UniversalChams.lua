local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))(); 
local Settings = {
	TeamCheck = false,
	WallCheck = "AlwaysOnTop",
	Whitelist = {},
	Players = {},
	List = {},
	Enabled = false,
	Color = {
		[1] = Color3.fromRGB(255, 255, 255),
		[2] = Color3.fromRGB(255, 255, 255),
	},
	Transparency = {
		[1] = 0,
		[2] = 0,
	},
}
for _, v in next, game:GetService("Players"):GetPlayers() do if v.Name ~= game:GetService("Players").LocalPlayer.Name then table.insert(Settings.List, v.Name) end end
game:GetService("Players").PlayerAdded:Connect(function(v) table.insert(Settings.List, v.Name) end)
game:GetService("Players").PlayerRemoving:Connect(function(v) table.remove(Settings.List, table.find(Settings.List, v.Name)) end)
if not isfile("Chams/Ignore") then
	Rayfield:Notify({
		Title = "Warning",
		Content = "This can be detectable. Make sure to test this on a alt before trying on other games! Click disable if you don't want to be notified anymore.",
		Duration = 6.5,
		Actions = {
			Disable = {
				Name = "Disable",
				Callback = function()
				    writefile("Chams/Ignore", "")
				end
			},
			Okay = {
				Name = "Okay!",
				Callback = function()

				end
			}
		}
	})
end

local Window = Rayfield:CreateWindow({
    Name = "Universal Chams",
    LoadingTitle = "Universal Chams",
    LoadingSubtitle = "Enjoy, " .. game:GetService("Players").LocalPlayer.Name .. ".",
    ConfigurationSaving = {
       Enabled = true,
       FolderName = "Chams", -- Create a custom folder for your hub/game
       FileName = "CFG"
    },
})

local Tab = Window:CreateTab("                                                                                                            "); Tab:CreateSection("Created by streekaiz#1132")
Tab:CreateToggle({
    Name = "Enabled",
    CurrentValue = false,
    Flag = "ESPEnabled",
    Callback = function(Value)
	    Settings.Enabled = Value
    end,
})

Tab:CreateSection("Colors")

Tab:CreateColorPicker({
    Name = "Fill Color",
    Color = Color3.fromRGB(255, 0, 0),
    Flag = "ColorPicker1",
    Callback = function(Value)
	    Settings.Color[1] = Value
    end
})

Tab:CreateColorPicker({
    Name = "Outline Color",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker2",
    Callback = function(Value)
	    Settings.Color[2] = Value
    end
})

Tab:CreateSection("Transparency")
Tab:CreateSlider({
    Name = "Fill Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "% / 1%",
    CurrentValue = 0,
    Flag = "Slider1", 
    Callback = function(Value)
	    Settings.Transparency[1] = Value
    end,
})

Tab:CreateSlider({
    Name = "Outline Transparency",
    Range = {0, 1},
    Increment = 0.1,
    Suffix = "% / 1%",
    CurrentValue = 0,
    Flag = "Slider2", 
    Callback = function(Value)
	    Settings.Transparency[2] = Value
    end,
})
Tab:CreateSection("Whitelist")
Tab:CreateInput({
    Name = "Insert Player",
    PlaceholderText = "",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
	    if Text == game:GetService("Players").LocalPlayer.Name then return end
		if not table.find(Settings.List, Text) then
			Rayfield:Notify({
				Title = "Error!",
				Content = "Unfortunately, we could not find " .. Text .. " in the players list.",
				Duration = 5,
				Image = 9838876113
			})
		else
			table.insert(Settings.Whitelist, Text)
			Rayfield:Notify({
				Title = "Success!",
				Content = "We found " .. Text .. " in the player list and added him.",
				Duration = 5,
				Image = 9838874163
			})
		end
    end,
})

Tab:CreateInput({
    Name = "Remove Player",
    PlaceholderText = "",
    RemoveTextAfterFocusLost = true,
    Callback = function(Text)
	    if Text == game:GetService("Players").LocalPlayer.Name then return end
		if not table.find(Settings.Whitelist, Text) then
			Rayfield:Notify({
				Title = "Error!",
				Content = "Unfortunately, we could not find " .. Text .. " in the whitelisted players list.",
				Duration = 5,
				Image = 9838876113
			})
		else
			table.remove(Settings.Whitelist, table.find(Settings.Whitelist, Text))
			Rayfield:Notify({
				Title = "Success!",
				Content = "We found " .. Text .. " in the whitelist and removed him.",
				Duration = 5,
				Image = 9838874163
			})
		end
	end,
})

Tab:CreateToggle({
    Name = "Team Check [SOON]",
    CurrentValue = false,
    Flag = "TeamCheck",
    Callback = function(Value)
	    if Value == false then
	        Settings.TeamCheck = true
		elseif Value ~= false then
			Settings.TeamCheck = false
		end
    end,
})

Tab:CreateSection("Miscallaenous Settings")
Tab:CreateToggle({
    Name = "Wall Check",
    CurrentValue = false,
    Flag = "WallCheck",
    Callback = function(Value)
	    if Value then
			Settings.WallCheck = "Occluded"
		else
			Settings.WallCheck = "AlwaysOnTop"
		end
    end,
})

local Players = game:GetService("Players")
local GetPlayers = Players:GetPlayers()
local Highlight = Instance.new("Highlight")
Highlight.Name = "Chams"


for _, v in next, GetPlayers do
	if v.Name ~= Players.LocalPlayer.Name then
		repeat task.wait() until v.Character
		if not table.find(Settings.Whitelist, v.Name) and not v.Character:FindFirstChild("Chams") then
			local Clone = Highlight:Clone()
			Clone.Parent = v.Character
			Clone.Enabled = Settings.Enabled
			Clone.DepthMode = Settings.WallCheck
			Clone.FillColor = Settings.Color[1]
			Clone.OutlineColor = Settings.Color[2]
			Clone.FillTransparency = Settings.Transparency[1]
			Clone.OutlineTransparency = Settings.Transparency[2]
			table.insert(Settings.Players, v.Name)
		end
	end
end

Players.PlayerAdded:Connect(function(v)
	if v.Name ~= Players.LocalPlayer.Name then
		repeat task.wait() until v.Character
		if not table.find(Settings.Whitelist, v.Name) then
			local Clone = Highlight:Clone()
			Clone.Enabled = Settings.Enabled
			Clone.Parent = v.Character
			Clone.DepthMode = Settings.WallCheck
			Clone.FillColor = Settings.Color[1]
			Clone.OutlineColor = Settings.Color[2]
			Clone.FillTransparency = Settings.Transparency[1]
			Clone.OutlineTransparency = Settings.Transparency[2]
			table.insert(Settings.Players, v.Name)
		end
	end
end)

Players.PlayerRemoving:Connect(function(v)
    table.remove(Settings.Players, table.find(Settings.Players, v.Name))
end)

game:GetService("RunService").Heartbeat:Connect(function()
    for _, v in next, GetPlayers do
	    if v.Name ~= Players.LocalPlayer.Name then
		    repeat task.wait() until v.Character
			if v.Character:FindFirstChild("Chams") then
				if not table.find(Settings.Whitelist, v.Name) and not v.Character:FindFirstChild("Chams") then
			    	v.Character:FindFirstChild("Chams").Enabled = Settings.Enabled
				    local Clone = v.Character:FindFirstChild("Chams")
				    Clone.Parent = v.Character
			    	Clone.DepthMode = Settings.WallCheck
		    	    Clone.FillColor = Settings.Color[1]
		         	Clone.OutlineColor = Settings.Color[2]
		            Clone.FillTransparency = Settings.Transparency[1]
			        Clone.OutlineTransparency = Settings.Transparency[2]
				    if v.Team == Players.LocalPlayer.Team then
				        v.Character.Chams.Enabled = Settings.TeamCheck
					else
					    Clone.Enabled = true
				    end
				end
			end
		end
	end
end)

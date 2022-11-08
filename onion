local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "OnionScript - Pies", HidePremium = false,IntroText = "OnionScript - Pies",IntroEnabled = true, SaveConfig = true, ConfigFolder = "OrionTest"})

-- tabs

local Heals = Window:MakeTab({
	Name = "Heals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Farming = Window:MakeTab({
	Name = "Farming",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Visuals = Window:MakeTab({
	Name = "Visuals",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Misc = Window:MakeTab({
	Name = "Keybinds",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local Credits = Window:MakeTab({
	Name = "Credits",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

-- global variables

_G.AutoBlood = false
_G.AutoBerries = false
_G.AutoBluefruit = false
_G.AutoLemons = false
_G.AutoJelly = false

-- functions

function AutoPickUp()
    local Player = game:GetService("Players").LocalPlayer
    for _, v in pairs(workspace:GetChildren()) do
        if v.Name == "Bloodfruit Bush" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 50 then
            game.ReplicatedStorage.Events.Pickup:FireServer(v)
        end
    end
end

function KeyBindBloodfruit()
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bloodfruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bloodfruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bloodfruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bloodfruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bloodfruit")
end

function KeyBindBerries()
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Berry")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Berry")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Berry")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Berry")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Berry")
end

function KeyBindBluefruit()
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bluefruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bluefruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bluefruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bluefruit")
    game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bluefruit")
end


function AutoPlant()
    local Player = game:GetService("Players").LocalPlayer
    for _, v in pairs(workspace.Deployables:GetChildren()) do
        if v.Name == "Plant Box" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 500 then
            game.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Bloodfruit")
        end
    end
end

function AutoBlood()
        while _G.AutoBlood == true do
        if _G.AutoBlood == true then 
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health< 100 then
        game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bloodfruit") -- fruit
         end
          task.wait()
       end
    end
end

function AutoBerries()
    while _G.AutoBerries == true do
        if _G.AutoBerries == true then 
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health< 100 then
        game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Berry") -- fruit
         end
          task.wait()
       end
    end
end

function AutoBluefruit()
    while _G.AutoBluefruit == true do
        if _G.AutoBluefruit == true then 
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health< 100 then
        game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Bluefruit") -- fruit
         end
          task.wait()
       end
    end
end

function AutoLemons()
    while _G.AutoLemons == true do
        if _G.AutoLemons == true then 
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health< 100 then
        game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Lemon") -- fruit
         end
          task.wait()
       end
    end
end

function AutoJelly()
    while _G.AutoJelly == true do
        if _G.AutoJelly == true then 
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health< 100 then
        game:GetService("ReplicatedStorage").Events.UseBagItem:FireServer("Jelly") -- fruit
         end
          task.wait()
       end
    end
end

-- toggles


Heals:AddToggle({
	Name = "AutoHeal - Bloodfruit",
	Default = false,
	Callback = function(Value)
		_G.AutoBlood = Value
        AutoBlood()
	end    
})

Heals:AddToggle({
	Name = "AutoHeal - Berries",
	Default = false,
	Callback = function(Value)
		_G.AutoBerries = Value
        AutoBerries()
	end    
})

Heals:AddToggle({
	Name = "AutoHeal - Bluefruit",
	Default = false,
	Callback = function(Value)
		_G.AutoBluefruit = Value
        AutoBluefruit()
	end    
})

Heals:AddToggle({
	Name = "AutoHeal - Lemons",
	Default = false,
	Callback = function(Value)
		_G.AutoLemons = Value
        AutoLemons()
	end    
})

Heals:AddToggle({
	Name = "AutoHeal - Jelly",
	Default = false,
	Callback = function(Value)
		_G.AutoJelly = Value
        AutoJelly()
	end    
})

local PlantBoxes = Farming:AddSection({
	Name = "Plant Boxes"
})


Farming:AddButton({
	Name = "Plant Boxes - layer 1",
	Callback = function()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local RootPart = LocalPlayer.Character.HumanoidRootPart
        local cframe = RootPart.CFrame
        local Remote = game:GetService("ReplicatedStorage").Events.PlaceStructure
        
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -9), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -8.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -8), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -7.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -7), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -6.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -3, -6), 0)
  	end    
})

Farming:AddButton({
	Name = "Plant Boxes - layer 2",
	Callback = function()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local RootPart = LocalPlayer.Character.HumanoidRootPart
        local cframe = RootPart.CFrame
        local Remote = game:GetService("ReplicatedStorage").Events.PlaceStructure
        
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -9), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -8.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -8), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -7.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -7), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -6.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2.5, -6), 0)
  	end    
})


Farming:AddButton({
	Name = "Plant Boxes - layer 3",
	Callback = function()
        local LocalPlayer = game:GetService("Players").LocalPlayer
        local RootPart = LocalPlayer.Character.HumanoidRootPart
        local cframe = RootPart.CFrame
        local Remote = game:GetService("ReplicatedStorage").Events.PlaceStructure
        
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -9), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -8.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -8), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -7.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -7), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -6.5), 0)
        Remote:FireServer("Plant Box", cframe * CFrame.new(-0, -2, -6), 0)
  	end    
})

local FruitToFarm = Farming:AddSection({
	Name = "Fruits to farm"
})


Farming:AddButton({
	Name = "Autofarm - Bloodfruit",
	Callback = function()
        local placekey = "p"
        local plantkey = "["
        local collectkey = "]"
        local amountofpots = 40  
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        
        _G.plant = function()
            for _, v in pairs(workspace.Deployables:GetChildren()) do
                if v.Name == "Plant Box" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 500 then
                    game.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Bloodfruit")
                end
            end
        end
        
        _G.collect = function()
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "Bloodfruit Bush" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 50 then
                    game.ReplicatedStorage.Events.Pickup:FireServer(v)
                end
            end
        end
        
        Mouse.KeyUp:connect(function(k)
            if k == placekey then
                for i = 1, amountofpots do
                    game.ReplicatedStorage.Events.PlaceStructure:FireServer("Plant Box", Mouse.Hit, 0)
                end
            elseif k == plantkey then
                _G.plant()
            elseif k == collectkey then
                _G.collect()
            end
        end)
  	end    
})

Farming:AddButton({
	Name = "Autofarm - Berries",
	Callback = function()
        local placekey = "p"
        local plantkey = "["
        local collectkey = "]"
        local amountofpots = 40  
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        
        _G.plant = function()
            for _, v in pairs(workspace.Deployables:GetChildren()) do
                if v.Name == "Plant Box" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 500 then
                    game.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Berry")
                end
            end
        end
        
        _G.collect = function()
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "Berry Bush" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 50 then
                    game.ReplicatedStorage.Events.Pickup:FireServer(v)
                end
            end
        end
        
        Mouse.KeyUp:connect(function(k)
            if k == placekey then
                for i = 1, amountofpots do
                    game.ReplicatedStorage.Events.PlaceStructure:FireServer("Plant Box", Mouse.Hit, 0)
                end
            elseif k == plantkey then
                _G.plant()
            elseif k == collectkey then
                _G.collect()
            end
        end)
  	end    
})

Farming:AddButton({
	Name = "Autofarm - Bluefruit",
	Callback = function()
        local placekey = "p"
        local plantkey = "["
        local collectkey = "]"
        local amountofpots = 40  
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        
        _G.plant = function()
            for _, v in pairs(workspace.Deployables:GetChildren()) do
                if v.Name == "Plant Box" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 500 then
                    game.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Bluefruit")
                end
            end
        end
        
        _G.collect = function()
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "Bluefruit Bush" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 50 then
                    game.ReplicatedStorage.Events.Pickup:FireServer(v)
                end
            end
        end
        
        Mouse.KeyUp:connect(function(k)
            if k == placekey then
                for i = 1, amountofpots do
                    game.ReplicatedStorage.Events.PlaceStructure:FireServer("Plant Box", Mouse.Hit, 0)
                end
            elseif k == plantkey then
                _G.plant()
            elseif k == collectkey then
                _G.collect()
            end
        end)
  	end    
})

Farming:AddButton({
	Name = "Autofarm - Lemons",
	Callback = function()
        local placekey = "p"
        local plantkey = "["
        local collectkey = "]"
        local amountofpots = 40  
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        
        _G.plant = function()
            for _, v in pairs(workspace.Deployables:GetChildren()) do
                if v.Name == "Plant Box" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 500 then
                    game.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Lemon")
                end
            end
        end
        
        _G.collect = function()
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "Lemon Tree" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 50 then
                    game.ReplicatedStorage.Events.Pickup:FireServer(v)
                end
            end
        end
        
        Mouse.KeyUp:connect(function(k)
            if k == placekey then
                for i = 1, amountofpots do
                    game.ReplicatedStorage.Events.PlaceStructure:FireServer("Plant Box", Mouse.Hit, 0)
                end
            elseif k == plantkey then
                _G.plant()
            elseif k == collectkey then
                _G.collect()
            end
        end)
  	end    
})


Farming:AddButton({
	Name = "Autofarm - Jelly",
	Callback = function()
        local placekey = "p"
        local plantkey = "["
        local collectkey = "]"
        local amountofpots = 40  
        
        local Player = game:GetService("Players").LocalPlayer
        local Mouse = Player:GetMouse()
        
        _G.plant = function()
            for _, v in pairs(workspace.Deployables:GetChildren()) do
                if v.Name == "Plant Box" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 500 then
                    game.ReplicatedStorage.Events.InteractStructure:FireServer(v, "Jelly")
                end
            end
        end
        
        _G.collect = function()
            for _, v in pairs(workspace:GetChildren()) do
                if v.Name == "Jelly Tree" and (Player.Character.Head.Position - v.PrimaryPart.Position).magnitude < 50 then
                    game.ReplicatedStorage.Events.Pickup:FireServer(v)
                end
            end
        end
        
        Mouse.KeyUp:connect(function(k)
            if k == placekey then
                for i = 1, amountofpots do
                    game.ReplicatedStorage.Events.PlaceStructure:FireServer("Plant Box", Mouse.Hit, 0)
                end
            elseif k == plantkey then
                _G.plant()
            elseif k == collectkey then
                _G.collect()
            end
        end)
  	end    
})

Visuals:AddButton({
	Name = "Tp To Void",
	Callback = function()
        game:GetService("TeleportService"):Teleport(10767870749)
  	end    
})

Visuals:AddButton({
	Name = "Night Mode",
	Callback = function()
        game.Lighting.TimeOfDay = 3
  	end    
})

Visuals:AddSlider({
	Name = "Field Of View",
	Min = 10,
	Max = 120,
	Default = 70,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 1,
	ValueName = "FOV",
	Callback = function(Value)
		game.Workspace.CurrentCamera.FieldOfView  = Value
	end    
})

Visuals:AddSlider({
	Name = "Brightness",
	Min = 0.1,
	Max = 3,
	Default = 0.1,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 1,
	ValueName = "Brightness",
	Callback = function(Value)
		game.Lighting.Brightness  = Value
	end    
})

Visuals:AddSlider({
	Name = "Saturation",
	Min = 0.1,
	Max = 3,
	Default = 0.1,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 0.1,
	ValueName = "Saturation",
	Callback = function(Value)
		game.Lighting.ColorCorrection.Saturation  = Value
	end    
})

Visuals:AddSlider({
	Name = "Contrast",
	Min = 0.1,
	Max = 3,
	Default = 0.1,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 0.1,
	ValueName = "Contrast",
	Callback = function(Value)
		game.Lighting.ColorCorrection.Contrast  = Value
	end    
})

Visuals:AddSlider({
	Name = "FogEnd",
	Min = 100,
	Max = 4500,
	Default = 2000,
	Color = Color3.fromRGB(60, 234, 176),
	Increment = 100,
	ValueName = "FogEnd",
	Callback = function(Value)
		game.Lighting.FogEnd  = Value
	end    
})

Misc:AddBind({
	Name = "Auto - Pickup",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		AutoPickUp()
	end    
})

Misc:AddBind({
	Name = "Auto - Plant",
	Default = Enum.KeyCode.F,
	Hold = false,
	Callback = function()
		AutoPlant()
	end    
})

Misc:AddBind({
	Name = "Autoheal - Bloodfruit",
	Default = Enum.KeyCode.Q,
	Hold = true,
	Callback = function()
		KeyBindBloodfruit()
	end    
})

Misc:AddBind({
	Name = "Autoheal - Berries",
	Default = Enum.KeyCode.H,
	Hold = true,
	Callback = function()
		KeyBindBerries()
	end    
})


Misc:AddBind({
	Name = "Autoheal - Bluefruit",
	Default = Enum.KeyCode.O,
	Hold = true,
	Callback = function()
		KeyBindBluefruit()
	end    
})


local Credits1 = Credits:AddSection({
	Name = "Eyes stole ur script lol"
})

local Credits2 = Credits:AddSection({
	Name = "Eyes stole ur script lol"
})

local Credits2 = Credits:AddSection({
	Name = "Eyes stole ur script lol"
})

local Credits2 = Credits:AddSection({
	Name = "Helpers: "
})

local Credits2 = Credits:AddSection({
	Name = "1. Eyes stole ur script lol "
})

local Credits2 = Credits:AddSection({
	Name = "2. Eyes stole ur script lol "
})

local Credits2 = Credits:AddSection({
	Name = "3. Eyes stole ur script lol "
})


local Keybinds1 = Credits:AddSection({
	Name = "Right Shift - Open ui"
})

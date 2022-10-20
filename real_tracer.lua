local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "tracer.lua", HidePremium = true, SaveConfig = false, ConfigFolder = "OrionTest", IntroEnabled = true, IntroText = "welcome to tracer.lua", Icon = "rbxassetid://4483345998"})
getgenv().OldAimPart = ""
getgenv().AimPart = "" 
    getgenv().AimlockKey = ""
    getgenv().AimRadius = 7.22
    getgenv().ThirdPerson = false
    getgenv().FirstPerson = false
    getgenv().TeamCheck = false 
    getgenv().PredictMovement = false
    getgenv().PredictionVelocity = 25
    getgenv().CheckIfJumped = false
    getgenv().Smoothness = false
    getgenv().SmoothnessAmount = false

local Tracer = Window:MakeTab({
	Name = "Tracer",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
local A1 = Tracer:AddSection({
	Name = "tracer"
})

local A2 = Tracer:AddSection({
	Name = "settings"
})

A1:AddBind({
	Name = "lock keybind",
	Default = Enum.KeyCode.Q,
	Hold = false,
	Callback = function(Bind)
    getgenv().AimlockKey = bind
	end    
})
A2:AddDropdown({
	Name = "orgin aimpart",
	Default = "UpperTorso",
	Options = {"Head", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "HumanoidRootPart", "LeftUpperLeg", "RightLowerLeg", "RightFoot", "LowerTorso"},
	Callback = function(Value)
    getgenv().OldAimPart = Value
	end    
})
A2:AddDropdown({
	Name = "main aimpart",
	Default = "HumanoidRootPart",
	Options = {"Head", "LeftHand", "RightHand", "LeftLowerArm", "RightLowerArm", "LeftUpperArm", "RightUpperArm", "LeftFoot", "LeftLowerLeg", "UpperTorso", "HumanoidRootPart", "LeftUpperLeg", "RightLowerLeg", "RightFoot", "LowerTorso"},
	Callback = function(Value)
    getgenv().AimPart = Value
	end    
})
A2:AddTextbox({
	Name = "radius",
	Default = "7.22",
	TextDisappear = false,
	Callback = function(Value)
    getgenv().AimRadius = Value

	end	  
})
A2:AddTextbox({
	Name = "smoothing",
	Default = "0.0421",
	TextDisappear = false,
	Callback = function(Value)
    getgenv().Smoothness = Value

	end	  
})
A2:AddTextbox({
	Name = "velocity prediction",
	Default = "25",
	TextDisappear = true,
	Callback = function(Value)
    getgenv().PredictonVelocity = Value
	end	  
})
A2:AddToggle({
	Name = "first person",
	Default = true,
	Callback = function(Value)
		getgenv().FirstPerson = Value
	end    
})
A2:AddToggle({
	Name = "third person",
	Default = true,
	Callback = function(Value)
		getgenv().ThirdPerson = Value
	end    
})
A2:AddToggle({
	Name = "team check",
	Default = false,
	Callback = function(Value)
		getgenv().TeamCheck = Value
	end    
})
A2:AddToggle({
	Name = "jump check",
	Default = false,
	Callback = function(Value)
		getgenv().CheckIfJumped = Value
	end    
})





loadstring(game:HttpGet('https://raw.githubusercontent.com/Streekaiz/random-shit/main/tracer.lua'))()

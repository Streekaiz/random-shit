local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/vozoid/ui-libraries/main/drawing/void/source.lua"))()
local watermark = library:Watermark("Noss Lock | ... fps | ... ping")
local main = library:Load{
    Name = "",
    SizeX = 600,
    SizeY = 380,
}
local tab = main:Tab("Noss's Silent Lock | " .. os.date("%b, %d, %A") )

local section = tab:Section{
    Name = "Keybinds",
    Side = "Left"
}
section:Box{
    Name = "Key",
    Placeholder = "Lock Key",
    Flag = "LockKey",
	Default = getgenv().ToggleKey or "C",
	Callback = function(Value)
	getgenv().ToggleKey = (  Value  )
	end
}
section:Box{
    Name = "Resolve Key",
    Placeholder = "Resolve Key",
    Flag = "ResolveKey",
	Default = getgenv().ResolverToggleKey or "V",
	Callback = function(Value)
	getgenv().ResolverToggleKey = (  Value  )
	end
}
section:Box{
    Name = "Screen Share Key",
    Placeholder = "Screen Share Key",
    Flag = "ScreenShareKey",
	Default = getgenv().HideAllWhenAskedToScreenShareKey or "Y",
	Callback = function(Value)
	getgenv().HideAllWhenAskedToScreenShareKey = (  Value  )
	end
}
local section1 = tab:Section{
    Name = "Prediction",
    Side = "Left"
}
section1:Box{
    Name = "Prediction",
    Placeholder = "Prediction Value",
    Flag = "Prediction",
	Default = "0.18",
	Callback = function(Value)
	getgenv().Prediction = (  Value  )
	end
}
section1:Toggle{
    Name = "Use Auto Prediction",
    Flag = "AutoPrediction",
    Default = getgenv().Auto_Prediction or false,
    Callback  = function(Value)
	getgenv().Auto_Prediction = Value
    end
}
local section2 = tab:Section{
    Name = "Whitelisting",
    Side = "Left"
}
section2:Toggle{
    Name = "Friend Check",
    Flag = "IgnoreFriends",
    Default = getgenv().DontShootMyFriends or false,
    Callback  = function(Value)
	getgenv().DontShootMyFriends = Value
    end
}
section2:Toggle{
    Name = "Wall Check",
    Flag = "WallCheck",
    Default = getgenv().IgnoreWalls or false,
    Callback  = function(Value)
	getgenv().IgnoreWalls = Value
    end
}
section2:Seperator("Table Whitelist")
section2:Box{
    Name = "Player",
    Placeholder = "Player Username",
    Flag = "PlayerUser",
	Default = game.Players.LocalPlayer.DisplayName,
}
section2:Button{
    Name = "Insert",
    Callback  = function()
        if not table.find(getgenv().DontShootThesePeople, library.flags["PlayerUser"]) then
			table.insert(getgenv().DontShootThesePeople, library.flags["PlayerUser"])
		end
    end
}
section2:Button{
    Name = "Remove",
    Callback  = function()
		table.remove(
			getgenv().DontShootThesePeople, 
			table.find(getgenv().DontShootThesePeople, library.flags["PlayerUser"]))
    end
}
local section3 = tab:Section{
    Name = "Hit Parts",
    Side = "Right"
}
section3:Toggle{
    Name = "Legit Hitparts",
    Flag = "Legit",
    Default = getgenv().HitParts or false,
    Callback  = function(Value)
	getgenv().HitParts = Value
    end
}
local hpdropdown = section3:Dropdown{
	Name = "Hit Parts",
    Default = "Head",
    Content = {
	"Head";
	"HumanoidRootPart",
	"UpperTorso";
	"LowerTorso";
	"RightHand",
	"RightLowerArm";
	"RightUpperArm";
	"LeftUpperArm";
	"LeftLowerArm";
	"LeftHand",
	"LeftUpperLeg";
	"LeftLowerLeg";
	"LeftFoot",
	"RightUpperLeg",
	"RightLowerLeg",
	"RightFoot"
    },
    Max = 16, -- turns into multidropdown
    Scrollable = true, -- makes it scrollable
    ScrollingMax = 6, -- caps the amount it contains before scrolling
    Flag = "Hitparts",
    Callback = function(tbl)
	getgenv().Randomized_HitParts = tbl
    end
}; hpdropdown:Set{
	getgenv().Randomized_HitParts and unpack(getgenv().Randomized_HitParts) or
		"Head";
	--"HumanoidRootPart"; -- This is kinda extra and slows lock down
	"UpperTorso";
	"LowerTorso";
	--"RightHand"; -- This is kinda extra and slows lock down
	"RightLowerArm";
	"RightUpperArm";
	"LeftUpperArm";
	"LeftLowerArm";
	--"LeftHand"; -- This is kinda extra and slows lock down
	"LeftUpperLeg";
	"LeftLowerLeg";
	--"LeftFoot"; -- This is kinda extra and slows lock down
	"RightUpperLeg";
	"RightLowerLeg";
	--"RightFoot"; -- This is kinda extra and slows lock down

}
local section4 = tab:Section{
    Name = "Miscallaenous",
    Side = "Right"
}
section4:Toggle{
    Name = "Face Locked Player",
    Flag = "Face",
    Default = getgenv().FaceLockDirection or false,
    Callback  = function(Value)
	getgenv().FaceLockDirection = Value
    end
}
section4:Toggle{
    Name = "Show Dot",
    Flag = "ShowDot",
    Default = getgenv().Show_Dot or false,
    Callback  = function(Value)
	getgenv().Show_Dot = Value
    end
}
local section5 = tab:Section{
    Name = "Miscallaenous",
    Side = "Right"
}
section5:Keybind{
    Name = "UI Keybind",
    Flag = "UI Keybind",
    Default = getgenv().UIKey or Enum.KeyCode.RightShift,
    Blacklist = {Enum.UserInputType.MouseButton1, Enum.UserInputType.MouseButton2, Enum.UserInputType.MouseButton3},
    Callback = function(_, v)
        if not v then
            library:Close()
        end
    end
}
section5:Button{
    Name = "Unload UI",
    Callback  = function()
	    library:Unload()
    end
}
section5:Seperator("Accent")
section5:ColorPicker{
    Name = "Color",
    Default = library.theme["Accent"],
    Flag = "Accent",
    Callback = function(color)
        library:ChangeThemeOption("Accent", color)
    end
}

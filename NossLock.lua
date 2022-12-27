game:GetService("RunService").RenderStepped:Connect(function()
	for _, Connection in next, getconnections(game:GetService("ScriptContext").Error) do
		Connection:Disable()
	end
	for _, Connection in next, getconnections(game:GetService("LogService").MessageOut) do
		Connection:Disable()
	end
end)

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
local Window = Rayfield:CreateWindow({ Name = "Noss Silent Lock", LoadingTitle = "Noss Silent Lock", LoadingSubtitle = "UI Converted by streekaiz#1132", ConfigurationSaving = { Enabled = false, FolderName = nil, FileName = "" }, Discord = { Enabled = false, Invite = "", RememberJoins = true }, KeySystem = false, KeySettings = {Title = "", Subtitle = "", Note = "", FileName = "", SaveKey = true, GrabKeyFromSite = false, } })



local HitpartsToCheck = {
    "Head";
	"HumanoidRootPart";
	"UpperTorso";
	"LowerTorso";
	"RightHand";
	"RightLowerArm";
	"RightUpperArm";
	"LeftUpperArm";
	"LeftLowerArm";
	"LeftHand";
	"LeftUpperLeg";
	"LeftLowerLeg";
	"LeftFoot";
	"RightUpperLeg";
	"RightLowerLeg";
	"RightFoot";
}

function CheckTable(bool, z, x) --[[
	doesn't return true because i only need to do a simple "else"
	incase you're too lazy how i use the functions
	bool is about hitparts and players check
	z is the table to search 
	x is the text thats input to search in the table
]]
    if bool == false then
	    if z == "Hitpart" then
			for _, v in pairs(HitpartsToCheck) do
				if x ~= v then
					return false
				end
			end
		end
		if z == "Players" then
			for _, v in pairs(game:GetService("Players"):GetPlayers()) do
			    if x ~= v.Name then
					return false
				end	
			end
		end
		elseif bool then
			for _, v in pairs(z) do
				if x ~= z then
					return false
			end
		end
	end
end

local Tab = Window:CreateTab("Noss Silent Lock", 4483345998)     

    Tab:CreateSection("Keybind Settings") do


        local K1 = Tab:CreateKeybind({
        	Name = "Lock Keybind",
        	CurrentKeybind = getgenv().ToggleKey,
        	HoldToInteract = false,
            Flag = "Lock Keybind",
			Callback = function()

	        end
        })

        local K2 = Tab:CreateKeybind({
        	Name = "Resolve Keybind",
	        CurrentKeybind = getgenv().ResolverToggleKey,
        	HoldToInteract = false,
            Flag = "Resolve Keybind",
			Callback = function()

	        end
        })

        local K3 = Tab:CreateKeybind({
        	Name = "Screen Share Keybind",
        	CurrentKeybind = getgenv().HideAllWhenAskedToScreenShareKey,
        	HoldToInteract = false,
            Flag = "Screen Share Keybind",
			Callback = function()

	        end
        })

        task.spawn(function()
            while true do
	        	getgenv().ToggleKey = (  K1.CurrentKeybind  )
	        	getgenv().ResolverToggleKey = (  K2.CurrentKeybind  )
		        getgenv().HideAllWhenAskedToScreenShareKey = (  K3.CurrentKeybind  )
		        task.wait(2.5)
            end
        end)
    end
    Tab:CreateSection("Toggle Settings") do
        Tab:CreateToggle({
            Name = "Dot Visible",
            CurrentValue = getgenv().Show_Dot,
            Callback = function(Value)
                getgenv().Show_Dot = Value
            end,
        })
        Tab:CreateToggle({
            Name = "Ignore Walls",
            CurrentValue = getgenv().IgnoreWalls,
            Callback = function(Value)
                getgenv().IgnoreWalls = Value
            end,
        })
        Tab:CreateToggle({
            Name = "Don't lock onto friends",
            CurrentValue = getgenv().DontShootMyFriends,
            Callback = function(Value)
                getgenv().DontShootMyFriends = Value
            end,
        })
    end

    Tab:CreateSection("Hitpart Settings") do
        Tab:CreateToggle({
            Name = "Use Hitpart Settings",
            CurrentValue = getgenv().HitParts,
            Callback = function(Value)
                getgenv().HitParts = Value
            end,
        })
        Tab:CreateInput({
            Name = "Add Hitpart",
            PlaceholderText = "",
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
		        if CheckTable(false, "Hitpart", Text) == false then
                        Rayfield:Notify({
                            Title = "Hey!",
                            Content = "You must've spelt the hitpart incorrectly. We cannot add that hitpart.",
                            Duration = 5,
                            Image = 4483345998,
                        })
		    	    	else
		    	    		table.insert( getgenv().Randomized_HitParts, Text)
		        	end
                end,
        })
        Tab:CreateInput({
            Name = "Remove Hitpart",
            PlaceholderText = "",
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
		  	    if CheckTable(false, getgenv().Randomized_HitParts, Text) == false then
                    Rayfield:Notify({
                        Title = "Hey!",
                        Content = "You must've spelt the hitpart incorrectly. We cannot remove that hitpart.",
                        Duration = 5,
                        Image = 4483345998,
                    })
		    	else
		    		table.remove(getgenv().Randomized_HitParts, table.find(getgenv().Randomized_HitParts, Text))
		    	end
            end,
        })
    end

    Tab:CreateSection("Whitelist & Blacklist Settings") do
        Tab:CreateInput({
            Name = "Whitelist Player",
            PlaceholderText = "",
            RemoveTextAfterFocusLost = true,
	    	Callback = function(Text)
	    	    if CheckTable(false, "Players", Text) == false then
                    Rayfield:Notify({
                        Title = "lmao",
                        Content = "who is that bro",
                        Duration = 5,
                        Image = 4483345998,
                    })
		    		else
		    			table.insert(getgenv().DontShootThesePeople, Text)
	    		end
            end,
        })
        Tab:CreateInput({
            Name = "Remove Player",
            PlaceholderText = "",
            RemoveTextAfterFocusLost = true,
            Callback = function(Text)
		        if CheckTable(true, getgenv().DontShootThesePeople, Text) == false then
                    Rayfield:Notify({
                        Title = "lmao",
                        Content = "bro he isnt in the whitelist table",
                        Duration = 5,
                        Image = 4483345998,
                    })
	    			else
	    				table.remove(getgenv().DontShootThesePeople, table.find(getgenv().DontShootThesePeople, Text))
    			end
            end,
        })
    end
	Tab:CreateSection("Prediction Settings") do
        Tab:CreateInput({
            Name = "Prediction",
            PlaceholderText = "",
            RemoveTextAfterFocusLost = false,
            Callback = function(Text)
			    getgenv().Prediction = (  Text  )
            end,
        })
	end


A documentary for octohook's ui.
This only has some of the main functions.
**Booting up the library**
```
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/random-shit/main/octo_hook_ui.lua"))({cheatname = "", gamename = ""})
library:init()
```
**Making the Window**
```
local menu = library.NewWindow({title = "Example UI", size = UDim2.new(0.3965, 100, 0.47, 27.5)})
-- last 4 args are the size and probably the positioning of when the lib is loaded
-- a little reminder that if you resize your roblox screen the ui will get glitched for whatever reason
-- if you wanna fix it go in source (and slide it in my dms)
```
**Creating a tab**
```
local ExampleTab = menu:AddTab("Example Tab")
```
**Adding sections to a tab**
```
local ExampleSection = MiscellaneousTab:AddSection("Example Section", 1) -- 1 is left, 2 is right.
```
**Adding Seperators**
```
ExampleSection:AddSeparator({text = "Example Separator "}) -- leave blank if you want to just have a line   
```
**Adding Buttons**
```
ExampleSection:AddButton({
       text = "Button", -- The label for your button
       confirm = false, -- dont know what the fuck this is..
       callback = function() -- callback, function, (returns the values)
           Print("Button") -- your code here
       end
})
```
**Adding Toggles**
```
ExampleSection:AddToggle({
       text = "Toggle", -- The label for your toggle
       flag = "", -- flag, i believe for configs or smth
       callback = function(Value) -- callback, function, (returns the values)
       print(Value) -- your code here
       end
})
```
**Adding Sliders**
```
ExampleSection:AddSlider({
       text = "Slider", -- The label for your slider 
       flag = '"',  -- flag, i believe for configs or smth
       suffix = "%", -- what appears after the value. For example, if my slider is 82, on the ui it will show "82%"
       min = 0, -- the minimum value of your slider
       max = 100, -- the maxium value of your slider
       value = 16, -- the starting value of your slider
       increment = 1 -- increments of your slider
       callback = function(Value) -- callback, function, (returns the values)
       print(Value) -- your code here
       end
})
```
**Adding Dropdowns**
```
ExampleSection:AddList({
       text = "Dropdown", -- The label for your dropdown
       flag = "", -- flag, i believe for configs or smth 
       values = {"This", "Is", "A", "Example", "Dropdown"} -- the list of stuff in your dropdown
       callback = function(Value) -- callback, function, (returns the values)
       print(Value) -- your code here
       end
})
```
**Sending Notifications**
```
library:SendNotification("Example Notification", 3) -- First arg is the notif text, second arg is the time that the notif exists.
```

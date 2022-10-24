small documentary for people that dont know how to use this
i dont really know most of the ui functions though, to get stuff like warning buttons or whatever go look in src


**Booting up the library**
```
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/Streekaiz/random-shit/main/octo_hook_ui.lua"))({cheatname = "", gamename = ""})
library:init()
```
**Making the Window**
```
local menu = library.NewWindow({title = "", size = UDim2.new(0.3965, 100, 0.47, 27.5)})
-- last 4 args are the size and probably the positioning of when the lib is loaded
```
**Creating a tab**
```
local ExampleTab = menu:AddTab("Example")
```


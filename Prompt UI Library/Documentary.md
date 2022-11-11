**Prompt UI Library Documentation**
**Credits to Sunken**

This documentation will teach you how to use this UI Library.

**Getting the Library**
```
local Prompt = loadstring(game:HttpGet(https://raw.githubusercontent.com/Streekaiz/random-shit/main/Prompt%20UI%20Library/Source.lua))()
```
**Creating a Prompt**
```
Library:New({
	Title = "Title",
    Footer = "Footer",
    Text = "Text",
    Icon = "http://www.roblox.com/thumbs/asset.ashx?assetid=10010679532&x=100&y=100&format=png",
    Yes = function()
    -- Code for when the Yes button is clicked.
	end,
	Cancel = function()
  -- Code for when the Cancel button is clicked.
	end
})
```

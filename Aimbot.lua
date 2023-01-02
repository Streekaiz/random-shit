getgenv().Aimbot = {
   Enabled = true,
   Smoothing = 0,
   TeamCheck = true,
   EasingStyle = "Sine",
   Whitelist = {--[[
      Make sure that its not their display name
      and that they're not incorrectly capatalized or spelled.
   ]]
      "Player1",
      "Player2",
      "Player3"
   },
   AimAtPart = "Head",
   FOV = {
      Enabled = true,
      Filled = false,
      Radius = 250,
      Sides = 64,
      Thickness = 1,
      Transparency = 1,
      Color = Color3.fromRGB(255, 255, 255),
   }
}

local FOVCircle = Drawing.new("Circle")
local Players = game:GetService("Players")
local Mouse = game:GetService("UserInputService").GetMouseLocation(game:GetService("UserInputService"))

local function GetClosestPlayer()
   local FOVRadius = getgenv().Aimbot.FOV.Radius
   local Target = nil 

   for _, v in pairs(Players:GetPlayers()) do
      if v.Name ~= Players.LocalPlayer.Name then
         if getgenv().Aimbot.TeamCheck then
            if v.Team ~= Players.LocalPlayer.Team then
               if v.Character ~= nil then
                  if v.Character.HumanoidRootPart ~= nil then
                     if v.Character.Humanoid ~= nil and v.Character.Humanoid.Health ~= 0 and not table.find(getgenv().Aimbot.Whitelist, v.Name) then
                        local ScreenPoint = workspace.CurrentCamera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                        local VectorDistance = (Vector2.new(game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y ) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                        if VectorDistance < FOVRadius then
                           Target = v 
                        end
                     end
                  end
               end
            end
         else
            if v.Character ~= nil then
               if v.Character.HumanoidRootPart ~= nil then
                  if v.Character.Humanoid ~= nil and v.Character.Humanoid.Health ~= 0 then
                     local ScreenPoint = workspace.CurrentCamera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                     local VectorDistance = (Vector2.new(game:GetService("UserInputService"):GetMouseLocation().X, game:GetService("UserInputService"):GetMouseLocation().Y ) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude

                     if VectorDistance < FOVRadius then
                        Target = v 
                     end
                  end
               end
            end
         end
      end
   end
   return Target
end

local HoldingKey = false

game:GetService("UserInputService").InputBegan:Connect(function(Input, IsTyping)
   if Input.UserInputType == Enum.UserInputType.MouseButton2 then
      HoldingKey = true
   end
end)

game:GetService("UserInputService").InputEnded:Connect(function(Input, IsTyping)
   if Input.UserInputType == Enum.UserInputType.MouseButton2 then
      HoldingKey = false
   end
end)


game:GetService("RunService").RenderStepped:Connect(function()
   Mouse = game:GetService("UserInputService").GetMouseLocation(game:GetService("UserInputService"))
   FOVCircle.Visible = getgenv().Aimbot.FOV.Enabled
   FOVCircle.Transparency = getgenv().Aimbot.FOV.Transparency
   FOVCircle.Thickness = getgenv().Aimbot.FOV.Thickness
   FOVCircle.Radius = getgenv().Aimbot.FOV.Radius
   FOVCircle.Filled = getgenv().Aimbot.FOV.Filled
   FOVCircle.NumSides = getgenv().Aimbot.FOV.Sides
   FOVCircle.Position = Mouse

   
   if HoldingKey and getgenv().Aimbot.Enabled then
      game:GetService("TweenService"):Create(
         workspace.CurrentCamera, 
         TweenInfo.new(
            getgenv().Aimbot.Smoothing, 
            Enum.EasingStyle[getgenv().Aimbot.EasingStyle], 
            Enum.EasingDirection.Out
         ), 
         {
            CFrame = CFrame.new(
               workspace.CurrentCamera.CFrame.Position, 
               GetClosestPlayer().Character[getgenv().Aimbot.AimAtPart].Position
            )
         }
      ):Play()
   end

end)

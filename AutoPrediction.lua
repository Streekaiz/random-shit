function c(n)
    getgenv().Prediction = (  n  )
end
local ping = math.round(tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ' ')[1]))
game:GetService("RunService").RenderStepped:Connect(function()
    ping = math.round(tonumber(string.split(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(), ' ')[1]))
	if ping < 20 then
		c(.135)
		elseif ping < 30 then
			c(.118)
			elseif ping < 40 then
				c(.1239)
				elseif ping < 50 then
					c(.127)
					elseif ping < 60 then
						c(.135)
						elseif ping < 70 then
							c(.138)
							elseif ping < 80 then
								c(.142)
								elseif ping < 90 then
									c(.148)
									elseif ping < 100 then
										c(.152)
										elseif ping < 110 then
											c(.140)
											elseif ping < 125 then
												c(.149)
												elseif ping < 130 then
													c(.151)
													elseif ping < 140 then
														c(.159)
														elseif ping < 150 then
															c(.162)
															elseif ping < 160 then
																c(.168)
																elseif ping < 170 then
																	c(.173)
																	else 
																	c(.1238915416)

									end
warn(getgenv().Prediction.." "..ping)
end)

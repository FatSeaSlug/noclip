local start = tick()

_G.TeamLine = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localplayer = Players.LocalPlayer
local cam = workspace.CurrentCamera

function esp(plr)

	local Names = Drawing.new("Text")
	Names.Text = plr.Name
	Names.Color = Color3.new(1, 1, 1)	
	Names.Outline = true
	Names.OutlineColor = Color3.new(0, 0, 0)
	Names.Size = 20
	Names.Visible = false

	RunService.RenderStepped:Connect(function()
		if plr ~= localplayer and plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") then
			local headPos = plr.Character:FindFirstChild("Head").Position
			local primaryPos = plr.Character.PrimaryPart.Position

			local nameVector, nameSeen = cam:WorldToViewportPoint(headPos)

			if lineSeen then
				Names.Position = Vector2.new(nameVector.X-2, nameVector.Y)


				Names.Visible = true

				if plr.TeamColor then
					Names.Color = plr.TeamColor.Color
				else
					Names.Color = Color3.new(1, 1, 1)
				end

				if not _G.TeamLine then
					if plr.TeamColor == localplayer.TeamColor then
						Names.Visible = false
					else
						Lines.Visible = true
						Names.Visible = true
					end
				end
			else
				Names.Visible = false
			end
		end
	end)
end

for i,v in pairs(Players:GetChildren()) do
	esp(v)
end

Players.PlayerAdded:Connect(function(v)
	v.CharacterAdded:Connect(function()
		esp(v)
	end)
end)

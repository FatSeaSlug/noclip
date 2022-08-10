local start = tick()

_G.TeamLine = true

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local localplayer = Players.LocalPlayer
local cam = workspace.CurrentCamera

function esp(plr)
	local Lines = Drawing.new("Line")
	Lines.Color = Color3.new(1, 1, 1)
	Lines.Visible = false
	Lines.Thickness = 1
	Lines.Transparency = 1
	
	local Names = Drawing.new("Text")
	Names.Text = plr.Name
	Names.Color = Color3.new(1, 1, 1)	
	Names.Outline = false
	Names.OutlineColor = Color3.new(0, 0, 0)
	Names.Size = 20
	Names.Visible = false
	

	RunService.RenderStepped:Connect(function()
		if plr ~= localplayer and plr.Character ~= nil and plr.Character:FindFirstChild("HumanoidRootPart") then
			local headPos = plr.Character:FindFirstChild("Head").Position
			local primaryPos = plr.Character.PrimaryPart.Position

			local nameVector, nameSeen = cam:WorldToViewportPoint(headPos)
			local lineVector, lineSeen = cam:WorldToViewportPoint(primaryPos)

			if lineSeen then
				Lines.From = Vector2.new(cam.ViewportSize.X/2, cam.ViewportSize.Y)
				Lines.To = Vector2.new(lineVector.X, lineVector.Y)
				Names.Position = Vector2.new(nameVector.X-2, nameVector.Y)

				Lines.Visible = false
				Names.Visible = false

				if plr.TeamColor then
					Lines.Color = plr.TeamColor.Color
					Names.Color = plr.TeamColor.Color
				else
					Lines.Color = Color3.new(1, 1, 1)
					Names.Color = Color3.new(1, 1, 1)
				end

				if not _G.TeamLine then
					if plr.TeamColor == localplayer.TeamColor then
						Lines.Visible = false
						Names.Visible = false
					else
						Lines.Visible = false
						Names.Visible = false
					end
				end
			else
				Lines.Visible = false
				Names.Visible = false
			end
		end
	end)
end

for i,v in pairs(Players:GetChildren()) do
	esp(v)
	Destroy()
	
end

Players.PlayerAdded:Connect(function(v)
	v.CharacterAdded:Connect(function()
		esp(v)
		Destroy()
	end)
end)

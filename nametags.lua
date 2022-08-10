--// Get the game instances.


local CurrentCamera = workspace.CurrentCamera
local LocalPlayer = game.Players.LocalPlayer
local Camera = workspace.Camera
local RunService = game:service('RunService')
local Players = game:GetService("Players")

local CreateInfo = function(Type, Player)

    --// To run the loop.

    local DrawingFunction = function() return true end


    --// To check what type they created.

    if Type == "Names" then


        --// Create the drawings.

        local Label = Drawing.new("Text")

        Label.Center = true
        Label.Outline = true
        Label.Font = Drawing.Fonts.Monospace
        Label.Size = 15


        --// Redo the function on line:32

        DrawingFunction = function()


            --// Make the checks to see if we can draw on the character without problems.

            if Player and Player.Character and Player.Character:WaitForChild("HumanoidRootPart") and Player.Character:FindFirstChild("Head") then


                --// This is too see where to put the drawing instances on line:42 or see if the player is OnScreen

                local Pos, Vis = CurrentCamera:WorldToViewportPoint(Player.Character.Head.CFrame.Position)


                --// Make the label invisible if the player is not OnScreen

                Label.Text = Player.Name
                Label.Color = Player.TeamColor.Color

                if Vis then
                    Label.Visible = true
                else
                    Label.Visible = false
                end

                Label.Position = Vector2.new(Pos.X, Pos.Y)


            else

                Label.Visible = false

            end

        end

    end

    RunService:BindToRenderStep("NameTags", 1, DrawingFunction)

end

for i,v in next, Players:GetPlayers() do
    if v ~= LocalPlayer then
        CreateInfo("Names", v)
    end
end

Players.PlayerAdded:connect(function(plr)
    CreateInfo("Names", plr)
end)

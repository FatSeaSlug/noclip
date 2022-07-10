repeat wait() until game:IsLoaded()
loadstring(game:HttpGet("https://raw.githubusercontent.com/1201for/V.G_Hub_Extras/main/Universal_Client_Bypass"))()

noclip = false
game:GetService('RunService').Stepped:connect(function()
if noclip then
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
end
end)
plr = game.Players.LocalPlayer
mouse = plr:GetMouse()
mouse.KeyDown:connect(function(key)

if key == "t" then
noclip = not noclip
game.Players.LocalPlayer.Character:WaitForChild("Humanoid"):ChangeState(11)
end
end)
print('Loaded')
print('Press "T" to noclip')

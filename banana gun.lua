local tool = game:GetObjects('rbxassetid://13035202991')[1]
tool.Parent = game.Players.LocalPlayer.Backpack
local humanoid = game.Players.LocalPlayer.Character.Humanoid
local cam = game.Workspace.CurrentCamera
local head = game.Players.LocalPlayer.Character.Head
local sound = Instance.new('Sound')
sound.SoundId = 'rbxassetid://8516024276'
sound.Parent = tool.Handle

local holding = Instance.new('Animation')
holding.AnimationId = 'rbxassetid://9982615727'

local shooting = Instance.new('Animation')
shooting.AnimationId = 'rbxassetid://9975553075'

local hold = humanoid:LoadAnimation(holding)
local shoot = humanoid:LoadAnimation(shooting)
shoot.Looped = false

tool.Equipped:Connect(function()
	hold:Play()
end)
tool.Unequipped:Connect(function()
	hold:Stop()
end)

tool.Activated:Connect(function()
    local allbananas = {}
    for i, v in pairs(game.Workspace:GetChildren()) do
        if v.Name == 'BananaPeel' then
            table.insert(allbananas, v)
        end
    end
    if #allbananas > 0 then
        local targ = allbananas[math.random(0, #allbananas)]
	if targ.TouchInterest then
        targ.TouchInterest:Destroy()
	end
        targ.Position = head.Position + cam.CFrame.LookVector * 5
        targ.AssemblyLinearVelocity = cam.CFrame.LookVector * 200
    end
    sound:Play()
    shoot:Play()
end)

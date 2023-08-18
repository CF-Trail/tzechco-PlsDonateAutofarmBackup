local lib = {}

local function twn(...)
	return game:GetService('TweenService'):Create(...)
end

local _TTSERVICE = game:GetService('TextChatService')

local function chat(C_1:string)
	if game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents') then
		game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer(C_1,'All')
	else
        local _TCHANNEL = _TTSERVICE.TextChannels.RBXGeneral
		_TCHANNEL:SendAsync(C_1)
	end
end

local function breakVelocity(char)
    local isVeloBroken = false
    task.delay(1,function()
        isVeloBroken = true
    end)
    while not isVeloBroken and task.wait() do
        for i,v in next, char:GetChildren() do
            if v:IsA('BasePart') then
                v.Velocity = v.Velocity * Vector3.new(0,1,0)
            end
        end
    end
end

local _CFRAMETABLE = {{-30.9582253, 1.36195695, 100.472855},{13.1596403, 0.731242418, 152.176956},{69.3110199, 0.73332727, 150.993561},{92.6021729, 0.733850241, 130.599258},{96.9429169, 0.738471866, 75},{91.9788284, 0.762879133, 72.3707657},{70.7379608, 0.737098873, 50.9553299},{15.6208801, 0.751551986, 50.5339737},{{-30.9582253, 1.36195695, 100.472855}}}

function lib.HLSetup(char)

end


function lib.HLUnload(char)

end

function lib.HLStart(char,raised)
    local deathcon
    local oldPos = char.Humanoid.RootPart.CFrame
    for i = 1, raised do
        repeat task.wait() until workspace:WaitForChild(game:GetService('Players').LocalPlayer.Name):FindFirstChild('Humanoid') and workspace:WaitForChild(game:GetService('Players').LocalPlayer.Name):FindFirstChild('Humanoid').Health ~= 0
        workspace:WaitForChild(game:GetService('Players').LocalPlayer.Name):FindFirstChild('Humanoid').Health = 0
    end
    workspace:WaitForChild(game:GetService('Players').LocalPlayer.Name):WaitForChild('HumanoidRootPart')
    twn(char.Humanoid.RootPart,TweenInfo.new(5,Enum.EasingStyle.Linear,Enum.EasingDirection.In),{CFrame = oldPos}):Play()
end

return lib

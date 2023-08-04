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

local _CFRAMETABLE = {{-30.9582253, 1.36195695, 100.472855},{13.1596403, 0.731242418, 152.176956},{69.3110199, 0.73332727, 150.993561},{92.6021729, 0.733850241, 130.599258},{96.9429169, 0.738471866, 75},{91.9788284, 0.762879133, 72.3707657},{70.7379608, 0.737098873, 50.9553299},{15.6208801, 0.751551986, 50.5339737},{{-30.9582253, 1.36195695, 100.472855}}}

function lib.HLSetup(char)
    --[[for i,v in next, _CFRAMETABLE do
        local _nPartC = Instance.new('Part',workspace)
        _nPartC.Name = '_[lap//]'
        _nPartC.Anchored = true
        _nPartC.Transparency = 1
        _nPartC.CanCollide = false
        _nPartC.CFrame = CFrame.new(table.unpack(i))
    end]]
end


function lib.HLUnload(char)
    --while workspace:FindFirstChild('_[lap//]') and task.wait() do
   --     workspace:FindFirstChild('_[lap//]'):Destroy()
 --   end
end

function lib.HLStart(char,raised)
    twn(char.Humanoid.RootPart,TweenInfo.new(5,Enum.EasingStyle.Linear,Enum.EasingDirection.In),{CFrame = CFrame.new(-30.9582253, 1.36195695, 100.472855)}):Play()
    task.wait(6)
    for _i = 1, raised do
        for i,v in next, _CFRAMETABLE do
            local con
            local _mtfinish
            char.Humanoid:MoveTo(Vector3.new(unpack(v)))
            con = char.Humanoid.MoveToFinished:Connect(function()
                _mtfinish = true
                con:Disconnect()
            end)
            repeat task.wait() until _mtfinish == true
        end 
    end
    if walkToBooth then
        walkToBooth()
    end
end

return lib

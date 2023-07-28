local lib = {}

local function twn(...)
	return game:GetService('TweenService'):Create(...)
end

local _TTSERVICE = game:GetService('TextChatService')
local _TCHANNEL = _TTSERVICE.TextChannels.RBXGeneral

local function chat(C_1:string)
	if game:GetService('ReplicatedStorage'):FindFirstChild('DefaultChatSystemChatEvents') then
		game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer(C_1,'All')
	else
		_TCHANNEL:SendAsync(C_1)
	end
end

function lib.HLSetup(char)
    local character = char
    local root = character.Humanoid.RootPart
	local Spin = Instance.new("BodyAngularVelocity")
	Spin.Name = "HL1__HELI"
	Spin.Parent = root
	Spin.MaxTorque = Vector3.new(0, math.huge, 0)
	Spin.AngularVelocity = Vector3.new(0, 1, 0)
    local __PART = Instance.new('Part',workspace)
    __PART.Name = '_HIGHLIGHT.CF'
    __PART.Anchored = true
    __PART.CFrame = CFrame.new(char.Humanoid.RootPart.Position - Vector3.new(0,3,0))
end


function lib.HLUnload(char)
    local character = char
    local root = character.Humanoid.RootPart
    root['HL1__HELI']:Destroy()
    workspace['_HIGHLIGHT.CF']:Destroy()
end

function lib.HLStart(char,raised)
    chat('Enabling engines...')
	task.wait(3)
	local _TWN = twn(char.Humanoid.RootPart.HL1__HELI, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
		AngularVelocity = Vector3.new(0, 25, 0)
	})
    _TWN:Play()
    task.wait(4)
    chat('TAKEOFF IN 3')
    task.wait(1)
    chat('2')
    task.wait(1)
    chat('1')
    task.wait(1)
    local C_OLDPOS = workspace['_HIGHLIGHT.CF'].Position
    local _TWN2 = twn(workspace['_HIGHLIGHT.CF'], TweenInfo.new(10,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{CFrame = CFrame.new(C_OLDPOS + Vector3.new(0,70,0))})
    local _TWN3 = twn(workspace['_HIGHLIGHT.CF'], TweenInfo.new(10,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{CFrame = CFrame.new(C_OLDPOS)})
    _TWN2:Play()
    task.wait(10)
    _TWN3:Play()
end

return lib

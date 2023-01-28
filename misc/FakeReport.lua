if not getgenv().victimName then game:GetService('Players').LocalPlayer:Kick('bruh') end
local players = game:GetService('Players')
local victim = players[getgenv().victimName]

function disguisechar(char, id)
	task.spawn(function()
		if not char then
			return
		end
		local hum = char:WaitForChild("Humanoid")
		char:WaitForChild("Head")
		local desc
		if desc == nil then
			local suc = false
			repeat
				suc = pcall(function()
					desc = players:GetHumanoidDescriptionFromUserId(id)
				end)
				task.wait(1)
			until suc
		end
		desc.HeightScale = hum:WaitForChild("HumanoidDescription").HeightScale
		char.Archivable = true
		local disguiseclone = char:Clone()
		disguiseclone.Name = "disguisechar"
		disguiseclone.Parent = workspace
		for i, v in pairs(disguiseclone:GetChildren()) do
			if v:IsA("Accessory") or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") then
				v:Destroy()
			end
		end
		disguiseclone.Humanoid:ApplyDescriptionClientServer(desc)
		for i, v in pairs(char:GetChildren()) do
			if (v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
				v.Parent = game
			end
		end
		char.ChildAdded:Connect(function(v)
			if ((v:IsA("Accessory") and v:GetAttribute("InvItem") == nil and v:GetAttribute("ArmorSlot") == nil) or v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors")) and v:GetAttribute("Disguise") == nil then
				repeat
					task.wait()
					v.Parent = game
				until v.Parent == game
			end
		end)
		for i, v in pairs(disguiseclone:WaitForChild("Animate"):GetChildren()) do
			v:SetAttribute("Disguise", true)
			local real = char.Animate:FindFirstChild(v.Name)
			if v:IsA("StringValue") and real then
				real.Parent = game
				v.Parent = char.Animate
			end
		end
		for i, v in pairs(disguiseclone:GetChildren()) do
			v:SetAttribute("Disguise", true)
			if v:IsA("Accessory") then
				for i2, v2 in pairs(v:GetDescendants()) do
					if v2:IsA("Weld") and v2.Part1 then
						v2.Part1 = char[v2.Part1.Name]
					end
				end
				v.Parent = char
			elseif v:IsA("ShirtGraphic") or v:IsA("Shirt") or v:IsA("Pants") or v:IsA("BodyColors") then
				v.Parent = char
			elseif v.Name == "Head" then
				char.Head.MeshId = v.MeshId
			end
		end
		local localface = char:FindFirstChild("face", true)
		local cloneface = disguiseclone:FindFirstChild("face", true)
		if localface and cloneface then
			localface.Parent = game
			cloneface.Parent = char.Head
		end
		char.Humanoid.HumanoidDescription:SetEmotes(desc:GetEmotes())
		char.Humanoid.HumanoidDescription:SetEquippedEmotes(desc:GetEquippedEmotes())
		disguiseclone:Destroy()
	end)
end
local oldVictimDisplay = victim.DisplayName
local oldVictimName = victim.Name
local id = players:GetUserIdFromNameAsync(getgenv().name)
disguisechar(victim.Character, id)
victim.Name = getgenv().name
victim.DisplayName = getgenv().displayname
victim.CharacterAppearanceId = id
victim.Character.Head.HeadTag.Display.Text = getgenv().displayname

game.DescendantAdded:Connect(function(child)
	if child:IsA("TextBox") or child:IsA("TextLabel") or child:IsA("TextButton") then
		child.Text = child.Text:gsub(game:GetService('Players').LocalPlayer.DisplayName, getgenv().displayname):gsub(oldVictimDisplay, getgenv().displayname):gsub(game:GetService('Players').LocalPlayer.Name, getgenv().name):gsub(oldVictimName, getgenv().name)
	end
end)

for i,v in next, game:GetDescendants() do
	if v:IsA("TextBox") or child:IsA("TextLabel") or v:IsA("TextButton") then
		child.Text = child.Text:gsub(game:GetService('Players').LocalPlayer.DisplayName, getgenv().displayname):gsub(oldVictimDisplay, getgenv().displayname):gsub(game:GetService('Players').LocalPlayer.Name, getgenv().name):gsub(oldVictimName, getgenv().name)
	end
end

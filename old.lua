--[[
	This property is protected.
	You are not allowed to claim this as your own.
	Removal of initial credits to the authors is prohibited.
]]

repeat
	task.wait()
until game:IsLoaded()

  --Stops script if on a different game
if game.PlaceId ~= 8737602449 and game.PlaceId ~= 8943844393 then
	return
end

local identifyexecutor = identifyexecutor or function() return 'Unknown' end
local cloneref = (identifyexecutor() ~= "Synapse Z" and not identifyexecutor():find("Codex") and cloneref) or function(o) return o end -- infinite yield
local CoreGui = cloneref(game:GetService("CoreGui"))
local Players = cloneref(game:GetService("Players"))
local HttpService = cloneref(game:GetService("HttpService"))
local TPService = cloneref(game:GetService("TeleportService"))
local PathfindingService = cloneref(game:GetService("PathfindingService"))
local ReplicatedStorage = cloneref(game:GetService("ReplicatedStorage"))
if not workspace then
	workspace = game:GetService('Workspace')
end
local Remotes

for i,v in next, ReplicatedStorage:GetChildren() do
   if v.Name:find('Remote') and v.IsA(v, 'ModuleScript') then
       local suc = pcall(function()
           require(v).Event('PromotionBlimpGiftbux'):FireServer()
       end)
       if suc then 
           Remotes = require(v)
           break
       end
   end
   task.wait()
end

--skidded!!! ty tvk1308
--[[for k, v in pairs(getgc(true)) do
	if pcall(function()
		return rawget(v, "indexInstance")
	end) and type(rawget(v, "indexInstance")) == "table" and  (rawget(v, "indexInstance"))[1] == "kick" then
		v.tvk = {
			"kick",
			function()
				return workspace:WaitForChild(HttpService:GenerateGUID(true))
			end
		}
	end
end]]

local xspin = 0
local nx = 0

local fonts = {
	"AmaticSC",
	"Antique",
	"Arcade",
	"Arial",
	"ArialBold",
	"Bangers",
	"Bodoni",
	"Cartoon",
	"Code",
	"Creepster",
	"DenkOne",
	"Fantasy",
	"Fondamento",
	"FredokaOne",
	"Garamond",
	"Gotham",
	"GothamBlack",
	"GothamBold",
	"GothamMedium",
	"GrenzeGotisch",
	"Highway",
	"IndieFlower",
	"JosefinSans",
	"Jura",
	"Kalam",
	"Legacy",
	"LuckiestGuy",
	"Merriweather",
	"Michroma",
	"Nunito",
	"Oswald",
	"PatrickHand",
	"PermanentMarker",
	"Roboto",
	"RobotoCondensed",
	"RobotoMono",
	"Sarpanch",
	"SciFi",
	"SourceSans",
	"SourceSansBold",
	"SourceSansItalic",
	"SourceSansLight",
	"SourceSansSemibold",
	"SpecialElite",
	"TitilliumWeb",
	"Ubuntu"
}

if getgenv().loadedRR then
	return
else
	getgenv().loadedRR = true
end

task.wait()

--Anti-AFK
local connections = getconnections or get_signal_cons or nil
task.spawn(function()
	if --[[connections and not identifyexecutor():find('Codex')]] false then
		for a, b in next, connections(Players.LocalPlayer.Idled) do
			b:Disable()
		end
	else
		local bb = game:GetService("VirtualUser")
		Players.LocalPlayer.Idled:Connect(function()
		    bb:CaptureController()
		    bb:ClickButton2(Vector2.new())
		end)
	end
end)

local _CFRAMETABLE = {{166.584, 3.47699, 371.398},{228.765, 3.57067, 332.55},{225.878, 3.57066, 274.96},{169.654, 4.11481, 232.826},{102.625, 3.57066, 274.941},{109.353, 3.57066, 351.28}, {166.584, 3.47699, 371.399}}
local unclaimed = {}
local mainCheckPosition = Vector3.new(165.161,0,311.636)
local donation, boothText, spamming, hopTimer, vcEnabled
local errCount = 0
local uid = Players.LocalPlayer.UserId
local newRaisedFormat = Players.LocalPlayer:WaitForChild('leaderstats'):WaitForChild('Raised')
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or nil
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = HttpService
if queueonteleport then
	queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/old.lua'))()")
end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/UI"))()
local _HIGHLIGHTLOADER
pcall(function()
     _HIGHLIGHTLOADER = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/hl.lib.lua'))()
end)
function forceServerHop()
	--local isVip = game:GetService('RobloxReplicatedStorage').GetServerType:InvokeServer()
	--if isVip == "VIPServer" then return end
	local gameId
	gameId = "8737602449"
	local servers = {}
	local req = httprequest({
		Url = "https://games.roblox.com/v1/games/" .. gameId .. "/servers/Public?sortOrder=Desc&limit=100"
	})
	local body = httpservice:JSONDecode(req.Body)
	if body and body.data then
		for i, v in next, body.data do
			if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing > 19 then
				table.insert(servers, 1, v.id)
			end
		end
	end
	task.spawn(function()
		while task.wait(0.5) do
			if #servers > 0 then
				TPService:TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
			end
		end
	end)
	TPService.TeleportInitFailed:Connect(function()
		TPService:TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
	end)
end
local settingsLock
function saveSettings()
	if not settingsLock then
		local suc, er = pcall(function()
			writefile('plsdonatesettings.txt', httpservice:JSONEncode(getgenv().settings))
		end)
		if not suc then
			return warn('lol')
		end
	end
end
getgenv().settings = {}

local sNames = {
	"textUpdateToggle",
	"textUpdateDelay",
	"serverHopToggle",
	"serverHopDelay",
	"hexBox",
	"goalBox",
	"webhookToggle",
	"webhookBox",
	"danceChoice",
	"thanksMessage",
	"signToggle",
	"customBoothText",
	"signUpdateToggle",
	"signText",
	"signHexBox",
	"autoThanks",
	"autoBeg",
	"begMessage",
	"begDelay",
	"fpsLimit",
	"render",
	"thanksDelay",
	"vcServer",
	"donationJump",
	"AlternativeHop",
	"autoNearReply",
	"boothPosition",
	"standingPosition",
	"AnonymousMode",
	"boothSwitcher",
	"serverHopAfterDonation",
	"jumpsPerRobux",
	"staffHopA",
	"spinSet",
	"boothTop",
	"spinSpeedMultiplier",
	"webhookAfterSH",
	"minimumDonated",
	"webhookType",
	"fpsBoost",
	"fontFace",
	"fontSize",
	'noFont',
	'taggedBoothHop',
	'rainbowText',
	'helloResponce',
	'botResponce',
	"donateResponce",
	"otherResponce",
	"scamResponce",
	"pingEveryone",
	"pingAboveDono",
	"removeHeadNametag",
	"gravitySwitch",
	"jumpBoost",
	'goalServerhopSwitch',
	'goalServerhopGoal',
	'highlightSwitch',
	'helicopterEnabled',
	'friendHop',
	'autoReplyNoRespond',
	'antiBotServers',
    'robuxLap'
}

local positionX = (Players.LocalPlayer.Character or Players.LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart').Position

local sValues = {
	true,
	30,
	true,
	15,
	"#32CD32",
	5,
	false,
	"",
	"Disabled",
	{
		"Thank you",
		"Thanks!",
		"ty :)",
		"tysm!"
	},
	false,
	"✅ 1R$ = +1 SPIN SPEED ✅",
	false,
	"your text here",
	"#ffffff",
	true,
	true,
	{
		"1R$ = +1 SPIN SPEED",
		"Spinning for donations!"
	},
	300,
	60,
	false,
	3,
	false,
	false,
	false,
	false,
	3,
	'Front',
	false,
	false,
	false,
	1,
	true,
	true,
	false,
	1,
	false,
	0,
	'New',
	false,
	'SciFi',
	5,
	false,
	false,
	false,
	{
		'Hi',
		'Sup',
		'Hello'
	},
	{
		'no im not',
		'im not a bot'
	},
	{
		"sorry im saving",
		"i am saving for my dream item",
		"sorry my robux is pending"
	},
	{
		"..?",
		"what",
		"?"
	},
	{
		"im no scam",
		"im not a scammer",
		"this is not a scam"
	},
	false,
	1000,
	false,
	false,
	false,
	false,
	0,
	false,
	false,
	true,
	false,
	false,
    false
}

  --Load Settings
if isfile("plsdonatesettings.txt") then
	local sl, er = pcall(function()
		getgenv().settings = HttpService:JSONDecode(readfile('plsdonatesettings.txt'))
	end)
	if er ~= nil then
		task.spawn(function()
			errMsg = Instance.new("Hint")
			errMsg.Parent = CoreGui
			errMsg.Text = tostring("COULDNT LOAD SETTINGS BECAUSE OF DUMBASS JSON ERROR, SERVERHOPPING")
			task.wait(15)
			errMsg:Destroy()
		end)
		delfile("plsdonatesettings.txt")
		task.wait(2)
		getgenv().settings = HttpService:JSONDecode(readfile('plsdonatesettingsbackup.txt'))
		saveSettings()
		forceServerHop()
		return
	else
		writefile('plsdonatesettingsbackup.txt', httpservice:JSONEncode(getgenv().settings))
	end
end

if #getgenv().settings ~= sNames then
	for i, v in ipairs(sNames) do
		if getgenv().settings[v] == nil then
			getgenv().settings[v] = sValues[i]
		end
	end
	writefile('plsdonatesettings.txt', httpservice:JSONEncode(getgenv().settings))
end

local settingsLock = true
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local S_T = TPService
local S_H = HttpService
local RandomName = "PlsDonateServerHop-Temp"

local File = pcall(function()
	AllIDs = S_H:JSONDecode(readfile(RandomName .. ".json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	pcall(function()
		writefile(RandomName .. ".json", S_H:JSONEncode(AllIDs))
	end)

end

local vc = cloneref(game:GetService("VoiceChatService"))

local success, enabled = pcall(function()
	return vc:IsVoiceEnabledForUserIdAsync(uid)
end)

if success and enabled then
	vcEnabled = true
else
	vcEnabled = false
end

local function choosePlaceId()
    if vcEnabled and settings.vcServer then
        return 8943844393
    elseif settings.AlternativeHop then
        return (math.random() < 0.5) and 8943844393 or 8737602449
    else
        return 8737602449
    end
end

local function serverHop()
    while task.wait(1.5) do
        if httprequest then
            task.spawn(function()
                local HttpService = game:GetService("HttpService")
                local TeleportService = game:GetService("TeleportService")
                local Players = game:GetService("Players")
                local LocalPlayer = Players.LocalPlayer
                local PlaceId = choosePlaceId()
                local JobId = game.JobId

                local req = httprequest({
                    Url = string.format(
                        "https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", 
                        PlaceId
                    )
                })

                local success, body = pcall(function()
                    return HttpService:JSONDecode(req.Body)
                end)

                if success and body and body.data then
                    local servers = {}

                    for _, server in pairs(body.data) do
                        if server.playing < server.maxPlayers and server.id ~= JobId then
                            table.insert(servers, server)
                        end
                    end

                    if #servers > 0 then
                        local selectedServer = servers[math.random(1, #servers)]
                        pcall(function()
                            TeleportService:TeleportToPlaceInstance(PlaceId, selectedServer.id, LocalPlayer)
                        end)
                    end
                end
            end)
        end
    end
end


function waitServerHop()
	task.wait(getgenv().settings.serverHopDelay * 60)
	serverHop()
end

local function hopSet()
	if hopTimer then
		task.cancel(hopTimer)
	end
	if getgenv().settings.serverHopToggle then
		hopTimer = task.spawn(waitServerHop)
	end
end

local function playerChecker(player)
	return
end

local function twn(...)
	return cloneref(game:GetService('TweenService')):Create(...)
end

local function oldWebhook(msg)
	if getgenv().settings.webhookBox:gsub(' ', '') == '' then
		return
	end
	pcall(function()
		httprequest({
			Url = getgenv().settings.webhookBox:gsub(' ', ''),
			Body = httpservice:JSONEncode({
				["content"] = msg
			}),
			Method = "POST",
			Headers = {
				["content-type"] = "application/json"
			}
		})
	end)
end

local sliderInProgress = false;
local function slider(value, whichSlider)
	if sliderInProgress then
		return
	end
	sliderInProgress = true
	task.wait(5)
	if getgenv().settings[whichSlider] == value then
		saveSettings()
		sliderInProgress = false;
		if whichSlider == "serverHopDelay" then
			hopSet()
		end
	else
		sliderInProgress = false;
		return slider(getgenv().settings[whichSlider], whichSlider)
	end
end

local _shuffled = workspace:WaitForChild('MapUI',3)
local _shufflerandom = 0
if not _shuffled then
   _shufflerandom = 1
end
local _boothlocation
if _shufflerandom == 1 then
	pcall(function()
	   _boothlocation = Players.LocalPlayer:WaitForChild('PlayerGui',5):WaitForChild('MapUIContainer',5):WaitForChild('MapUI',5)
	end)
else
   _boothlocation = _shuffled or workspace:WaitForChild('MapUI')
end

if not _boothlocation then
	return serverHop()
end

local function formatNumber(n)
    if n == 420 or n == 425 then
        n = n + 10
    end
    if n >= 10000 then
        return string.format("%.1fk", n / 1000)
    elseif n >= 1000 then
        return string.format("%.2fk", n / 1000)
    else
        return tostring(n)
    end
end

function updateBoothText()
    if not (settings.textUpdateToggle and settings.customBoothText) then
        return
    end

    local currentRaw = tonumber(newRaisedFormat.Value)
    local goalRaw    = currentRaw + tonumber(settings.goalBox)

    local currentStr = formatNumber(currentRaw)
    local goalStr    = formatNumber(goalRaw)

    local text = settings.customBoothText
        :gsub("%$C", currentStr)
        :gsub("%$G", goalStr)
        :gsub("%$JPR", tostring(settings.jumpsPerRobux))

    local boothUI = _boothlocation.BoothUI:FindFirstChild("BoothUI" .. unclaimed[2])
    if not boothUI then return end
    local signLabel = boothUI.Sign.TextLabel

    if signLabel.Text == text then
        return
    end

    if signLabel.Text:find("##") and settings.taggedBoothHop and nx >= 1 then
        return serverHop()
    end

    local basePayload = {
        textFont         = Enum.Font[settings.fontFace],
        richText         = true,
        strokeColor      = Color3.new(0, 0, 0),
        strokeOpacity    = 0,
        textColor        = rgb(settings.hexBox),
        buttonStrokeColor= Color3.new(0, 0, 0),
        buttonTextColor  = Color3.new(1, 1, 1),
        buttonColor      = Color3.new(98, 255, 0),
        buttonHoverColor = Color3.new(98, 255, 0),
        buttonLayout     = ""
    }
    basePayload.text = text
    Remotes.Event("SetCustomization"):FireServer(basePayload, "booth")
end

local _TTSERVICE = cloneref(game:GetService('TextChatService'))
local _TCHANNEL = _TTSERVICE.TextChannels.RBXGeneral

local function chat(C_1)
	_TCHANNEL:SendAsync(C_1)
end

local function begging()
	while getgenv().settings.autoBeg do
		chat(getgenv().settings.begMessage[math.random(#getgenv().settings.begMessage)])
		task.wait(getgenv().settings.begDelay)
	end
end

local function fetchNearPlr()
	local minmagnif,plrfoundf
	local lplrChar = Players.LocalPlayer.Character
	if lplrChar then
		local humanoidthing = lplrChar:FindFirstChildOfClass('Humanoid')
		if humanoidthing then
			local roothum = humanoidthing.RootPart
			if roothum then
				minmagnif = 9999999
				plrfoundf = nil
				for i,v in next, Players:GetPlayers() do
					if v == Players.LocalPlayer then
						continue
					end
					if v.Character and v.Character:FindFirstChildOfClass('Humanoid') then
						local randomplrroot = v.Character:FindFirstChildOfClass('Humanoid').RootPart
						if randomplrroot then
							local cmagnif = (randomplrroot.Position - roothum.Position).Magnitude
							if cmagnif < minmagnif then
								minmagnif = cmagnif
								plrfoundf = v
							end
						end
					end
				end
			end
		end
	end
	return plrfoundf
end

local function webhook(raised, donor)
    local url = getgenv().settings.webhookBox:match("%S+")
    if not url or url == "" then
        return
    end
    local embed = {
        title       = Players.LocalPlayer.Name .. " 💸 just got donated!",
        description = string.format(
            "**%d R$** by **%s**\n• A/T: %d R$\n• Total: %d R$",
            raised,
            donor,
            math.floor(raised * 0.6),
            tonumber(Players.LocalPlayer.leaderstats.Raised.Value)
        ),
        color       = 0x2ECC71,
        thumbnail   = {
            url = ("https://www.roblox.com/headshot-thumbnail/image?userId=%d&width=256&height=256&format=png")
                  :format(Players.LocalPlayer.UserId)
        },
        timestamp   = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }
    local payload = HttpService:JSONEncode({ embeds = { embed } })
    httprequest({
        Url     = url,
        Method  = "POST",
        Headers = { ["Content-Type"] = "application/json" },
        Body    = payload
    })
    if getgenv().settings.pingEveryone and raised >= tonumber(getgenv().settings.pingAboveDono) then
        httprequest({
            Url     = url,
            Method  = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body    = HttpService:JSONEncode({ content = "@everyone" })
        })
    end
end

local function hex(c3)
	local r, g, b = math.floor(c3.R * 255), math.floor(c3.G * 255), math.floor(c3.B * 255)
	return string.format("#%02X%02X%02X", r, g, b)
end

function rgb(hex)
	hex = hex:gsub("#", "")
	local r, g, b = tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
	return Color3.new(r, g, b)
end

if CoreGui:FindFirstChild('RobloxPromptGui') then
	for i, v in next, CoreGui.RobloxPromptGui:GetDescendants() do
		if v:IsA('TextLabel') and string.find(string.lower(v.Text), "ban") then
			oldWebhook('@everyone ||' .. Players.LocalPlayer.Name .. '|| got banned' .. v.Text:gsub("You've been banned", ''):gsub('You were kicked from this experience:', ''):gsub('(Error Code: 267)', ''):gsub('()', ''))
		end
	end
end

if CoreGui:FindFirstChild('RobloxPromptGui') then
	CoreGui.RobloxPromptGui.DescendantAdded:Connect(function(v)
		if v:IsA('TextLabel') and string.find(string.lower(v.Text), "ban") then
			oldWebhook('@everyone ||' .. Players.LocalPlayer.Name .. '|| got banned' .. v.Text:gsub("You've been banned", ''):gsub('You were kicked from this experience:', ''):gsub('(Error Code: 267)', ''):gsub('()', ''))
		end
	end)
end

local flaggedTexts = {
	'spin',
	'jump',
	'helicopter',
	'+1 speed',
	'gifting donations',
	'goal'
}

local flaggedTextCount = 0

local function checkForBots()
	if not getgenv().settings.antiBotServers then
		return
	end
	local boothUiStuff = _boothlocation:WaitForChild("BoothUI", 5)
	if not boothUiStuff then
		return
	end
	for i,v in next, boothUiStuff:GetDescendants() do
		if v:IsA('TextLabel') then
			for _i, text in flaggedTexts do
				if string.find(v.Text:lower(),text) and not v:GetAttribute('flaggedtext') then
					flaggedTextCount += 1
					v:SetAttribute('flaggedtext',true)
				end
			end
		end
	end
	if flaggedTextCount > 6 then
		serverHop()
	end
end

local easterlol = {
	Color3.fromRGB(200, 180, 255),
	Color3.fromRGB(180, 255, 200),
	Color3.fromRGB(255, 180, 200),
}

local easterclr = easterlol[math.random(1,#easterlol)]

local Window = library:AddWindow("🐈meeeowww @szze .gg/yrQbdfhuqd",
  {
	main_color = easterclr,
	min_size = Vector2.new(560, 563),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
})

local boothTab = Window:AddTab("Booth")
local mainTab = Window:AddTab("Main")
local chatTab = Window:AddTab("Chat")
local webhookTab = Window:AddTab("Webhook")
local serverHopTab = Window:AddTab("Server")
local otherTab2 = Window:AddTab("AR")
local supportTab = Window:AddTab("Support")
local TextService = cloneref(game:GetService("TextService"))
local sgoalR = 0

--Booth Settings
local textUpdateToggle = boothTab:AddSwitch("Text Update", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.textUpdateToggle = bool
	saveSettings()
	if bool then
		updateBoothText()
	end
end)

textUpdateToggle:Set(getgenv().settings.textUpdateToggle)
local textUpdateDelay = boothTab:AddTextBox("Text Update Delay (S)", function(text)
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.textUpdateDelay = tonumber(text)
	saveSettings()
end,
  {
	["clear"] = false
})

textUpdateDelay.Text = 'Text Update Delay: ' .. getgenv().settings.textUpdateDelay .. 'S'

local hexBox = boothTab:AddTextBox("Hex Codes Only", function(text)
	if settingsLock then
		return
	end
	text = text:gsub('Text Color Hex: ','')
	local success = pcall(function()
		return Color3.fromHex(text)
	end)
	if success and string.find(text, "#") then
		getgenv().settings.hexBox = text
		saveSettings()
		updateBoothText()
	end
end,
  {
	["clear"] = false
})
hexBox.Text = 'Text Color Hex: ' .. getgenv().settings.hexBox

local goalBox = boothTab:AddTextBox("Numbers Only", function(text)
	text = text:gsub('Robux Goal: ','')
	if tonumber(text) then
		getgenv().settings.goalBox = tonumber(text)
		saveSettings()
	end
end,
  {
	["clear"] = false
})
goalBox.Text = 'Robux Goal: ' .. getgenv().settings.goalBox
boothTab:AddLabel("Custom Booth Text:")
local customBoothText = boothTab:AddConsole({
	["y"] = 50,
	["source"] = "",
})

boothTab:AddLabel('$C = current | $G = goal | $JPR = jumps per robux')

local fontDropdown = boothTab:AddDropdown("Font: [ " .. getgenv().settings.fontFace .. " ]", function(t)
	if settingsLock then
	     return
	end
	getgenv().settings.fontFace = t
	saveSettings()
	updateBoothText()
end)

for i, v in next, fonts do
	fontDropdown:Add(v)
end

customBoothText:Set(getgenv().settings.customBoothText)

boothTab:AddButton("Update", function()
	if #customBoothText:Get() > 221 then
		customBoothText:Set("Character limit reached")
		return warn('CHARACTER LIMIT REACHED')
	end
	if settingsLock then
		return
	end
	if customBoothText:Get() then
		getgenv().settings.customBoothText = customBoothText:Get()
		saveSettings()
		updateBoothText()
	end
end)

local standingPos = boothTab:AddDropdown("Standing Position: [ " .. getgenv().settings.standingPosition .. " ]", function(t)
	getgenv().settings.standingPosition = t
	saveSettings()
	if t == "Front" then
		getgenv().settings.boothPosition = 3
	elseif t == "Left" then
		getgenv().settings.boothPosition = -6
	elseif t == "Right" then
		getgenv().settings.boothPosition = 6
	else
		getgenv().settings.boothPosition = -5.5
	end
end)

standingPos:Add('Front')
standingPos:Add('Left')
standingPos:Add('Right')
standingPos:Add('Behind')

--Chat Settings
local autoThanks = chatTab:AddSwitch("Auto Thank You", function(bool)
	getgenv().settings.autoThanks = bool
	saveSettings()
end)
autoThanks:Set(getgenv().settings.autoThanks)
local autoBeg = chatTab:AddSwitch("Auto Beg", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.autoBeg = bool
	saveSettings()
	if bool then
		spamming = task.spawn(begging)
	else
		task.cancel(spamming)
	end
end)
autoBeg:Set(getgenv().settings.autoBeg)

local thanksDelay = chatTab:AddTextBox("Thanks Delay (S)", function(text)
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.thanksDelay = tonumber(text)
	saveSettings()
end,
  {
	["clear"] = false
})

thanksDelay.Text = 'Thanks Delay: ' .. getgenv().settings.thanksDelay .. 'S'

local begDelay = chatTab:AddTextBox("Begging Delay (S)", function(text)
	text = text:gsub('S',''):gsub('s',''):gsub(' ','')
	print(text)
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.begDelay = tonumber(text)
	saveSettings()
        if getgenv().settings.autoBeg then
               pcall(task.cancel, spamming)
               spamming = nil
               spamming = task.spawn(begging)
        end
end,
  {
	["clear"] = false
})

begDelay.Text = 'Beg Delay: ' .. getgenv().settings.begDelay .. 'S'

local tym = chatTab:AddFolder("Thank You Messages:")
local thanksMessage = tym:AddConsole({
	["y"] = 170,
	["source"] = "",
})
local full = ''
for i, v in ipairs(getgenv().settings.thanksMessage) do
	full = full .. v .. "\n"
end
thanksMessage:Set(full)
tym:AddButton("Save", function()
	local split = {}
	for newline in string.gmatch(thanksMessage:Get(), "[^\n]+") do
		table.insert(split, newline)
	end
	getgenv().settings.thanksMessage = split
	saveSettings()
end)
local bm = chatTab:AddFolder("Begging Messages:")
local begMessage = bm:AddConsole({
	["y"] = 170,
	["source"] = "",
})
local bfull = ''
for i, v in ipairs(getgenv().settings.begMessage) do
	bfull = bfull .. v .. "\n"
end
begMessage:Set(bfull)
bm:AddButton("Save", function()
	local bsplit = {}
	for newline in string.gmatch(begMessage:Get(), "[^\n]+") do
		table.insert(bsplit, newline)
	end
	getgenv().settings.begMessage = bsplit
	saveSettings()
end)
  
  
  --Webhook Settings
local webhookToggle = webhookTab:AddSwitch("Discord Webhook Notifications", function(bool)
	getgenv().settings.webhookToggle = bool
	saveSettings()
end)
webhookToggle:Set(getgenv().settings.webhookToggle)

local serverHopDonation = webhookTab:AddSwitch("Notification after serverhop", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.webhookAfterSH = bool
	saveSettings()
end)

local PingEveryoneHighDono = webhookTab:AddSwitch("Ping Everyone Above Min Donation", function(bool)
	if settingsLock then
		return 
	end 
	getgenv().settings.pingEveryone = bool
	saveSettings()
end)
PingEveryoneHighDono:Set(getgenv().settings.pingEveryone)
serverHopDonation:Set(getgenv().settings.webhookAfterSH)

local webhookBox = webhookTab:AddTextBox("Webhook URL", function(text)
	if string.find(text, "api/") then
		getgenv().settings.webhookBox = text;
		saveSettings()
	end
end,
  {
	["clear"] = false
})
webhookBox.Text = getgenv().settings.webhookBox
webhookTab:AddLabel('Press Enter to Save')


local TB = webhookTab:AddTextBox("Minimum ping dono amount", function(text)
	local x = text:gsub('Minimum ping dono amount: ', '')
	if tonumber(x) then
		getgenv().settings.pingAboveDono = tonumber(x);
		saveSettings()
	end
end,
	{
	["clear"] = false
})
TB.Text = 'Minimum ping dono amount: ' .. getgenv().settings.pingAboveDono

webhookTab:AddButton("Test Webhook", function()
	if getgenv().settings.webhookBox:gsub(" ","") ~= "" then
		oldWebhook("Webhook works!")
	end
end)

 -- looks better

local webhookType = webhookTab:AddDropdown("Webhook Type: [ " .. getgenv().settings.webhookType .. " ]", function(t)
	if t == 'New' then
		getgenv().settings.webhookType = 'New'
	else
		getgenv().settings.webhookType = 'Old'
	end
	saveSettings()
end)
  
webhookType:Add('New')
webhookType:Add('Old')

local serverHopToggle = serverHopTab:AddSwitch("Auto Server Hop", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.serverHopToggle = bool
	hopSet()
	saveSettings()
end)

serverHopToggle:Set(getgenv().settings.serverHopToggle)

if vcEnabled then
	local vcToggle = serverHopTab:AddSwitch("Voice Chat Servers", function(bool)
		if settingsLock then
			return
		end
		getgenv().settings.vcServer = bool
		saveSettings()
	end)
	vcToggle:Set(getgenv().settings.vcServer)
end

if vcEnabled then
	local alhop = serverHopTab:AddSwitch("Random between normal/voice", function(bool)
		if settingsLock then
			return
		end
		getgenv().settings.AlternativeHop = bool
		saveSettings()
	end)
	alhop:Set(getgenv().settings.AlternativeHop)
end

local sHopSwitch = serverHopTab:AddSwitch('Server Hop after donation', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.serverHopAfterDonation = bool
	saveSettings()
end)

sHopSwitch:Set(getgenv().settings.serverHopAfterDonation)

local friendHopSwitch = serverHopTab:AddSwitch('Server Hop if friend joined',function(bool)
	if settingsLock then
		return 
	end
	getgenv().settings.friendHop = bool
	saveSettings()
end)

friendHopSwitch:Set(getgenv().settings.friendHop)

local gSHSwitch = serverHopTab:AddSwitch('Server Hop if Server Hop goal reached', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.goalServerhopSwitch = bool
	saveSettings()
end)

gSHSwitch:Set(getgenv().settings.goalServerhopSwitch)

local antiBotSwitch = serverHopTab:AddSwitch('[BETA] Anti Bot Servers', function(bool)
	getgenv().settings.antiBotServers = bool
	saveSettings()
	task.spawn(checkForBots)
end)

antiBotSwitch:Set(getgenv().settings.antiBotServers)

serverHopTab:AddLabel("*[BETA] > will server hop if there's a lot of bot-like booth texts [over 6]")

serverHopTab:AddButton("Server Hop", function()
	serverHop()
end)

local serverHopMinAmount = serverHopTab:AddTextBox("Minimum donated amount", function(text)
	getgenv().settings.minimumDonated = tonumber(text) or 0
	saveSettings()
end,
  {
	["clear"] = false
})
serverHopMinAmount.Text = 'Minimum donated: ' .. getgenv().settings.minimumDonated

local gSHAmount = serverHopTab:AddTextBox("Serverhop goal", function(text)
	getgenv().settings.goalServerhopGoal = tonumber(text) or 0
	saveSettings()
end,
  {
	["clear"] = false
})
gSHAmount.Text = 'ServerHop goal: ' .. getgenv().settings.goalServerhopGoal

local serverHopDelaySL = serverHopTab:AddTextBox("Serverhop Delay (Minutes)", function(text)
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.serverHopDelay = tonumber(text)
	hopSet()
end,
  {
	["clear"] = false
})

serverHopDelaySL.Text = 'ServerHop Delay: ' .. getgenv().settings.serverHopDelay .. 'M'
serverHopTab:AddLabel("Server hop timer resets after donation")

  --Other tab
local danceDropdown = mainTab:AddDropdown("Dance: [ " .. getgenv().settings.danceChoice .. " ]", function(object)
	if settingsLock then
		return
	end
	getgenv().settings.danceChoice = object
	saveSettings()
	if object == "Disabled" then
		Players:Chat("/e wave")
	elseif object == "1" then
		Players:Chat("/e dance")
	else
		Players:Chat("/e dance" .. object)
	end
end)

danceDropdown:Add("Disabled")
danceDropdown:Add("1")
danceDropdown:Add("2")
danceDropdown:Add("3")
local render = mainTab:AddSwitch("Disable Rendering", function(bool)
	getgenv().settings.render = bool
	saveSettings()
	if bool then
		cloneref(game:GetService("RunService")):Set3dRenderingEnabled(false)
	else
		cloneref(game:GetService("RunService")):Set3dRenderingEnabled(true)
	end
end)
render:Set(getgenv().settings.render)

local anonymousMode = mainTab:AddSwitch("Anonymous Mode", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.AnonymousMode = bool
	saveSettings()
	Remotes.Event('SetAnonymousLive'):FireServer(bool)
end)

anonymousMode:Set(getgenv().settings.AnonymousMode)

if getgenv().settings.AnonymousMode then
	task.delay(5,function()
		Remotes.Event('SetAnonymousLive'):FireServer(true)
	end)
end

local jumpswitch = mainTab:AddSwitch("Donation Jump", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.donationJump = bool
	saveSettings()
end)
jumpswitch:Set(getgenv().settings.donationJump)

local _HLTOGGLE = mainTab:AddSwitch('Sing a donator\'s choice song on donation', function(bool)
	getgenv().settings.highlightSwitch = bool
	pcall(function()
	     if bool then
		    _HIGHLIGHTLOADER.HLSetup(Players.LocalPlayer.Character)
	     else
	        _HIGHLIGHTLOADER.HLUnload(Players.LocalPlayer.Character)
	     end
	end)
end)

_HLTOGGLE:Set(getgenv().settings.highlightSwitch)

local autoReply = otherTab2:AddSwitch("Auto Reply [AR]", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.autoNearReply = bool
	saveSettings()
end)
autoReply:Set(getgenv().settings.autoNearReply)

local noRespond = otherTab2:AddSwitch("[AR] Skip Unrecognized Messages", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.autoReplyNoRespond = bool
	saveSettings()
end)

noRespond:Set(getgenv().settings.autoReplyNoRespond)

--[[task.spawn(function()
	while task.wait(1) do
		for i, v in next, Players:GetPlayers() do
			playerChecker(v)
			task.wait()
		end
	end
end)]] 

local bclaimed = false

local spinToggle = mainTab:AddSwitch('Spin [1R$ = +1 speed]', function(bool)
	getgenv().settings.spinSet = bool
	if getgenv().settings.spinSet then
		local root = Players.LocalPlayer.Character.Humanoid.RootPart
		local Spin = Instance.new("BodyAngularVelocity")
		Spin.Name = "Spin"
		Spin.Parent = root
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Spin.AngularVelocity = Vector3.new(0, 0.25 * settings.spinSpeedMultiplier, 0)
		task.spawn(function()
                    repeat task.wait() until bclaimed
		    local sppos = root.Position
		    while task.wait() do
                        if not getgenv().settings.spinSet then break end
			if (root.Position - sppos).Magnitude > 12 or (root.Position - sppos).Magnitude < -12 then
			    root.CFrame = CFrame.new(sppos - Vector3.new(0,0.1,0))
			end
		    end
		end)
	elseif not getgenv().settings.spinSet and Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin') then
		Players.LocalPlayer.Character.Humanoid.RootPart.Spin:Destroy()
	end
	saveSettings()
end)
	
local jumpSwitcher = mainTab:AddSwitch('1R$ = +1 jump power', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.jumpBoost = bool
	saveSettings()
end)

jumpSwitcher:Set(getgenv().settings.jumpBoost)
	
local gravityToggle = mainTab:AddSwitch('Gravity [1R$ = -1 gravity]', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.gravitySwitch = bool
	saveSettings()
end)

gravityToggle:Set(getgenv().settings.gravitySwitch)

local heliToggle = mainTab:AddSwitch('Helicopter On-Donation', function(bool)
	getgenv().settings.helicopterEnabled = bool
	local character = Players.LocalPlayer.Character
	local root = character:FindFirstChildOfClass('Humanoid').RootPart
	if not bool then
		root['HL1__HELI']:Destroy()
		workspace['_HIGHLIGHT.CF']:Destroy()
	else
		local Spin = Instance.new("BodyAngularVelocity")
		Spin.Name = "HL1__HELI"
		Spin.Parent = root
		Spin.MaxTorque = Vector3.new(0, math.huge , 0)
		Spin.AngularVelocity = Vector3.new(0, 1, 0)
		local __PART = Instance.new('Part', workspace)
		__PART.Name = '_HIGHLIGHT.CF'
		__PART.Size = Vector3.new(20,2,20)
		__PART.Anchored = true
		__PART.CFrame = CFrame.new(root.Position - Vector3.new(0, 3, 0))
	end
	saveSettings()
end)

local lapToggle = mainTab:AddSwitch('1R$ = 1 lap across the map', function(bool)
    if settingsLock then
        return
    end
    getgenv().settings.robuxLap = bool
    saveSettings()
end)

lapToggle:Set(getgenv().settings.robuxLap)
heliToggle:Set(getgenv().settings.helicopterEnabled)
mainTab:AddLabel("-----------------------")

local jumpsPerRB = mainTab:AddTextBox("Jumps Per Robux", function(text)
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.jumpsPerRobux = tonumber(text)
	saveSettings()
end,
  {
	["clear"] = false
})

jumpsPerRB.Text = 'Jumps Per Robux: ' .. getgenv().settings.jumpsPerRobux

local spinMultiplier = mainTab:AddTextBox("Spin Speed Multiplier", function(text)
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.spinSpeedMultiplier = tonumber(text)
	saveSettings()
end,
  {
	["clear"] = false
})

spinMultiplier.Text = 'Spin Speed Multiplier: ' .. getgenv().settings.spinSpeedMultiplier
spinToggle:Set(getgenv().settings.spinSet)

if setfpscap and type(setfpscap) == "function" then
	local fpsLimit = mainTab:AddTextBox("FPS Limit", function(text)
	if not tonumber(text) or tonumber(text) < 5 then
		return
	end
	getgenv().settings.fpsLimit = tonumber(text)
	saveSettings()
        end,
     {
	["clear"] = false
     })
     fpsLimit.Text = 'FPS Limit: ' .. getgenv().settings.fpsLimit
     setfpscap(getgenv().settings.fpsLimit)
end

mainTab:AddButton("Test Donation", function()
	Players.LocalPlayer.leaderstats.Raised.Value += 6
end)

--otherTab2

otherTab2:AddLabel("Auto Near Replies")
otherTab2:AddLabel("Responces to something similar to 'Hello'")
local HelloResponce = otherTab2:AddConsole({
	["y"] = 45,
	["source"] = "",
})
local hfull = ''
for i, v in ipairs(getgenv().settings.helloResponce) do
	hfull = hfull .. v .. "\n"
end
HelloResponce:Set(hfull)
otherTab2:AddLabel("Responces to something similar to 'You are a bot'")
local BotResponce = otherTab2:AddConsole({
	["y"] = 40,
	["source"] = "",
})
otherTab2:AddLabel("Responces to something similar to 'pls donate'")
local hfull = ''
for i, v in ipairs(getgenv().settings.botResponce) do
	hfull = hfull .. v .. "\n"
end
BotResponce:Set(hfull)
local DonateResponce = otherTab2:AddConsole({
	["y"] = 45,
	["source"] = "",
})
local hfull = ''
for i, v in ipairs(getgenv().settings.donateResponce) do
	hfull = hfull .. v .. "\n"
end
DonateResponce:Set(hfull)
otherTab2:AddLabel("Responces to something similar to 'you are a scammer'")
local ScamResponce = otherTab2:AddConsole({
	["y"] = 45,
	["source"] = "",
})
local hfull = ''
for i, v in ipairs(getgenv().settings.scamResponce) do
	hfull = hfull .. v .. "\n"
end
ScamResponce:Set(hfull)
otherTab2:AddLabel("Other Responses:")
local OtherResponce = otherTab2:AddConsole({
	["y"] = 45,
	["source"] = "",
})
local hfull = ''
for i, v in ipairs(getgenv().settings.otherResponce) do
	hfull = hfull .. v .. "\n"
end
OtherResponce:Set(hfull)
otherTab2:AddButton("Save Replies", function()
	local rsplit = {}
	for newline in string.gmatch(HelloResponce:Get(), "[^\n]+") do
		table.insert(rsplit, newline)
	end
	getgenv().settings.helloResponce = rsplit
	local rsplit = {}
	for newline in string.gmatch(BotResponce:Get(), "[^\n]+") do
		table.insert(rsplit, newline)
	end
	getgenv().settings.botResponce = rsplit
	local rsplit = {}
	for newline in string.gmatch(DonateResponce:Get(), "[^\n]+") do
		table.insert(rsplit, newline)
	end
	getgenv().settings.donateResponce = rsplit
	local rsplit = {}
	for newline in string.gmatch(OtherResponce:Get(), "[^\n]+") do
		table.insert(rsplit, newline)
	end
	getgenv().settings.otherResponce = rsplit
	local rsplit = {}
	for newline in string.gmatch(ScamResponce:Get(), "[^\n]+") do
		table.insert(rsplit, newline)
	end
	getgenv().settings.scamResponce = rsplit
	saveSettings()
end)

supportTab:AddLabel("Hello. This script is free but I won't resist")
supportTab:AddLabel("from some robux :3")
supportTab:AddLabel("If you want to donate me, click here: ")
supportTab:AddButton('Teleport', function()
	TPService:Teleport(13461969417)
end)
supportTab:AddLabel('You can also send me a message there for free!')

boothTab:Show()
library:FormatWindows()
settingsLock = false
  --Finds unclaimed booths
local function findUnclaimed()
    unclaimed = {}
    local boothUI      = _boothlocation:WaitForChild("BoothUI")
    local interactions = workspace:WaitForChild("BoothInteractions")
    local mainPos2D    = Vector3.new(mainCheckPosition.X, 0, mainCheckPosition.Z)

    for _, uiFrame in ipairs(boothUI:GetChildren()) do
        if uiFrame.Details.Owner.Text == "unclaimed" then
            local boothNum = tonumber(uiFrame.Name:match("%d+"))
            if boothNum then
                for _, interact in ipairs(interactions:GetChildren()) do
                    if interact:GetAttribute("BoothSlot") == boothNum then
                        local pos2D = Vector3.new(interact.Position.X, 0, interact.Position.Z)
                        if (pos2D - mainPos2D).Magnitude < 92 then
                            table.insert(unclaimed, boothNum)
                            break  -- stop scanning interactions once we found it
                        end
                    end
                end
            end
        end
    end
end

if not pcall(findUnclaimed) then
	serverHop()
end

local claimCount = #unclaimed
if not unclaimed[2] then
   serverHop()
   return
end

  --Claim booth function
local function boothclaim()
	Remotes.Event("ClaimBooth"):InvokeServer(unclaimed[2])
	if not string.find(_boothlocation.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[2])).Details.Owner.Text, Players.LocalPlayer.DisplayName) then
		task.wait(1)
		if not string.find(_boothlocation.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[2])).Details.Owner.Text, Players.LocalPlayer.DisplayName) then
			error()
		end
	end
end
  --Checks if booth claim fails
while not pcall(boothclaim) do
	if errCount >= claimCount then
		serverHop()
	end
	table.remove(unclaimed, 1)
	errCount = errCount + 1
end
hopSet()
getgenv().walkToBooth = function()
	local theCframe
	if string.find(tostring(getgenv().settings.boothPosition), "6") then
		theCframe = CFrame.new(getgenv().settings.boothPosition, 0, 0)
	else
		theCframe = CFrame.new(0, 0, getgenv().settings.boothPosition)
	end
	local boothPos, mainPosX
	for i, v in ipairs(workspace.BoothInteractions:GetChildren()) do
		if v:GetAttribute("BoothSlot") == unclaimed[2] then
			print((v.Position - mainCheckPosition).Magnitude)
			mainPosX = v.CFrame
			boothPos = v.CFrame * theCframe
			Players.LocalPlayer.Character.HumanoidRootPart.CFrame = mainPosX
			break
		end
	end
	Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
	local atBooth = false
	if workspace.Map.Decoration:FindFirstChild('Benches') then
		workspace.Map.Decoration.Benches:Destroy()		
	end
	Players.LocalPlayer.Character.Humanoid:MoveTo(boothPos.Position)
	Players.LocalPlayer.Character.Humanoid.MoveToFinished:Connect(function(reached)
		atBooth = true
	end)
	local atboothtick = 0
	repeat
		task.wait()
		atboothtick += 1
		if atboothtick > 999 then
			break
		end
	until atBooth
	Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = CFrame.new(boothPos.Position)
	Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(40, 14, 101)))
	task.wait(0.6)
	Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	Players:Chat('/e dance' .. getgenv().settings.danceChoice)
	bclaimed = true
end

walkToBooth()
if getgenv().settings.autoBeg then
	spamming = task.spawn(begging)
end

local RaisedC = Players.LocalPlayer.leaderstats.Raised.value
local djset = false
local helidebounce = false
local lapdebounce = false
Players.LocalPlayer.leaderstats.Raised.Changed:Connect(function()
	local playerWhoDonated
	sgoalR = sgoalR + (Players.LocalPlayer.leaderstats.Raised.Value - RaisedC)
    local raisedValue = Players.LocalPlayer.leaderstats.Raised.Value
    local raised = raisedValue - RaisedC
	hopSet()
	if Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').RootPart:FindFirstChild('Spin') and getgenv().settings.spinSet then
		local humanoid = Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
		local spinPart = humanoid.RootPart:FindFirstChild('Spin')
		local sSM = getgenv().settings.spinSpeedMultiplier
		local deltaRaised = raised
		local averageDelta = deltaRaised / 3
		local spinYVelocity = spinPart.AngularVelocity.Y
		xspin = (averageDelta * sSM) + spinYVelocity
	end
	if getgenv().settings.webhookToggle == true and getgenv().settings.webhookBox then
		task.spawn(function()
			playerWhoDonated = fetchNearPlr()
			if playerWhoDonated then
				if getgenv().settings.webhookType == 'New' then
					pcall(function()
						webhook(raised, playerWhoDonated.Name)
					end)
				else
					pcall(function()
						oldWebhook(Players.LocalPlayer.Name .. ' | Donation amount: ' .. tostring(raised) .. ' | [A/T]: ' .. tostring(math.floor((raised) * 0.6)) .. ' | Total: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value) .. ' | Donor: ' .. playerWhoDonated.Name)
					end)
				end
			else
				if getgenv().settings.webhookType == 'New' then
					pcall(function()
						webhook(raised, "Hi, I'm Crazyblox.")
					end)
				else
					pcall(function()
						oldWebhook(Players.LocalPlayer.Name .. ' | Donation amount: ' .. tostring(raised) .. ' | [A/T]: ' .. tostring(math.floor((raised) * 0.6)) .. ' | Total: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value))
					end)
				end
			end
		end)
	end
	if getgenv().settings.serverHopAfterDonation == true then
		task.spawn(serverHop)
	end
	if Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin') and getgenv().settings.spinSet == true and not getgenv().settings.highlightSwitch then
		local spin = Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin')
		spin.AngularVelocity = Vector3.new(0, xspin, 0)
	end
	if getgenv().settings.jumpBoost and not getgenv().settings.highlightSwitch then
		pcall(function()
			Players.LocalPlayer.Character.Humanoid.JumpPower = Players.LocalPlayer.Character.Humanoid.JumpPower + (raised)
		end)		
	end
	pcall(function()
		if getgenv().settings.gravitySwitch and not getgenv().settings.highlightSwitch then
			workspace.Gravity = workspace.Gravity - (raised)
		end
	end)
	task.spawn(function()
		if getgenv().settings.helicopterEnabled and not getgenv().settings.highlightSwitch then
			if helidebounce then
				return
			end
			helidebounce = true
			local char = Players.LocalPlayer.Character
			workspace['_HIGHLIGHT.CF'].CFrame = CFrame.new(char.Humanoid.RootPart.Position - Vector3.new(0, 3, 0))
			chat('Enabling engines...')
			Players:Chat('/e dance2')
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
			local _TWN2 = twn(workspace['_HIGHLIGHT.CF'], TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				CFrame = CFrame.new(C_OLDPOS + Vector3.new(0, raised * 5, 0))
			})
			local _TWN3 = twn(workspace['_HIGHLIGHT.CF'], TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
				CFrame = CFrame.new(C_OLDPOS)
			})
			local _TWN4 = twn(char.Humanoid.RootPart.HL1__HELI, TweenInfo.new(6, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				AngularVelocity = Vector3.new(0, 1, 0)
			})    
			_TWN2:Play()
			task.wait(10)
			_TWN3:Play()
			_TWN4:Play()
			helidebounce = false
			Players:Chat('/e wave')
		end
	end)
	if getgenv().settings.donationJump == true and not getgenv().settings.spinSet == true and not getgenv().settings.highlightSwitch then
		djset = true
		task.spawn(function()
			if getgenv().settings.jumpsPerRobux == 1 then
				for i = 1, raised do
					Players.LocalPlayer.Character.Humanoid:ChangeState('Jumping')
					repeat
						task.wait()
					until Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Running
				end
			else
				for i = 1, (Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) * getgenv().settings.jumpsPerRobux do
					Players.LocalPlayer.Character.Humanoid:ChangeState('Jumping')
					repeat
						task.wait()
					until Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Running
				end
			end
			djset = false
		end)
	end
    if getgenv().settings.robuxLap then
		if lapdebounce then
			return
		end
        lapdebounce = true
        task.spawn(function()
            twn(Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RootPart,TweenInfo.new(5,Enum.EasingStyle.Linear,Enum.EasingDirection.In),{CFrame = CFrame.new(166.584, 3.47699, 371.398)}):Play()
            Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').WalkSpeed = 50
            task.wait(6)
            for _i = 1, raised do
                for i,v in next, _CFRAMETABLE do
                    local con
                    local _mtfinish
                    Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):MoveTo(Vector3.new(unpack(v)))
                    con = Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').MoveToFinished:Connect(function()
                        _mtfinish = true
                        con:Disconnect()
                    end)
                    repeat task.wait() until _mtfinish == true
                end 
            end
            task.wait(1)
            getgenv().walkToBooth()
            lapdebounce = false
        end)
    end
	if getgenv().settings.highlightSwitch then
		task.spawn(function()
			_HIGHLIGHTLOADER.HLStart(Players.LocalPlayer.Character, Players.LocalPlayer.leaderstats.Raised.Value - RaisedC, (playerWhoDonated and playerWhoDonated or fetchNearPlr() or nil))
		end)
	end
	RaisedC = Players.LocalPlayer.leaderstats.Raised.value
	if getgenv().settings.autoThanks == true then
		task.spawn(function()
			task.wait(getgenv().settings.thanksDelay)
			chat(getgenv().settings.thanksMessage[math.random(#getgenv().settings.thanksMessage)])
		end)
	end
	task.spawn(function()
		repeat
			task.wait()
		until djset == false
		task.wait(0.5)
		local object = getgenv().settings.danceChoice
		if object == "Disabled" then
			Players:Chat("/e wave")
		elseif object == "1" then
			Players:Chat("/e dance")
		else
			Players:Chat("/e dance" .. object)
		end
	end)
	if getgenv().settings.goalServerhopSwitch and sgoalR >= getgenv().settings.goalServerhopGoal then
		serverHop()
	end
	task.wait(getgenv().settings.textUpdateDelay)
	updateBoothText()
end)
updateBoothText()

task.spawn(function()
	raisedV = 0
	task.wait(5)
	Players.LocalPlayer.CharacterRemoving:Connect(function()
		if getgenv().settings.spinSet and not getgenv().settings.highlightSwitch then
			serverHop()
		end
	end)
	for i, v in next, Players:GetPlayers() do
		if v:FindFirstChild('leaderstats') and v ~= Players.LocalPlayer then
			if raisedV ~= nil then
				if v.leaderstats.Raised.Value > raisedV then
					raisedV = v.leaderstats.Raised.Value
				end
			else
				raisedV = v.leaderstats.Raised.Value
			end
		end
	end
	if raisedV < getgenv().settings.minimumDonated then
		serverHop()
	end
end)

task.spawn(function()
	while task.wait(5) do
		if (Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RootPart) then
			local root = Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RootPart
			if (root.Position - positionX).Magnitude > 1100 or (root.Position - positionX).Magnitude < -1100 then
				serverHop()
			end
		end
	end
end)

if getgenv().settings.webhookAfterSH then
	if Players.LocalPlayer.DisplayName ~= Players.LocalPlayer.Name then
		oldWebhook(Players.LocalPlayer.DisplayName .. ' (@' .. Players.LocalPlayer.Name .. ') serverhopped')
	else
		oldWebhook('@' .. Players.LocalPlayer.Name .. ' serverhopped')
	end
end

local messagesToResp = {
	['Greetings'] = {
		'hi',
		'hello',
		'hey',
		'sup',
		'yo',
		'howdy',
		'sup bro',
		'sup dude',
		'hai',
		'hii',
		'hey man',
		'hiya',
		'heyy',
		'hello man',
		'hello dude',
		'hi bro',
		'hi sup',
		'hiey',
		'👋',
		'hey hello',
		'sup hi'
	},
}

Players.PlayerChatted:Connect(function(_____________________, player, message)
	local speaker = tostring(player)
	local message = string.lower(message)
	task.wait(2.1 + math.random())
	local plrChatted = Players:FindFirstChild(speaker)
	if (plrChatted and plrChatted == Players.LocalPlayer) or getgenv().settings.autoNearReply == false or not plrChatted  or string.find(message, 'donates') or string.find(message, "spamming") then
		return
	end
	if plrChatted:GetAttribute('respcd') then
		return
	end
	pcall(function()
		plrChatted:SetAttribute('respcd',true)
		local chatChar = plrChatted.Character
		if (plrChatted.Character and plrChatted.Character.Humanoid.RootPart) then
			local root = chatChar.Humanoid.RootPart
			if (root.Position - Players.LocalPlayer.Character.Humanoid.RootPart.Position).Magnitude < 11 then
				if table.find(messagesToResp.Greetings,message) then
					chat(getgenv().settings.helloResponce[math.random(1, #getgenv().settings.helloResponce)])
				elseif string.find(message, 'bot') then
					mchat(getgenv().settings.botResponce[math.random(1, #getgenv().settings.botResponce)])
				elseif string.find(message, 'donate') then
					chat(getgenv().settings.donateResponce[math.random(1, #getgenv().settings.donateResponce)])
				elseif string.find(message, 'scam') then
					chat(getgenv().settings.scamResponce[math.random(1, #getgenv().settings.scamResponce)])
				else
				        if not getgenv().autoReplyNoRespond then
					       chat(getgenv().settings.otherResponce[math.random(1, #getgenv().settings.otherResponce)])
					end
				end
			end
		end
		task.wait(math.random(12,18))
		plrChatted:SetAttribute('respcd',false)
	end)
end)

Players.PlayerAdded:Connect(function(player)
	if getgenv().settings.friendHop and player:IsFriendsWith(uid) then
	        Players.LocalPlayer:Kick('friend joined - rejoining')
		serverHop()
	end
end)

for i,player in next, Players:GetPlayers() do
	if getgenv().settings.friendHop and player:IsFriendsWith(uid) then
	        Players.LocalPlayer:Kick('friend is in - rejoining')
		serverHop()
	end
end

while task.wait(getgenv().settings.serverHopDelay * 60) do
	if not hopTimer then
		hopSet()
	end
end

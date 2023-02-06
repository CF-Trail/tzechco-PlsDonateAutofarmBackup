--[[
	This property is protected.
	You are not allowed to claim this as your own.
	Removal of initial credits to the authors is prohibited.
]]

if hookmetamethod and typeof(hookmetamethod) == 'function' then
	local oldHook
	oldHook = hookmetamethod(game, "__namecall", function(self, ...)
		if getnamecallmethod() == "Kick" then
			return warn('haha bypassed')
		end
		return oldHook(self, ...)
	end)
end

if hookmetamethod and typeof(hookmetamethod) == 'function' then
	local oldHookS
	oldHookS = hookmetamethod(game, "__namecall", function(self, ...)
		if getnamecallmethod() == "IsVoiceEnabledForUserIdAsync" then
			return true
		end
		return oldHookS(self, ...)
	end)
end

repeat
	task.wait()
until game:IsLoaded()

if isfile and writefile and typeof(isfile) == 'function' and typeof(writefile) == 'function' then
	if not isfile('PromptedDiscordCFCommunityPD.txt') then
		writefile('PromptedDiscordCFCommunityPD.txt', game:GetService('HttpService'):JSONEncode('hi'))
		local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()
		Module.Prompt({
			invite = "https://discord.gg/fNeggqVMZs",
			name = "CF Community",
		})
	end
end

  --Stops script if on a different game
if game.PlaceId ~= 8737602449 and game.PlaceId ~= 8943844393 then
	return
end

local xspin = 0
local nx = 0
local RainbowTextActivated = false

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

local RainbowHexColors = {
	"#FF0000",
	"#FF7F00",
	"#FFFF00",
	"#00FF00",
	"#0000FF",
	"#4B0082",
	"#9400D3"
}
local BetterRainbowColorHex = {
	"#FF0000",
	"#FF1100",
	"#FF2300",
	"#FF3400",
	"#FF4600",
	"#FF5700",
	"#FF6900",
	"#FF7B00",
	"#FF8C00",
	"#FF9E00",
	"#FFAF00",
	"#FFC100",
	"#FFD200",
	"#FFE400",
	"#FFF500",
	"#F5FF00",
	"#E3FF00",
	"#D1FF00",
	"#BFFF00",
	"#ADFF00",
	"#9CFF00",
	"#8AFF00",
	"#78FF00",
	"#66FF00",
	"#54FF00",
	"#42FF00",
	"#31FF00",
	"#1FFF00",
	"#00FF0F",
	"#00FF21",
	"#00FF32",
	"#00FF44",
	"#00FF55",
	"#00FF67",
	"#00FF78",
	"#00FF8A",
	"#00FF9B",
	"#00FFAD",
	"#00FFBE",
	"#00FFD0",
	"#00FFE1",
	"#00FFF3",
	"#00F5FF",
	"#00E3FF",
	"#00D1FF",
	"#00BFFF",
	"#00ADFF",
	"#009CFF",
	"#008AFF",
	"#0078FF",
	"#0066FF",
	"#0054FF",
	"#0042FF",
	"#0031FF",
	"#001FFF",
	"#0000FF",
	"#0F00FF",
	"#2100FF",
	"#3200FF",
	"#4400FF",
	"#5500FF",
	"#6700FF",
	"#7800FF",
	"#8A00FF",
	"#9B00FF",
	"#AD00FF",
	"#BE00FF",
	"#D000FF",
	"#E100FF",
	"#F300FF",
	"#FF00F5",
	"#FF00E3",
	"#FF00D1",
	"#FF00BF",
	"#FF00AD",
	"#FF009C",
	"#FF008A",
	"#FF0078",
	"#FF0066",
	"#FF0054",
	"#FF0042",
	"#FF0031",
	"#FF001F"
}
print('TurningGlobe ily thanks for showcasing / szze#6220')
if getgenv().loadedRR then
	return
else
	getgenv().loadedRR = true
end
task.wait()
  --Anti-AFK
local Players = game:GetService("Players")
Players.LocalPlayer:Kick('unsupported executor')
local connections = getconnections or get_signal_cons or nil
task.spawn(function()
	if connections then
		for a, b in next, connections(game:GetService('Players').LocalPlayer.Idled) do
			b:Disable()
		end
	else
		local vu = game:GetService("VirtualUser")
		game:GetService("Players").LocalPlayer.Idled:Connect(function()
			vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
			wait(1)
			vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
		end)
	end
end)

local unclaimed = {}
local counter = 0
local donation, boothText, spamming, hopTimer, vcEnabled
local signPass = false
local errCount = 0
local booths = {
	["1"] = "72, 3, 36",
	["2"] = "83, 3, 161",
	["3"] = "11, 3, 36",
	["4"] = "100, 3, 59",
	["5"] = "72, 3, 166",
	["6"] = "2, 3, 42",
	["7"] = "-9, 3, 52",
	["8"] = "10, 3, 166",
	["9"] = "-17, 3, 60",
	["10"] = "35, 3, 173",
	["11"] = "24, 3, 170",
	["12"] = "48, 3, 29",
	["13"] = "24, 3, 33",
	["14"] = "101, 3, 142",
	["15"] = "-18, 3, 142",
	["16"] = "60, 3, 33",
	["17"] = "35, 3, 29",
	["18"] = "0, 3, 160",
	["19"] = "48, 3, 173",
	["20"] = "61, 3, 170",
	["21"] = "91, 3, 151",
	["22"] = "-24, 3, 72",
	["23"] = "-28, 3, 88",
	["24"] = "92, 3, 51",
	["25"] = "-28, 3, 112",
	["26"] = "-24, 3, 129",
	["27"] = "83, 3, 42",
	["28"] = "-8, 3, 151"
}
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = game:GetService('HttpService')
queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/old.lua'))()")
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/UI"))()
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
					game:GetService("TeleportService"):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
				end
		end
	end)
	game:GetService("TeleportService").TeleportInitFailed:Connect(function()
		game:GetService("TeleportService"):TeleportToPlaceInstance(gameId, servers[math.random(1, #servers)], Players.LocalPlayer)
	end)
end
local function claimGifts()
	pcall(function()
		Players.LocalPlayer:WaitForChild("PlayerGui")
		local guipath = Players.LocalPlayer.PlayerGui:WaitForChild("ScreenGui")
		firesignal(guipath.GiftAlert.Buttons.Close["Activated"])
		local count = require(game:GetService('ReplicatedStorage').Remotes).Event("UnclaimedDonationCount"):InvokeServer()
		while count == nil do
			task.wait(5)
			count = require(game:GetService('ReplicatedStorage').Remotes).Event("UnclaimedDonationCount"):InvokeServer()
		end
		if count then
			local ud = {}
			for i = 1, count do
				table.insert(ud, i)
			end
			if #ud > 0 then
				firesignal(guipath.Gift.Buttons.Inbox["Activated"])
				Players.LocalPlayer.ClaimDonation:InvokeServer(ud)
				task.wait(.5)
				firesignal(guipath.GiftInbox.Buttons.Close["Activated"])
				task.wait(.5)
				firesignal(guipath.Gift.Buttons.Close["Activated"])
			end
		end
	end)
end
task.spawn(claimGifts)
getgenv().settings = {}
  --Load Settings
if isfile("plsdonatesettings.txt") then
	local sl, er = pcall(function()
		getgenv().settings = game:GetService('HttpService'):JSONDecode(readfile('plsdonatesettings.txt'))
	end)
	if er ~= nil then
		task.spawn(function()
			errMsg = Instance.new("Hint")
			errMsg.Parent = game:GetService('CoreGui')
			errMsg.Text = tostring("COULDNT LOAD SETTINGS BECAUSE OF DUMBASS JSON ERROR, SERVERHOPPING")
			task.wait(15)
			errMsg:Destroy()
		end)
		task.wait(2)
		forceServerHop()
		return
	end
end
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
	"pingAboveDono"
}

local positionX = workspace:WaitForChild('Boomboxes'):WaitForChild('Spawn')

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
	"✅ 1 ROBUX DONATED = $D JUMP ✅",
	false,
	"your text here",
	"#ffffff",
	true,
	true,
	{
		"1R$ = 1 JUMP",
		"Jumping for donations!"
	},
	300,
	60,
	false,
	3,
	true,
	true,
	false,
	false,
	3,
	'Front',
	false,
	false,
	false,
	1,
	true,
	false,
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
	1000
}

if #getgenv().settings ~= sNames then
	for i, v in ipairs(sNames) do
		if getgenv().settings[v] == nil then
			getgenv().settings[v] = sValues[i]
		end
	end
	writefile('plsdonatesettings.txt', httpservice:JSONEncode(getgenv().settings))
end

local settingsLock = true
local function saveSettings()
	if settingsLock == false then
		print('Settings saved.')
		writefile('plsdonatesettings.txt', httpservice:JSONEncode(getgenv().settings))
	end
end
local AllIDs = {}
local foundAnything = ""
local actualHour = os.date("!*t").hour
local Deleted = false
local S_T = game:GetService("TeleportService")
local S_H = game:GetService("HttpService")
local RandomName = "PlsDonateServerHop-Temp"

local File = pcall(function()
	AllIDs = S_H:JSONDecode(readfile(RandomName..".json"))
end)
if not File then
	table.insert(AllIDs, actualHour)
	pcall(function()
		writefile(RandomName..".json", S_H:JSONEncode(AllIDs))
	end)

end
local function TPReturner(placeId)
	local Site;
	if foundAnything == "" then
		Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100'))
	else
		Site = S_H:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. placeId .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
	end
	local ID = ""
	if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
		foundAnything = Site.nextPageCursor
	end
	local num = 0;
	for i,v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) and tonumber(v.playing) >= 19  then
			for _,Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile(RandomName..".json")
							AllIDs = {}
							table.insert(AllIDs, actualHour)
						end)
					end
				end
				num = num + 1
			end
			if Possible == true then
				table.insert(AllIDs, ID)
				task.wait()
				pcall(function()
					writefile(RandomName..".json", S_H:JSONEncode(AllIDs))
					task.wait()
					S_T:TeleportToPlaceInstance(placeId, ID, game:GetService("Players").LocalPlayer)
				end)
				task.wait(4)
			end
		end
	end
end

function serverHop()
    local gameId
	gameId = 8737602449
	if vcEnabled and getgenv().settings.vcServer then
		gameId = 8943844393
	end
	if getgenv().settings.AlternativeHop then
		math.randomseed(tick())
		local random = math.random(0, 1)
		if random == 1 then
			gameId = 8943844393
		else
			gameId = 8737602449
		end
	end

	while task.wait() do
		pcall(function()
			TPReturner(gameId)
			if foundAnything ~= "" then
				TPReturner(gameId)
			end
		end)
	end
end

local function waitServerHop()
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
	if not getgenv().settings.staffHopA then
		return
	end
	pcall(function()
		if player:GetRankInGroup(12121240) >= 254 then
			serverHop()
		end
	end)
end

local function oldWebhook(msg)
	if getgenv().settings.webhookBox:gsub(' ', '') == '' then
		return
	end
	pcall(function()
		httprequest({
			Url = getgenv().settings.webhookBox,
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

function updateBoothText()
	local text
	local current = Players.LocalPlayer.leaderstats.Raised.Value
	local goal = current + tonumber(getgenv().settings.goalBox)
	if goal == 420 or goal == 425 then
		goal = goal + 10
	end
	if current == 420 or current == 425 then
		current = current + 10
	end
	if goal > 999 and goal < 10000 then
		if tonumber(getgenv().settings.goalBox) < 10 then
			goal = string.format("%.2fk", (current + 10) / 10 ^ 3)
		else
			goal = string.format("%.2fk", (goal) / 10 ^ 3)
		end
	elseif goal > 9999 then
		if tonumber(getgenv().settings.goalBox) < 10 then
			goal = string.format("%.1fk", (current + 10) / 10 ^ 3)
		else
			goal = string.format("%.1fk", (goal) / 10 ^ 3)
		end
	end
	if current > 999 and current < 10000 then
		current = string.format("%.2fk", current / 10 ^ 3)
	elseif current > 9999 then
		current = string.format("%.1fk", current / 10 ^ 3)
	end
	if getgenv().settings.textUpdateToggle and getgenv().settings.customBoothText then
		text = string.gsub(getgenv().settings.customBoothText, "$C", current)
		text = string.gsub (text, "$G", goal)
		text = string.gsub(text, '$D', tostring(getgenv().settings.jumpsPerRobux))
		if not getgenv().settings.noFont then
			boothText = tostring('<font face="' .. getgenv().settings.fontFace .. '" size="' .. getgenv().settings.fontSize .. '" color="#' .. getgenv().settings.hexBox .. '">' .. text .. '</font>')
		else
			boothText = tostring('<font color="#' .. getgenv().settings.hexBox .. '">' .. text .. '</font>')
		end
		--Updates the booth text
		local myBooth = Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[1]))
		if myBooth.Sign.TextLabel.Text ~= boothText then
			if string.find(myBooth.Sign.TextLabel.Text, "# #") or string.find(myBooth.Sign.TextLabel.Text, "##") then
				if getgenv().settings.taggedBoothHop then
					if nx >= 1 then
						serverHop()
					else
						nx = 8
					end
				end
				require(game:GetService("ReplicatedStorage").Remotes).Event("SetBoothText"):FireServer("your text here", "booth")
				task.wait(3)
			end
			require(game:GetService('ReplicatedStorage').Remotes).Event("SetBoothText"):FireServer(boothText, "booth")
			task.wait(3)
		else
		end
	end
	if getgenv().settings.textUpdateToggle and getgenv().settings.customBoothText and getgenv().settings.rainbowText then
	  while task.wait() and getgenv().settings.rainbowText do
		task.wait(3)
		for i,v in next, RainbowHexColors do
			if not getgenv().settings.rainbowText then break end
			if not getgenv().settings.noFont then
				boothText = tostring('<font face="' .. getgenv().settings.fontFace .. '" size="' .. getgenv().settings.fontSize .. '" color="#' .. v .. '">' .. text .. '</font>')
			else
				boothText = tostring('<font color="' .. v .. '">' .. text .. '</font>')
			end
			require(game:GetService('ReplicatedStorage').Remotes).Event("SetBoothText"):FireServer(boothText, "booth")
			task.wait(3)
		end
	  end
	end
	if getgenv().settings.signToggle and getgenv().settings.signUpdateToggle and getgenv().settings.signText and signPass then
		local currentSign = game:GetService('Players').LocalPlayer.Character.DonateSign.TextSign.SurfaceGui.TextLabel.Text
		text = string.gsub(getgenv().settings.signText, "$C", current)
		text = string.gsub (text, "$G", goal)
		signText = tostring('<font color="' .. getgenv().settings.signHexBox .. '">' .. text .. '</font>')
		if currentSign ~= signText then
			if string.find(currentSign, "# #") or string.find(currentSign, "##") then
				require(game:GetService('ReplicatedStorage').Remotes).Event("SetBoothText"):FireServer("your text here", "sign")
				task.wait(3)
			end
			require(game:GetService('ReplicatedStorage').Remotes).Event("SetBoothText"):FireServer(signText, "sign")
		end
	end
end
local function begging()
	while getgenv().settings.autoBeg do
		game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().settings.begMessage[math.random(#getgenv().settings.begMessage)], "All")
		task.wait(getgenv().settings.begDelay)
	end
end

local function webhook(raised, donor)
	if getgenv().settings.webhookBox:gsub(' ', '') == '' then
		return
	end
	local isLucky
	local math1 = math.random(1, 1000)
	local math2 = math.random(1, 1000)
	if math1 == math2 then
		isLucky = 'Lucky'
	else
		isLucky = 'Unlucky'
	end
	local a = os.time()
	local a = os.date("!*t", a)
	local c = game:GetService("MarketplaceService")
	local c = c:GetProductInfo(game.PlaceId, Enum.InfoType.Asset)
	local a = {
		["title"] = '**' .. game:GetService('Players').LocalPlayer.Name .. '**',
		["description"] = "",
		["type"] = "rich",
		["color"] = tonumber(getgenv().embedcolor),
		["thumbnail"] = {
			["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId=" ..
               Players.LocalPlayer.UserId .. "&width=420&height=420&format=png"
		},
		["image"] = {
			["url"] = "http://www.roblox.com/Thumbs/Asset.ashx?Width=768&Height=432&AssetID=" .. game.PlaceId
		},
		["fields"] = {
			{
				["name"] = "Donation Amount",
				["value"] = "`" .. tostring(raised) .. '`',
				["inline"] = true
			},
			{
				["name"] = "Total",
				["value"] = '`' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value) .. '`',
				["inline"] = true
			},
			{
				["name"] = "After Tax [DONATION]",
				["value"] = '`' .. '' .. math.floor(tostring(raised * 0.6)) .. '`',
				["inline"] = true
			},
			{
				["name"] = "After Tax [TOTAL]",
				["value"] = '`' .. math.floor(tostring(Players.LocalPlayer.leaderstats.Raised.Value * 0.6)) .. '`',
				["inline"] = true
			},
			{
				["name"] = "Donor",
				["value"] = '`' .. tostring(donor) .. '`',
				["inline"] = true
			},
			{
				["name"] = "RNG lucky game:",
				["value"] = '`' .. tostring(isLucky) .. '`',
				["inline"] = true
			},
		},
		["footer"] = {
			["text"] = "made by szze#6220 | https://discord.gg/8jxEbMAEQD",
		},
		["timestamp"] = string.format("%d-%d-%dT%02d:%02d:%02dZ", a.year, a.month, a.day, a.hour, a.min, a.sec)
	}
	if getgenv().settings.pingEveryone and tonumber(raised) > tonumber(getgenv().settings.pingAboveDono) then
		httprequest{
			Url = getgenv().settings.webhookBox,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = game:GetService "HttpService":JSONEncode({
				content = "@everyone",
				embeds = {
					a
				}
			})
		}
	else
		httprequest{
			Url = getgenv().settings.webhookBox,
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = game:GetService "HttpService":JSONEncode({
				content = "No Ping",
				embeds = {
					a
				}
			})
		}   
	end
end

local function hex(c3)
	local r, g, b = math.floor(c3.R * 255), math.floor(c3.G * 255), math.floor(c3.B * 255)
	return string.format("#%02X%02X%02X", r, g, b)
end

local function rgb(hex)
	hex = hex:gsub("#", "")
	local r, g, b = tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
	return Color3.new(r, g, b)
end

local Window = library:AddWindow("welcome dtt haters | szze#6220",
  {
	main_color = Color3.fromRGB(80, 80, 80),
	min_size = Vector2.new(500, 563),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
})
local boothTab = Window:AddTab("Booth")
local signTab = Window:AddTab("Sign")
local chatTab = Window:AddTab("Chat")
local webhookTab = Window:AddTab("Webhook")
local serverHopTab = Window:AddTab("Server")
local otherTab = Window:AddTab("Other")
local otherTab2 = Window:AddTab("Other 2")

local bThemes = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenGui"):WaitForChild("BoothSettings"):WaitForChild("ScrollingFrame"):WaitForChild("ChangeTheme"):WaitForChild("Themes")
local TextService = game:GetService("TextService")
  
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

local noFontSwitch = boothTab:AddSwitch("No Font", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.noFont = bool
	saveSettings()
	if bool then
		updateBoothText()
	end
end)
noFontSwitch:Set(getgenv().settings.noFont)

local rainbowSwitch = boothTab:AddSwitch("Rainbow Text", function(bool)
	getgenv().settings.rainbowText = bool
	saveSettings()
	if bool then
		updateBoothText()
	end
end)
rainbowSwitch:Set(getgenv().settings.rainbowText)

textUpdateToggle:Set(getgenv().settings.textUpdateToggle)
local textUpdateDelay = boothTab:AddSlider("Text Update Delay (S)", function(x)
	if settingsLock then
		return
	end
	getgenv().settings.textUpdateDelay = x
	coroutine.wrap(slider)(getgenv().settings.textUpdateDelay, "textUpdateDelay")
end,
  {
	["min"] = 0,
	["max"] = 120
})
textUpdateDelay:Set((getgenv().settings.textUpdateDelay / 120) * 100)

boothTab:AddLabel("Goal Increase:")
local goalBox = boothTab:AddTextBox("Numbers Only", function(text)
	if tonumber(text) then
		getgenv().settings.goalBox = tonumber(text)
		saveSettings()
	end
end,
  {
	["clear"] = false
})
goalBox.Text = getgenv().settings.goalBox
boothTab:AddLabel("Custom Booth Text:")
local customBoothText = boothTab:AddConsole({
	["y"] = 50,
	["source"] = "",
})

boothTab:AddLabel('$C = current | $G = goal | $D = jumps per robux')

boothTab:AddLabel("Font:")
local fontDropdown = boothTab:AddDropdown("[ " .. getgenv().settings.fontFace .. " ]", function(t)
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
  --Sign Settings
pcall(function()
	if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(Players.LocalPlayer.UserId, 28460459) then
		signPass = true
	end
end)
if signPass then
	local signToggle = signTab:AddSwitch("Equip Sign", function(bool)
		getgenv().settings.signToggle = bool
		saveSettings()
		if bool then
			Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):EquipTool(Players.LocalPlayer.Backpack:FindFirstChild("DonateSign"))
		else
			Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):UnequipTools(Players.LocalPlayer.Character:FindFirstChild("DonateSign"))
		end
	end)
	signToggle:Set(getgenv().settings.signToggle)
	local signUpdateToggle = signTab:AddSwitch("Text Update", function(bool)
		if settingsLock then
			return
		end
		getgenv().settings.signUpdateToggle = bool
		saveSettings()
		if bool then
			updateBoothText()
		end
	end)
	signUpdateToggle:Set(getgenv().settings.signUpdateToggle)

	signTab:AddLabel("Sign Text:")
	local signText = signTab:AddConsole({
		["y"] = 50,
		["source"] = "",
	})
	signText:Set(getgenv().settings.signText)
	signTab:AddButton("Save", function()
		if #signText:Get() > 221 then
			return signText:Set("221 Character Limit")
		end
		if settingsLock then
			return
		end
		if signText:Get() then
			getgenv().settings.signText = signText:Get()
			saveSettings()
			updateBoothText()
		end
	end)
	local signHelpLabel = signTab:AddLabel("$C = Current, $G = Goal, 221 Character Limit")
	signHelpLabel.TextSize = 9
	signHelpLabel.TextXAlignment = Enum.TextXAlignment.Center
else
	signTab:AddLabel('Requires Sign Gamepass')
end
  
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
local thanksDelay = chatTab:AddSlider("Thanks Delay (S)", function(x)
	if settingsLock then
		return
	end
	getgenv().settings.thanksDelay = x
	coroutine.wrap(slider)(getgenv().settings.thanksDelay, "thanksDelay")
end,
  {
	["min"] = 1,
	["max"] = 120
})
thanksDelay:Set((getgenv().settings.thanksDelay / 120) * 100)
local begDelay = chatTab:AddSlider("Begging Delay (S)", function(x)
	if settingsLock then
		return
	end
	getgenv().settings.begDelay = x
	coroutine.wrap(slider)(getgenv().settings.begDelay, "begDelay")
end,
  {
	["min"] = 1,
	["max"] = 300
})
begDelay:Set((getgenv().settings.begDelay / 300) * 100)
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
	getgenv().settings.webhookAfterSH = bool
	saveSettings()
end)

local PingEveryoneHighDono = webhookTab:AddSwitch("Ping Everyone Above Min Donation", function(bool)
	if settingsLock then
		return 
	end--wait can u copy this and set the pingAboveDono to 0 im gonna dono u s o u test it
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
webhookTab:AddButton("Test", function()
	if getgenv().settings.webhookBox then
		oldWebhook("webhook works | dotgg")
	end
end)

 -- looks better

webhookTab:AddLabel('Webhook Type: ')

local webhookType = webhookTab:AddDropdown("[ " .. getgenv().settings.webhookType .. " ]", function(t)
	if t == 'New [BUGGY]' then
		getgenv().settings.webhookType = 'New'
	else
		getgenv().settings.webhookType = 'Old'
	end
	saveSettings()
end)
  
webhookType:Add('New [BUGGY]')
webhookType:Add('Old [RECOMMENDED!]')

local TB = webhookTab:AddTextBox("Minimum ping dono amount", function(text)
	local x = text:gsub('Minimum ping dono amount','')
	if tonumber(x) then
		getgenv().settings.pingAboveDono = tonumber(x);
		saveSettings()
	end
	end,
	{
	["clear"] = false
	})
	
	TB.Text = 'Minimum ping dono amount: ' .. getgenv().settings.pingAboveDono

pcall(function()
	if game:GetService("VoiceChatService"):IsVoiceEnabledForUserIdAsync(Players.LocalPlayer.UserId) then
		vcEnabled = true
	end
end)

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

local alhop = serverHopTab:AddSwitch("Random Hop", function(bool)
	getgenv().settings.AlternativeHop = bool
	saveSettings()
end)

local sHopSwitch = serverHopTab:AddSwitch('ServerHop after donation', function(bool)
	getgenv().settings.serverHopAfterDonation = bool
	saveSettings()
end)

sHopSwitch:Set(getgenv().settings.serverHopAfterDonation)

local staffHopSwitch = serverHopTab:AddSwitch('ServerHop if Staff', function(bool)
	getgenv().settings.staffHopA = bool
	saveSettings()
end)

staffHopSwitch:Set(getgenv().settings.staffHopA)

local taggedBoothHopSwitch = serverHopTab:AddSwitch('ServerHop if tagged booth', function(bool)
	getgenv().settings.taggedBoothHop = bool
	saveSettings()
end)

alhop:Set(getgenv().settings.AlternativeHop)
taggedBoothHopSwitch:Set(getgenv().settings.taggedBoothHop)
serverHopTab:AddButton("Server Hop", function()
	serverHop()
end)

local serverHopMinAmount = serverHopTab:AddTextBox("Minimum donated amount", function(text)
	getgenv().settings.minimumDonated = tonumber(text) or 0
end,
  {
	["clear"] = false
})
serverHopMinAmount.Text = getgenv().settings.minimumDonated

local serverHopDelay = serverHopTab:AddSlider("Server Hop Delay (M)", function(x)
	if settingsLock then
		return
	end
	getgenv().settings.serverHopDelay = x
	coroutine.wrap(slider)(getgenv().settings.serverHopDelay, "serverHopDelay")
end,
  {
	["min"] = 1,
	["max"] = 120
})

serverHopTab:AddLabel("Server hop timer resets after donation")

serverHopDelay:Set((getgenv().settings.serverHopDelay / 120) * 100)
  --Other tab
otherTab:AddLabel('Dance:')
local danceDropdown = otherTab:AddDropdown("[ " .. getgenv().settings.danceChoice .. " ]", function(object)
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
local render = otherTab:AddSwitch("Disable Rendering", function(bool)
	getgenv().settings.render = bool
	saveSettings()
	if bool then
		game:GetService("RunService"):Set3dRenderingEnabled(false)
	else
		game:GetService("RunService"):Set3dRenderingEnabled(true)
	end
end)
render:Set(getgenv().settings.render)
local jumpswitch = otherTab:AddSwitch("Donation Jump", function(bool)
	getgenv().settings.donationJump = bool
	saveSettings()
end)
jumpswitch:Set(getgenv().settings.donationJump)
local autoReply = otherTab:AddSwitch("Auto Reply [Experimental]", function(bool)
	getgenv().settings.autoNearReply = bool
	saveSettings()
end)
autoReply:Set(getgenv().settings.autoNearReply)
local anMode = otherTab:AddSwitch('Anonymous Mode', function(bool)
	getgenv().settings.AnonymousMode = bool
	if getgenv().settings.AnonymousMode then
		require(game:GetService('ReplicatedStorage').Remotes).Event('SetDonatedVisibility'):FireServer(false)
	else
		require(game:GetService('ReplicatedStorage').Remotes).Event('SetDonatedVisibility'):FireServer(true)
	end
	saveSettings()
end)
anMode:Set(getgenv().settings.AnonymousMode)

if getgenv().settings.AnonymousMode then
	require(game:GetService('ReplicatedStorage').Remotes).Event('SetDonatedVisibility'):FireServer(false)
end

task.spawn(function()
	while task.wait(1) do
		for i, v in next, Players:GetPlayers() do
			playerChecker(v)
			task.wait()
		end
	end
end)

local spinToggle = otherTab:AddSwitch('Spin [1R$ = +1 speed]', function(bool)
	getgenv().settings.spinSet = bool
	if getgenv().settings.spinSet then
		local root = Players.LocalPlayer.Character.Humanoid.RootPart
		local Spin = Instance.new("BodyAngularVelocity")
		if syn then
			syn.protect_gui(Spin)
		end
		Spin.Name = "Spin"
		Spin.Parent = root
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Spin.AngularVelocity = Vector3.new(0, 0.25 * settings.spinSpeedMultiplier, 0)
	elseif not getgenv().settings.spinSet and Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin') then
		Players.LocalPlayer.Character.Humanoid.RootPart.Spin:Destroy()
	end
	saveSettings()
end)


local fpsBoosts = otherTab:AddSwitch('CPU Saver', function(bool)
	getgenv().settings.fpsBoost = bool
	saveSettings()
	task.spawn(function()
		task.wait(9)
		if getgenv().settings.fpsBoost then
			for i, v in next, workspace:GetDescendants() do
				task.wait()
				if v:IsA('BasePart') then
					v.Material = Enum.Material.Plastic
					v.CastShadow = false
				end
				if v:IsA('Decal') or (string.match(v.ClassName, 'Mesh') and not v:IsDescendantOf(game:GetService('Players').LocalPlayer.Character)) then
					v:Destroy()
				end
				if string.match(v.Name, 'Blimp') and not game:GetService('Players'):FindFirstChild(v.Name) then
					v:Destroy()
				end
			end
			workspace.DescendantAdded:Connect(function(v)
				task.wait()
				if v:IsA('BasePart') then
					v.Material = Enum.Material.Plastic
					v.CastShadow = false
				end
				if v:IsA('Decal') or (string.match(v.ClassName, 'Mesh') and not v:IsDescendantOf(game:GetService('Players').LocalPlayer.Character)) then
					v:Destroy()
				end
				if string.match(v.Name, 'Blimp') and not game:GetService('Players'):FindFirstChild(v.Name) then
					v:Destroy()
				end
			end)
			game:GetService('Lighting').GlobalShadows = false
			for i, v in next, game:GetService("Lighting"):GetChildren() do
				v:Destroy()
			end
			if settings then
				settings().Rendering.QualityLevel = 1
			end
		end
	end)
end)

fpsBoosts:Set(getgenv().settings.fpsBoost)

otherTab:AddLabel("-----------------------")

local jumpsPerRB = otherTab:AddSlider("Jumps per robux", function(x)
	if settingsLock then
		return
	end
	getgenv().settings.jumpsPerRobux = x
	saveSettings()
	coroutine.wrap(slider)(getgenv().settings.jumpsPerRobux, "jumpsPerRobux")
end,
  {
	["min"] = 0,
	["max"] = 100
})

local spinMultiplier = otherTab:AddSlider("Spin speed multiplier", function(x)
	if settingsLock then
		return
	end
	getgenv().settings.spinSpeedMultiplier = x
	saveSettings()
	coroutine.wrap(slider)(getgenv().settings.spinSpeedMultiplier, "spinSpeedMultiplier")
end,
  {
	["min"] = 1,
	["max"] = 3
})

spinMultiplier:Set(getgenv().settings.spinSpeedMultiplier)
jumpsPerRB:Set(getgenv().settings.jumpsPerRobux)
spinToggle:Set(getgenv().settings.spinSet)

if setfpscap and type(setfpscap) == "function" then
	local fpsLimit = otherTab:AddSlider("FPS Limit", function(x)
		if settingsLock then
			return
		end
		getgenv().settings.fpsLimit = x
		setfpscap(x)
		coroutine.wrap(slider)(getgenv().settings.fpsLimit, "fpsLimit")
	end,
	  {
		["min"] = 1,
		["max"] = 60
	})
	fpsLimit:Set((getgenv().settings.fpsLimit / 60) * 100)
	setfpscap(getgenv().settings.fpsLimit)
end

--otherTab2

otherTab2:AddLabel("Standing Position:")
local standingPos = otherTab2:AddDropdown("[ " .. getgenv().settings.standingPosition .. " ]", function(t)
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

boothTab:Show()
library:FormatWindows()
settingsLock = false
  
  --Finds unclaimed booths
local function findUnclaimed()
	for i, v in pairs(Players.LocalPlayer.PlayerGui:WaitForChild('MapUIContainer'):WaitForChild('MapUI'):WaitForChild('BoothUI'):GetChildren()) do
		if (v.Details.Owner.Text == "unclaimed") then
			table.insert(unclaimed, tonumber(string.match(tostring(v), "%d+")))
		end
	end
end
if not pcall(findUnclaimed) then
	serverHop()
end
local claimCount = #unclaimed
  --Claim booth function
local function boothclaim()
	require(game:GetService('ReplicatedStorage').Remotes).Event("ClaimBooth"):InvokeServer(unclaimed[1])
	if not string.find(Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[1])).Details.Owner.Text, Players.LocalPlayer.DisplayName) then
		task.wait(1)
		if not string.find(Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[1])).Details.Owner.Text, Players.LocalPlayer.DisplayName) then
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
local function walkToBooth()
	local theCframe
	if string.find(tostring(getgenv().settings.boothPosition), "6") then
		theCframe = CFrame.new(getgenv().settings.boothPosition, 0, 0)
	else
		theCframe = CFrame.new(0, 0, getgenv().settings.boothPosition)
	end
	local boothPos, mainPosX
	for i, v in ipairs(game:GetService("Workspace").BoothInteractions:GetChildren()) do
		if v:GetAttribute("BoothSlot") == unclaimed[1] then
			mainPosX = v.CFrame
			boothPos = v.CFrame * theCframe
			break
		end
	end
	game:GetService('VirtualInputManager'):SendKeyEvent(true, "LeftControl", false, game)
	local Controls = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
	Controls:Disable()
	local atBooth = false
	game:GetService("Workspace").Map.Main.Bench:Destroy()
	Players.LocalPlayer.Character.Humanoid:MoveTo(boothPos.Position)
	Players.LocalPlayer.Character.Humanoid.MoveToFinished:Connect(function(reached)
		atBooth = true
	end)
	repeat
		task.wait()
	until atBooth
	Players.LocalPlayer.Character.Humanoid.RootPart.CFrame = CFrame.new(boothPos.Position)
	Controls:Enable()
	game:GetService('VirtualInputManager'):SendKeyEvent(false, "LeftControl", false, game)
	Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(40, 14, 101)))
	task.wait(0.6)
	Players:Chat('/e dance' .. getgenv().settings.danceChoice)
end
walkToBooth()
if getgenv().settings.autoBeg then
	spamming = task.spawn(begging)
end
local RaisedC = Players.LocalPlayer.leaderstats.Raised.value
Players.LocalPlayer.leaderstats.Raised.Changed:Connect(function()
	local playerWhoDonated
	hopSet()
	if Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').RootPart:FindFirstChild('Spin') then
		xspin = (((xspin + Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) / 3) * getgenv().settings.spinSpeedMultiplier) + Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').RootPart:FindFirstChild('Spin').AngularVelocity.Y
	end
	if getgenv().settings.webhookToggle == true and getgenv().settings.webhookBox then
		local LogService = Game:GetService("LogService")
		local logs = LogService:GetLogHistory()
		if string.find(logs[#logs].message, Players.LocalPlayer.DisplayName) then
			local msg = string.gsub(logs[#logs].message, ' tipped ', ''):gsub('', ''):gsub('💸', ''):gsub(' to ', ''):gsub(Players.LocalPlayer.DisplayName, ''):gsub(tostring(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC), ''):gsub('', ''):gsub("💰", ''):gsub(' ', '')
			for i, v in next, Players:GetPlayers() do
				if v.DisplayName == msg then
					playerWhoDonated = v
				end
			end
		end
		if playerWhoDonated then
			if getgenv().settings.webhookType == 'New' then
				webhook(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC, playerWhoDonated)
			else
				oldWebhook(Players.LocalPlayer.Name .. ' | Donation amount: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) .. ' | [A/T]: ' .. tostring(math.floor((Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) * 0.6)) .. ' | Total: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value) .. ' | Donor: ' .. playerWhoDonated.Name)
			end
		else
			if getgenv().settings.webhookType == 'New' then
				webhook(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC)				
			else
				oldWebhook(Players.LocalPlayer.Name .. ' | Donation amount: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) .. ' | [A/T]: ' .. tostring(math.floor((Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) * 0.6)) .. ' | Total: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value))
			end
		end
	end
	if getgenv().settings.serverHopAfterDonation == true then
		task.spawn(function()
			serverHop()
		end)
	end
	if Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin') and getgenv().settings.spinSet == true then
		local spin = Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin')
		spin.AngularVelocity = Vector3.new(0, xspin, 0)
	end
	if getgenv().settings.donationJump == true and not getgenv().settings.spinSet == true then
		task.spawn(function()
			if getgenv().settings.jumpsPerRobux == 1 then
				for i = 1, game:GetService('Players').LocalPlayer.leaderstats.Raised.Value - RaisedC do
					game:GetService('Players').LocalPlayer.Character.Humanoid:ChangeState('Jumping')
					repeat
						task.wait()
					until game:GetService('Players').LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Running
				end
			else
				for i = 1, (game:GetService('Players').LocalPlayer.leaderstats.Raised.Value - RaisedC) * getgenv().settings.jumpsPerRobux do
					game:GetService('Players').LocalPlayer.Character.Humanoid:ChangeState('Jumping')
					repeat
						task.wait()
					until game:GetService('Players').LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Running
				end
			end
		end)
	end
	RaisedC = Players.LocalPlayer.leaderstats.Raised.value
	if getgenv().settings.autoThanks == true then
		task.spawn(function()
			task.wait(getgenv().settings.thanksDelay)
			game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest:FireServer(getgenv().settings.thanksMessage[math.random(#getgenv().settings.thanksMessage)], "All")
		end)
	end
	task.wait(getgenv().settings.textUpdateDelay)
	updateBoothText()
end)
updateBoothText()

task.spawn(function()
	raisedV = 0
	task.wait(5)
	Players.LocalPlayer.CharacterRemoving:Connect(function()
		if getgenv().settings.spinSet then
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
		saveSettings()
		if (Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RootPart) then
			local root = Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid').RootPart
			if (root.Position - positionX.Position).Magnitude > 1500 or (root.Position - positionX.Position).Magnitude < -1500 then
				serverHop()
			end
		end
	end
end)

if getgenv().settings.webhookAfterSH then
	webhook('hi hello ' .. Players.LocalPlayer.DisplayName .. ' (' .. Players.LocalPlayer.Name .. ') serverhopped')
end

local msgdone = game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.OnMessageDoneFiltering
local randommsgs = {
	'yes',
	'ok',
	'alr',
	'yeah'
}
local randombotmsgs = {
	'no im not a bot',
	'why do yall think im a bot :(',
	'bro im not a bot',
	'bruh shut up im a real human'
}
local messageRequest = game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents.SayMessageRequest
msgdone.OnClientEvent:Connect(function(msgdata)
	local speaker = tostring(msgdata.FromSpeaker)
	local message = string.lower(msgdata.Message)
	task.wait(2.1 + math.random(0.4, 1))
	local plrChatted = game:GetService('Players')[speaker] or nil
	if (plrChatted and plrChatted == game:GetService('Players').LocalPlayer) or getgenv().settings.autoNearReply == false or not plrChatted  or string.find(message, 'donates') or string.find(message, "spamming") then
		return
	end
	pcall(function()
		local chatChar = plrChatted.Character
		if (plrChatted.Character and plrChatted.Character.Humanoid.RootPart) then
			local root = chatChar.Humanoid.RootPart
			if (root.Position - game:GetService('Players').LocalPlayer.Character.Humanoid.RootPart.Position).Magnitude < 11 then
				if message == 'hello' or message == 'hi' or message == 'sup' or message == 'hey' then
					messageRequest:FireServer(getgenv().settings.helloResponce[math.random(1, #getgenv().settings.helloResponce)], 'All')
				elseif string.find(message, 'bot') then
					messageRequest:FireServer(getgenv().settings.botResponce[math.random(1, #getgenv().settings.botResponce)], 'All')
				elseif string.find(message, 'donate') then
					messageRequest:FireServer(getgenv().settings.donateResponce[math.random(1, #getgenv().settings.donateResponce)], 'All')
				elseif string.find(message, 'scam') then
					messageRequest:FireServer(getgenv().settings.scamResponce[math.random(1, #getgenv().settings.scamResponce)], 'All')
				else
					messageRequest:FireServer(getgenv().settings.otherResponce[math.random(1, #getgenv().settings.otherResponce)], 'All')
				end
			end
		end
	end)
end)
if game:GetService("CoreGui").imgui.Windows.Window.Title.Text == "Loading..." then
	game:GetService("CoreGui").imgui.Windows.Window.Title.Text = "dtt haters hello | szze#6220"
end
while task.wait(getgenv().settings.serverHopDelay * 60) do
	if not hopTimer then
		hopSet()
	end
end

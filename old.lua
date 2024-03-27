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

--skidded!!! ty tvk1308
for k, v in pairs(getgc(true)) do
	if pcall(function()
		return rawget(v, "indexInstance")
	end) and type(rawget(v, "indexInstance")) == "table" and  (rawget(v, "indexInstance"))[1] == "kick" then
		v.tvk = {
			"kick",
			function()
				return workspace:WaitForChild(game:GetService('HttpService'):GenerateGUID(true))
			end
		}
	end
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
if getgenv().loadedRR then
	return
else
	getgenv().loadedRR = true
end
task.wait()
  --Anti-AFK
local Players = game:GetService("Players")
local connections = getconnections or get_signal_cons or nil
task.spawn(function()
	if connections then
		for a, b in next, connections(game:GetService('Players').LocalPlayer.Idled) do
			b:Disable()
		end
	end
end)

local Players = game:GetService('Players')
local unclaimed = {}
local counter = 0
local mainCheckPosition = Vector3.new(165.715, 21.3212, 507.079) * Vector3.new(1,0.5,1)
local donation, boothText, spamming, hopTimer, vcEnabled
local signPass = false
local errCount = 0
local uid = game:GetService('Players').LocalPlayer.UserId
local newRaisedFormat = Players.LocalPlayer:WaitForChild('leaderstats'):WaitForChild('Raised')
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
local queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport) or nil
local httprequest = (syn and syn.request) or http and http.request or http_request or (fluxus and fluxus.request) or request
local httpservice = game:GetService('HttpService')
if queueonteleport then
	queueonteleport("loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/old.lua'))()")
end
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/UI"))()
local _HIGHLIGHTLOADER = loadstring(game:HttpGet('https://raw.githubusercontent.com/CF-Trail/tzechco-PlsDonateAutofarmBackup/main/hl.lib.lua'))()
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
	'friendHop'
}

local positionX = (game:GetService('Players').LocalPlayer.Character or game:GetService('Players').LocalPlayer.CharacterAdded:Wait()):WaitForChild('HumanoidRootPart').Position

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
	false,
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
	1000,
	false,
	false,
	false,
	false,
	0,
	false,
	false,
	true
}

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
		delfile("plsdonatesettings.txt")
		task.wait(2)
		getgenv().settings = game:GetService('HttpService'):JSONDecode(readfile('plsdonatesettingsbackup.txt'))
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
local Deleted = false
local S_T = game:GetService("TeleportService")
local S_H = game:GetService("HttpService")
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
	for i, v in pairs(Site.data) do
		local Possible = true
		ID = tostring(v.id)
		if tonumber(v.maxPlayers) > tonumber(v.playing) and tonumber(v.playing) >= 19  then
			for _, Existing in pairs(AllIDs) do
				if num ~= 0 then
					if ID == tostring(Existing) then
						Possible = false
					end
				else
					if tonumber(actualHour) ~= tonumber(Existing) then
						local delFile = pcall(function()
							delfile(RandomName .. ".json")
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
					writefile(RandomName .. ".json", S_H:JSONEncode(AllIDs))
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

	pcall(function()
		TPReturner(gameId)
		if foundAnything ~= "" then
			TPReturner(gameId)
		end
	end)

	while task.wait(5) do
		pcall(function()
			TPReturner(gameId)
			if foundAnything ~= "" then
				TPReturner(gameId)
			end
		end)
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
	return game:GetService('TweenService'):Create(...)
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
   _boothlocation = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui'):WaitForChild('MapUIContainer'):WaitForChild('MapUI')
else
   _boothlocation = _shuffled or workspace:WaitForChild('MapUI')
end

function updateBoothText()
	local text
	local current = tonumber(newRaisedFormat.Value)
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
		boothText = text
		--Updates the booth text
		local myBooth = _boothlocation.BoothUI:FindFirstChild(tostring("BoothUI" .. unclaimed[2]))
		if myBooth.Sign.TextLabel.Text ~= boothText then
			if string.find(myBooth.Sign.TextLabel.Text, "# #") or string.find(myBooth.Sign.TextLabel.Text, "##") then
				if getgenv().settings.taggedBoothHop then
					if nx >= 1 then
						serverHop()
					else
						nx = 8
					end
				end
				require(game:GetService("ReplicatedStorage").Remotes).Event("SetCustomization"):FireServer({
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["richText"] = true,
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["strokeColor"] = Color3.new(0,0,0),
				        ["text"] = "your text here",
				        ["buttonStrokeColor"] = Color3.new(0,0,0),
				        ["buttonTextColor"] = Color3.new(1,1,1),
				        ["buttonColor"] = Color3.new(98, 255, 0),
				        ["buttonHoverColor"] = Color3.new(98, 255, 0),
				        ["buttonLayout"] = "",
				        ["strokeOpacity"] = 0,
				        ["textColor"] = rgb(getgenv().settings.hexBox)
				}, "booth")
				task.wait(3)
			end
				require(game:GetService("ReplicatedStorage").Remotes).Event("SetCustomization"):FireServer({
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["richText"] = true,
				        ["textFont"] = Enum.Font[getgenv().settings.fontFace],
				        ["strokeColor"] = Color3.new(0,0,0),
				        ["text"] = getgenv().settings.customBoothText:gsub('$C',current):gsub('$G',goal),
				        ["buttonStrokeColor"] = Color3.new(0,0,0),
				        ["buttonTextColor"] = Color3.new(1,1,1),
				        ["buttonColor"] = Color3.new(98, 255, 0),
				        ["buttonHoverColor"] = Color3.new(98, 255, 0),
				        ["buttonLayout"] = "",
				        ["strokeOpacity"] = 0,
				        ["textColor"] = rgb(getgenv().settings.hexBox)
				}, "booth")
			task.wait(3)
		else
		end
	end
end

local _TTSERVICE = game:GetService('TextChatService')
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
		["color"] = tonumber(3066993),
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
				["value"] = '`' .. tostring(tonumber(newRaisedFormat.Value)) .. '`',
				["inline"] = true
			},
			{
				["name"] = "After Tax [DONATION]",
				["value"] = '`' .. '' .. math.floor(tostring(raised * 0.6)) .. '`',
				["inline"] = true
			},
			{
				["name"] = "After Tax [TOTAL]",
				["value"] = '`' .. math.floor(tostring(tonumber(newRaisedFormat.Value) * 0.6)) .. '`',
				["inline"] = true
			},
			{
				["name"] = "Donor",
				["value"] = '`' .. donor .. '`',
				["inline"] = true
			},
			{
				["name"] = "RNG lucky game:",
				["value"] = '`' .. tostring(isLucky) .. '`',
				["inline"] = true
			},
		},
		["footer"] = {
			["text"] = "made by szze#6220 (szze) | https://discord.gg/SuNqfnK",
		},
		["timestamp"] = string.format("%d-%d-%dT%02d:%02d:%02dZ", a.year, a.month, a.day, a.hour, a.min, a.sec)
	}
	if getgenv().settings.pingEveryone and tonumber(raised) >= tonumber(getgenv().settings.pingAboveDono) then
		httprequest{
			Url = getgenv().settings.webhookBox:gsub(' ', ''),
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
			Url = getgenv().settings.webhookBox:gsub(' ', ''),
			Method = "POST",
			Headers = {
				["Content-Type"] = "application/json"
			},
			Body = game:GetService "HttpService":JSONEncode({
				content = "",
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

function rgb(hex)
	hex = hex:gsub("#", "")
	local r, g, b = tonumber("0x" .. hex:sub(1, 2)), tonumber("0x" .. hex:sub(3, 4)), tonumber("0x" .. hex:sub(5, 6))
	return Color3.new(r, g, b)
end

if game:GetService('CoreGui'):FindFirstChild('RobloxPromptGui') then
	for i, v in next, game:GetService("CoreGui").RobloxPromptGui:GetDescendants() do
		if v:IsA('TextLabel') and string.find(string.lower(v.Text), "ban") then
			oldWebhook('@everyone ||' .. Players.LocalPlayer.Name .. '|| got banned' .. v.Text:gsub("You've been banned", ''):gsub('You were kicked from this experience:', ''):gsub('(Error Code: 267)', ''):gsub('()', ''))
		end
	end
end

if game:GetService('CoreGui'):FindFirstChild('RobloxPromptGui') then
	game:GetService('CoreGui').RobloxPromptGui.DescendantAdded:Connect(function(v)
		if v:IsA('TextLabel') and string.find(string.lower(v.Text), "ban") then
			oldWebhook('@everyone ||' .. Players.LocalPlayer.Name .. '|| got banned' .. v.Text:gsub("You've been banned", ''):gsub('You were kicked from this experience:', ''):gsub('(Error Code: 267)', ''):gsub('()', ''))
		end
	end)
end

local Window = library:AddWindow("@szze | 💖",
  {
	main_color = Color3.fromRGB(80, 80, 80),
	min_size = Vector2.new(560, 563),
	toggle_key = Enum.KeyCode.RightShift,
	can_resize = true,
})
local boothTab = Window:AddTab("Booth")
local highlightTab = Window:AddTab("Highlights")
local chatTab = Window:AddTab("Chat")
local webhookTab = Window:AddTab("Webhook")
local serverHopTab = Window:AddTab("Server")
local otherTab = Window:AddTab("Other")
local otherTab2 = Window:AddTab("Other 2")
local supportTab = Window:AddTab("Support")
local TextService = game:GetService("TextService")
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

boothTab:AddLabel("Text Color:")
local hexBox = boothTab:AddTextBox("Hex Codes Only", function(text)
	if settingsLock then
		return
	end
	local success = pcall(function()
		return Color3.fromHex(text)
	end)
	if success and string.find(text, "#") then
		getgenv().settings.hexBox = text
		saveSettings()
		update()
	end
end,
  {
	["clear"] = false
})
hexBox.Text = getgenv().settings.hexBox

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

boothTab:AddLabel("Standing Position:")
local standingPos = boothTab:AddDropdown("[ " .. getgenv().settings.standingPosition .. " ]", function(t)
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

--highlights
highlightTab:AddLabel("What are highlights? See in Discord")
highlightTab:AddLabel('(or join manually if your executor sucks: SaGSHTVmKM)')

highlightTab:AddButton("Copy Invite", function()
	local _clipfunc = setclipboard or toclipboard
	_clipfunc('https://discord.gg/SaGSHTVmKM')
end)

highlightTab:AddLabel('-------------------------------------')

local _HLTOGGLE = highlightTab:AddSwitch('Sing a song on donation [HIGHLIGHT]', function(bool)
	getgenv().settings.highlightSwitch = bool
	if bool then
		_HIGHLIGHTLOADER.HLSetup(Players.LocalPlayer.Character)
	else
		_HIGHLIGHTLOADER.HLUnload(Players.LocalPlayer.Character)
	end
end)

_HLTOGGLE:Set(getgenv().settings.highlightSwitch)

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
	if settingsLock or not tonumber(text) then
		return
	end
	getgenv().settings.begDelay = tonumber(text)
	saveSettings()
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
webhookTab:AddButton("Test", function()
	if getgenv().settings.webhookBox then
		oldWebhook("Webhook works!")
	end
end)

 -- looks better

webhookTab:AddLabel('Webhook Type: ')

local webhookType = webhookTab:AddDropdown("[ " .. getgenv().settings.webhookType .. " ]", function(t)
	if t == 'New' then
		getgenv().settings.webhookType = 'New'
	else
		getgenv().settings.webhookType = 'Old'
	end
	saveSettings()
end)
  
webhookType:Add('New')
webhookType:Add('Old')

local TB = webhookTab:AddTextBox("Minimum ping dono amount", function(text)
	local x = text:gsub('Minimum ping dono amount', '')
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

local alhop = serverHopTab:AddSwitch("Random between normal/voice", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.AlternativeHop = bool
	saveSettings()
end)

local sHopSwitch = serverHopTab:AddSwitch('ServerHop after donation', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.serverHopAfterDonation = bool
	saveSettings()
end)

sHopSwitch:Set(getgenv().settings.serverHopAfterDonation)

local staffHopSwitch = serverHopTab:AddSwitch('ServerHop if Staff', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.staffHopA = bool
	saveSettings()
end)

local friendHopSwitch = serverHopTab:AddSwitch('ServerHop if friend joined',function(bool)
	if settingsLock then
		return 
	end
	getgenv().settings.friendHop = bool
	saveSettings()
end)

friendHopSwitch:Set(getgenv().settings.friendHop)
staffHopSwitch:Set(getgenv().settings.staffHopA)

local taggedBoothHopSwitch = serverHopTab:AddSwitch('ServerHop if tagged booth', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.taggedBoothHop = bool
	saveSettings()
end)

local gSHSwitch = serverHopTab:AddSwitch('ServerHop if ServerHop goal reached', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.goalServerhopSwitch = bool
	saveSettings()
end)

gSHSwitch:Set(getgenv().settings.goalServerhopSwitch)
alhop:Set(getgenv().settings.AlternativeHop)
taggedBoothHopSwitch:Set(getgenv().settings.taggedBoothHop)

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
	if settingsLock then
		return
	end
	getgenv().settings.donationJump = bool
	saveSettings()
end)
jumpswitch:Set(getgenv().settings.donationJump)
local autoReply = otherTab:AddSwitch("Auto Reply [Experimental]", function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.autoNearReply = bool
	saveSettings()
end)
autoReply:Set(getgenv().settings.autoNearReply)
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
		Spin.Name = "Spin"
		Spin.Parent = root
		Spin.MaxTorque = Vector3.new(0, math.huge, 0)
		Spin.AngularVelocity = Vector3.new(0, 0.25 * settings.spinSpeedMultiplier, 0)
	elseif not getgenv().settings.spinSet and Players.LocalPlayer.Character.Humanoid.RootPart:FindFirstChild('Spin') then
		Players.LocalPlayer.Character.Humanoid.RootPart.Spin:Destroy()
	end
	saveSettings()
end)
	
local jumpSwitcher = otherTab:AddSwitch('1R$ = +1 jump power', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.jumpBoost = bool
	saveSettings()
end)

jumpSwitcher:Set(getgenv().settings.jumpBoost)
	
local gravityToggle = otherTab:AddSwitch('Gravity [1R$ = -1 gravity]', function(bool)
	if settingsLock then
		return
	end
	getgenv().settings.gravitySwitch = bool
	saveSettings()
end)

gravityToggle:Set(getgenv().settings.gravitySwitch)

local heliToggle = otherTab:AddSwitch('Helicopter On-Donation', function(bool)
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
		__PART.Anchored = true
		__PART.CFrame = CFrame.new(root.Position - Vector3.new(0, 3, 0))
	end
	saveSettings()
end)

heliToggle:Set(getgenv().settings.helicopterEnabled)
otherTab:AddLabel("-----------------------")

local jumpsPerRB = otherTab:AddTextBox("Jumps Per Robux", function(text)
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

local spinMultiplier = otherTab:AddTextBox("Spin Speed Multiplier", function(text)
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
	local fpsLimit = otherTab:AddTextBox("FPS Limit", function(text)
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
	game:GetService('TeleportService'):Teleport(13461969417)
end)
supportTab:AddLabel('You can also send me a message there for free!')

boothTab:Show()
library:FormatWindows()
settingsLock = false
  --Finds unclaimed booths
local function findUnclaimed()
	for i, v in pairs(_boothlocation:WaitForChild('BoothUI'):GetChildren()) do
		if (v.Details.Owner.Text == "unclaimed") then
			local _boothnum = tonumber(string.match(tostring(v), "%d+"))
			for i, v in ipairs(game:GetService("Workspace").BoothInteractions:GetChildren()) do
		              if v:GetAttribute("BoothSlot") == _boothnum and (v.Position - mainCheckPosition).Magnitude > 50 then
				   table.insert(unclaimed,_boothnum)
			           break
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
	require(game:GetService('ReplicatedStorage').Remotes).Event("ClaimBooth"):InvokeServer(unclaimed[2])
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
	for i, v in ipairs(game:GetService("Workspace").BoothInteractions:GetChildren()) do
		if v:GetAttribute("BoothSlot") == unclaimed[2] then
			print((v.Position - mainCheckPosition).Magnitude)
			mainPosX = v.CFrame
			boothPos = v.CFrame * theCframe
			game:GetService('Players').LocalPlayer.Character.HumanoidRootPart.CFrame = mainPosX
			break
		end
	end
	Players.LocalPlayer.Character.Humanoid.WalkSpeed = 32
	local Controls = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
	Controls:Disable()
	local atBooth = false
	game:GetService("Workspace").Map.Decoration.Benches:Destroy()
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
	Controls:Enable()
	Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(Players.LocalPlayer.Character.HumanoidRootPart.Position, Vector3.new(40, 14, 101)))
	task.wait(0.6)
	Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
	Players:Chat('/e dance' .. getgenv().settings.danceChoice)
end
walkToBooth()
if getgenv().settings.autoBeg then
	spamming = task.spawn(begging)
end

local RaisedC = Players.LocalPlayer.leaderstats.Raised.value
local djset = false
local helidebounce = false
Players.LocalPlayer.leaderstats.Raised.Changed:Connect(function()
	local playerWhoDonated
	sgoalR = sgoalR + (Players.LocalPlayer.leaderstats.Raised.Value - RaisedC)
	hopSet()
	if Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid').RootPart:FindFirstChild('Spin') and getgenv().settings.spinSet then
		local raisedValue = Players.LocalPlayer.leaderstats.Raised.Value
		local humanoid = Players.LocalPlayer.Character:FindFirstChildWhichIsA('Humanoid')
		local spinPart = humanoid.RootPart:FindFirstChild('Spin')
		local sSM = getgenv().settings.spinSpeedMultiplier
		local deltaRaised = raisedValue - RaisedC
		local averageDelta = deltaRaised / 3
		local spinYVelocity = spinPart.AngularVelocity.Y
		xspin = (averageDelta * sSM) + spinYVelocity
	end
	if getgenv().settings.webhookToggle == true and getgenv().settings.webhookBox then
		task.spawn(function()
			playerWhoDonated = nil
			if playerWhoDonated then
				if getgenv().settings.webhookType == 'New' then
					pcall(function()
						webhook(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC, playerWhoDonated.Name)
					end)
				else
					pcall(function()
						oldWebhook(Players.LocalPlayer.Name .. ' | Donation amount: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) .. ' | [A/T]: ' .. tostring(math.floor((Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) * 0.6)) .. ' | Total: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value) .. ' | Donor: ' .. playerWhoDonated.Name)
					end)
				end
			else
				if getgenv().settings.webhookType == 'New' then
					pcall(function()
						webhook(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC, "Hi, I'm Crazyblox.")
					end)
				else
					pcall(function()
						oldWebhook(Players.LocalPlayer.Name .. ' | Donation amount: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) .. ' | [A/T]: ' .. tostring(math.floor((Players.LocalPlayer.leaderstats.Raised.Value - RaisedC) * 0.6)) .. ' | Total: ' .. tostring(Players.LocalPlayer.leaderstats.Raised.Value))
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
			Players.LocalPlayer.Character.Humanoid.JumpPower = Players.LocalPlayer.Character.Humanoid.JumpPower + (Players.LocalPlayer.leaderstats.Raised.Value - RaisedC)
		end)		
	end
	pcall(function()
		if getgenv().settings.gravitySwitch and not getgenv().settings.highlightSwitch then
			workspace.Gravity = workspace.Gravity - (Players.LocalPlayer.leaderstats.Raised.Value - RaisedC)
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
			game:GetService('Players'):Chat('/e dance2')
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
				CFrame = CFrame.new(C_OLDPOS + Vector3.new(0, 70, 0))
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
			game:GetService('Players'):Chat('/e wave')
		end
	end)
	if getgenv().settings.donationJump == true and not getgenv().settings.spinSet == true and not getgenv().settings.highlightSwitch then
		djset = true
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
			djset = false
		end)
	end
	if getgenv().settings.highlightSwitch then
		task.spawn(function()
			_HIGHLIGHTLOADER.HLStart(Players.LocalPlayer.Character, Players.LocalPlayer.leaderstats.Raised.Value - RaisedC, (playerWhoDonated and playerWhoDonated or nil))
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

Players.PlayerChatted:Connect(function(_____________________, player, message)
	local speaker = tostring(player)
	local message = string.lower(message)
	task.wait(2.1 + math.random(0.4, 1))
	local plrChatted = game:GetService('Players'):FindFirstChild(speaker)
	if (plrChatted and plrChatted == game:GetService('Players').LocalPlayer) or getgenv().settings.autoNearReply == false or not plrChatted  or string.find(message, 'donates') or string.find(message, "spamming") then
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
			if (root.Position - game:GetService('Players').LocalPlayer.Character.Humanoid.RootPart.Position).Magnitude < 11 then
				if message == 'hello' or message == 'hi' or message == 'sup' or message == 'hey' then
					chat(getgenv().settings.helloResponce[math.random(1, #getgenv().settings.helloResponce)])
				elseif string.find(message, 'bot') then
					mchat(getgenv().settings.botResponce[math.random(1, #getgenv().settings.botResponce)])
				elseif string.find(message, 'donate') then
					chat(getgenv().settings.donateResponce[math.random(1, #getgenv().settings.donateResponce)])
				elseif string.find(message, 'scam') then
					chat(getgenv().settings.scamResponce[math.random(1, #getgenv().settings.scamResponce)])
				else
					chat(getgenv().settings.otherResponce[math.random(1, #getgenv().settings.otherResponce)])
				end
			end
		end
		task.wait(15)
		plrChatted:SetAttribute('respcd',false)
	end)
end)

game:GetService('Players').PlayerAdded:Connect(function(player)
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

local plr = game.Players.LocalPlayer
local map = workspace:WaitForChild("Map")

local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
local Window = Rayfield:CreateWindow({
	Name = "NNHub",
	Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
	LoadingTitle = "Im wanna test this game",
	LoadingSubtitle = "by Noname Scripts",
	ShowText = "NNHub", -- for mobile users to unhide rayfield, change if you'd like
	Theme = "Amethyst", -- Check https://docs.sirius.menu/rayfield/configuration/themes

	ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

	DisableRayfieldPrompts = false,
	DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

	ConfigurationSaving = {
		Enabled = true,
		FolderName = "IWTTG_byNNScr", -- Create a custom folder for your hub/game
		FileName = "NNHub"
	},

	Discord = {
		Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
		Invite = "7SbkzZPqx9", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
		RememberJoins = true -- Set this to false to make them join the discord every time they load it up
	},
	KeySystem = false, -- Set this to true to use our key system
	KeySettings = {
		Title = "NN Hub",
		Subtitle = "Key System",
		Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
		FileName = "", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
		SaveKey = false, -- The user's key will be saved, but if you change the key, they will be unable to use your script
		GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
		Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
	}
})

--[[Rayfield:Notify({
   Title = "Notification Title",
   Content = "Notification Content",
   Duration = 6.5,
   Image = 4483362458,
})]]

Rayfield:Notify({
	Title = "Welcome, ...",
	Content = "Join our discord!",
	Duration = 5,
	Image = "circle-plus",
})

local stage1 = map.Stage.LavaStage
local stage2 = map.Stage.LavaStage2
local stage3 = map.Stage.Stage3
local stage4 = map.Stage.Stage4

local mPlatform = stage4["Moving Platform"]
local pTemplate = mPlatform:Clone()
pTemplate.Name = "SafePlatform"
pTemplate.Material = Enum.Material.SmoothPlastic
pTemplate.BrickColor = BrickColor.new("Bright green")
pTemplate.Transparency = 0.3

local function createPl(pos, rot, size)
	local plat = pTemplate:Clone()
	plat.Size = Vector3.new(size[1],size[2],size[3])

	local rotX = math.rad(rot[1])
	local rotY = math.rad(rot[2])
	local rotZ = math.rad(rot[3])

	local rotation = CFrame.Angles(rotX, rotY, rotZ)
	local position = Vector3.new(pos[1], pos[2], pos[3])

	plat.CFrame = CFrame.new(position) * rotation
	plat.Parent = workspace
	return plat
end

local levelRanges = {
	{minX = 23,   maxX = 63,   minZ = 112, maxZ = 183, level = 3},
	{minX = -102, maxX = 193,  minZ = 267, maxZ = 334, level = 4},
	{minX = -402, maxX = -338, minZ = 266, maxZ = 396, level = 5},
}

local function getLevel(x, z)
	for _, range in ipairs(levelRanges) do
		if x >= range.minX and x < range.maxX and 
			z >= range.minZ and z < range.maxZ then
			return range.level
		end
	end
	return 1
end

local npcFolder = workspace:FindFirstChild("NPCs")

local function findNPCsWithLevels()
	if not npcFolder then
		warn("NPCs folder not found in workspace")
		return {}
	end

	local npcs = {}
	for _, npc in ipairs(npcFolder:GetChildren()) do
		if npc:IsA("Model") and npc:FindFirstChild("HumanoidRootPart") then
			local root = npc.HumanoidRootPart
			local pos = root.Position
			local level = getLevel(pos.X, pos.Z)

			table.insert(npcs, {
				Instance = npc,
				Name = npc.Name,
				Level = level
			})
		end
	end
	return npcs
end

--[[
	1 - lava and triggers
	2 - quick
]]
function stage3func(index)
	if index == 1 then
		if stage3.Lava then
			stage3.Lava:Destroy()
		else
			print("Stage 3 lavas not found")
		end
	elseif index == 2 then
		if stage3:FindFirstChild("Triggers") then
			stage3.Triggers:Destroy()
		else
			print("Stage 3 traps not found")
		end
	end
end

--==	Info	==--
local infoTab = Window:CreateTab("Info", "info") -- Title, Image

local infoUsLabel = infoTab:CreateLabel("Welcome".. plr.Name, "user")
local infoDevLabel = infoTab:CreateLabel("By noname", "memory-stick")
local infoInspiredLabel = infoTab:CreateLabel("Motivated by gddreamslenderman's", "person-standing")
local label1 = infoTab:CreateLabel("Warning: This is a testing version of the script. It is not fully functional and may contain bugs. Use at your own risk – the script is still under development.", "info")

--==	Quick Menu	==--
local QuickMenu = Window:CreateTab("Quick Menu", "zap") -- Title, Image"
local bBullets = false
local Toggle = QuickMenu:CreateToggle({
	Name = "Big bullets",
	CurrentValue = false,
	Flag = "bBulletsT", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		bBullets = Value
	end,
})
QuickMenu:CreateLabel("Hint: Not working on charged bullets", "message-circle")


QuickMenu:CreateSection("Global")
local qMLava = QuickMenu:CreateButton({
	Name = "Delete all lava",
	Callback = function()
		-- Stage 1
		if stage1.Lavas then
			stage1.Lavas:Destroy()
		else
			print("Stage 1 lavas not found")
		end
		-- Stage 2
		if stage2.Lavas then
			stage2.Lavas:Destroy()
		else
			print("Stage 2 lavas not found")
		end
		if stage2:FindFirstChild("Triggers") then
			stage2.Triggers:Destroy()
		else
			print("Stage 2 triggers not found")
		end
		-- Stage 3
		stage3func(1)
	end,
})


local qMhpNpc = QuickMenu:CreateButton({
	Name = "1Hp all NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 1)
				end
			end
		end
	end
})
local qMdelNpc = QuickMenu:CreateButton({
	Name = "Kill all NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 0)
				end
			end
		end
	end	
})

local delTraps = QuickMenu:CreateButton({
	Name = "Delete all traps",
	Callback = function()
		stage3func(2)
		for _, spike in pairs(stage4.Spike1:GetChildren(), stage4.Spike2:GetChildren()) do
			if spike:IsA("Model") and string.find(string.lower(spike.Name), "spike") then
				spike:Destroy()
			end
		end
		stage4.FakeIsland.Trigger:Destroy()
		stage4.FakeIsland.FakeButton:Destroy()
		stage4["Moving Platform"].BombHitbox:Destroy()
		stage4["Appear Brick 1"].Transparency = 0
		stage4.BlockTrap:Destroy()
	end	
})

local crPaths = QuickMenu:CreateButton({
	Name = "Create paths",
	Callback = function()
		createPl({22.999, -0.697, 307}, {0,0,0}, {20, 1.4, 20})
		createPl({-5.706, 2.205, 284.952}, {0, 135, 5}, {72, 1.4, 20})
		createPl({-48.654, 8.195, 278.744}, {0, 35, 0}, {38.823, 1.4, 20})
		createPl({-82.952, 3.942, 292.389}, {0, 10, 10}, {47.823, 1.4, 20})
		createPl({-198.219, -0.245, 296.428}, {0, 0, 0}, {189.566, 1.4, 20})
	end
})

QuickMenu:CreateSection('"Sagat, 1 "mini-boss"')
local hpBoss = QuickMenu:CreateButton({
	Name = "Last act Boss",
	Callback = function()
		task.spawn(function()
			local hitboxes = workspace.Map.Stage.Stage6.BossFight:WaitForChild("Hitboxes")
			hitboxes:SetAttribute("Health", 0)
		end)
	end,
})
local labBoss1 = QuickMenu:CreateLabel("Hint: Go to the middle platform", "message-circle")

local safeLavaBoss = QuickMenu:CreateButton({
	Name = "Safe lava",
	Callback = function()
		local lava = workspace.Map.Stage.Stage6.SagatRoom:FindFirstChild("Lava")
		lava.BrickColor = BrickColor.new("dark Dark stone grey")
		for _, part in ipairs(lava:GetChildren()) do
			part:Destroy()
		end
	end,
})
local killBoss = QuickMenu:CreateButton({
	Name = "Kill boss",
	Callback = function()
		task.spawn(function()
			local hitboxes = workspace.Map.Stage.Stage6.BossFight:WaitForChild("Hitboxes")
			for _, part in hitboxes:GetDescendants() do
				if part:IsA("BasePart") then
					part:Destroy()
				end
			end
			hitboxes:SetAttribute("Health", 0)
			task.wait(1)
			local tigerShoot = workspace.Map.Stage.Stage6.BossFight:WaitForChild("TigerShotCannon")
			if not tigerShoot then return end
			tigerShoot:SetAttribute("Health", 0)
		end)
	end,
})
local labBoss2 = QuickMenu:CreateLabel("Hint: Go to the middle platform so you don't get killed", "message-circle")

--==	Lava	==--
local lavaTab = Window:CreateTab("Lava", "flame") -- Title, Image
lavaTab:CreateSection("Global")
local lavaStage1 = lavaTab:CreateButton({
	Name = "Delete all lava",
	Callback = function()
		-- Stage 1
		if stage1.Lavas then
			stage1.Lavas:Destroy()
		else
			print("Stage 1 lavas not found")
		end
		-- Stage 2
		if stage2.Lavas then
			stage2.Lavas:Destroy()
		else
			print("Stage 2 lavasnot found")
		end
		if stage2.Triggers then
			stage2.Triggers:Destroy()
		else
			print("Stage 2 triggers not found")
		end
		-- Stage 3
		stage3func(1)
	end,
})

lavaTab:CreateSection("Stage 1")
local lavaStage1 = lavaTab:CreateButton({
	Name = "Delete lava",
	Callback = function()
		if stage1.Lavas then
			stage1.Lavas:Destroy()
		else
			print("Stage 1 lavas not found")
		end
	end,
})
lavaTab:CreateSection("Stage 2")
local lavaStage2 = lavaTab:CreateButton({
	Name = "Delete lava",
	Callback = function()
		if stage2.Lavas then
			stage2.Lavas:Destroy()
		else
			print("Stage 2 lavasnot found")
		end
	end,
})
lavaTab:CreateSection("Stage 3")
local lavaStage3 = lavaTab:CreateButton({
	Name = "Delete lava",
	Callback = function()
		stage3func(1)
	end,
})


--==	Trap	==--
local trapTab = Window:CreateTab("Traps", "triangle-alert") -- Title, Image
trapTab:CreateSection("Stage 3")
local trapsStage3 = trapTab:CreateButton({
	Name = "Untrigger traps",
	Callback = function()
		stage3func(2)
	end,
})
trapTab:CreateSection("Stage 4")
local spikeStage4 = trapTab:CreateButton({
	Name = "Delete spikes",
	Callback = function()
		for _, spike in pairs(stage4.Spike1:GetChildren(), stage4.Spike2:GetChildren()) do
			if spike:IsA("Model") and string.find(string.lower(spike.Name), "spike") then
				spike:Destroy()
			end
		end
	end,
})
local trapStage4 = trapTab:CreateButton({
	Name = "Delete traps",
	Callback = function()
		stage4.FakeIsland.Trigger:Destroy()
		stage4.FakeIsland.FakeButton:Destroy()
		stage4["Moving Platform"].BombHitbox:Destroy()
		stage4["Appear Brick 1"].Transparency = 0
		stage4.BlockTrap:Destroy()
	end,
})

--==	Paths	==--
local pathsTab = Window:CreateTab("Paths", "route") -- Title, Image
pathsTab:CreateSection("Stage 4")
local pathStage4 = pathsTab:CreateButton({
	Name = "Create path",
	Callback = function()
		createPl({22.999, -0.697, 307}, {0,0,0}, {20, 1.4, 20})
		createPl({-5.706, 2.205, 284.952}, {0, 135, 5}, {72, 1.4, 20})
		createPl({-48.654, 8.195, 278.744}, {0, 35, 0}, {38.823, 1.4, 20})
		createPl({-82.952, 3.942, 292.389}, {0, 10, 10}, {47.823, 1.4, 20})
		createPl({-198.219, -0.245, 296.428}, {0, 0, 0}, {189.566, 1.4, 20})
	end,
})

--==	NPCs	==--
local npcTab = Window:CreateTab("NPC", "bot") -- Title, Image
npcTab:CreateSection("Global")
local hpNpc = npcTab:CreateButton({
	Name = "1Hp NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 1)
				end
			end
		end
	end
})
local delNpc = npcTab:CreateButton({
	Name = "Kill NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 0)
				end
			end
		end
	end	
})

npcTab:CreateSection("Stage 3")
local hpNpcStage3 = npcTab:CreateButton({
	Name = "1Hp NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance and npc.Level == 3 then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 1)
				end
			end
		end
	end
})
local delNpcStage3 = npcTab:CreateButton({
	Name = "Kill NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance and npc.Level == 3 then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 0)
				end
			end
		end
	end	
})

npcTab:CreateSection("Stage 4")
local hpNpcStage4 = npcTab:CreateButton({
	Name = "1Hp NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance and npc.Level == 4 then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 1)
				end
			end
		end
	end
})
local delNpcStage4 = npcTab:CreateButton({
	Name = "Kill NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance and npc.Level == 4 then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 0)
				end
			end
		end
	end	
})

npcTab:CreateSection("Stage 5")
local hpNpcStage5 = npcTab:CreateButton({
	Name = "1Hp NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance and npc.Level == 5 then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 1)
				end
			end
		end
	end
})
local delNpcStage5 = npcTab:CreateButton({
	Name = "Kill NPCs",
	Callback = function()
		local NPCs = findNPCsWithLevels()
		if NPCs then
			for _, npc in pairs(NPCs) do
				if npc.Instance and npc.Level == 5 then 
					local stats : Folder = npc.Instance:FindFirstChild("Stats")
					stats:SetAttribute("health", 0)
				end
			end
		end
	end	
})
--==	Boss	==--
local bossTab = Window:CreateTab("Boss", "skull") -- Title, Image
bossTab:CreateSection('"Sagat, 1 "mini-boss"')
local hpBoss = bossTab:CreateButton({
	Name = "Last act Boss",
	Callback = function()
		task.spawn(function()
			local hitboxes = workspace.Map.Stage.Stage6.BossFight:WaitForChild("Hitboxes")
			hitboxes:SetAttribute("Health", 0)
		end)
	end,
})
local labBoss1 = bossTab:CreateLabel("Hint: Go to the middle platform", "message-circle")

local safeLavaBoss = bossTab:CreateButton({
	Name = "Safe lava",
	Callback = function()
		local lava = workspace.Map.Stage.Stage6.SagatRoom:FindFirstChild("Lava")
		lava.BrickColor = BrickColor.new("dark Dark stone grey")
		for _, part in ipairs(lava:GetChildren()) do
			part:Destroy()
		end
	end,
})

local unArmBoss = bossTab:CreateButton({
	Name = "Unarm boss",
	Callback = function()
		local plr = game.Players.LocalPlayer

		plr.CharacterAdded:Connect(function(char)
			local hum = char:WaitForChild("Humanoid")
			hum.HealthChanged:Connect(function()
				if hum.Health <= 0 then
					hum.Health = hum.MaxHealth
				end
			end)
		end)
	end,
})
local labBoss1 = bossTab:CreateLabel('Hint: Working 50/50', "message-circle")

local killBoss = bossTab:CreateButton({
	Name = "Kill boss",
	Callback = function()
		task.spawn(function()
			local hitboxes = workspace.Map.Stage.Stage6.BossFight:WaitForChild("Hitboxes")
			for _, part in hitboxes:GetDescendants() do
				if part:IsA("BasePart") then
					part:Destroy()
				end
			end
			hitboxes:SetAttribute("Health", 0)
			task.wait(1)
			local tigerShoot = workspace.Map.Stage.Stage6.BossFight:WaitForChild("TigerShotCannon")
			if not tigerShoot then return end
			tigerShoot:SetAttribute("Health", 0)
		end)
	end,
})
local labBoss1 = bossTab:CreateLabel("Hint: Go to the middle platform so you don't get killed", "message-circle")

local tParts = workspace.TempPart
tParts.ChildAdded:Connect(function(tempPart)
	if tempPart:IsA("BasePart") and tempPart.Name == "Part" and bBullets == true then
		tempPart.Size =	Vector3.new(2,2,2)
	end
end)

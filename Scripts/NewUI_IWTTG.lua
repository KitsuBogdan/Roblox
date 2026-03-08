local plr = game.Players.LocalPlayer
local map = workspace:FindFirstChild("Map")
local npcFolder = workspace:FindFirstChild("NPCs")

local stage1 = map.Stage.LavaStage
local stage2 = map.Stage.LavaStage2
local stage3 = map.Stage.Stage3
local stage4 = map.Stage.Stage4

-- == Helpful functions == --
local function destroy (obj)
	if obj then
		obj:Destroy()
	else
		warn("Attempted to destroy a", obj..".", "Object is nil.")
	end
end
local function createTempPlatform()
	local pTemplate = stage1:Clone()
	pTemplate.Name = "SafePlatform"
	pTemplate.Material = Enum.Material.SmoothPlastic
	pTemplate.BrickColor = BrickColor.new("Bright green")
	pTemplate.Transparency = 0.3
	pTemplate.Parent = game.ReplicatedStorage
	
	return pTemplate
end

local function createPlatform(pos, rot, size)
	local plat = createTempPlatform()
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

-- == Level recognition == --
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
	return nil
end

-- == NPCs recognition == --
local function findNPCsWithLevels()
	if not npcFolder then
		error("NPCs folder not found in workspace")
		return nil
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

-- Functional variables == --
local bBullets = false


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


local Lib = loadstring(game:HttpGet("https://library.nonamescr.workers.dev/"))()

Lib:Init("IWTTGame_NNHub")
local Window = Lib:CreateWindow("Noname Hub", "Blue")

-- == Info == --
local infoTab = Window:AddTab("Info")
infoTab:AddLabel("Welcome",plr.Name)
infoTab:AddLabel("UI and scripts:", "Noname Hub")
infoTab:AddLabel("Motivated to update from beta by: gddreamslenderman")
infoTab:AddLabel("Unofficial and non-public release: 3; Date: 2026-07-03")
infoTab:AddLabel("Warning: May contain vulnerabilities and bugs")
infoTab:AddLabel("Version: 2.0.0")


-- == Quick Menu == --
local quickTab = Window:AddTab("Quick Menu")

local quickTabBBSection = quickTab:AddSection("Big Bullets")
quickTabBBSection:AddToggle("Toggle", function(state)
	bBullets = state
end)
quickTabBBSection:AddLabel("Not working on over-charged bullets!")


local quickTabGlobalSection = quickTab:AddSection("Global")

quickTabGlobalSection:AddButton("Delete all lava", function()
	destroy(stage1.Lavas)
	destroy(stage2.Lavas)
	destroy(stage3.Lava)
end)

quickTabGlobalSection:AddButton("Delete all traps and spikes", function()
	destroy(stage2:FindFirstChild("Triggers"))
	destroy(stage3:FindFirstChild("Triggers"))
	
	for _, spike in pairs(stage4.Spike1:GetChildren(), stage4.Spike2:GetChildren()) do
		if spike:IsA("Model") and string.find(string.lower(spike.Name), "spike") then
			spike:Destroy()
		end
	end
	
	destroy(stage4.FakeIsland.Trigger)
	destroy(stage4.FakeIsland.FakeButton)
	destroy(stage4["Moving Platform"].BombHitbox)
	stage4["Appear Brick 1"].Transparency = 0
	destroy(stage4.BlockTrap)
end)

quickTabGlobalSection:AddButton("1hp all NPC's", function()
	warn("1hp all NPC's")
end)

quickTabGlobalSection:AddButton("Kill all NPC's", function()
	warn("Kill all NPC's")
end)


quickTabGlobalSection:AddButton("Create paths", function()
	createPlatform({22.999, -0.697, 307}, {0,0,0}, {20, 1.4, 20})
	createPlatform({-5.706, 2.205, 284.952}, {0, 135, 5}, {72, 1.4, 20})
	createPlatform({-48.654, 8.195, 278.744}, {0, 35, 0}, {38.823, 1.4, 20})
	createPlatform({-82.952, 3.942, 292.389}, {0, 10, 10}, {47.823, 1.4, 20})
	createPlatform({-198.219, -0.245, 296.428}, {0, 0, 0}, {189.566, 1.4, 20})
end)

quickTab:AddLabel("Sagat, first 'Mini-boss'")

local quickTabSagatHint1 = quickTab:AddSection("Hint: Go to the middle platform")
quickTabSagatHint1:AddButton("Last act boss", function()
	task.spawn(function()
		local hitboxes = workspace.Map.Stage.Stage6.BossFight:WaitForChild("Hitboxes")
		hitboxes:SetAttribute("Health", 0)
	end)
end)

local quickTabSagatHint2 = quickTab:AddSection("Hint: Go to the middle platform!!!")
quickTabSagatHint2:AddButton("Kill boss", function()
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
end)

quickTab:AddButton("Safe lava", function()
	local lava = workspace.Map.Stage.Stage6.SagatRoom:FindFirstChild("Lava")
	lava.BrickColor = BrickColor.new("dark Dark stone grey")
	for _, part in ipairs(lava:GetChildren()) do
		part:Destroy()
	end
end)


-- == Lava == --
local lavaTab = Window:AddTab("Lava")


local lavaTabGlobal = lavaTab:AddSection("Global")
lavaTabGlobal:AddButton("Delete all lava", function()
	destroy(stage1.Lavas)
	destroy(stage2.Lavas)
	destroy(stage3.Lava)
end)

local lavaTabStage1 = lavaTab:AddSection("Stage 1")
lavaTabStage1:AddButton("Delete lava", function()
	destroy(stage1.Lavas)
end)

local lavaTabStage2 = lavaTab:AddSection("Stage 2")
lavaTabStage2:AddButton("Delete lava", function()
	destroy(stage2.Lavas)
end)

local lavaTabStage3 = lavaTab:AddSection("Stage 3")
lavaTabStage3:AddButton("Delete lava", function()
	destroy(stage3.Lava)
end)

-- == Traps == --
local trapsTab = Window:AddTab("Traps")


local trapsTabGlobal = trapsTab:AddSection("Global")
trapsTabGlobal:AddButton("Delete all traps", function()
	destroy(stage2:FindFirstChild("Triggers"))
	destroy(stage3:FindFirstChild("Triggers"))

	for _, spike in pairs(stage4.Spike1:GetChildren(), stage4.Spike2:GetChildren()) do
		if spike:IsA("Model") and string.find(string.lower(spike.Name), "spike") then
			spike:Destroy()
		end
	end

	destroy(stage4.FakeIsland.Trigger)
	destroy(stage4.FakeIsland.FakeButton)
	destroy(stage4["Moving Platform"].BombHitbox)
	stage4["Appear Brick 1"].Transparency = 0
	destroy(stage4.BlockTrap)
end)

local trapsTabStage3 = trapsTab:AddSection("Stage 3")
trapsTabStage3:AddButton("Delete traps", function()
	destroy(stage3:FindFirstChild("Triggers"))
end)

local trapsTabStage4 = trapsTab:AddSection("Stage 4")
trapsTabStage4:AddButton("Delete traps", function()
	destroy(stage4.FakeIsland.Trigger)
	destroy(stage4.FakeIsland.FakeButton)
	destroy(stage4["Moving Platform"].BombHitbox)
	stage4["Appear Brick 1"].Transparency = 0
	destroy(stage4.BlockTrap)
end)
trapsTabStage4:AddButton("Delete spikes", function()
	for _, spike in pairs(stage4.Spike1:GetChildren(), stage4.Spike2:GetChildren()) do
		if spike:IsA("Model") and string.find(string.lower(spike.Name), "spike") then
			spike:Destroy()
		end
	end
end)


-- == Paths == --
local pathsTab = Window:AddTab("Paths")
local pathsTabStage4 = pathsTab:AddSection("Stage 4")
pathsTabStage4:AddButton("Create path", function()
	createPlatform({22.999, -0.697, 307}, {0,0,0}, {20, 1.4, 20})
	createPlatform({-5.706, 2.205, 284.952}, {0, 135, 5}, {72, 1.4, 20})
	createPlatform({-48.654, 8.195, 278.744}, {0, 35, 0}, {38.823, 1.4, 20})
	createPlatform({-82.952, 3.942, 292.389}, {0, 10, 10}, {47.823, 1.4, 20})
	createPlatform({-198.219, -0.245, 296.428}, {0, 0, 0}, {189.566, 1.4, 20})
end)



-- == NPCs == --
local npcsTab = Window:AddTab("NPC's")

local npcsTabGlobal = npcsTab:AddSection("Global")
npcsTabGlobal:AddButton("1hp all NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 1)
			end
		end
	end
end)

npcsTabGlobal:AddButton("Kill all NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 0)
			end
		end
	end
end)

local npcsTabStage3 = npcsTab:AddSection("Stage 3")
npcsTabStage3:AddButton("1hp NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance and npc.Level == 3 then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 1)
			end
		end
	end
end)
npcsTabStage3:AddButton("Kill NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance and npc.Level == 3 then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 0)
			end
		end
	end
end)

local npcsTabStage4 = npcsTab:AddSection("Stage 4")
npcsTabStage4:AddButton("1hp NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance and npc.Level == 4 then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 1)
			end
		end
	end
end)
npcsTabStage4:AddButton("Kill NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance and npc.Level == 4 then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 0)
			end
		end
	end
end)

local npcsTabStage5 = npcsTab:AddSection("Stage 5")
npcsTabStage5:AddButton("1hp NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance and npc.Level == 5 then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 1)
			end
		end
	end
end)
npcsTabStage5:AddButton("Kill NPC's", function()
	local NPCs = findNPCsWithLevels()
	if NPCs then
		for _, npc in pairs(NPCs) do
			if npc.Instance and npc.Level == 5 then 
				local stats : Folder = npc.Instance:FindFirstChild("Stats")
				stats:SetAttribute("health", 0)
			end
		end
	end
end)

-- == Bosses == --
local bossesTab = Window:AddTab("Boss's")

local bossesTabSagat = bossesTab:AddSection("Sagat, first 'mini-boss'")
local bossesTabSagatHint1 = bossesTabSagat:AddSection("Hint: Go to the middle platform")
bossesTabSagatHint1:AddButton("Last act Boss", function()
	task.spawn(function()
		local hitboxes = workspace.Map.Stage.Stage6.BossFight:WaitForChild("Hitboxes")
		hitboxes:SetAttribute("Health", 0)
	end)
end)

local bossesTabSagatHint2 = bossesTabSagat:AddSection("Hint: Working 50/50")
bossesTabSagatHint2:AddButton("Unarm Boss", function()
	plr.CharacterAdded:Connect(function(char)
		local hum = char:WaitForChild("Humanoid")
		hum.HealthChanged:Connect(function()
			if hum.Health < hum.MaxHealth then
				hum.Health = hum.MaxHealth
			end
		end)
	end)
end)

local bossesTabSagatHint3 = bossesTabSagat:AddSection("Hint: Go to the middle platform!!!")
bossesTabSagatHint3:AddButton("Kill Boss", function()
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
end)

bossesTab:AddButton("Safe lava", function()
	local lava = workspace.Map.Stage.Stage6.SagatRoom:FindFirstChild("Lava")
	lava.BrickColor = BrickColor.new("dark Dark stone grey")
	for _, part in ipairs(lava:GetChildren()) do
		part:Destroy()
	end
end)

local module = {}
local tweenService = game:GetService("TweenService")
local inputService = game:GetService("UserInputService")
local httpService = game:GetService("HttpService")
local runService = game:GetService("RunService")
local plr = game.Players.LocalPlayer
module.UId = nil
module.I = {Release = 1, Version = "1.0.0", Creator = "Noname Hub"}

local writefile = writefile or false
local isfile = isfile or false
local gethui = gethui or false
local readfile = readfile or false

-- THEMES
local Themes = {
	Red = {
		Background = Color3.fromRGB(40, 10, 10),
		Sidebar = Color3.fromRGB(55, 15, 15),
		Accent = Color3.fromRGB(255, 80, 80),
		Text = Color3.fromRGB(255, 200, 200),
		TextDark = Color3.fromRGB(150, 70, 70),
		Element = Color3.fromRGB(50, 15, 15),
		Stroke = Color3.fromRGB(70, 25, 25),
		toggleActive = Color3.fromRGB(255, 100, 100),
		toggleInActive = Color3.fromRGB(255, 150, 150),
	},
	Orange = {
		Background = Color3.fromRGB(30, 15, 5),
		Sidebar = Color3.fromRGB(45, 25, 10),
		Accent = Color3.fromRGB(255, 150, 50),
		Text = Color3.fromRGB(255, 220, 180),
		TextDark = Color3.fromRGB(150, 100, 50),
		Element = Color3.fromRGB(40, 20, 10),
		Stroke = Color3.fromRGB(60, 35, 20),
		toggleActive = Color3.fromRGB(255, 150, 50),
		toggleInActive = Color3.fromRGB(255, 180, 100),
	},
	Yellow = {
		Background = Color3.fromRGB(40, 40, 10),
		Sidebar = Color3.fromRGB(55, 55, 15),
		Accent = Color3.fromRGB(255, 255, 80),
		Text = Color3.fromRGB(255, 255, 200),
		TextDark = Color3.fromRGB(150, 150, 70),
		Element = Color3.fromRGB(50, 50, 15),
		Stroke = Color3.fromRGB(70, 70, 25),
		toggleActive = Color3.fromRGB(255, 255, 80),
		toggleInActive = Color3.fromRGB(255, 255, 150),
	},
	Green = {
		Background = Color3.fromRGB(10, 30, 10),
		Sidebar = Color3.fromRGB(15, 45, 15),
		Accent = Color3.fromRGB(80, 255, 80),
		Text = Color3.fromRGB(200, 255, 200),
		TextDark = Color3.fromRGB(70, 150, 70),
		Element = Color3.fromRGB(15, 40, 15),
		Stroke = Color3.fromRGB(25, 60, 25),
		toggleActive = Color3.fromRGB(80, 255, 80),
		toggleInActive = Color3.fromRGB(150, 255, 150),
	},
	Aqua = {
		Background = Color3.fromRGB(10, 20, 20),
		Sidebar = Color3.fromRGB(15, 25, 25),
		Accent = Color3.fromRGB(0, 255, 200),
		Text = Color3.fromRGB(240, 255, 250),
		TextDark = Color3.fromRGB(100, 150, 150),
		Element = Color3.fromRGB(20, 35, 35),
		Stroke = Color3.fromRGB(30, 50, 50),
		toggleActive = Color3.fromRGB(0, 255, 200),
		toggleInActive = Color3.fromRGB(150, 200, 200),
	},
	Blue = {
		Background = Color3.fromRGB(15, 15, 40),
		Sidebar = Color3.fromRGB(25, 25, 55),
		Accent = Color3.fromRGB(100, 125, 255),
		Text = Color3.fromRGB(220, 220, 255),
		TextDark = Color3.fromRGB(140, 140, 150),
		Element = Color3.fromRGB(28, 28, 35),
		Stroke = Color3.fromRGB(45, 45, 55),
		toggleActive = Color3.fromRGB(100, 125, 255),
		toggleInActive = Color3.fromRGB(30,30,40),
	},
	Purple = {
		Background = Color3.fromRGB(30, 15, 40),
		Sidebar = Color3.fromRGB(45, 25, 55),
		Accent = Color3.fromRGB(200, 100, 255),
		Text = Color3.fromRGB(255, 230, 255),
		TextDark = Color3.fromRGB(150, 120, 150),
		Element = Color3.fromRGB(35, 20, 50),
		Stroke = Color3.fromRGB(60, 40, 70),
		toggleActive = Color3.fromRGB(200, 100, 255),
		toggleInActive = Color3.fromRGB(255, 200, 255),
	},
	Dark = {
		Background = Color3.fromRGB(25, 25, 25),
		Sidebar = Color3.fromRGB(35, 35, 35),
		Accent = Color3.fromRGB(200, 200, 200),
		Text = Color3.fromRGB(240, 240, 240),
		TextDark = Color3.fromRGB(160, 160, 160),
		Element = Color3.fromRGB(45, 45, 45),
		Stroke = Color3.fromRGB(60, 60, 60),
		toggleActive = Color3.fromRGB(100, 125, 255),
		toggleInActive = Color3.fromRGB(25, 25, 25),
	},
	Light = {
		Background = Color3.fromRGB(245, 245, 245),
		Sidebar = Color3.fromRGB(230, 230, 230),
		Accent = Color3.fromRGB(60, 60, 60),
		Text = Color3.fromRGB(40, 40, 40),
		TextDark = Color3.fromRGB(100, 100, 100),
		Element = Color3.fromRGB(215, 215, 215),
		Stroke = Color3.fromRGB(190, 190, 190),
		toggleActive = Color3.fromRGB(100, 125, 255),
		toggleInActive = Color3.fromRGB(25, 25, 25),
	}
}
local toggleInactive = Color3.fromRGB(30,30,35)
local CurrentTheme = Themes.Dark

--[[
theme = table, {}
type:
Purple (themeName) = {
	Background = Color3(...),
	Sidebar = Color3(...),
	Accent = Color3(...),
	Text = Color3(...),
	TextDark = Color3(...),
	Element = Color3(...),
	Stroke = Color3(...)
module:importTheme(Purple)
window:SetTheme(Purple)
}
]]
function module:importTheme(theme)
	if typeof(theme) == "table" then
		for name, values in pairs(theme) do
			if typeof(values) == "table" then
				Themes[name] = values
			end
		end
	end
end

local isSaveble = false
--[[
UId - Unical ID
U can use anything as UId, but it's recommended to use the unical id.
This used in UName

UName - Unical Name
This used to save the settings of the UI in devices.
This name will be used to save the settings of the UI in the local storage.
Format - UId, PlaceId, Module Version
]]
function module:Init(UId)
	module.UName = string.format("%s|PId-%s|V-%s", UId, game.PlaceId, module.I.Version)
	isSaveble = true
end



-- HELPERS

local function roundToStep(value, step)
	local precision = 0
	if step < 1 then
		-- Визначаємо кількість знаків після коми
		precision = math.ceil(math.abs(math.log10(step)))
	end
	local mult = 10 ^ precision
	return math.floor(value * mult + 0.5) / mult
end

local function addUICorner(instance, radius)
	local c = Instance.new("UICorner")
	c.CornerRadius = UDim.new(0, radius)
	c.Parent = instance
end
local function rippleEffect(button)
	if not button then return end

	button.ClipsDescendants = true
	local debounce = false

	button.InputBegan:Connect(function(input)
		if input.UserInputType ~= Enum.UserInputType.MouseButton1
			and input.UserInputType ~= Enum.UserInputType.Touch then
			return
		end

		if debounce then return end
		debounce = true

		local ripple = Instance.new("Frame")
		ripple.BackgroundColor3 = CurrentTheme.Accent
		ripple.BackgroundTransparency = 0.6
		ripple.BorderSizePixel = 0
		ripple.AnchorPoint = Vector2.new(0.5,0.5)
		ripple.Size = UDim2.fromOffset(0,0)

		local clickPos = input.Position
		local relativeX = clickPos.X - button.AbsolutePosition.X
		local relativeY = clickPos.Y - button.AbsolutePosition.Y

		ripple.Position = UDim2.fromOffset(relativeX, relativeY)
		ripple.Parent = button

		addUICorner(ripple, 999)

		local sizeX = math.max(relativeX, button.AbsoluteSize.X - relativeX)
		local sizeY = math.max(relativeY, button.AbsoluteSize.Y - relativeY)
		local diameter = math.sqrt(sizeX^2 + sizeY^2) * 2

		tweenService:Create(
			ripple,
			TweenInfo.new(0.45, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
			{
				Size = UDim2.fromOffset(diameter, diameter),
				BackgroundTransparency = 1
			}
		):Play()

		task.delay(0.45, function()
			if ripple then
				ripple:Destroy()
			end
			debounce = false
		end)
	end)
end
local function addUIStroke(instance, color, thickness)
	local s = Instance.new("UIStroke")
	s.Color = color or CurrentTheme.Stroke
	s.Thickness = thickness or 1
	s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	s.Parent = instance
	s:SetAttribute("ThemeColor", "Stroke")
	return s
end
local function tween(obj, time, props, style, dir)
	return tweenService:Create(
		obj,
		TweenInfo.new(time or 0.25, style or Enum.EasingStyle.Quad, dir or Enum.EasingDirection.Out),
		props
	)
end
local function addHover(frame, target, original)
	local function getColor(val)
		if type(val) == "string" then
			return CurrentTheme[val] or Color3.new(1, 1, 1)
		elseif type(val) == "userdata" then 
			return val
		end
		return val
	end

	frame.MouseEnter:Connect(function()
		tween(frame, 0.15, {BackgroundColor3 = getColor(target)}):Play()
	end)

	frame.MouseLeave:Connect(function()
		tween(frame, 0.15, {BackgroundColor3 = getColor(original)}):Play()
	end)
end

local flags = {}
local saveDebounce = false

local function saveConfig()
	if not isSaveble then return end
	if type(writefile) ~= "function" then return end

	if saveDebounce then return end
	saveDebounce = true

	task.spawn(function()
		local success, err = pcall(function()
			local encoded = httpService:JSONEncode(flags)
			local fileName = tostring(module.UName):gsub("%W", "") .. ".json"
			writefile(fileName, encoded)
		end)

		if not success then
			warn("Save Error: " .. tostring(err))
		end

		task.wait(0.5)
		saveDebounce = false
	end)
end

------------------------------------------------------------------
-- WINDOW
------------------------------------------------------------------

--[[
Themes:
Red; Orange; Yellow; Green; Blue; Purple; Aqua; Dark; Light
]]
function module:CreateWindow(title, themeName)

	CurrentTheme = Themes[themeName] or Themes.Dark

	local fileName = tostring(module.UName):gsub("%W", "") .. ".json" -- ТАК САМО ЯК У SAVE
	flags = {}

	if isSaveble and type(readfile) == "function" then
		if isfile(fileName) then
			local success, decoded = pcall(function()
				return httpService:JSONDecode(readfile(fileName))
			end)
			if success and type(decoded) == "table" then
				flags = decoded 
			end
		end
	end

	local gui = Instance.new("ScreenGui")
	gui.Name = httpService:GenerateGUID(false)
	gui.Parent = (gethui and gethui()) or game.CoreGui or plr.PlayerGui
	gui.IgnoreGuiInset = true
	gui.ResetOnSpawn = true

	------------------------------------------------
	-- MAIN FRAME
	------------------------------------------------
	local isMobile = inputService.TouchEnabled and not inputService.KeyboardEnabled

	local main = Instance.new("CanvasGroup", gui)
	main.Size = isMobile and UDim2.new(.85,0,.75,0) or UDim2.new(0,720,0,500)
	main.AnchorPoint = isMobile and Vector2.new(.5,.0) or Vector2.new(.5,0,0,0)
	main.Position = isMobile and UDim2.new(0.5,0,0.15,0) or UDim2.new(0.5,0,0.1,0)
	main.BackgroundColor3 = CurrentTheme.Background
	main.GroupTransparency = 1
	main:SetAttribute("ThemeBackground","Background")

	addUICorner(main, 14)
	addUIStroke(main)

	local targetSize = isMobile and UDim2.new(.85,0,.75,0) or UDim2.new(0, 720, 0, 500)
	tween(main, 0.35, {Size = targetSize}):Play()
	tween(main, 0.35, {GroupTransparency = 0}):Play()

	------------------------------------------------
	-- HEADER
	------------------------------------------------

	local header = Instance.new("Frame", main)
	header.Size = UDim2.new(1,0,0,55)
	header.BackgroundTransparency = 1
	header:SetAttribute("ThemeRole","None")

	local titleL = Instance.new("TextLabel", header)
	titleL.Size = UDim2.new(1,-140,1,0)
	titleL.Position = UDim2.new(0,20,0,0)
	titleL.Text = title
	titleL.Font = Enum.Font.GothamBold
	titleL.TextSize = 20
	titleL.TextColor3 = CurrentTheme.Accent
	titleL.BackgroundTransparency = 1
	titleL.TextXAlignment = Enum.TextXAlignment.Left
	titleL:SetAttribute("ThemeText","Accent")

	local contentGroup = Instance.new("CanvasGroup")
	contentGroup.Parent = main
	contentGroup.Size = UDim2.new(1,0,1,-55)
	contentGroup.Position = UDim2.new(0,0,0,55)
	contentGroup.BackgroundTransparency = 1
	contentGroup.GroupTransparency = 0

	------------------------------------------------
	-- DRAG SYSTEM
	------------------------------------------------

	local dragging = false
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		main.Position = UDim2.new(
			startPos.X.Scale,
			startPos.X.Offset + delta.X,
			startPos.Y.Scale,
			startPos.Y.Offset + delta.Y
		)
	end

	header.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = main.Position
		end
	end)

	inputService.InputChanged:Connect(function(input)
		if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
			update(input)
		end
	end)

	inputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = false
		end
	end)

	------------------------------------------------
	-- CLOSE BUTTON
	------------------------------------------------

	local closeBtn = Instance.new("TextButton", header)
	closeBtn.Size = UDim2.new(0,40,0,40)
	closeBtn.Position = UDim2.new(1,-45,0,7)
	closeBtn.Text = "×"
	closeBtn.TextSize = 28
	closeBtn.TextColor3 = Color3.fromRGB(255,100,100)
	closeBtn.BackgroundTransparency = 1
	closeBtn:SetAttribute("ThemeRole","None")

	closeBtn.MouseButton1Click:Connect(function()
		tween(main,0.25,{GroupTransparency = 1}):Play()
		tween(main,0.25,{Size = UDim2.new(0,720,0,0)}):Play()
		task.wait(0.25)
		gui:Destroy()
	end)

	------------------------------------------------
	-- PREMIUM MINIMIZE SYSTEM (PC + MOBILE)
	------------------------------------------------

	local TweenService = game:GetService("TweenService")
	local UserInputService = game:GetService("UserInputService")
	local TextService = game:GetService("TextService")

	local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

	local minimized = false
	local animating = false

	main.AnchorPoint = Vector2.new(0.5, 0)

	local storedSize = main.Size
	local storedPosition = main.Position

	main.ClipsDescendants = true

	------------------------------------------------
	-- TWEEN HELPER
	------------------------------------------------
	local function tween(obj,time,props,style,direction)
		style = style or Enum.EasingStyle.Quint
		direction = direction or Enum.EasingDirection.Out

		local info = TweenInfo.new(time,style,direction)
		local tw = TweenService:Create(obj,info,props)
		tw:Play()
		return tw
	end

	------------------------------------------------
	-- FLOATING OPEN BUTTON (MOBILE)
	------------------------------------------------
	local openBtn = Instance.new("TextButton")
	openBtn.Parent = gui
	openBtn.AnchorPoint = Vector2.new(0.5,0.5)
	openBtn.Position = UDim2.new(0.5,0,0.5,0)
	openBtn.Size = UDim2.new(0,0,0,0)
	openBtn.BackgroundColor3 = CurrentTheme.Accent
	openBtn.Text = "UI"
	openBtn.TextColor3 = Color3.new(1,1,1)
	openBtn.TextSize = 18
	openBtn.Font = Enum.Font.GothamBold
	openBtn.Visible = false
	openBtn.AutoButtonColor = false
	openBtn:SetAttribute("ThemeBackground","Accent")

	addUICorner(openBtn, 30)
	addUIStroke(openBtn)
	rippleEffect(openBtn)

	------------------------------------------------
	-- MOBILE DRAG SYSTEM
	------------------------------------------------
	do
		local dragging = false
		local dragStart
		local startPos

		openBtn.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = true
				dragStart = input.Position
				startPos = openBtn.Position -- Беремо поточну позицію (Scale та Offset)
			end
		end)

		inputService.InputChanged:Connect(function(input)
			if dragging and (input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseMovement) then
				local delta = input.Position - dragStart

				-- Розраховуємо нові координати, зберігаючи Scale, але змінюючи Offset
				local newX = startPos.X.Offset + delta.X
				local newY = startPos.Y.Offset + delta.Y

				-- Обмеження, щоб не вилітало за екран (використовуємо AbsoluteSize батьківського GUI)
				local parentSize = gui.AbsoluteSize
				newX = math.clamp(newX, -openBtn.AbsolutePosition.X + openBtn.Position.X.Offset, parentSize.X - openBtn.AbsoluteSize.X)
				newY = math.clamp(newY, -openBtn.AbsolutePosition.Y + openBtn.Position.Y.Offset, parentSize.Y - openBtn.AbsoluteSize.Y)

				openBtn.Position = UDim2.new(startPos.X.Scale, newX, startPos.Y.Scale, newY)
			end
		end)

		inputService.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.Touch or input.UserInputType == Enum.UserInputType.MouseButton1 then
				dragging = false
			end
		end)
	end

	------------------------------------------------
	-- HEADER MIN BUTTON
	------------------------------------------------
	local minBtn = Instance.new("TextButton")
	minBtn.Parent = header
	minBtn.Size = UDim2.new(0,40,0,40)
	minBtn.Position = UDim2.new(1,-90,0,7)
	minBtn.Text = "−"
	minBtn.TextSize = 24
	minBtn.TextColor3 = CurrentTheme.TextDark
	minBtn.BackgroundTransparency = 1
	minBtn.AutoButtonColor = false
	minBtn:SetAttribute("ThemeText","TextDark")

	------------------------------------------------
	-- MOBILE OPEN LOGIC
	------------------------------------------------
	openBtn.MouseButton1Click:Connect(function()
		if animating then return end
		animating = true

		openBtn.Visible = false
		main.Visible = true

		main.Position = UDim2.new(
			storedPosition.X.Scale,
			storedPosition.X.Offset,
			1.2,0
		)

		contentGroup.GroupTransparency = 1

		tween(main,0.4,{
			Position = storedPosition
		},Enum.EasingStyle.Back,Enum.EasingDirection.Out)

		tween(contentGroup,0.3,{
			GroupTransparency = 0
		})

		task.wait(0.4)
		minimized = false
		animating = false
	end)

	------------------------------------------------
	-- MAIN MINIMIZE LOGIC
	------------------------------------------------
	minBtn.MouseButton1Click:Connect(function()
		if animating then return end
		animating = true

		if not minimized then
			minimized = true

			if isMobile then
				storedPosition = main.Position

				tween(main,0.35,{
					Position = UDim2.new(
						storedPosition.X.Scale,
						storedPosition.X.Offset,
						1.2,0
					)
				},Enum.EasingStyle.Back,Enum.EasingDirection.In)

				tween(contentGroup,0.25,{
					GroupTransparency = 1
				})

				task.wait(0.35)
				main.Visible = false

				openBtn.Size = UDim2.new(0,0,0,0)
				openBtn.Visible = true

				tween(openBtn,0.3,{
					Size = UDim2.new(0,70,0,70)
				},Enum.EasingStyle.Back,Enum.EasingDirection.Out)

			else
				------------------------------------
				-- PC TRUE HEADER COLLAPSE
				------------------------------------
				storedSize = main.Size
				local headerHeight = header.AbsoluteSize.Y
				local textLabel = titleL
				local originalTextSize = textLabel.TextSize

				tween(contentGroup,0.18,{
					GroupTransparency = 1
				})

				local textBounds = TextService:GetTextSize(
					textLabel.Text,
					textLabel.TextSize,
					textLabel.Font,
					Vector2.new(storedSize.X.Offset, headerHeight)
				)

				local buttonAreaWidth = 100
				local textWidth = TextService:GetTextSize(
					textLabel.Text,
					textLabel.TextSize,
					textLabel.Font,
					Vector2.new(storedSize.X.Offset - buttonAreaWidth, headerHeight)
				).X

				local targetWidth = math.max(textWidth + 20 + buttonAreaWidth, 150) 
				tween(main,0.25,{
					Size = UDim2.new(0, targetWidth, 0, headerHeight)
				},Enum.EasingStyle.Cubic,Enum.EasingDirection.Out)

				tween(minBtn,0.15,{
					Rotation = 180
				})
				minBtn.Text = "+"
			end
		else
			minimized = false

			if isMobile then
				------------------------------------
				-- MOBILE RESTORE
				------------------------------------
				openBtn.Visible = false
				main.Visible = true

				tween(main,0.4,{
					Position = storedPosition
				},Enum.EasingStyle.Back,Enum.EasingDirection.Out)

				tween(contentGroup,0.3,{
					GroupTransparency = 0
				})

			else
				------------------------------------
				-- PC RESTORE
				------------------------------------
				local restoreSize = isMobile and UDim2.new(.85,0,.75,0) or UDim2.new(0, 720, 0, 500)
				tween(main, 0.3, {
					Size = restoreSize
				}, Enum.EasingStyle.Quint, Enum.EasingDirection.Out)

				tween(contentGroup,0.22,{
					GroupTransparency = 0
				})

				tween(minBtn,0.15,{
					Rotation = 0
				})

				minBtn.Text = "−"
			end
		end

		task.wait(0.35)
		animating = false
	end)

	------------------------------------------------
	-- BODY
	------------------------------------------------


	local sidebar = Instance.new("Frame")
	sidebar.Parent = contentGroup
	sidebar.Size = UDim2.new(0,200,1,0)
	sidebar.Position = UDim2.new(0,0,0,0)
	sidebar.BackgroundColor3 = CurrentTheme.Sidebar
	sidebar:SetAttribute("ThemeBackground","Sidebar")
	addUICorner(sidebar, 12)

	local lgLayout = Instance.new("UIListLayout")
	lgLayout.Parent = sidebar
	lgLayout.FillDirection = Enum.FillDirection.Vertical
	lgLayout.Padding = UDim.new(0,6)
	lgLayout:SetAttribute("ThemeRole","None")
	
	local excFolder = Instance.new("Folder", sidebar)
	excFolder.Name = "excludeFold"
	
	local accentBar = Instance.new("Frame", excFolder)
	accentBar.BackgroundColor3 = CurrentTheme.Accent
	accentBar:SetAttribute("ThemeBackground", "Accent")
	accentBar.Size = UDim2.new(0,8,0,25)
	accentBar.Position = UDim2.new(0,5,0,10)
	addUICorner(accentBar, 12)

	local container = Instance.new("Frame")
	container.Parent = contentGroup
	container.Size = UDim2.new(1,-200,1,0)
	container.Position = UDim2.new(0,203,0,0)
	container.BackgroundTransparency = 1
	container.ClipsDescendants = true
	lgLayout:SetAttribute("ThemeRole","container")


	local pageLayout = Instance.new("UIPageLayout")
	pageLayout.Parent = container
	pageLayout.Padding = UDim.new(0,5)
	pageLayout.SortOrder = Enum.SortOrder.LayoutOrder
	pageLayout.TweenTime = 0.25
	pageLayout.EasingStyle = Enum.EasingStyle.Quint
	pageLayout.EasingDirection = Enum.EasingDirection.Out
	pageLayout:SetAttribute("ThemeRole","None")


	------------------------------------------------
	-- NOTIFY HOLDER
	------------------------------------------------

	local notifyHolder = Instance.new("Frame")
	notifyHolder.Parent = gui
	notifyHolder.Size = UDim2.new(0,300,1,-20)
	notifyHolder.Position = UDim2.new(1,-320,0,10)
	notifyHolder.BackgroundTransparency = 1
	notifyHolder:SetAttribute("ThemeRole","None")


	local layout = Instance.new("UIListLayout")
	layout.Parent = notifyHolder
	layout.Padding = UDim.new(0,10)
	layout.VerticalAlignment = Enum.VerticalAlignment.Bottom
	layout:SetAttribute("ThemeRole","None")


	------------------------------------------------
	-- WINDOW OBJECT
	------------------------------------------------

	local window = {}
	window._gui = gui
	window._main = main
	window._titleLabel = titleL
	window._sidebar = sidebar
	window._container = container
	window._storedSize = main.Size
	window._minimized = false
	window._ActiveDropdown = nil
	window._objsCount = 0
	window._ActiveTab = nil

	function window:SetTitle(text)

		local label = window._titleLabel
		if not label then return end

		tween(label,0.15,{
			TextTransparency = 1
		}):Play()

		task.wait(0.15)

		label.Text = text

		tween(label,0.15,{
			TextTransparency = 0
		}):Play()
	end

	function window:Notify(text, duration)
		duration = duration or 3

		local sound = Instance.new("Sound")
		sound.SoundId = "rbxassetid://139162619516355"
		sound.Volume = 0.5
		sound.Parent = game:GetService("SoundService")
		sound:Play()
		game:GetService("Debris"):AddItem(sound, 2)

		local n = Instance.new("Frame")
		n.Parent = notifyHolder
		n.Size = UDim2.new(1,0,0,0)
		n.Position = UDim2.new(1,20,0,0)
		n.BackgroundColor3 = CurrentTheme.Element
		n.BackgroundTransparency = 1
		n.ClipsDescendants = true
		n.AutomaticSize = Enum.AutomaticSize.Y
		n:SetAttribute("ThemeBackground","Element")

		addUICorner(n,10)

		local stroke = addUIStroke(n)
		stroke.Transparency = 1
		stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

		local icon = Instance.new("ImageLabel")
		icon.Parent = n
		icon.Size = UDim2.new(0,20,0,20)
		icon.Position = UDim2.new(0,12,0,12)
		icon.BackgroundTransparency = 1
		icon.Image = "rbxassetid://10734950309"
		icon.ImageColor3 = CurrentTheme.Accent
		icon.ImageTransparency = 1

		local lbl = Instance.new("TextLabel")
		lbl.Parent = n
		lbl.Size = UDim2.new(1,-50,0,0)
		lbl.Position = UDim2.new(0,42,0,12)
		lbl.BackgroundTransparency = 1
		lbl.Text = text
		lbl.TextWrapped = true
		lbl.Font = Enum.Font.GothamMedium
		lbl.TextSize = 13
		lbl.TextColor3 = CurrentTheme.Text
		lbl.TextTransparency = 1
		lbl.TextXAlignment = Enum.TextXAlignment.Left
		lbl.AutomaticSize = Enum.AutomaticSize.Y
		lbl:SetAttribute("ThemeText","Text")

		local padding = Instance.new("UIPadding")
		padding.Parent = n
		padding.PaddingBottom = UDim.new(0,16)
		padding.PaddingTop = UDim.new(0,14)
		padding.PaddingRight = UDim.new(0,12)

		local barBg = Instance.new("Frame")
		barBg.Parent = n
		barBg.Size = UDim2.new(1,0,0,2)
		barBg.Position = UDim2.new(0,0,1,-1)
		barBg.BackgroundColor3 = CurrentTheme.Accent
		barBg.BackgroundTransparency = 0.8
		barBg.BorderSizePixel = 0

		local bar = Instance.new("Frame")
		bar.Parent = barBg
		bar.Size = UDim2.new(1,0,1,0)
		bar.BackgroundColor3 = CurrentTheme.Accent
		bar.BorderSizePixel = 0
		bar:SetAttribute("ThemeBackground","Accent")

		tween(n,0.35,{
			BackgroundTransparency = 0.05,
			Position = UDim2.new(0,0,0,0)
		}):Play()

		tween(lbl,0.35,{TextTransparency = 0}):Play()
		tween(icon,0.35,{ImageTransparency = 0}):Play()
		tween(stroke,0.35,{Transparency = 0.7}):Play()

		local timerTween = tween(bar,duration,{
			Size = UDim2.new(0,0,1,0)
		})
		timerTween:Play()

		local hovering = false

		n.MouseEnter:Connect(function()
			hovering = true
			timerTween:Pause()
		end)

		n.MouseLeave:Connect(function()
			hovering = false
			timerTween:Play()
		end)

		timerTween.Completed:Wait()

		if hovering then
			repeat task.wait() until not hovering
		end

		local close = tween(n,0.35,{
			BackgroundTransparency = 1,
			Position = UDim2.new(1,20,0,0)
		})

		tween(lbl,0.25,{TextTransparency = 1}):Play()
		tween(icon,0.25,{ImageTransparency = 1}):Play()
		tween(stroke,0.25,{Transparency = 1}):Play()

		close:Play()
		close.Completed:Wait()

		n:Destroy()
	end

	function window:GetFlags()
		return flags
	end

	function window:SetFlag(name, value)
		flags[name] = value
		saveConfig()
	end

	function window:ResetConfig()
		flags = {}
		saveConfig()
	end

	function window:SetTheme(themeName)
		local newTheme = Themes[themeName]
		if not newTheme then return end

		CurrentTheme = newTheme

		for _, obj in ipairs(window._gui:GetDescendants()) do

			if obj:GetAttribute("ThemeBackground") then
				tween(obj,1,{
					BackgroundColor3 = newTheme[obj:GetAttribute("ThemeBackground")]
				}):Play()
			end
			
			if obj:GetAttribute("ThemeText") then
				if window._ActiveTab == obj then
					tween(obj,1,{
						TextColor3 = newTheme.Accent
					}):Play()
				else
					tween(obj,1,{
						TextColor3 = newTheme[obj:GetAttribute("ThemeText")]
					}):Play()
				end
				
			end
			
			if obj:GetAttribute("ThemeColor") then
				tween(obj,1,{
					Color = newTheme[obj:GetAttribute("ThemeColor")]
				}):Play()
			end
			
			if obj:GetAttribute("ThemeScrollbar") then
				tween(obj,1,{
					ScrollBarImageColor3 = newTheme[obj:GetAttribute("ThemeScrollbar")]
				}):Play()
			end
			
		end
	end
	
	local isfirst = true
	function window:AddTab(name)
		local tBtn = Instance.new("TextButton", sidebar)
		tBtn.Size = UDim2.new(1, -10, 0, 45)
		tBtn.TextSize = 17
		tBtn.BackgroundTransparency = 1
		tBtn.Text = "  " .. name
		tBtn.TextColor3 = isfirst and CurrentTheme.Accent or CurrentTheme.TextDark
		tBtn.Font = Enum.Font.GothamMedium
		tBtn.TextXAlignment = "Left"
		tBtn:SetAttribute("ThemeText","TextDark")
		if isfirst then
			isfirst = false
			window._ActiveTab = tBtn
		end
		
		local padding = Instance.new("UIPadding", tBtn)
		padding.PaddingLeft = UDim.new(0,10)
		
		local page = Instance.new("ScrollingFrame", container)
		page.Size = UDim2.new(.985, 0, 1, 0)
		page.BackgroundTransparency = 1
		page.ScrollBarThickness = 2
		page.ScrollBarImageColor3 = CurrentTheme.Accent
		page.AutomaticCanvasSize = Enum.AutomaticSize.Y
		page.ClipsDescendants = true
		page:SetAttribute("ThemeScrollbar","Accent")
		
		local offset = Instance.new("Frame", page)
		offset.Size = UDim2.new(0.05, 0, 0, 10)
		offset.Interactable = false
		offset.LayoutOrder = -666
		offset.BackgroundTransparency = 1
		offset.Name = "tabOffset"
		
		local pList = Instance.new("UIListLayout", page)
		pList.Padding = UDim.new(.01, 5)
		pList.HorizontalAlignment = Enum.HorizontalAlignment.Center
		pList.SortOrder = Enum.SortOrder.LayoutOrder

		pList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			page.CanvasSize = UDim2.new(0, 0, 0, pList.AbsoluteContentSize.Y + 10)
		end)

		tBtn.MouseButton1Click:Connect(function()
			pageLayout:JumpTo(page)
			for _, v in ipairs(sidebar:GetChildren()) do
				if v:IsA("TextButton") then v.TextColor3 = CurrentTheme.TextDark end
			end
			tBtn.TextColor3 = CurrentTheme.Accent

			local relativeY = tBtn.AbsolutePosition.Y - sidebar.AbsolutePosition.Y
			local centerOffsetY = (tBtn.AbsoluteSize.Y / 2) - (accentBar.Size.Y.Offset / 2)

			tweenService:Create(accentBar, TweenInfo.new(0.35, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
				Position = UDim2.new(0, 5, 0, relativeY + centerOffsetY)
			}):Play()
			
			window._ActiveTab = tBtn
		end)

		local elements = {}
		function elements:AddLabel(text: string)
			local parent = self.Container or page


			local label = Instance.new("TextLabel")
			label.Name = "Label_" .. text:sub(1, 10)
			label.Parent = parent


			label.Text = text
			label.Size = UDim2.new(1, -10, 0, 0)
			label.BackgroundTransparency = 1
			label.TextColor3 = CurrentTheme.Text
			label.TextXAlignment = Enum.TextXAlignment.Left
			label.Font = Enum.Font.GothamBold
			label.TextSize = 20
			label.TextWrapped = true
			label.AutomaticSize = Enum.AutomaticSize.Y

			label:SetAttribute("ThemeText", "Text")

			local padding = Instance.new("UIPadding")
			padding.PaddingLeft = UDim.new(0, 8)
			padding.PaddingRight = UDim.new(0, 8)
			padding.Parent = label
			
			local accentBar = Instance.new("Frame", label)
			accentBar.Size = UDim2.new(0, 2, 0.8, 0)
			accentBar.Position = UDim2.new(0, 0, 0.1, 0)
			accentBar.BackgroundColor3 = CurrentTheme.Accent
			accentBar.BorderSizePixel = 0

			local labObj = {
				Object = label,
				Text = text
			}

			function labObj:Set(newText)
				for i = 1, #newText do
					label.Text = newText:sub(1, i)
					task.wait(0.05)
				end
			end

			return labObj
		end
		
		function elements:AddButton(text, callback)
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -10, 0, 40)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = text
			b.Font = Enum.Font.GothamMedium
			b.TextColor3 = CurrentTheme.Text
			b.TextSize = 20
			b:SetAttribute("ThemeBackground","Element")
			b:SetAttribute("ThemeText","Text")


			addUICorner(b, 8)
			addUIStroke(b)
			rippleEffect(b)
			if typeof(callback) == "function" then
				b.MouseButton1Click:Connect(callback) 
			end
		end

		function elements:AddInput(text, placeholder, callback)
			window._objsCount += 1
			local objId = "input_" .. text:gsub("%s+", "") .. window._objsCount
			callback = typeof(callback) == "function" and callback or function() end
			local currentVal = flags[objId.. "_text"] or ""
			
			local parent = self.Container or page
			local iFrame = Instance.new("Frame", parent)
			iFrame.Size = UDim2.new(1, -20, 0, 70)
			iFrame.BackgroundColor3 = CurrentTheme.Element
			iFrame:SetAttribute("ThemeBackground","Element")
			addUICorner(iFrame, 12)
			addUIStroke(iFrame)

			addHover(iFrame, "Sidebar", "Element")

			local label = Instance.new("TextLabel", iFrame)
			label.Size = UDim2.new(1, -20, 0, 22)
			label.Position = UDim2.new(0, 15, 0, 8)
			label.Text = text
			label.TextColor3 = CurrentTheme.TextDark
			label.Font = Enum.Font.GothamMedium
			label.TextSize = 16
			label.BackgroundTransparency = 1
			label.TextXAlignment = Enum.TextXAlignment.Left
			label:SetAttribute("ThemeText","TextDark")

			local box = Instance.new("TextBox", iFrame)
			box.Size = UDim2.new(1, -30, 0, 32)
			box.Position = UDim2.new(0, 15, 0, 32)
			box.BackgroundColor3 = CurrentTheme.Background
			box.Text = currentVal
			box.PlaceholderText = placeholder or "Enter value..."
			box.PlaceholderColor3 = Color3.fromRGB(140,140,150)
			box.TextColor3 = CurrentTheme.Text
			box.Font = Enum.Font.Gotham
			box.TextSize = 16
			box.ClearTextOnFocus = false
			box.TextXAlignment = Enum.TextXAlignment.Left
			box:SetAttribute("ThemeBackground","Background")
			box:SetAttribute("ThemeText","Text")
			addUICorner(box, 8)
			addUIStroke(box)

			box.Focused:Connect(function()
				tweenService:Create(box, TweenInfo.new(0.15), {
					BackgroundColor3 = CurrentTheme.Background
				}):Play()
			end)

			box.FocusLost:Connect(function()
				tweenService:Create(box, TweenInfo.new(0.15), {
					BackgroundColor3 = Color3.fromRGB(30,30,35)
				}):Play()

				flags[objId.. "_text"] = box.Text
				saveConfig()
				if typeof(callback) == "function" then
					callback(box.Text)
				end
			end)

			if currentVal ~= "" then
				callback(currentVal)
			end
		end

		function elements:AddToggle(text, callback)
			window._objsCount += 1
			local objId = "toggle_" .. text:gsub("%s+", "") .. window._objsCount

			callback = typeof(callback) == "function" and callback or function() end
			local state = flags[objId.. "_state"] or false
			
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -10, 0, 52)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = "   " .. text
			b.Font = Enum.Font.GothamMedium
			b.TextSize = 18
			b.TextColor3 = CurrentTheme.Text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.AutoButtonColor = false
			b:SetAttribute("ThemeBackground","Element")
			b:SetAttribute("ThemeText","Text")
			addUICorner(b, 12)
			addUIStroke(b)
			
			addHover(b, "Sidebar", "Element")

			local switch = Instance.new("Frame", b)
			switch.Size = UDim2.new(0, 44, 0, 24)
			switch.Position = UDim2.new(1, -65, 0.5, -12)
			switch.BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
			switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
			addUICorner(switch, 20)

			local dot = Instance.new("Frame", switch)
			dot.Size = UDim2.new(0, 18, 0, 18)
			dot.Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
			dot.BackgroundColor3 = Color3.new(1,1,1)
			addUICorner(dot, 20)

			local function update()
				tweenService:Create(switch, TweenInfo.new(0.2), {
					BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
				}):Play()

				tweenService:Create(dot, TweenInfo.new(0.2), {
					Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
				}):Play()

				flags[objId.. "_state"] = state
				saveConfig()
				if typeof(callback) == "function" then
					callback(state)
				end
			end

			b.MouseButton1Click:Connect(function()
				state = not state
				switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
				update()
			end)

			task.defer(function()
				callback(state)
			end)
		end

		function elements:AddToggleKeybind(text, defaultKey, callback)
			window._objsCount += 1
			local objId = "toggleKeybind_" .. text:gsub("%s+", "") .. window._objsCount
			callback = typeof(callback) == "function" and callback or function() end

			local state = flags[objId.. "_state"] or false
			local key = flags[objId .. "_key"] or defaultKey
			local listening = false
			
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -20, 0, 52)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = "   " .. text
			b.Font = Enum.Font.GothamMedium
			b.TextSize = 18
			b.TextColor3 = CurrentTheme.Text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.AutoButtonColor = false
			b:SetAttribute("ThemeBackground","Element")
			b:SetAttribute("ThemeText","Text")
			addUICorner(b, 12)
			addUIStroke(b)

			addHover(b, "Sidebar", "Element")

			--------------------------------------------------
			-- TOGGLE
			--------------------------------------------------

			local switch = Instance.new("Frame", b)
			switch.Size = UDim2.new(0, 44, 0, 24)
			switch.Position = UDim2.new(1, -170, 0.5, -12)
			switch.BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
			switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
			addUICorner(switch, 20)

			local dot = Instance.new("Frame", switch)
			dot.Size = UDim2.new(0, 18, 0, 18)
			dot.Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
			dot.BackgroundColor3 = Color3.new(1,1,1)
			dot:SetAttribute("ThemeRole","None")

			addUICorner(dot, 20)

			--------------------------------------------------
			-- KEYBIND BOX
			--------------------------------------------------

			local keyLabel = Instance.new("TextLabel", b)
			keyLabel.Size = UDim2.new(0, 80, 0, 28)
			keyLabel.Position = UDim2.new(1, -100, 0.5, -14)
			keyLabel.BackgroundColor3 = CurrentTheme.Background
			keyLabel.Text = key.Name
			keyLabel.Font = Enum.Font.GothamBold
			keyLabel.TextSize = 16
			keyLabel.TextColor3 = CurrentTheme.Accent
			keyLabel.TextXAlignment = Enum.TextXAlignment.Center
			keyLabel:SetAttribute("ThemeBackground","Background")
			keyLabel:SetAttribute("ThemeText","Accent")
			addUICorner(keyLabel, 8)
			addUIStroke(keyLabel)

			--------------------------------------------------
			-- UPDATE FUNCTION
			--------------------------------------------------

			local function update()
				tweenService:Create(switch, TweenInfo.new(0.2), {
					BackgroundColor3 = state and CurrentTheme.toggleActive or CurrentTheme.toggleInActive
				}):Play()

				tweenService:Create(dot, TweenInfo.new(0.2), {
					Position = state and UDim2.new(1, -22, 0.5, -9) or UDim2.new(0, 4, 0.5, -9)
				}):Play()

				flags[objId.. "_state"] = state
				saveConfig()
				if typeof(callback) == "function" then
					callback(state)
				end
			end

			--------------------------------------------------
			-- TOGGLE CLICK
			--------------------------------------------------

			b.MouseButton1Click:Connect(function()
				if listening then return end
				state = not state
				switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
				update()
			end)

			--------------------------------------------------
			-- KEY SELECT MODE
			--------------------------------------------------

			keyLabel.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then

					listening = true
					keyLabel.Text = "..."

					tweenService:Create(keyLabel, TweenInfo.new(0.2), {
						BackgroundColor3 = CurrentTheme.Accent
					}):Play()
				end
			end)

			--------------------------------------------------
			-- INPUT LISTENER
			--------------------------------------------------

			inputService.InputBegan:Connect(function(i, gpe)
				if gpe then return end

				if listening and i.UserInputType == Enum.UserInputType.Keyboard then
					key = i.KeyCode
					keyLabel.Text = key.Name
					listening = false

					tweenService:Create(keyLabel, TweenInfo.new(0.2), {
						BackgroundColor3 = CurrentTheme.Background
					}):Play()

					flags[objId.. "_key"] = key
					saveConfig()

				elseif not listening and i.KeyCode == key then
					state = not state
					switch:SetAttribute("ThemeBackground",state and "toggleActive" or "toggleInActive")
					update()
				end
			end)

			task.defer(function()
				callback(state)
			end)
		end

		function elements:AddSlider(text, min, max, defaultValue, step, callback)
			step = step or 1
			
			window._objsCount += 1
			local objId = "slider_" .. text:gsub("%s+", "") .. window._objsCount

			local isMobile = inputService.TouchEnabled and not inputService.KeyboardEnabled
			local buttonSize = isMobile and 50 or 40
			local textSize = isMobile and 20 or 18
			local height = isMobile and 110 or 95
			
			
			local val = flags[objId.. "_val"] or defaultValue
			val = math.clamp(val, min, max)
			
			local parent = self.Container or page
			local sFrame = Instance.new("Frame", parent)
			sFrame.Size = UDim2.new(1, -10, 0, height)
			sFrame.BackgroundColor3 = CurrentTheme.Element
			sFrame:SetAttribute("ThemeBackground", "Element")
			addUICorner(sFrame, 12)
			addUIStroke(sFrame)

			local label = Instance.new("TextLabel", sFrame)
			label.Size = UDim2.new(1, -20, 0, 30)
			label.Position = UDim2.new(0, 10, 0, 5)
			label.BackgroundTransparency = 1
			label.Text = text
			label.TextColor3 = CurrentTheme.Text
			label.Font = Enum.Font.GothamMedium
			label.TextSize = textSize
			label.TextXAlignment = Enum.TextXAlignment.Left
			label:SetAttribute("ThemeText", "Text")

			local controls = Instance.new("Frame", sFrame)
			controls.Size = UDim2.new(1, -20, 0, buttonSize)
			controls.Position = UDim2.new(0, 10, 0, 35)
			controls.BackgroundTransparency = 1

			local minus = Instance.new("TextButton", controls)
			minus.Size = UDim2.new(0, buttonSize, 1, 0)
			minus.Text = "-"
			minus.Font = Enum.Font.GothamBold
			minus.TextSize = textSize + 2
			minus.BackgroundColor3 = CurrentTheme.Sidebar
			minus.TextColor3 = CurrentTheme.Text
			minus:SetAttribute("ThemeBackground", "Sidebar")
			minus:SetAttribute("ThemeText", "Text")
			addUICorner(minus, 10)

			local valueBox = Instance.new("TextBox", controls)
			valueBox.Size = UDim2.new(1, -(buttonSize * 2 + 20), 1, 0)
			valueBox.Position = UDim2.new(0, buttonSize + 10, 0, 0)
			valueBox.BackgroundColor3 = CurrentTheme.Background
			valueBox.Text = tostring(val)
			valueBox.TextColor3 = CurrentTheme.Text
			valueBox.Font = Enum.Font.GothamMedium
			valueBox.TextSize = textSize
			valueBox.ClearTextOnFocus = false
			valueBox:SetAttribute("ThemeBackground", "Background")
			valueBox:SetAttribute("ThemeText", "Text")
			addUICorner(valueBox, 10)

			local plus = Instance.new("TextButton", controls)
			plus.Size = UDim2.new(0, buttonSize, 1, 0)
			plus.Position = UDim2.new(1, -buttonSize, 0, 0)
			plus.Text = "+"
			plus.Font = Enum.Font.GothamBold
			plus.TextSize = textSize + 2
			plus.BackgroundColor3 = CurrentTheme.Sidebar
			plus.TextColor3 = CurrentTheme.Text
			plus:SetAttribute("ThemeBackground", "Sidebar")
			plus:SetAttribute("ThemeText", "Text")
			addUICorner(plus, 10)

			local bar = Instance.new("Frame", sFrame)
			bar.Size = UDim2.new(1, -20, 0, isMobile and 10 or 8)
			bar.Position = UDim2.new(0, 10, 1, -15)
			bar.BackgroundColor3 = Color3.fromRGB(50,50,60)
			addUICorner(bar, 5)

			local fill = Instance.new("Frame", bar)
			fill.BackgroundColor3 = CurrentTheme.Accent
			fill:SetAttribute("ThemeBackground", "Accent")
			addUICorner(fill, 5)

			local function updateVisual(animated)
				local percent = (val - min) / (max - min)

				if animated then
					tweenService:Create(fill, TweenInfo.new(0.15), {
						Size = UDim2.new(percent,0,1,0)
					}):Play()
				else
					fill.Size = UDim2.new(percent,0,1,0)
				end

				valueBox.Text = tostring(val)

				flags[objId.. "_val"] = val
				saveConfig()
				if typeof(callback) == "function" then
					callback(val)
				end
			end

			updateVisual(false)

			local dragging = false

			bar.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					dragging = true
				end
			end)

			inputService.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					dragging = false
				end
			end)

			inputService.InputChanged:Connect(function(input)
				if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement
					or input.UserInputType == Enum.UserInputType.Touch) then

					local percent = math.clamp(
						(input.Position.X - bar.AbsolutePosition.X) / bar.AbsoluteSize.X,
						0,1
					)

					local raw = min + (max - min) * percent
					local steppedVal = math.floor(raw / step + 0.5) * step
					val = math.clamp(roundToStep(steppedVal, step), min, max)

					updateVisual(false)
				end
			end)

			local function hold(button, direction)
				local holding = true

				local function change()
					val = math.clamp(roundToStep(val + (step * direction), step), min, max)
					updateVisual(true)
				end

				change()

				task.spawn(function()
					task.wait(0.4)
					while holding do
						change()
						task.wait(0.08)
					end
				end)

				button.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1
						or input.UserInputType == Enum.UserInputType.Touch then
						holding = false
					end
				end)
			end

			minus.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					hold(minus, -1)
				end
			end)

			plus.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1
					or input.UserInputType == Enum.UserInputType.Touch then
					hold(plus, 1)
				end
			end)

			valueBox.FocusLost:Connect(function()
				local number = tonumber(valueBox.Text)
				if number then
					local steppedVal = math.floor(number / step + 0.5) * step
					val = math.clamp(roundToStep(steppedVal, step), min, max)
					updateVisual(true)
				else
					valueBox.Text = tostring(val)
				end
			end)

			task.spawn(function()
				if typeof(callback) == "function" then
					callback(val)
				end
			end)
		end

		function elements:AddKeybind(text, defaultKey, callback)
			window._objsCount += 1
			local objId = "keybind_" .. text:gsub("%s+", "") .. window._objsCount

			callback = typeof(callback) == "function" and callback or function() end
			local key = flags[objId.. "_key"] or defaultKey
			
			local parent = self.Container or page
			local b = Instance.new("TextButton", parent)
			b.Size = UDim2.new(1, -20, 0, 52)
			b.BackgroundColor3 = CurrentTheme.Element
			b.Text = "   " .. text
			b.Font = Enum.Font.Gotham
			b.TextSize = 18
			b.TextColor3 = CurrentTheme.Text
			b.TextXAlignment = Enum.TextXAlignment.Left
			b.AutoButtonColor = false
			b:SetAttribute("ThemeBackground", "Element")
			b:SetAttribute("ThemeText", "Text")
			addUICorner(b, 12)
			addUIStroke(b)

			addHover(b, "Sidebar", "Element")

			local keyLabel = Instance.new("TextLabel", b)
			keyLabel.Size = UDim2.new(0, 80, 0, 28)
			keyLabel.Position = UDim2.new(1, -100, 0.5, -14)
			keyLabel.BackgroundColor3 = CurrentTheme.Background
			keyLabel.Text = key.Name
			keyLabel.Font = Enum.Font.GothamBold
			keyLabel.TextSize = 16
			keyLabel.TextColor3 = CurrentTheme.Accent
			keyLabel.TextXAlignment = Enum.TextXAlignment.Center
			keyLabel:SetAttribute("ThemeBackground", "Background")
			keyLabel:SetAttribute("ThemeText", "Accent")
			addUICorner(keyLabel, 8)
			addUIStroke(keyLabel)

			local listening = false

			b.MouseButton1Click:Connect(function()
				listening = true
				keyLabel.Text = "..."
				tweenService:Create(keyLabel, TweenInfo.new(0.2), {
					BackgroundColor3 = CurrentTheme.Accent
				}):Play()
			end)

			inputService.InputBegan:Connect(function(i, gpe)
				if gpe then return end

				if listening and i.UserInputType == Enum.UserInputType.Keyboard then
					key = i.KeyCode
					keyLabel.Text = key.Name
					listening = false

					tweenService:Create(keyLabel, TweenInfo.new(0.2), {
						BackgroundColor3 = CurrentTheme.Background
					}):Play()

					flags[objId.."_key"] = key

				elseif not listening and i.KeyCode == key then
					callback()
				end
			end)
		end

		function elements:AddDropdown(text : string, list : {}, callback)
			window._objsCount += 1
			local drop = {}
			drop.objId = "dropdown_" .. text:gsub("%s+", "") .. window._objsCount
			local selected = nil
			local isOpen = false
	
			
			if typeof(list) == "string" then
				local t = {}
				for item in string.gmatch(list,"[^,]+") do
					table.insert(t,item:match("^%s*(.-)%s*$"))
				end
				list = t
			end

			local ITEM_HEIGHT = 32
			local MAX_VISIBLE = 6
			
			local parent = self.Container or page
			local dFrame = Instance.new("Frame", parent)
			dFrame.Size = UDim2.new(1,-10,0,45)
			dFrame.BackgroundColor3 = CurrentTheme.Element
			dFrame:SetAttribute("ThemeBackground", "Element")
			addUICorner(dFrame,10)
			addUIStroke(dFrame)

			local mainB = Instance.new("TextButton", dFrame)
			mainB.Size = UDim2.new(1,0,1,0)
			mainB.BackgroundTransparency = 1
			mainB.Text = "  "..text
			mainB.TextColor3 = CurrentTheme.Text
			mainB.Font = Enum.Font.GothamMedium
			mainB.TextSize = 17
			mainB.TextXAlignment = Enum.TextXAlignment.Left
			mainB:SetAttribute("ThemeText", "Text")

			local arrow = Instance.new("TextLabel", mainB)
			arrow.Size = UDim2.new(0,30,1,0)
			arrow.Position = UDim2.new(1,-35,0,0)
			arrow.BackgroundTransparency = 1
			arrow.Text = "▼"
			arrow.Font = Enum.Font.GothamBold
			arrow.TextSize = 16
			arrow.TextColor3 = CurrentTheme.Text
			arrow:SetAttribute("ThemeText", "Text")

			local holder = Instance.new("Frame", gui)
			holder.BackgroundTransparency = 1
			holder.Visible = false
			holder.ZIndex = 50

			local container = Instance.new("ScrollingFrame", holder)
			container.BackgroundColor3 = CurrentTheme.Element
			container.BorderSizePixel = 0
			container.ScrollBarThickness = 4
			container.AutomaticCanvasSize = Enum.AutomaticSize.Y
			container.ZIndex = 51
			container:SetAttribute("ThemeBackground", "Element")
			addUICorner(container,10)
			addUIStroke(container)
			
			local searchBox

			if #list >= 10 then
				searchBox = Instance.new("TextBox",holder)
				searchBox.Position = UDim2.new(0,0,-.2,0)
				searchBox.Size = UDim2.new(1,0,0,30)
				searchBox.BackgroundColor3 = CurrentTheme.Element
				searchBox.PlaceholderText = "Search..."
				searchBox.Text = ""
				searchBox.Name = "SearchBox"
				searchBox.Font = Enum.Font.Gotham
				searchBox.TextSize = 15
				searchBox.TextColor3 = CurrentTheme.Text
				searchBox:SetAttribute("ThemeBackground", "Element")
				searchBox:SetAttribute("ThemeText", "Text")
				addUICorner(searchBox,8)
				addUIStroke(searchBox)

				container.Position = UDim2.new(0,0,0,34)

			end

			local layout = Instance.new("UIListLayout", container)
			layout.Padding = UDim.new(0,4)

			local function updatePosition()

				local pos = dFrame.AbsolutePosition
				local size = dFrame.AbsoluteSize
				local screen = workspace.CurrentCamera.ViewportSize

				local dropdownHeight = math.min(#list,MAX_VISIBLE)*(ITEM_HEIGHT+4)

				local spaceBelow = screen.Y - (pos.Y + size.Y) - 100
				local spaceAbove = pos.Y

				local openUp = spaceBelow < dropdownHeight and spaceAbove > dropdownHeight

				holder.Size = UDim2.fromOffset(size.X, dropdownHeight)

				if openUp then

					holder.Position = UDim2.fromOffset(
						pos.X,
						pos.Y
					)

					container.AnchorPoint = Vector2.new(0,1)
					container.Position = UDim2.new(0,0,1,0)

				else

					holder.Position = UDim2.fromOffset(
						pos.X,
						pos.Y + size.Y + 15
					)

					container.AnchorPoint = Vector2.new(0,0)
					container.Position = UDim2.new(0,0,0,0)

				end

				container.Size = UDim2.new(1,0,1,0)

			end
			
			local function refresh(filter)

				for _,v in ipairs(container:GetChildren()) do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end

				for _,val in ipairs(list) do

					if filter and not string.find(
						string.lower(val),
						string.lower(filter)
						) then
						continue
					end

					local b = Instance.new("TextButton",container)
					b.Size = UDim2.new(1,-8,0,ITEM_HEIGHT)
					b.BackgroundColor3 = CurrentTheme.Element
					b.Text = tostring(val)
					b.Font = Enum.Font.Gotham
					b.TextSize = 16
					b.TextColor3 = CurrentTheme.Text
					b.ZIndex = 52
					b:SetAttribute("ThemeBackground", "Element")
					b:SetAttribute("ThemeText", "Text")
					addUICorner(b,8)

					rippleEffect(b)

					b.MouseButton1Click:Connect(function()

						selected = val
						mainB.Text = "  "..text..": "..val

						if callback then
							callback(val)
						end

						isOpen = false
						holder.Visible = false
						arrow.Text = "▼"

					end)

				end

			end

			refresh()
			
			if searchBox then

				searchBox:GetPropertyChangedSignal("Text"):Connect(function()
					refresh(searchBox.Text)
				end)

			end

			mainB.MouseButton1Click:Connect(function()

				isOpen = not isOpen

				if isOpen then
					if window._ActiveDropdown and window._ActiveDropdown.objId ~= drop.objId then
						window._ActiveDropdown:Close()
					end
					window._ActiveDropdown = drop
					container.Size = UDim2.new(
						1,0,
						0,math.min(#list,MAX_VISIBLE)*(ITEM_HEIGHT+4)
					)

					task.wait()
					updatePosition()

					holder.Visible = true
					container.Size = UDim2.new(1,0,0,0)

					local target = math.min(#list,MAX_VISIBLE)*(ITEM_HEIGHT+4)

					tweenService:Create(container,TweenInfo.new(.2),{
						Size = UDim2.new(1,0,0,target)
					}):Play()

					arrow.Text = "▲"

				else

					tweenService:Create(container,TweenInfo.new(.15),{
						Size = UDim2.new(1,0,0,0)
					}):Play()

					task.delay(.15,function()
						holder.Visible = false
					end)

					arrow.Text = "▼"

				end

			end)

			inputService.InputBegan:Connect(function(i,gpe)

				if gpe or not isOpen then return end
				if i.UserInputType ~= Enum.UserInputType.MouseButton1 then return end

				local mouse = inputService:GetMouseLocation()
				local pos = holder.AbsolutePosition
				local size = holder.AbsoluteSize

				if not (
					mouse.X > pos.X and mouse.X < pos.X + size.X and
						mouse.Y > pos.Y and mouse.Y < pos.Y + size.Y
					) then

					isOpen = false
					holder.Visible = false
					arrow.Text = "▼"

				end

			end)

			function drop:Set(value)

				selected = value
				mainB.Text = "  "..text..": "..value

			end

			function drop:Update(newList)

				list = newList
				refresh()

			end
			
			function drop:Close()
				isOpen = false
				tweenService:Create(container,TweenInfo.new(.15),{
					Size = UDim2.new(1,0,0,0)
				}):Play()

				task.delay(.15,function()
					holder.Visible = false
				end)

				arrow.Text = "▼"
			end
			
			window._ActiveDropdown = drop
			
			return drop

		end
		
		function elements:AddSection(title)

			local section = {}

			local parent = self.Container or page
			local frame = Instance.new("Frame", parent)
			frame.Size = UDim2.new(1, -10, 0, 0)
			frame.AutomaticSize = Enum.AutomaticSize.Y
			frame.BackgroundColor3 = CurrentTheme.Element
			frame.ClipsDescendants = true
			frame:SetAttribute("ThemeBackground","Element")
			addUICorner(frame, 10)
			addUIStroke(frame)

			local layout = Instance.new("UIListLayout", frame)
			layout.Padding = UDim.new(0,8)
			layout.SortOrder = Enum.SortOrder.LayoutOrder
			
			local padding0 = Instance.new("UIPadding", frame)
			padding0.Parent = frame
			padding0.PaddingBottom = UDim.new(0,10)

			local titleLabel = Instance.new("TextLabel", frame)
			titleLabel.Size = UDim2.new(1,-20,0,34)
			titleLabel.BackgroundTransparency = 1
			titleLabel.Text = title
			titleLabel.Font = Enum.Font.GothamBold
			titleLabel.TextSize = 25
			titleLabel.TextColor3 = CurrentTheme.Accent
			titleLabel.TextXAlignment = Enum.TextXAlignment.Left
			titleLabel.LayoutOrder = 1
			titleLabel:SetAttribute("ThemeText","Accent")
			
			local padding1 = Instance.new("UIPadding", titleLabel)
			padding1.PaddingLeft = UDim.new(0,10)
			padding1.Name = "textPadding"
			
			local separator = Instance.new("Frame", frame)
			separator.Size = UDim2.new(1.2,-20,0,1)
			separator.BackgroundColor3 = Color3.fromRGB(60,60,70)
			separator.BorderSizePixel = 0
			separator.LayoutOrder = 2

			local container = Instance.new("Frame", frame)
			container.Size = UDim2.new(1,0,0,0)
			container.AutomaticSize = Enum.AutomaticSize.Y
			container.BackgroundTransparency = 1
			container.LayoutOrder = 3

			local containerLayout = Instance.new("UIListLayout", container)
			containerLayout.Padding = UDim.new(0,6)
			containerLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			containerLayout.SortOrder = Enum.SortOrder.LayoutOrder

			section.Container = container

			setmetatable(section, {__index = elements})

			return section
		end
		
		return elements
	end

	return window
end

return module

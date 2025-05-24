# How to Use NoName GUI Library for Roblox

NoName GUI Library is a lightweight and easy-to-use Roblox GUI framework that helps you create GUI windows, tabs, buttons, toggles, labels, and textboxes quickly.

---

## 1. Setup

Load the library module directly from the GitHub raw URL and require it:

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/KitsuBogdan/Roblox/refs/heads/main/Libraries/NoNameGUI/Library"))()
local GuiLib = require(lib)
````

This code fetches and initializes the GUI library as `GuiLib`.

---

## 2. Create the GUI Window

Initialize the main GUI window with a custom name (this name is for your reference):

```lua
GuiLib.createGui('Gulik_Library')
```

---

## 3. Create Tabs

You can add two types of tabs to your GUI window:

* **List Tab** — vertical list style, suitable for menus or grouped items.

```lua
GuiLib.createListTab("Main")
```

* **Table Tab** — grid or table style, great for multiple buttons or structured layouts.

```lua
GuiLib.createTableTab("table")
```

---

## 4. Add Elements to Tabs

### 4.1 Label

Add a simple static text label inside a tab:

```lua
GuiLib.CreateLabel("Hello from guldell(creator)", "Main")
```

---

### 4.2 Buttons (Click Buttons)

Add clickable buttons with callbacks.

* Using an inline anonymous function:

```lua
GuiLib.createClickBtn("Hello World", "Main", function()
    print("Hello from MyTab!")
end)
```

* Using a predefined function:

```lua
function helloworld()
    print("Hello from MyTab!")
end

GuiLib.createClickBtn("Hello World func", "Main", helloworld)
```

---

### 4.3 Toggle

Add a toggle switch with default state and a callback triggered on toggle:

```lua
local infJumpEnabled = false

GuiLib.createToggle("Inf Jump", "Main", false, function(state)
    infJumpEnabled = state
    print("Inf Jump toggled:", state)
end)
```

Example usage — infinite jump implementation with the toggle:

```lua
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)
```

---

### 4.4 Textbox

Add a textbox input box with placeholder text, default value, and a callback when the user types something:

```lua
GuiLib.createTextbox("Type your name here...", "Main", "", function(text)
    print("User typed:", text)
end)
```

---

## 5. Multiple Buttons Example in Table Tab

You can add many buttons quickly inside a tab, here is an example:

```lua
GuiLib.createTableTab("table")

for i = 1, 3 do
    GuiLib.createClickBtn("Hello World", "table", function()
        print("Hello from MyTab!")
    end)
end
```

---

## 6. Summary of Available Functions

| Function                                                                                             | Parameters                                      | Description                       |
| ---------------------------------------------------------------------------------------------------- | ----------------------------------------------- | --------------------------------- |
| `createGui(name: string)`                                                                            | `name`: GUI window name                         | Creates the main GUI window       |
| `createListTab(name: string)`                                                                        | `name`: tab name                                | Creates a vertical list tab       |
| `createTableTab(name: string)`                                                                       | `name`: tab name                                | Creates a table/grid style tab    |
| `CreateLabel(text: string, tab: string)`                                                             | `text`: label text, `tab`: target tab           | Adds a label to the specified tab |
| `createClickBtn(text: string, tab: string, callback: function)`                                      | Button text, tab name, callback function        | Adds a clickable button           |
| `createToggle(text: string, tab: string, default: boolean, callback: function(state: boolean))`      | Toggle label, tab name, default state, callback | Adds a toggle switch              |
| `createTextbox(placeholder: string, tab: string, default: string, callback: function(text: string))` | Placeholder, tab name, default text, callback   | Adds a textbox input              |

---

## 7. Full Example Script

Here’s a complete example to demonstrate usage:

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/KitsuBogdan/Roblox/refs/heads/main/Libraries/NoNameGUI/Library"))()
local GuiLib = require(lib)

GuiLib.createGui('Gulik_Library')
GuiLib.createListTab("Main")

GuiLib.CreateLabel("Hello from guldell(creator)", "Main")

GuiLib.createClickBtn("Hello World", "Main", function()
    print("Hello from MyTab!")
end)

function helloworld()
    print("Hello from MyTab!")
end

GuiLib.createClickBtn("Hello World func", "Main", helloworld)

local infJumpEnabled = false

GuiLib.createToggle("Inf Jump", "Main", false, function(state)
    infJumpEnabled = state
    print("Inf Jump toggled:", state)
end)

game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJumpEnabled then
        local character = game.Players.LocalPlayer.Character
        if character then
            local humanoid = character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end
    end
end)

GuiLib.createTextbox("Type your name here...", "Main", "", function(text)
    print("User typed:", text)
end)

GuiLib.createTableTab("table")

for i = 1, 3 do
    GuiLib.createClickBtn("Hello World", "table", function()
        print("Hello from MyTab!")
    end)
end
```

---

## 8. Troubleshooting & Notes

* Ensure your Roblox executor supports `loadstring` and `HttpGet` functions.
* The GUI will be created inside Roblox’s `PlayerGui`.
* You can create multiple tabs and add any supported elements as needed.
* Callbacks execute in the local player context.
* Customize element texts and tab names freely.

---

Thank you for using NoName GUI Library! For any issues or feature requests, please open an issue on the GitHub repo.

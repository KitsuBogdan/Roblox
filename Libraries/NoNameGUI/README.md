# 🧰 NoNameGUI Library for Roblox

---

## 🌟 Features

* 📋 Tabbed UI (List & Table styles)
* 🖱️ Clickable buttons with callbacks
* ✅ Toggles with state detection
* 🧾 Textboxes with input handling (custom height)
* 🎚️ Sliders (e.g. for FPS limit, with custom width)
* 🧩 Modular & clean Lua API
* ⚡ Easy integration via `loadstring`

---

## 📦 Installation

To install, simply require the library via HTTP GET and `require` it:

```lua
local GuiLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/KitsuBogdan/Roblox/main/Libraries/NoNameGUI/Library.lua"))()
```

---

## 🛠️ Example Usage

```lua
-- Initialize the GUI
GuiLib.createGui('Gulik_Library')

-- Create a list-style tab
GuiLib.createListTab("Main")

-- Add a label
GuiLib.CreateLabel("Hello from guldell (creator)", "Main")

-- Add clickable buttons
GuiLib.createClickBtn("Hello World", "Main", function()
    print("Hello from MyTab!")
end)

-- Using a named function
function helloWorld()
    print("Hello from MyTab!")
end
GuiLib.createClickBtn("Hello World func", "Main", helloWorld)

-- Toggle button (e.g. for Infinite Jump)
local infJumpEnabled = false
GuiLib.createToggle("Inf Jump", "Main", false, function(state)
    infJumpEnabled = state
    print("Inf Jump toggled:", state)
end)

-- Infinite jump functionality
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

-- Textbox for user input with optional custom height (sizey)
GuiLib.createTextbox("Type your name here...", "Main", "", function(text)
    print("User typed:", text)
end, 0.2)

-- Slider with optional custom width (sizex)
GuiLib.createSlider("FPS Limit", "Main", 60, function(value)
    print("FPS Limit set to", value)
end, 0.4)

-- Create a table-style tab
GuiLib.createTableTab("table")

-- Add a button in the table tab
GuiLib.createClickBtn("Hello World", "table", function()
    print("Hello from table!")
end)
```

---

## 📄 API Reference

### 🧱 Basic Setup

| Function               | Description                       |
| ---------------------- | --------------------------------- |
| `createGui(name)`      | Initializes the main GUI window   |
| `createListTab(name)`  | Creates a vertical list-style tab |
| `createTableTab(name)` | Creates a grid/table-style tab    |

---

### 🔘 UI Elements

| Function                                                        | Description                                                               |
| --------------------------------------------------------------- | ------------------------------------------------------------------------- |
| `CreateLabel(text, tabName)`                                    | Adds a static text label to a specified tab                               |
| `createClickBtn(text, tabName, callback)`                       | Adds a clickable button with a callback function                          |
| `createToggle(text, tabName, default, callback)`                | Adds a toggle switch with initial state and callback                      |
| `createTextbox(placeholder, tabName, default, callback, sizey)` | Adds a textbox with placeholder, input callback and optional height scale |
| `createSlider(label, tabName, defaultValue, callback, sizex)`   | Adds a slider control with default value, callback and optional width     |

> **Note**: `sizex` (for sliders) and `sizey` (for textboxes) are optional `number` values between `0.1` and `1.0`, representing UI scale:
>
> * `0.2` = 20% height (textbox) or width (slider) relative to container
> * Useful for custom/responsive GUI layouts

---

## 🎨 Theme Customization

You can customize the overall look of your GUI by selecting one of the predefined color themes.

### How to apply a theme:

1. After creating the GUI with `createGui()`, set the `GuiLib.Theme` property to one of the available themes.
2. Available themes include:
   `purple`, `red`, `blue`, `green`, `orange`, `pink`, `gray`, `white`, `black`.

### Example:

```lua
GuiLib.createGui('Gulik_Library')

-- Set the theme to red
GuiLib.Theme = GuiLib.Themes.red
```

This will update the GUI colors instantly, applying the selected theme palette for backgrounds, buttons, toggles, sliders, and text.

---

## 📌 Notes

* The GUI is **client-side only**, visible and functional only for the local player.
* Modular by design — each tab and component is independent.
* Easy to extend: create your own UI elements or styles by forking the library.
* All callbacks are instant and receive the current value of the control.

---

## 🙏 Credits

Created by **guldell**
GitHub: [KitsuBogdan](https://github.com/KitsuBogdan)

---

## 📅 Changelog

See [CHANGELOG.md](CHANGELOG.md) for detailed version history.

---

# NoNameGUI Library Guide

This guide explains how to use the **NoNameGUI Library** for Roblox to create simple and modular GUIs with tabs, buttons, toggles, textboxes, sliders, and more.

---

## 📥 Installation

Load and require the library in your LocalScript:

```lua
local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/KitsuBogdan/Roblox/main/Libraries/NoNameGUI/Library"))()
local GuiLib = require(lib)
````

---

## 🚀 Getting Started

1. **Create the main GUI window:**

```lua
GuiLib.createGui('Your_GUI_Name')
```

2. **Create tabs for organizing UI elements:**

```lua
GuiLib.createListTab("Main")   -- List-style tab
GuiLib.createTableTab("Settings") -- Table-style tab
```

---

## 🧩 Adding UI Elements

### Label

Displays static text on a tab:

```lua
GuiLib.CreateLabel("Welcome to NoNameGUI", "Main")
```

### Click Button

Creates a button with a callback function:

```lua
GuiLib.createClickBtn("Click Me!", "Main", function()
    print("Button clicked!")
end)
```

### Toggle

A switch button that can be turned on/off:

```lua
local toggleState = false
GuiLib.createToggle("Enable Feature", "Main", false, function(state)
    toggleState = state
    print("Toggle is now", state)
end)
```

### Textbox

Allows user to input text:

```lua
GuiLib.createTextbox("Enter your name...", "Main", "", function(text)
    print("User typed:", text)
end)
```

### Slider

A draggable slider control for numeric values:

```lua
GuiLib.createSlider("Volume", "Settings", 50, function(value)
    print("Volume set to", value)
end)
```

---

## ⚙️ Example: Infinite Jump Toggle

```lua
local infJumpEnabled = false

GuiLib.createToggle("Infinite Jump", "Main", false, function(state)
    infJumpEnabled = state
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
```

---

## 📜 API Summary

| Function                                                 | Purpose                          |
| -------------------------------------------------------- | -------------------------------- |
| `createGui(name)`                                        | Create the main GUI window       |
| `createListTab(tabName)`                                 | Create a vertical list-style tab |
| `createTableTab(tabName)`                                | Create a table/grid-style tab    |
| `CreateLabel(text, tabName)`                             | Add a label to a tab             |
| `createClickBtn(text, tabName, callback)`                | Add a clickable button           |
| `createToggle(text, tabName, default, callback)`         | Add a toggle switch              |
| `createTextbox(placeholder, tabName, default, callback)` | Add a textbox for input          |
| `createSlider(label, tabName, defaultValue, callback)`   | Add a slider control             |

---

## 🔗 Resources

* [GitHub Repository](https://github.com/KitsuBogdan/Roblox/tree/main/Libraries/NoNameGUI)
* [Full README](../../Libraries/NoNameGUI)
* [ChangeLog](https://github.com/KitsuBogdan/Roblox/tree/main/Libraries/NoNameGUI)

---


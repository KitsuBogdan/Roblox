# Roblox GUI library - "Non UI"

## 🚀 Features
* **PC & Mobile Support**: The UI automatically adapts to the user's device. It self-configures element scaling, hitboxes, and input methods (mouse vs touch) to ensure a high-quality UX.
* **Dynamic Theme System**: Support for custom themes (Dark/Light) that can be swapped in real-time without restarting the script.
* **Modular Logic**: Create windows, tabs, and toggles using a simple, readable API designed for speed.
* **Smooth Animations**: Powered by TweenService for polished transitions, fading effects, and interactive hover states.

| Category | Technology |
| --- | --- |
| **Language** | Luau (Roblox) |
| **Execution** | Loadstring & URL Fetching |
| **UI Type** | Modular Ui Library |
| **Data/Config Storage** | writefile / readfile (JSON) |

## 🏁 Getting Started
### Prerequisites

To use **Non UI**, ensure your environment meets the following requirements:
* **Supported Executor**: Any Level 7+ executor (e.g., Wave, Solara, Swift, or similar).
* **Permissions**: The script requires `HttpGet` and `loadstring` enabled to fetch the library and assets.
* **File System (Optional)**: Required for **Auto-Save Config**. If your executor lacks `writefile`/`readfile` support, the feature will **automatically disable itself during execution**, allowing the UI to run smoothly without errors.
* **UI Compatibility**: Optimized for all screen resolutions, including **Mobile (Touch)** and **PC (1080p/1440p/4K)**.

### 💡 Supports:

| Feature | Support |
| --- | --- |
| **Mobile (iOS/Android)** | ✅ Full (Touch-optimized) |
| **PC (Windows/Mac)** | ✅ Full (Mouse/Keyboard) |
| **Auto-Save** | ✅ Supported (Workspace folder) |
| **Custom Themes** | ⚠ Not fully finalized |

### Installation:

Simply copy and paste this loadstring into your executor:

```lua
local NonUI = loadstring(game:HttpGet("[https://raw.githubusercontent.com/YourName/NonUI/main/Source.lua](https://raw.githubusercontent.com/YourName/NonUI/main/Source.lua)"))()

-- Your script logic goes here
```

## ✨ API Methods
### `Library`

The main module used to initialize the UI and create windows.
 
* **`NonUI:Init(UId: string)`** Initializes the library with a unique identifier. This `UId` is used to create a unique save file name for your configurations (format: `UId|PlaceId|Version`).

* **`NonUI:CreateWindow(title: string, themeName: string)`** Creates the main UI window. If `themeName` is not provided, it defaults to **"Dark"**.
**Available Themes**: `Red`, `Orange`, `Yellow`, `Green`, `Blue`, `Purple`, `Aqua`, `Dark`, `Light`.

* **NonUI.I**: A table containing internal build information, such as `Version` (currently 0.8.5) and `Release` status.
* **NonUI.UId**: The Unique Identifier for your project, set via the `Init` method. It ensures that configuration files are unique to your specific script.

* **`Library:importTheme(themeTable: table)`** Allows you to inject custom color schemes into the library's theme registry. ⚠ Not fully finalized 

### `Window`
The object returned by `CreateWindow`. Used to manage the UI container and global settings.
 
* **`Window:AddTab(name: string)`** Creates a new sidebar tab and a corresponding scrolling page for elements.

* **`Window:SetTitle(text: string)`** Updates the main window's title text with a smooth fade animation.

* **`Window:Notify(text: string, duration: number)`** Sends a notification pop-up at the bottom-right of the screen.

* **`Window:SetTheme(themeName: string)`** Changes the UI theme in real-time.

* **`Window:GetFlags()`** Returns the current table of all saved states (toggles, inputs, sliders).

* **`Window:ResetConfig()`** Clears all saved flags and resets the local JSON configuration file.

### `Elements`

Methods available within each **Tab** to add interactive components.

* **`Tab:AddLabel(text: string)`** Adds a text label. Returns an object with a `:Set(newText)` method.

* **`Tab:AddButton(text: string, callback: function)`** Adds a clickable button with a ripple effect.

* **`Tab:AddToggle(text: string, callback: function)`** Adds a switch. Automatically saves its state and triggers the callback on execution and change.

* **`Tab:AddInput(text: string, placeholder: string, callback: function)`** Adds a text box for user input. Saves the value automatically.

* **`Tab:AddToggleKeybind(text: string, defaultKey: Enum.KeyCode, callback: function)`** A toggle that can also be triggered by a customizable keybind.

* **`Tab:AddSlider(text: string, min: number, max: number, default: number, step: number, callback: function)`** Adds a functional slider for numerical values.

## 🖥️ Usage

```lua
local NonUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/YourName/NonUI/main/Source.lua"))()

-- 1. Initialize with a Unique ID for Auto-Saving
NonUI:Init("MyUniqueProjectID")

-- 2. Create the Main Window
local Window = NonUI:CreateWindow("Non UI Hub", "Blue") -- Themes: Red, Blue, Dark, etc

-- 3. Add a Tab
local MainTab = Window:AddTab("Home")

-- 4. Add Elements
MainTab:AddLabel("Welcome to Non UI!")

MainTab:AddButton("Click Me", function()
    Window:Notify("Button Clicked!", 2)
end)

local autofarm = false
MainTab:AddToggle("Auto Farm", function(state)
    print("Auto Farm is now:", state)
    autofarm = state
end)

MainTab:AddSlider("WalkSpeed", 16, 100, 16, 1, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

MainTab:AddInput("Teleport to Player", "Username...", function(text)
    print("Targeting player:", text)
end)

-- 5. Organize with Sections
local SettingsSection = MainTab:AddSection("Settings")
SettingsSection:AddKeybind("Toggle UI", Enum.KeyCode.RightControl, function()
    print("Keybind pressed!")
end)
```

## 🤝 Available Elements

### 🏷️ Label

A simple text display for information or instructions.

```lua
local label = tab:AddLabel("Hello World")

```

#### Label APIs

* **`label:Set(newText: string)`**: Updates the label's text dynamically.

---

### 🖱️ Button

A clickable element with a smooth ripple effect.

```lua
tab:AddButton("Click Me", function()
    print("Button was pressed!")
end)

```

---

### 🔘 Toggle

A switch that saves its state automatically. The callback runs immediately upon execution (to load saved settings) and every time the user clicks it.

```lua
tab:AddToggle("Auto Farm", function(state)
    print("Toggle is now:", state)
end)

```

---

### ⌨️ Keybind Toggle

A special toggle that can be activated by clicking it in the menu OR by pressing a physical key.

```lua
tab:AddToggleKeybind("Fast Run", Enum.KeyCode.V, function(state)
    print("Fast Run active:", state)
end)

```

---

### 🎚️ Slider

A functional slider for choosing values within a range.

```lua
tab:AddSlider("WalkSpeed", 16, 100, 16, 1, function(value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
end)

```

* **Parameters**: `(text, min, max, default, step, callback)`

---

### 📝 Input

A text box for user-provided strings. Automatically saves the last entered text.

```lua
tab:AddInput("Teleport Player", "Enter username...", function(text)
    print("Teleporting to:", text)
end)

```

---

### 📂 Section

Used to group related elements together under a titled category with a separator.

```lua
local section = tab:AddSection("Combat Settings")
section:AddToggle("Kill Aura", function() end)

```

---

## 🎨 Themes

**Non UI** comes with a variety of built-in color schemes. You can set the theme when creating a window or change it dynamically later.

### How to Use a Theme

```lua
-- When creating the window
local Window = NonUI:CreateWindow("My Script", "Aqua")

-- Or changing it later
Window:SetTheme("Purple")
```

### Available Theme Names

| Theme Name | Style Description |
| --- | --- |
| `Red` | Deep crimson and dark red tones |
| `Orange` | Warm sunset and burnt orange colors |
| `Yellow` | Bright amber and gold accents |
| `Green` | Forest and emerald shades |
| `Blue` | Classic sapphire and midnight blue |
| `Purple` | Royal violet and deep amethyst |
| `Aqua` | Teal and bright cyan highlights |
| `Dark` | Professional charcoal and slate (Default) |
| `Light` | Clean white and soft gray aesthetic |

### 🛠️ Custom Themes

You can also inject your own theme into the library using the `importTheme` method before initializing your window:

```lua
NonUI:importTheme({
    MyCustomTheme = {
        Background = Color3.fromRGB(20, 20, 20),
        Sidebar = Color3.fromRGB(30, 30, 30),
        Accent = Color3.fromRGB(255, 0, 255),
        Text = Color3.fromRGB(255, 255, 255),
        TextDark = Color3.fromRGB(150, 150, 150),
        Element = Color3.fromRGB(35, 35, 35),
        Stroke = Color3.fromRGB(50, 50, 50),
        toggleActive = Color3.fromRGB(255, 50, 255),
        toggleInActive = Color3.fromRGB(200, 200, 200),
    }
})

local Window = NonUI:CreateWindow("Custom Hub", "MyCustomTheme")

```

---

### 💡 Visual Tip

Since the UI uses **Smooth Transitions**, switching themes via `Window:SetTheme` will fade all colors (Background, Accent, and Text) simultaneously for a polished feel.

---

## 🤝 Credits

**Non UI** was developed with a focus on performance and cross-platform accessibility for the Roblox scripting community.

* **Developer**: Noname - *Lead Architecture & UI/UX Design*
* **Core Technologies**:
* **Luau**: The high-performance scripting language used to power the library logic.
* **TweenService**: Used for all smooth transitions and theme fading.
* **UserInputService**: Handles the adaptive PC and Mobile input detection.


* **Inspired by**: The need for a lightweight, "invisible" UI footprint in complex execution environments.

---

[![YouTube](https://img.shields.io/badge/YouTube-Subscribe%20Now-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/@nnscripts)
[![Discord](https://img.shields.io/badge/Discord-Join%20Our%20Community-7289DA?style=for-the-badge&logo=discord)](https://discord.gg/aJeWPZqKgs)

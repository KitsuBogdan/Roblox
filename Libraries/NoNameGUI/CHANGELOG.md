# 📜 Changelog

---

## \[1.1.2] - 2025-05-26

### ✨ Added

* 🔧 **`createSlider`** now supports optional parameter `sizey` for custom dimensions.

  * Example:

    ```lua
    GuiLib.createSlider("FPS Limit", "Main", 60, function(value)
        print("FPS Limit set to", value)
    end, 0.4)
    ```

* 🔧 **`createTextbox`** now supports optional parameter `sizey` for flexible sizing.

  * Example:

    ```lua
    GuiLib.createTextbox("Type your name here...", "Main", "", function(text)
        print("User typed:", text)
    end, 0.2)
    ```

- 🎨 **Theme customization support** via `GuiLib.Theme`.
  - Example:
    ```lua
    GuiLib.createGui('Gulik_Library')
    GuiLib.Theme = GuiLib.Themes.red -- Options: purple, red, blue, green, orange, pink, gray, white, black
    ```
---

## [1.1.1] - 2025-05-24

### Fixed

- 🛠️ Fixed draggable GUI bug (the window could not be dragged).
- 🐞 Resolved other minor internal bugs for smoother UI behavior.

---

## [1.1.0] - 2025-05-24

### Added

- ✅ `createSlider(label, tab, defaultValue, callback)` – Adds a slider control to a tab (e.g., for FPS limit, volume, etc.).
  - Example:  
    ```lua
    GuiLib.createSlider("FPS Limit", "Main", 60, function(value)
        print("FPS Limit set to", value)
    end)
    ```

---

## [1.0.0] - 2025-05-24

### Added

- ✅ `createGui(name)` – Initializes the main GUI window.
- ✅ `createListTab(name)` – Creates a vertical list-style tab.
- ✅ `createTableTab(name)` – Creates a grid/table-style tab.
- ✅ `CreateLabel(text, tab)` – Adds a static text label to a tab.
- ✅ `createClickBtn(text, tab, callback)` – Adds a button with a callback.
- ✅ `createToggle(text, tab, default, callback)` – Adds a toggle switch with state handling.
- ✅ `createTextbox(placeholder, tab, default, callback)` – Adds a textbox with live callback.

### Features

- 🔁 Reusable modular architecture (via `require(lib)`).
- 💡 Simple callback-based logic.
- 🧪 Functional infinite jump demo using toggle.
- 🧩 Organized tabbed layout with two modes: List and Table.
- 🧼 Clean and readable API, optimized for rapid GUI development.
- 📦 Easy integration via `loadstring(game:HttpGet(...))`.

---

## 📌 Notes

- Initial public release in `v1.0.0`.
- `v1.1.0` added slider UI controls.
- `v1.1.1` focused on improving UI stability and bug fixes.
- `v1.1.2` adds flexible sizing to `Slider` and `Textbox`.
---

## Upcoming

- 🌐 Localization support.

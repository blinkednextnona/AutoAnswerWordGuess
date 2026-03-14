# Auto Answer
### Made By CozzyBruh

A clean, minimal auto-answer script with a custom UI.

---

## 📁 File Structure

```
AutoAnswer/
├── Main.lua          → Loader script (ties everything together)
├── UILibrary.lua     → Clean UI system (tabs, toggles, sliders, notifications)
├── Engine.lua        → Auto answer logic (parsing, word finding, typing)
├── WordList.lua      → Word database (edit this to add more words)
└── README.md         → This file
```

## 🧩 How Each File Works

| File | Purpose |
|------|---------|
| **Main.lua** | Entry point. Loads the other modules, builds the UI tabs, connects everything. |
| **UILibrary.lua** | Self-contained UI library. Handles window, tabs, toggles, sliders, buttons, notifications, dragging, and open/close animations. |
| **Engine.lua** | The brain. Reads the game's instruction text, parses what it's asking for, finds a valid word, types it character by character, and submits it. |
| **WordList.lua** | Just a big table of uppercase English words. Edit this file to add more words for better coverage. |

## 🎮 Features

- **Auto Word Answer** — Detects "Enter a word with X & Y!" and finds + types a valid word
- **Auto Letter Answer** — Detects "Enter A Letter!" and submits a random letter
- **Speed Control** — Min/Max delay sliders (in milliseconds) to control typing speed
- **Clean UI** — Draggable window, tab system, toggle switches, smooth animations
- **Toggle Keybind** — Press `RightShift` to show/hide the UI

## 🚀 Usage

### Option 1: Load from GitHub
Update the URLs in `Main.lua` with your GitHub raw URLs, then:
```lua
loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/Main.lua"))()
```

### Option 2: Single File
If your executor doesn't support multi-file loading, paste all 4 files together in order:
1. WordList.lua (assign to `_G.AutoAnswer_WordList`)
2. UILibrary.lua (assign to `_G.AutoAnswer_UILib`)
3. Engine.lua (assign to `_G.AutoAnswer_Engine`)
4. Main.lua

## ➕ Adding More Words

Open `WordList.lua` and add words to the table. All words must be **UPPERCASE**:

```lua
"NEWWORD","ANOTHERWORD","EXAMPLE",
```

The more words you add, the better the script handles uncommon letter combinations.

## ⚙️ Controls

| Action | Control |
|--------|---------|
| Toggle UI | `RightShift` |
| Move Window | Drag the top bar |
| Enable Auto Answer | Toggle switch on Home tab |
| Adjust Speed | Sliders on Home tab |
| Destroy UI | Button on Settings tab |

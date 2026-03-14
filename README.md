# ⌨️ Auto Answer — Word Guess
### Made By CozzyBruh

Auto-answer script for the Roblox word guessing game. Reads the prompt, finds a valid word, types it out, and submits — all automatically with a clean UI.

---

## ⚡ Quick Start

Paste this into your executor:

```lua
loadstring(game:GetService("HttpService"):GetAsync("https://raw.githubusercontent.com/blinkednextnona/AutoAnswerWordGuess/main/AutoAnswer_AllInOne.lua"))()
```

That's it. The UI will appear and you're ready to go.

---

## 🎮 What It Does

The game gives you two types of prompts:

| Prompt | What the script does |
|--------|---------------------|
| `Enter a word with F & A!` | Finds a word containing **both** letters (e.g. "FAMILY"), types it character by character, and submits |
| `Enter A Letter!` | Picks a random letter and submits it |

Everything happens automatically once you toggle it on.

---

## 🖥️ UI Features

- **Draggable window** — grab the top bar to move it
- **Tab system** — Home tab for controls, Settings tab for UI options
- **Auto Answer toggle** — flip it on/off anytime
- **Speed sliders** — control min/max typing delay in milliseconds
- **Notifications** — shows status updates with color-coded alerts
- **Smooth animations** — open/close, tab switching, hover effects
- **Keybind** — press `RightShift` to show/hide the UI

---

## 📁 File Structure

```
AutoAnswerWordGuess/
├── AutoAnswer_AllInOne.lua   ← Single file, paste and run
├── Main.lua                  ← Loader (for modular setup)
├── UILibrary.lua             ← UI system (reusable)
├── Engine.lua                ← Answer logic
├── WordList.lua              ← Word database
└── README.md                 ← This file
```

### What each file does

| File | Purpose |
|------|---------|
| **AutoAnswer_AllInOne.lua** | Everything in one file. Just paste and execute. Best for most users. |
| **Main.lua** | Entry point for the modular version. Loads the other 3 modules and builds the UI. |
| **UILibrary.lua** | Standalone UI library — window, tabs, toggles, sliders, buttons, notifications, dragging. |
| **Engine.lua** | The brain — reads instructions, parses required letters, finds words, types them, submits. |
| **WordList.lua** | Big table of uppercase English words. Edit this to improve coverage. |

---

## ⚙️ Controls

| Action | How |
|--------|-----|
| Show/Hide UI | `RightShift` |
| Move window | Drag the top bar |
| Turn on auto answer | Toggle on Home tab |
| Change typing speed | Min/Max delay sliders on Home tab |
| Reset window position | Button on Settings tab |
| Destroy UI completely | Button on Settings tab |

---

## ➕ Adding More Words

Open `WordList.lua` (or the word list section in the all-in-one file) and add words. They must be **UPPERCASE**:

```lua
"NEWWORD","ANOTHERWORD","EXAMPLE",
```

More words = better coverage for uncommon letter combos. If the script can't find a word for a particular prompt, it just skips that round — adding the missing word to the list fixes it.

---

## 🔧 Speed Settings

The two sliders control how fast each character is typed:

| Setting | What it means |
|---------|--------------|
| **Min Delay** | Fastest possible delay between keystrokes (in ms) |
| **Max Delay** | Slowest possible delay between keystrokes (in ms) |

Each keystroke picks a random delay between min and max. Lower values = faster typing.

**Default:** 50ms min, 150ms max

---

## 📝 Notes

- The script checks for new prompts every 0.5 seconds
- If auto answer is disabled mid-word, it stops typing immediately
- The word list has 900+ common English words built in
- Works with both 1-letter and 2-letter prompts

---

**Made By CozzyBruh**

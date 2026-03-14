--[[
    ╔═══════════════════════════════════════════════╗
    ║           AUTO ANSWER                         ║
    ║       Made By CozzyBruh                       ║
    ╚═══════════════════════════════════════════════╝
    
    Main loader — loads all modules and sets up the UI.
    
    GitHub Structure:
    ├── Main.lua          ← This file (loader)
    ├── UILibrary.lua     ← Clean UI system
    ├── Engine.lua        ← Auto answer logic
    ├── WordList.lua      ← Word database
    └── README.md         ← Documentation
    
    Usage (loadstring from GitHub):
    loadstring(game:HttpService:GetAsync("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/Main.lua"))()
    
    Or if running locally, just execute this file.
]]

-- ═══════════════════════════════════════
-- LOAD MODULES
-- Change these URLs to your raw GitHub URLs
-- ═══════════════════════════════════════
local function LoadModule(url)
    return loadstring(game:GetService("HttpService"):GetAsync(url))()
end

-- ══ OPTION 1: Load from GitHub (fill in your URLs) ══
-- local UILib    = LoadModule("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/UILibrary.lua")
-- local Engine   = LoadModule("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/Engine.lua")
-- local WordList = LoadModule("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/WordList.lua")

-- ══ OPTION 2: Load locally (for testing / single-file paste) ══
-- If you're pasting everything into one executor, uncomment the lines below
-- and comment out the GitHub lines above. The modules will need to be
-- defined above this point or use your executor's require() equivalent.

-- For now, we attempt GitHub load. If it fails, we fall back to checking
-- if the modules are already loaded in the environment.
local UILib, EngineModule, WordList

local success, err = pcall(function()
    -- TRY GITHUB LOAD — Replace YOUR_USER with your GitHub username
    -- UILib      = LoadModule("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/UILibrary.lua")
    -- EngineModule = LoadModule("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/Engine.lua")
    -- WordList   = LoadModule("https://raw.githubusercontent.com/YOUR_USER/AutoAnswer/main/WordList.lua")
end)

-- If modules aren't loaded yet (GitHub lines commented out), 
-- they should be defined elsewhere in your environment.
-- This is the fallback for local/executor usage.
if not UILib then
    UILib      = _G.AutoAnswer_UILib or require(script.Parent.UILibrary)
end
if not EngineModule then
    EngineModule = _G.AutoAnswer_Engine or require(script.Parent.Engine)
end
if not WordList then
    WordList   = _G.AutoAnswer_WordList or require(script.Parent.WordList)
end

-- ═══════════════════════════════════════
-- INITIALIZE
-- ═══════════════════════════════════════
local Window = UILib.new("Auto Answer", "Made By CozzyBruh")
local AutoEngine = EngineModule.new(WordList)

-- ═══════════════════════════════════════
-- HOME TAB
-- ═══════════════════════════════════════
local HomeTab = Window:AddTab("Home", "🏠")

HomeTab:AddSection("Auto Answer")
HomeTab:AddLabel("Toggle auto answer on/off below.")
HomeTab:AddSeparator()

HomeTab:AddToggle("Auto Answer", false, function(state)
    if state then
        AutoEngine:Start()
        Window:Notify("Auto Answer", "Enabled — answering automatically.", 2, "success")
    else
        AutoEngine:Stop()
        Window:Notify("Auto Answer", "Disabled.", 2, "error")
    end
end)

HomeTab:AddSeparator()
HomeTab:AddSection("Speed Control")

HomeTab:AddSlider("Min Delay (ms)", 10, 500, 50, function(val)
    AutoEngine.SpeedMin = val / 1000
end)

HomeTab:AddSlider("Max Delay (ms)", 10, 500, 150, function(val)
    AutoEngine.SpeedMax = val / 1000
end)

HomeTab:AddSeparator()
HomeTab:AddSection("Status")
HomeTab:AddLabel("Speed values are in milliseconds.")
HomeTab:AddLabel("Lower = faster typing, higher = slower.")

-- ═══════════════════════════════════════
-- SETTINGS TAB
-- ═══════════════════════════════════════
local SettingsTab = Window:AddTab("Settings", "⚙️")

SettingsTab:AddSection("UI Settings")

SettingsTab:AddButton("Reset Position", function()
    Window.MainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window.Shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
    Window:Notify("Settings", "Position reset to center.", 2)
end)

SettingsTab:AddButton("Destroy UI", function()
    AutoEngine:Stop()
    Window:Destroy()
end)

SettingsTab:AddSeparator()
SettingsTab:AddSection("Info")
SettingsTab:AddLabel("Toggle UI: RightShift")
SettingsTab:AddLabel("Drag the top bar to move.")
SettingsTab:AddLabel("Made By CozzyBruh")

-- ═══════════════════════════════════════
-- STARTUP
-- ═══════════════════════════════════════
task.wait(0.5)
Window:Notify("Auto Answer", "Loaded — Made By CozzyBruh", 4, "success")

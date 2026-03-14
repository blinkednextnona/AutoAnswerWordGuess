--[[
    ╔═══════════════════════════════════════════════╗
    ║           AUTO ANSWER - ENGINE                ║
    ║       Made By CozzyBruh                       ║
    ╚═══════════════════════════════════════════════╝
    
    Handles:
    • Reading the instruction text
    • Parsing "Enter a word with X & Y!" prompts
    • Parsing "Enter A Letter!" prompts
    • Finding valid words from the word list
    • Typing answers character by character
    • Submitting via remotes
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Engine = {}
Engine.__index = Engine

function Engine.new(wordList)
    local self = setmetatable({}, Engine)
    
    self.Enabled = false
    self.SpeedMin = 0.05
    self.SpeedMax = 0.15
    self.WordList = wordList or {}
    self._loop = nil
    
    -- Pre-index words by letter for fast lookup
    self.WordsByLetter = {}
    for _, word in ipairs(self.WordList) do
        for i = 1, #word do
            local c = string.sub(word, i, i)
            if not self.WordsByLetter[c] then
                self.WordsByLetter[c] = {}
            end
            table.insert(self.WordsByLetter[c], word)
        end
    end
    
    -- Remotes
    self._dataRemote = ReplicatedStorage:WaitForChild("ffrostflame_bridgenet2@1.0.0"):WaitForChild("dataRemoteEvent")
    self._pickWordRemote = ReplicatedStorage:WaitForChild("Remote"):WaitForChild("PickWord")
    
    -- Instruction label
    self._instructions = Player.PlayerGui:WaitForChild("KeyboardGui"):WaitForChild("Main"):WaitForChild("Instructions")
    
    return self
end

-- ═══════════════════════════════════════
-- PARSE THE INSTRUCTION TEXT
-- ═══════════════════════════════════════
function Engine:ParseInstruction(text)
    if not text or text == "" then return nil end
    
    local lower = string.lower(text)
    
    -- Check for "Enter A Letter!" type prompts
    if string.find(lower, "enter a letter") then
        return "LETTER"
    end
    
    -- Check for "Enter a word with X & Y!" or "Enter a word with X!"
    local letterSection = string.match(text, "with%s+(.+)!")
    if letterSection then
        local letters = {}
        for letter in string.gmatch(letterSection, "%u") do
            table.insert(letters, letter)
        end
        if #letters > 0 then
            return letters
        end
    end
    
    return nil
end

-- ═══════════════════════════════════════
-- FIND A VALID WORD
-- ═══════════════════════════════════════
function Engine:FindWord(requiredLetters)
    if not requiredLetters or #requiredLetters == 0 then return nil end
    
    -- Start with words containing the first required letter
    local candidates = self.WordsByLetter[requiredLetters[1]] or {}
    local results = {}
    
    for _, word in ipairs(candidates) do
        local valid = true
        for _, letter in ipairs(requiredLetters) do
            if not string.find(word, letter) then
                valid = false
                break
            end
        end
        if valid then
            table.insert(results, word)
        end
    end
    
    if #results > 0 then
        return results[math.random(1, #results)]
    end
    return nil
end

-- ═══════════════════════════════════════
-- TYPE A WORD (character by character)
-- ═══════════════════════════════════════
function Engine:TypeWord(word)
    local typed = ""
    for i = 1, #word do
        if not self.Enabled then return end -- Stop if disabled mid-type
        typed = typed .. string.sub(word, i, i)
        self._dataRemote:FireServer({typed, "\019"})
        local delay = self.SpeedMin + math.random() * (self.SpeedMax - self.SpeedMin)
        task.wait(delay)
    end
    -- Submit
    self._pickWordRemote:FireServer(word)
end

-- ═══════════════════════════════════════
-- TYPE A RANDOM LETTER
-- ═══════════════════════════════════════
function Engine:TypeLetter()
    local letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local idx = math.random(1, 26)
    local letter = string.sub(letters, idx, idx)
    
    self._dataRemote:FireServer({letter, "\019"})
    
    local delay = self.SpeedMin + math.random() * (self.SpeedMax - self.SpeedMin)
    task.wait(delay)
    
    self._pickWordRemote:FireServer(letter)
end

-- ═══════════════════════════════════════
-- MAIN LOOP
-- ═══════════════════════════════════════
function Engine:Start()
    if self._loop then return end
    self.Enabled = true
    
    self._loop = task.spawn(function()
        while self.Enabled do
            local ok, err = pcall(function()
                local instruction = self._instructions.Text
                local parsed = self:ParseInstruction(instruction)
                
                if parsed == "LETTER" then
                    self:TypeLetter()
                elseif parsed and type(parsed) == "table" then
                    local word = self:FindWord(parsed)
                    if word then
                        self:TypeWord(word)
                    end
                end
            end)
            
            if not ok then
                warn("[Auto Answer Engine] Error: " .. tostring(err))
            end
            
            task.wait(0.5)
        end
    end)
end

function Engine:Stop()
    self.Enabled = false
    self._loop = nil
end

return Engine

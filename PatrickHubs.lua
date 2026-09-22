--// Patrick Hubs
--// LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "PatrickHubs"
Gui.ResetOnSpawn = false
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

--==================================================
-- FUNÇÕES
--==================================================

local function Corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = obj
end

local function Border(obj, thickness, transparency)
    local s = Instance.new("UIStroke")
    s.Thickness = thickness
    s.Transparency = transparency
    s.Color = Color3.fromRGB(255,255,255)
    s.Parent = obj
end

local function Drag(frame, area)
    local dragging = false
    local dragStart
    local startPosition

    area.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

            dragging = true
            dragStart = input.Position
            startPosition = frame.Position

            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (
            input.UserInputType == Enum.UserInputType.MouseMovement
            or input.UserInputType == Enum.UserInputType.Touch
        ) then

            local delta = input.Position - dragStart

            frame.Position = UDim2.new(
                startPosition.X.Scale,
                startPosition.X.Offset + delta.X,
                startPosition.Y.Scale,
                startPosition.Y.Offset + delta.Y
            )
        end
    end)
end

--==================================================
-- JANELA PRINCIPAL
--==================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.Size = UDim2.new(0,330,0,410)
Main.Position = UDim2.new(0.5,-165,0.5,-205)
Main.BackgroundColor3 = Color3.fromRGB(12,12,12)
Main.BorderSizePixel = 0
Main.Parent = Gui

Corner(Main,16)
Border(Main,1.5,0.25)

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,64)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-70,0,32)
Title.Position = UDim2.new(0,20,0,7)
Title.BackgroundTransparency = 1
Title.Text = "Patrick Hubs"
Title.TextColor3 = Color3.fromRGB(245,245,245)
Title.TextSize = 24
Title.Font = Enum.Font.GothamBold
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Subtitle = Instance.new("TextLabel")
Subtitle.Size = UDim2.new(1,-70,0,18)
Subtitle.Position = UDim2.new(0,21,0,39)
Subtitle.BackgroundTransparency = 1
Subtitle.Text = "P A T R I C K   J A N E"
Subtitle.TextColor3 = Color3.fromRGB(125,125,125)
Subtitle.TextSize = 9
Subtitle.Font = Enum.Font.GothamMedium
Subtitle.TextXAlignment = Enum.TextXAlignment.Left
Subtitle.Parent = Header

--==================================================
-- BOTÃO MINIMIZAR
--==================================================

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.new(0,38,0,38)
Minimize.Position = UDim2.new(1,-50,0,12)
Minimize.BackgroundColor3 = Color3.fromRGB(25,25,25)
Minimize.BorderSizePixel = 0
Minimize.Text = "−"
Minimize.TextColor3 = Color3.fromRGB(255,255,255)
Minimize.TextSize = 25
Minimize.Font = Enum.Font.GothamMedium
Minimize.AutoButtonColor = false
Minimize.Parent = Header

Corner(Minimize,11)
Border(Minimize,1,0.5)

--==================================================
-- LINHA
--==================================================

local Line = Instance.new("Frame")
Line.Size = UDim2.new(1,-30,0,1)
Line.Position = UDim2.new(0,15,0,63)
Line.BackgroundColor3 = Color3.fromRGB(45,45,45)
Line.BorderSizePixel = 0
Line.Parent = Main

--==================================================
-- SCROLL
--==================================================

local Scroll = Instance.new("ScrollingFrame")
Scroll.Name = "HubList"
Scroll.Size = UDim2.new(1,-20,1,-80)
Scroll.Position = UDim2.new(0,10,0,70)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = Color3.fromRGB(100,100,100)
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.CanvasSize = UDim2.new(0,0,0,0)
Scroll.ScrollingDirection = Enum.ScrollingDirection.Y
Scroll.Parent = Main

local Padding = Instance.new("UIPadding")
Padding.PaddingLeft = UDim.new(0,5)
Padding.PaddingRight = UDim.new(0,5)
Padding.PaddingTop = UDim.new(0,2)
Padding.PaddingBottom = UDim.new(0,10)
Padding.Parent = Scroll

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0,9)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = Scroll

--==================================================
-- CRIAR BOTÃO
--==================================================

local function CreateHub(name,description,order,callback)

    local Button = Instance.new("TextButton")
    Button.Name = name:gsub("%s","")
    Button.Size = UDim2.new(1,-10,0,58)
    Button.BackgroundColor3 = Color3.fromRGB(22,22,22)
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.LayoutOrder = order
    Button.Parent = Scroll

    Corner(Button,12)
    Border(Button,1,0.65)

    local Indicator = Instance.new("Frame")
    Indicator.Size = UDim2.new(0,4,0,34)
    Indicator.Position = UDim2.new(0,8,0.5,-17)
    Indicator.BackgroundColor3 = Color3.fromRGB(235,235,235)
    Indicator.BorderSizePixel = 0
    Indicator.Parent = Button

    Corner(Indicator,4)

    local NameLabel = Instance.new("TextLabel")
    NameLabel.Size = UDim2.new(1,-70,0,24)
    NameLabel.Position = UDim2.new(0,25,0,7)
    NameLabel.BackgroundTransparency = 1
    NameLabel.Text = name
    NameLabel.TextColor3 = Color3.fromRGB(245,245,245)
    NameLabel.TextSize = 15
    NameLabel.Font = Enum.Font.GothamBold
    NameLabel.TextXAlignment = Enum.TextXAlignment.Left
    NameLabel.Parent = Button

    local Description = Instance.new("TextLabel")
    Description.Size = UDim2.new(1,-70,0,17)
    Description.Position = UDim2.new(0,25,0,32)
    Description.BackgroundTransparency = 1
    Description.Text = description
    Description.TextColor3 = Color3.fromRGB(120,120,120)
    Description.TextSize = 10
    Description.Font = Enum.Font.Gotham
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.Parent = Button

    local Arrow = Instance.new("TextLabel")
    Arrow.Size = UDim2.new(0,35,0,35)
    Arrow.Position = UDim2.new(1,-43,0.5,-17)
    Arrow.BackgroundTransparency = 1
    Arrow.Text = "›"
    Arrow.TextColor3 = Color3.fromRGB(170,170,170)
    Arrow.TextSize = 27
    Arrow.Font = Enum.Font.Gotham
    Arrow.Parent = Button

    Button.MouseEnter:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(32,32,32)
    end)

    Button.MouseLeave:Connect(function()
        Button.BackgroundColor3 = Color3.fromRGB(22,22,22)
    end)

    Button.MouseButton1Click:Connect(function()

        Button.BackgroundColor3 = Color3.fromRGB(45,45,45)

        task.delay(0.12,function()
            if Button then
                Button.BackgroundColor3 = Color3.fromRGB(22,22,22)
            end
        end)

        task.spawn(function()
            local success,err = pcall(callback)

            if not success then
                warn("[Patrick Hubs] "..tostring(err))
            end
        end)

    end)
end

--==================================================
-- MIRANDA HUB
--==================================================

CreateHub(
    "Miranda Hub",
    "Miranda Hub",
    1,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/mirandaafk.lua"))()
    end
)

--==================================================
-- LENNON HUB
--==================================================

CreateHub(
    "Lennon Hub",
    "Lennon Hub",
    2,
    function()
        loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/73260ee6e0b3892aa700a13e1fd7d3c9.lua"))()
    end
)

--==================================================
-- FYY COMMUNITY
--==================================================

CreateHub(
    "FYY COMMUNITY",
    "FYY COMMUNITY",
    3,
    function()
        loadstring(game:HttpGet("https://FyyCommunity.my.id"))()
    end
)

--==================================================
-- CHILLI HUB
--==================================================

CreateHub(
    "Chilli Hub",
    "Chilli Hub",
    4,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))()
    end
)

--==================================================
-- NIGHT HUB
--==================================================

CreateHub(
    "Night Hub",
    "Night Hub",
    5,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/StealEggOnly.luau"))()
    end
)

--==================================================
-- SMALL SERVE
--==================================================

CreateHub(
    "Small Serve",
    "Small Serve",
    6,
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dertonware/scriptasda/refs/heads/main/scriptlua",true))()
    end
)

--==================================================
-- BOLHA PH
--==================================================

local Bubble = Instance.new("TextButton")
Bubble.Name = "PH_Bubble"
Bubble.Size = UDim2.new(0,58,0,58)
Bubble.Position = UDim2.new(0,20,0.5,-29)
Bubble.BackgroundColor3 = Color3.fromRGB(12,12,12)
Bubble.BorderSizePixel = 0
Bubble.Text = "PH"
Bubble.TextColor3 = Color3.fromRGB(255,255,255)
Bubble.TextSize = 17
Bubble.Font = Enum.Font.GothamBold
Bubble.AutoButtonColor = false
Bubble.Visible = false
Bubble.Parent = Gui

Corner(Bubble,100)
Border(Bubble,2,0.15)

--==================================================
-- ARRASTAR JANELA
--==================================================

Drag(Main,Header)

--==================================================
-- ARRASTAR BOLHA
--==================================================

Drag(Bubble,Bubble)

--==================================================
-- MINIMIZAR
--==================================================

Minimize.MouseButton1Click:Connect(function()
    Main.Visible = false
    Bubble.Visible = true
end)

--==================================================
-- RESTAURAR
--==================================================

Bubble.MouseButton1Click:Connect(function()
    Bubble.Visible = false
    Main.Visible = true
end)

--==================================================
-- EFEITOS
--==================================================

Minimize.MouseEnter:Connect(function()
    Minimize.BackgroundColor3 = Color3.fromRGB(40,40,40)
end)

Minimize.MouseLeave:Connect(function()
    Minimize.BackgroundColor3 = Color3.fromRGB(25,25,25)
end)

Bubble.MouseEnter:Connect(function()
    Bubble.BackgroundColor3 = Color3.fromRGB(30,30,30)
end)

Bubble.MouseLeave:Connect(function()
    Bubble.BackgroundColor3 = Color3.fromRGB(12,12,12)
end)

print("Patrick Hubs carregado com sucesso.")

--====================================================--
--                 PATRICK HUBS
--====================================================--

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

local Old = PlayerGui:FindFirstChild("PatrickHubs")
if Old then
    Old:Destroy()
end

local BLACK = Color3.fromRGB(0,0,0)
local WHITE = Color3.fromRGB(255,255,255)

local GUI = Instance.new("ScreenGui")
GUI.Name = "PatrickHubs"
GUI.ResetOnSpawn = false
GUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
GUI.Parent = PlayerGui

local function Corner(obj, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = obj
end

local function Stroke(obj, thickness)
    local s = Instance.new("UIStroke")
    s.Color = WHITE
    s.Thickness = thickness
    s.Parent = obj
    return s
end

local function TextStyle(obj, size)
    obj.TextColor3 = BLACK
    obj.TextStrokeColor3 = WHITE
    obj.TextStrokeTransparency = 0
    obj.Font = Enum.Font.GothamBold
    obj.TextSize = size
end

--====================================================--
-- JANELA
--====================================================--

local Main = Instance.new("Frame")
Main.Size = UDim2.fromOffset(330,430)
Main.Position = UDim2.new(.5,-165,.5,-215)
Main.BackgroundColor3 = BLACK
Main.BorderSizePixel = 0
Main.Parent = GUI

Corner(Main,18)
Stroke(Main,2)

--====================================================--
-- HEADER
--====================================================--

local Header = Instance.new("Frame")
Header.Size = UDim2.new(1,0,0,58)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1,-105,1,0)
Title.Position = UDim2.fromOffset(15,0)
Title.BackgroundTransparency = 1
Title.Text = "Patrick Hubs"
Title.TextXAlignment = Enum.TextXAlignment.Left
TextStyle(Title,21)
Title.Parent = Header

local Minimize = Instance.new("TextButton")
Minimize.Size = UDim2.fromOffset(38,38)
Minimize.Position = UDim2.new(1,-86,0,10)
Minimize.BackgroundColor3 = BLACK
Minimize.Text = "-"
Minimize.AutoButtonColor = false
TextStyle(Minimize,24)
Minimize.Parent = Header

Corner(Minimize,10)
local MinStroke = Stroke(Minimize,1.5)

local Close = Instance.new("TextButton")
Close.Size = UDim2.fromOffset(38,38)
Close.Position = UDim2.new(1,-43,0,10)
Close.BackgroundColor3 = BLACK
Close.Text = "X"
Close.AutoButtonColor = false
TextStyle(Close,16)
Close.Parent = Header

Corner(Close,10)
local CloseStroke = Stroke(Close,1.5)

--====================================================--
-- SCROLL
--====================================================--

local Scroll = Instance.new("ScrollingFrame")
Scroll.Size = UDim2.new(1,-20,1,-70)
Scroll.Position = UDim2.fromOffset(10,62)
Scroll.BackgroundTransparency = 1
Scroll.BorderSizePixel = 0
Scroll.ScrollBarThickness = 4
Scroll.ScrollBarImageColor3 = WHITE
Scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
Scroll.CanvasSize = UDim2.new()
Scroll.Parent = Main

local Layout = Instance.new("UIListLayout")
Layout.Padding = UDim.new(0,9)
Layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
Layout.Parent = Scroll

--====================================================--
-- AÇÕES
--====================================================--

local Actions = {

    ["Small Serve"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/dertonware/scriptasda/refs/heads/main/scriptlua",true))()
    
    end,

    ["Anti Hit Wzeu"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Wzeus-NTH/Wzeusno1/main/Wzeus/nthzz"))()
    end,

    ["Pulse Hub"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/PulseZax/Loader/refs/heads/main/.lua"))()
    end,

    ["Ajjans Hub"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/virtuososvisualedits-prog/Ww/refs/heads/main/final-obfuscated.lua"))()
    end,

    ["Miranda Hub"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/miirandahub/loader/refs/heads/main/afkk"))()
    end,

    ["Fyy Community"] = function()
        loadstring(game:HttpGet("https://FyyCommunity.my.id"))()
    end,

    ["Chilli Hub"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/Chilli-Hub-Script/refs/heads/main/StealAnEgg"))()
    end,

    ["Night Hub"] = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/WhiteX1208/Scripts/refs/heads/main/StealEggOnly.luau"))()
    end
}

--====================================================--
-- OPÇÕES
--====================================================--

local Options = {
    {"Small Serve","Key"},
    {"Anti Hit Wzeu","No Key"},
    {"Pulse Hub","No Key"},
    {"Ajjans Hub","Key System"},
    {"Miranda Hub","No Key"},
    {"Fyy Community","Key System"},
    {"Chilli Hub","No Key"},
    {"Night Hub","No Key"}
}

--====================================================--
-- CRIAR BOTÃO
--====================================================--

for index,data in ipairs(Options) do

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(1,-8,0,72)
    Button.BackgroundColor3 = BLACK
    Button.BorderSizePixel = 0
    Button.Text = ""
    Button.AutoButtonColor = false
    Button.LayoutOrder = index
    Button.Parent = Scroll

    Corner(Button,13)

    local ButtonStroke = Stroke(Button,1.5)

    local Name = Instance.new("TextLabel")
    Name.Size = UDim2.new(1,-20,0,30)
    Name.Position = UDim2.fromOffset(10,5)
    Name.BackgroundTransparency = 1
    Name.Text = data[1]
    Name.TextXAlignment = Enum.TextXAlignment.Left
    TextStyle(Name,17)
    Name.Parent = Button

    local Description = Instance.new("TextLabel")
    Description.Size = UDim2.new(1,-20,0,22)
    Description.Position = UDim2.fromOffset(10,39)
    Description.BackgroundTransparency = 1
    Description.Text = data[2]
    Description.TextXAlignment = Enum.TextXAlignment.Left
    TextStyle(Description,12)
    Description.Parent = Button

    Button.Activated:Connect(function()

        -- animação
        TweenService:Create(
            Button,
            TweenInfo.new(.08),
            {Size = UDim2.new(1,-16,0,66)}
        ):Play()

        TweenService:Create(
            ButtonStroke,
            TweenInfo.new(.08),
            {Thickness = 4}
        ):Play()

        task.delay(.09,function()

            TweenService:Create(
                Button,
                TweenInfo.new(.12),
                {Size = UDim2.new(1,-8,0,72)}
            ):Play()

            TweenService:Create(
                ButtonStroke,
                TweenInfo.new(.12),
                {Thickness = 1.5}
            ):Play()

        end)

        -- executa a ação correspondente
        local Action = Actions[data[1]]

        if Action then
            task.spawn(function()
                local Success,Error = pcall(Action)

                if not Success then
                    warn("[Patrick Hubs] "..tostring(Error))
                end
            end)
        end
    end)
end

--====================================================--
-- ARRASTAR JANELA
--====================================================--

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = input.Position
        StartPosition = Main.Position
    end
end)

Header.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
    or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false
    end
end)

UIS.InputChanged:Connect(function(input)

    if not Dragging then return end

    if input.UserInputType == Enum.UserInputType.MouseMovement
    or input.UserInputType == Enum.UserInputType.Touch then

        local Delta = input.Position - DragStart

        Main.Position = UDim2.new(
            StartPosition.X.Scale,
            StartPosition.X.Offset + Delta.X,
            StartPosition.Y.Scale,
            StartPosition.Y.Offset + Delta.Y
        )
    end
end)

--====================================================--
-- BOLHA PH
--====================================================--

local Bubble = Instance.new("TextButton")
Bubble.Size = UDim2.fromOffset(58,58)
Bubble.Position = UDim2.new(.5,-29,.5,-29)
Bubble.BackgroundColor3 = BLACK
Bubble.BorderSizePixel = 0
Bubble.Text = "PH"
Bubble.AutoButtonColor = false
Bubble.Visible = false
TextStyle(Bubble,19)
Bubble.Parent = GUI

Corner(Bubble,999)
Stroke(Bubble,2)

--====================================================--
-- MINIMIZAR
--====================================================--

Minimize.Activated:Connect(function()

    Main.Visible = false
    Bubble.Visible = true

    Bubble.Size = UDim2.fromOffset(0,0)

    TweenService:Create(
        Bubble,
        TweenInfo.new(.2,Enum.EasingStyle.Back),
        {Size = UDim2.fromOffset(58,58)}
    ):Play()
end)

--====================================================--
-- ABRIR
--====================================================--

Bubble.Activated:Connect(function()

    TweenService:Create(
        Bubble,
        TweenInfo.new(.12),
        {Size = UDim2.fromOffset(0,0)}
    ):Play()

    task.wait(.12)

    Bubble.Visible = false
    Main.Visible = true

    Main.Size = UDim2.fromOffset(0,0)

    TweenService:Create(
        Main,
        TweenInfo.new(.22,Enum.EasingStyle.Back),
        {Size = UDim2.fromOffset(330,430)}
    ):Play()
end)

--====================================================--
-- FECHAR
--====================================================--

Close.Activated:Connect(function()

    TweenService:Create(
        Main,
        TweenInfo.new(.15),
        {Size = UDim2.fromOffset(0,0)}
    ):Play()

    task.wait(.16)

    GUI:Destroy()
end)

print("Patrick Hubs carregado!")

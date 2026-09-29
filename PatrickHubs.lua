--// Patrick Hubs
--// LocalScript

local Players = game:GetService("Players")
local UIS = game:GetService("UserInputService")

local player = Players.LocalPlayer

--// GUI
local gui = Instance.new("ScreenGui")
gui.Name = "PatrickHubs"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = player:WaitForChild("PlayerGui")

--// Cores
local BLACK = Color3.fromRGB(0, 0, 0)
local WHITE = Color3.fromRGB(255, 255, 255)

--// Função para criar contorno de texto
local function outlineText(label)
    label.TextColor3 = BLACK
    label.TextStrokeColor3 = WHITE
    label.TextStrokeTransparency = 0
    label.Font = Enum.Font.GothamBold
end

--// Janela principal
local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(330, 430)
main.Position = UDim2.new(0.5, -165, 0.5, -215)
main.BackgroundColor3 = BLACK
main.BorderSizePixel = 0
main.Parent = gui

local mainCorner = Instance.new("UICorner")
mainCorner.CornerRadius = UDim.new(0, 18)
mainCorner.Parent = main

local mainStroke = Instance.new("UIStroke")
mainStroke.Color = WHITE
mainStroke.Thickness = 2
mainStroke.Parent = main

--// Barra superior
local top = Instance.new("Frame")
top.Size = UDim2.new(1, 0, 0, 55)
top.BackgroundTransparency = 1
top.Parent = main

--// Título
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -100, 1, 0)
title.Position = UDim2.fromOffset(18, 0)
title.BackgroundTransparency = 1
title.Text = "Patrick Hubs"
title.TextSize = 22
title.TextXAlignment = Enum.TextXAlignment.Left
outlineText(title)
title.Parent = top

--// Botão minimizar
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.fromOffset(38, 38)
minimize.Position = UDim2.new(1, -85, 0, 8)
minimize.BackgroundColor3 = BLACK
minimize.Text = "-"
minimize.TextSize = 25
outlineText(minimize)
minimize.Parent = top

local minCorner = Instance.new("UICorner")
minCorner.CornerRadius = UDim.new(1, 0)
minCorner.Parent = minimize

local minStroke = Instance.new("UIStroke")
minStroke.Color = WHITE
minStroke.Thickness = 1.5
minStroke.Parent = minimize

--// Botão fechar
local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(38, 38)
close.Position = UDim2.new(1, -43, 0, 8)
close.BackgroundColor3 = BLACK
close.Text = "X"
close.TextSize = 17
outlineText(close)
close.Parent = top

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(1, 0)
closeCorner.Parent = close

local closeStroke = Instance.new("UIStroke")
closeStroke.Color = WHITE
closeStroke.Thickness = 1.5
closeStroke.Parent = close

--// Área de scroll
local scroll = Instance.new("ScrollingFrame")
scroll.Size = UDim2.new(1, -20, 1, -70)
scroll.Position = UDim2.fromOffset(10, 60)
scroll.BackgroundTransparency = 1
scroll.BorderSizePixel = 0
scroll.ScrollBarThickness = 4
scroll.ScrollBarImageColor3 = WHITE
scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
scroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
scroll.Parent = main

local layout = Instance.new("UIListLayout")
layout.Padding = UDim.new(0, 9)
layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
layout.Parent = scroll

--// Opções
local options = {
    {"Small Serve", "Key"},
    {"Anti Hit Wzeu", "No Key"},
    {"Pulse Hub", "No Key"},
    {"Ajjans Hub", "Key System"},
    {"Miranda Hub", "No Key"},
    {"Fyy Community", "Key System"},
    {"Chilli Hub", "No Key"},
    {"Night Hub", "No Key"}
}

--// Criar opção
local function createOption(name, description, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -8, 0, 72)
    button.BackgroundColor3 = BLACK
    button.Text = ""
    button.AutoButtonColor = false
    button.Parent = scroll

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 13)
    corner.Parent = button

    local stroke = Instance.new("UIStroke")
    stroke.Color = WHITE
    stroke.Thickness = 1.5
    stroke.Parent = button

    -- Nome
    local nameLabel = Instance.new("TextLabel")
    nameLabel.Size = UDim2.new(1, -20, 0, 30)
    nameLabel.Position = UDim2.fromOffset(10, 6)
    nameLabel.BackgroundTransparency = 1
    nameLabel.Text = name
    nameLabel.TextSize = 17
    nameLabel.TextXAlignment = Enum.TextXAlignment.Left
    outlineText(nameLabel)
    nameLabel.Parent = button

    -- Descrição
    local desc = Instance.new("TextLabel")
    desc.Size = UDim2.new(1, -20, 0, 22)
    desc.Position = UDim2.fromOffset(10, 39)
    desc.BackgroundTransparency = 1
    desc.Text = description
    desc.TextSize = 12
    desc.TextXAlignment = Enum.TextXAlignment.Left
    outlineText(desc)
    desc.Parent = button

    button.MouseButton1Click:Connect(function()
        if callback then
            callback()
        end
    end)

    return button
end

--// Botões
for _, option in ipairs(options) do
    createOption(option[1], option[2], function()
        print("[Patrick Hubs] Selecionado:", option[1])

        -- Coloque aqui a ação correspondente de cada opção.
    end)
end

--// Arrastar janela
local dragging = false
local dragStart
local startPos

top.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        dragging = true
        dragStart = input.Position
        startPos = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if dragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then

        local delta = input.Position - dragStart

        main.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

--// Bolha PH
local bubble = Instance.new("TextButton")
bubble.Size = UDim2.fromOffset(58, 58)
bubble.Position = UDim2.new(0.5, -29, 0.5, -29)
bubble.BackgroundColor3 = BLACK
bubble.Text = "PH"
bubble.TextSize = 19
bubble.Visible = false
outlineText(bubble)
bubble.Parent = gui

local bubbleCorner = Instance.new("UICorner")
bubbleCorner.CornerRadius = UDim.new(1, 0)
bubbleCorner.Parent = bubble

local bubbleStroke = Instance.new("UIStroke")
bubbleStroke.Color = WHITE
bubbleStroke.Thickness = 2
bubbleStroke.Parent = bubble

--// Minimizar
minimize.MouseButton1Click:Connect(function()
    main.Visible = false
    bubble.Visible = true
end)

--// Reabrir
bubble.MouseButton1Click:Connect(function()
    bubble.Visible = false
    main.Visible = true
end)

--// Fechar
close.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

--// Arrastar bolha
local bubbleDragging = false
local bubbleStart
local bubblePos

bubble.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        bubbleDragging = true
        bubbleStart = input.Position
        bubblePos = bubble.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                bubbleDragging = false
            end
        end)
    end
end)

UIS.InputChanged:Connect(function(input)
    if bubbleDragging and (
        input.UserInputType == Enum.UserInputType.MouseMovement
        or input.UserInputType == Enum.UserInputType.Touch
    ) then

        local delta = input.Position - bubbleStart

        bubble.Position = UDim2.new(
            bubblePos.X.Scale,
            bubblePos.X.Offset + delta.X,
            bubblePos.Y.Scale,
            bubblePos.Y.Offset + delta.Y
        )
    end
end)

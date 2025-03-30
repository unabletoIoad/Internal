-- Create the main ScreenGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "DarkThemeGUI"
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
screenGui.Parent = playerGui

-- Create the main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 36)
mainFrame.BorderSizePixel = 0
mainFrame.ClipsDescendants = true
mainFrame.Transparency = 1 -- Start fully transparent for fade-in effect
mainFrame.Parent = screenGui

-- Add corner rounding
local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 8)
corner.Parent = mainFrame

-- Add shadow effect
local shadow = Instance.new("ImageLabel")
shadow.Name = "Shadow"
shadow.Image = "rbxassetid://1316045217"
shadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
shadow.ImageTransparency = 0.8
shadow.ScaleType = Enum.ScaleType.Slice
shadow.SliceCenter = Rect.new(10, 10, 118, 118)
shadow.AnchorPoint = Vector2.new(0.5, 0.5)
shadow.Size = UDim2.new(1, 30, 1, 30)
shadow.Position = UDim2.new(0.5, 0, 0.5, 0)
shadow.BackgroundTransparency = 1
shadow.ZIndex = -1
shadow.Parent = mainFrame

-- Add title text
local title = Instance.new("TextLabel")
title.Name = "Title"
title.Text = "Dark Theme GUI"
title.Font = Enum.Font.GothamSemibold
title.TextSize = 18
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1, 0, 0, 40)
title.Position = UDim2.new(0, 0, 0, 10)
title.Parent = mainFrame

-- Add some sample content
local content = Instance.new("TextLabel")
content.Name = "Content"
content.Text = "This is a dark-themed GUI with a smooth fade-in effect."
content.Font = Enum.Font.Gotham
content.TextSize = 14
content.TextColor3 = Color3.fromRGB(200, 200, 200)
content.TextWrapped = true
content.BackgroundTransparency = 1
content.Size = UDim2.new(1, -20, 0.6, -20)
content.Position = UDim2.new(0, 10, 0, 50)
content.Parent = mainFrame

-- Fade-in animation
local tweenService = game:GetService("TweenService")

local fadeInInfo = TweenInfo.new(
    0.5, -- Duration
    Enum.EasingStyle.Quad, -- Easing style
    Enum.EasingDirection.Out -- Easing direction
)

local fadeInTween = tweenService:Create(
    mainFrame,
    fadeInInfo,
    {Transparency = 0}
)

-- Start the fade-in animation
fadeInTween:Play()

-- Optional: Add a close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Text = "X"
closeButton.Font = Enum.Font.GothamBold
closeButton.TextSize = 16
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
closeButton.BorderSizePixel = 0
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.Parent = mainFrame

local buttonCorner = Instance.new("UICorner")
buttonCorner.CornerRadius = UDim.new(0, 15)
buttonCorner.Parent = closeButton

-- Button hover effects
closeButton.MouseEnter:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(70, 70, 80)
end)

closeButton.MouseLeave:Connect(function()
    closeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
end)

-- Close functionality
closeButton.MouseButton1Click:Connect(function()
    -- Fade out before destroying
    local fadeOutTween = tweenService:Create(
        mainFrame,
        fadeInInfo,
        {Transparency = 1}
    )
    
    fadeOutTween:Play()
    fadeOutTween.Completed:Wait()
    screenGui:Destroy()
end)

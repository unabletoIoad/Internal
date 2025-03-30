local LUAX = {};
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")

LUAX["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
LUAX["1"]["Name"] = [[LuaX]];
LUAX["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
LUAX["1"].Enabled = false

local function fadeIn(gui)
    gui.Enabled = true
    TweenService:Create(gui, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play()
end

local dragging
local dragInput
local dragStart
local startPos
local lastPos = UDim2.new(0.35452, 0, 0.32161, 0)

local function update(input)
    local delta = input.Position - dragStart
    local newPos = UDim2.new(
        lastPos.X.Scale, 
        lastPos.X.Offset + delta.X,
        lastPos.Y.Scale, 
        lastPos.Y.Offset + delta.Y
    )
    TweenService:Create(LUAX["2"], TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = newPos}):Play()
end

LUAX["a"].InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = LUAX["2"].Position
        lastPos = startPos
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

LUAX["a"].InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

local uiVisible = true
local function toggleUI()
    uiVisible = not uiVisible
    local tweenInfo = TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    if uiVisible then
        LUAX["1"].Enabled = true
        TweenService:Create(LUAX["1"], tweenInfo, {BackgroundTransparency = 0}):Play()
    else
        TweenService:Create(LUAX["1"], tweenInfo, {BackgroundTransparency = 1}):Play()
        task.wait(0.3)
        LUAX["1"].Enabled = false
    end
end

UserInputService.InputBegan:Connect(function(input, processed)
    if input.KeyCode == Enum.KeyCode.RightControl and not processed then
        toggleUI()
    end
end)

local function createToggle(button)
    local enabled = false
    button.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    button.MouseButton1Click:Connect(function()
        enabled = not enabled
        button.BackgroundColor3 = enabled and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0)
        print(button.Parent.Name.." toggled:", enabled and "ON" or "OFF")
    end)
end

createToggle(LUAX["6"])
createToggle(LUAX["9"])

LUAX["2"] = Instance.new("Frame", LUAX["1"]);
LUAX["2"]["BorderSizePixel"] = 0;
LUAX["2"]["BackgroundColor3"] = Color3.fromRGB(31, 31, 31);
LUAX["2"]["Size"] = UDim2.new(0, 466, 0, 284);
LUAX["2"]["Position"] = UDim2.new(0.35452, 0, 0.32161, 0);
LUAX["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["2"]["Name"] = [[LuaX_Frame]];

LUAX["3"] = Instance.new("Frame", LUAX["2"]);
LUAX["3"]["BorderSizePixel"] = 0;
LUAX["3"]["BackgroundColor3"] = Color3.fromRGB(41, 41, 41);
LUAX["3"]["Size"] = UDim2.new(0, 451, 0, 269);
LUAX["3"]["Position"] = UDim2.new(0.01717, 0, 0.02113, 0);
LUAX["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["3"]["Name"] = [[MainFrame]];

LUAX["4"] = Instance.new("Frame", LUAX["3"]);
LUAX["4"]["BorderSizePixel"] = 0;
LUAX["4"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
LUAX["4"]["Size"] = UDim2.new(0, 168, 0, 43);
LUAX["4"]["Position"] = UDim2.new(0.02439, 0, 0.18587, 0);
LUAX["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["4"]["Name"] = [[CamLock]];

LUAX["5"] = Instance.new("TextLabel", LUAX["4"]);
LUAX["5"]["BorderSizePixel"] = 0;
LUAX["5"]["TextSize"] = 20;
LUAX["5"]["TextXAlignment"] = Enum.TextXAlignment.Left;
LUAX["5"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["5"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
LUAX["5"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["5"]["BackgroundTransparency"] = 1;
LUAX["5"]["Size"] = UDim2.new(0, 128, 0, 18);
LUAX["5"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["5"]["Text"] = [[Cam Lock [Q]];
LUAX["5"]["Name"] = [[Context]];
LUAX["5"]["Position"] = UDim2.new(0.23688, 0, 0.28181, 0);

LUAX["6"] = Instance.new("TextButton", LUAX["4"]);
LUAX["6"]["BorderSizePixel"] = 0;
LUAX["6"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["6"]["TextSize"] = 14;
LUAX["6"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
LUAX["6"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LUAX["6"]["Size"] = UDim2.new(0, 22, 0, 22);
LUAX["6"]["Name"] = [[Enable]];
LUAX["6"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["6"]["Text"] = [[]];
LUAX["6"]["Position"] = UDim2.new(0.04762, 0, 0.23256, 0);

LUAX["7"] = Instance.new("Frame", LUAX["3"]);
LUAX["7"]["BorderSizePixel"] = 0;
LUAX["7"]["BackgroundColor3"] = Color3.fromRGB(61, 61, 61);
LUAX["7"]["Size"] = UDim2.new(0, 168, 0, 43);
LUAX["7"]["Position"] = UDim2.new(0.02217, 0, 0.39405, 0);
LUAX["7"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["7"]["Name"] = [[Esp]];

LUAX["8"] = Instance.new("TextLabel", LUAX["7"]);
LUAX["8"]["BorderSizePixel"] = 0;
LUAX["8"]["TextSize"] = 20;
LUAX["8"]["TextXAlignment"] = Enum.TextXAlignment.Left;
LUAX["8"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["8"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
LUAX["8"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["8"]["BackgroundTransparency"] = 1;
LUAX["8"]["Size"] = UDim2.new(0, 116, 0, 18);
LUAX["8"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["8"]["Text"] = [[ESP [X]];
LUAX["8"]["Name"] = [[Context]];
LUAX["8"]["Position"] = UDim2.new(0.23688, 0, 0.28181, 0);

LUAX["9"] = Instance.new("TextButton", LUAX["7"]);
LUAX["9"]["BorderSizePixel"] = 0;
LUAX["9"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["9"]["TextSize"] = 14;
LUAX["9"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
LUAX["9"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LUAX["9"]["Size"] = UDim2.new(0, 22, 0, 22);
LUAX["9"]["Name"] = [[Enable]];
LUAX["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["9"]["Text"] = [[]];
LUAX["9"]["Position"] = UDim2.new(0.04762, 0, 0.23256, 0);

LUAX["a"] = Instance.new("Frame", LUAX["2"]);
LUAX["a"]["BorderSizePixel"] = 0;
LUAX["a"]["BackgroundColor3"] = Color3.fromRGB(51, 51, 51);
LUAX["a"]["Size"] = UDim2.new(0, 451, 0, 34);
LUAX["a"]["Position"] = UDim2.new(0.01717, 0, 0.02113, 0);
LUAX["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["a"]["Name"] = [[TopBar]];

LUAX["b"] = Instance.new("ImageLabel", LUAX["a"]);
LUAX["b"]["BorderSizePixel"] = 0;
LUAX["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["b"]["Image"] = [[rbxassetid://120045459930627]];
LUAX["b"]["Size"] = UDim2.new(0, 31, 0, 31);
LUAX["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["b"]["BackgroundTransparency"] = 1;
LUAX["b"]["Name"] = [[Icon]];
LUAX["b"]["Position"] = UDim2.new(0, 0, 0.02941, 0);

LUAX["c"] = Instance.new("TextLabel", LUAX["a"]);
LUAX["c"]["BorderSizePixel"] = 0;
LUAX["c"]["TextSize"] = 20;
LUAX["c"]["TextXAlignment"] = Enum.TextXAlignment.Left;
LUAX["c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["c"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Medium, Enum.FontStyle.Normal);
LUAX["c"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["c"]["BackgroundTransparency"] = 1;
LUAX["c"]["Size"] = UDim2.new(0, 138, 0, 18);
LUAX["c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["c"]["Text"] = [[Lua X - Internal]];
LUAX["c"]["Name"] = [[Title]];
LUAX["c"]["Position"] = UDim2.new(0.09091, 0, 0.23529, 0);

LUAX["d"] = Instance.new("TextLabel", LUAX["a"]);
LUAX["d"]["BorderSizePixel"] = 0;
LUAX["d"]["TextSize"] = 15;
LUAX["d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
LUAX["d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
LUAX["d"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
LUAX["d"]["TextColor3"] = Color3.fromRGB(201, 201, 201);
LUAX["d"]["BackgroundTransparency"] = 1;
LUAX["d"]["Size"] = UDim2.new(0, 148, 0, 18);
LUAX["d"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
LUAX["d"]["Text"] = [[Hide/Show [Right Ctrl]];
LUAX["d"]["Name"] = [[Hotkey]];
LUAX["d"]["Position"] = UDim2.new(0.65595, 0, 0.19357, 0);

fadeIn(LUAX["1"])
return LUAX["1"]

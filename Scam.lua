local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local FreezeTradeButton = Instance.new("TextButton")
local ForceAcceptButton = Instance.new("TextButton")
local BlockJumpButton = Instance.new("TextButton")  -- New button for Block Jump
local Title = Instance.new("TextLabel")

-- ScreenGui properties
ScreenGui.Name = "TradeScamGUI"
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- MainFrame properties
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
MainFrame.Size = UDim2.new(0, 300, 0, 300)  -- Increased height to fit the new button
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -150)  -- Adjusted position to fit the longer frame
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0
MainFrame.ClipsDescendants = true
local UICorner = Instance.new("UICorner", MainFrame)
UICorner.CornerRadius = UDim.new(0, 10)

-- Title properties
Title.Name = "Title"
Title.Parent = MainFrame
Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Title.Size = UDim2.new(1, 0, 0.2, 0)
Title.Font = Enum.Font.GothamBold
Title.Text = "Blox Fruits Trade Scam GUI"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.BorderSizePixel = 0
local TitleCorner = Instance.new("UICorner", Title)
TitleCorner.CornerRadius = UDim.new(0, 8)

-- FreezeTradeButton properties
FreezeTradeButton.Name = "FreezeTradeButton"
FreezeTradeButton.Parent = MainFrame
FreezeTradeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
FreezeTradeButton.Size = UDim2.new(0.8, 0, 0.2, 0)
FreezeTradeButton.Position = UDim2.new(0.1, 0, 0.25, 0)  -- Slightly moved down
FreezeTradeButton.Font = Enum.Font.Gotham
FreezeTradeButton.Text = "Freeze Trade "
FreezeTradeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
FreezeTradeButton.TextSize = 12
local FreezeTradeCorner = Instance.new("UICorner", FreezeTradeButton)
FreezeTradeCorner.CornerRadius = UDim.new(0, 8)

-- ForceAcceptButton properties
ForceAcceptButton.Name = "ForceAcceptButton"
ForceAcceptButton.Parent = MainFrame
ForceAcceptButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ForceAcceptButton.Size = UDim2.new(0.8, 0, 0.2, 0)
ForceAcceptButton.Position = UDim2.new(0.1, 0, 0.5, 0)  -- Slightly moved down
ForceAcceptButton.Font = Enum.Font.Gotham
ForceAcceptButton.Text = "Force Accept "
ForceAcceptButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ForceAcceptButton.TextSize = 12
local ForceAcceptCorner = Instance.new("UICorner", ForceAcceptButton)
ForceAcceptCorner.CornerRadius = UDim.new(0, 8)

-- BlockJumpButton properties (New button)
BlockJumpButton.Name = "BlockJumpButton"
BlockJumpButton.Parent = MainFrame
BlockJumpButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
BlockJumpButton.Size = UDim2.new(0.8, 0, 0.2, 0)
BlockJumpButton.Position = UDim2.new(0.1, 0, 0.75, 0)  -- Slightly moved down
BlockJumpButton.Font = Enum.Font.Gotham
BlockJumpButton.Text = "Block Jump "
BlockJumpButton.TextColor3 = Color3.fromRGB(255, 255, 255)
BlockJumpButton.TextSize = 12
local BlockJumpCorner = Instance.new("UICorner", BlockJumpButton)
BlockJumpCorner.CornerRadius = UDim.new(0, 8)

-- Function to toggle and change button color to a darker shade when clicked
local function toggleButton(button)
    -- Toggle the button's state
    if button.BackgroundColor3 == Color3.fromRGB(50, 50, 50) then
        -- Change color to a darker shade
        button.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    else
        -- Revert color to the original shade
        button.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    end
end

-- Example of visual interactivity (fake functionality)
FreezeTradeButton.MouseButton1Click:Connect(function()
    toggleButton(FreezeTradeButton)
    FreezeTradeButton.Text = FreezeTradeButton.BackgroundColor3 == Color3.fromRGB(40, 40, 40) and "Trade Frozen" or "Freeze Trade"
end)

ForceAcceptButton.MouseButton1Click:Connect(function()
    toggleButton(ForceAcceptButton)
    ForceAcceptButton.Text = ForceAcceptButton.BackgroundColor3 == Color3.fromRGB(40, 40, 40) and "Trade Accepted" or "Force Accept"
end)

-- Block Jump functionality (fake functionality for visual purposes)
local jumpBlocked = false  -- Variable to track jump status

BlockJumpButton.MouseButton1Click:Connect(function()
    toggleButton(BlockJumpButton)
    jumpBlocked = not jumpBlocked  -- Toggle the block status
    BlockJumpButton.Text = jumpBlocked and "Jump Blocked" or "Block Jump"
    
    if jumpBlocked then
        -- Preventing jump behavior (Visual simulation only)
        game:GetService("UserInputService").JumpRequest:Connect(function()
            if jumpBlocked then
                -- Block the jump
                return Enum.ContextActionResult.Sink
            end
        end)
    end
end)

-- Make GUI movable
local UIS = game:GetService("UserInputService")
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UIS.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(
            startPos.X.Scale,
            startPos.X.Offset + delta.X,
            startPos.Y.Scale,
            startPos.Y.Offset + delta.Y
        )
    end
end)

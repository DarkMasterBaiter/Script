local player = game:GetService("Players").LocalPlayer
local tweenService = game:GetService("TweenService")

-- GUI Setup
local gui = Instance.new("ScreenGui")
gui.Name = "UltraDonateGUI"
gui.Parent = player:WaitForChild("PlayerGui")
gui.ResetOnSpawn = false

-- Main Frame (Draggable)
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 400, 0, 220)
frame.Position = UDim2.new(0.5, -200, 0.5, -110)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundTransparency = 1
frame.Active = true
frame.Draggable = true
frame.Parent = gui
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 50)
title.BackgroundTransparency = 1
title.Text = "Pls Donate YX-Hub"
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.TextSize = 26

-- Input
local input = Instance.new("TextBox", frame)
input.Size = UDim2.new(0.8, 0, 0, 40)
input.Position = UDim2.new(0.1, 0, 0.35, 0)
input.PlaceholderText = "Amount (1 - 300)"
input.Text = ""
input.Font = Enum.Font.Gotham
input.TextSize = 22
input.TextColor3 = Color3.new(1,1,1)
input.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
input.BorderSizePixel = 0
input.ClearTextOnFocus = false
Instance.new("UICorner", input).CornerRadius = UDim.new(0, 8)

-- Donate Button
local donate = Instance.new("TextButton", frame)
donate.Size = UDim2.new(0.6, 0, 0, 40)
donate.Position = UDim2.new(0.2, 0, 0.65, 0)
donate.Text = "Donate"
donate.Font = Enum.Font.GothamBold
donate.TextSize = 22
donate.TextColor3 = Color3.new(1,1,1)
donate.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
donate.BorderSizePixel = 0
Instance.new("UICorner", donate).CornerRadius = UDim.new(0, 8)

-- LOADING SCREEN
local loading = Instance.new("Frame", gui)
loading.Size = UDim2.new(0, 350, 0, 100)
loading.Position = UDim2.new(0.5, -175, 1, -120)
loading.BackgroundColor3 = Color3.fromRGB(255, 170, 0)
loading.BackgroundTransparency = 1
loading.Visible = false
Instance.new("UICorner", loading).CornerRadius = UDim.new(0, 8)

local loadingText = Instance.new("TextLabel", loading)
loadingText.Size = UDim2.new(1, 0, 0.6, 0)
loadingText.Position = UDim2.new(0, 0, 0, 0)
loadingText.BackgroundTransparency = 1
loadingText.Text = "💸 Sending Robux..."
loadingText.Font = Enum.Font.GothamMedium
loadingText.TextSize = 20
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.TextTransparency = 1

-- Progress Bar Container
local loadingBar = Instance.new("Frame", loading)
loadingBar.Size = UDim2.new(0.9, 0, 0.15, 0)
loadingBar.Position = UDim2.new(0.05, 0, 0.7, 0)
loadingBar.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
loadingBar.BorderSizePixel = 0
loadingBar.BackgroundTransparency = 1
Instance.new("UICorner", loadingBar).CornerRadius = UDim.new(0, 6)

-- Progress Fill
local progress = Instance.new("Frame", loadingBar)
progress.Size = UDim2.new(0, 0, 1, 0)
progress.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
progress.BorderSizePixel = 0
progress.BackgroundTransparency = 1
Instance.new("UICorner", progress).CornerRadius = UDim.new(0, 6)

-- Notification
local notification = Instance.new("TextLabel", gui)
notification.Size = UDim2.new(0, 300, 0, 50)
notification.Position = UDim2.new(1, -320, 1, -70)
notification.BackgroundColor3 = Color3.fromRGB(40, 200, 60)
notification.TextColor3 = Color3.new(1, 1, 1)
notification.Font = Enum.Font.GothamSemibold
notification.TextSize = 20
notification.Text = "✅ Robux sent. Check pending."
notification.Visible = true
notification.TextTransparency = 1
notification.BackgroundTransparency = 1
Instance.new("UICorner", notification).CornerRadius = UDim.new(0, 6)

-- Animate GUI in
tweenService:Create(frame, TweenInfo.new(1, Enum.EasingStyle.Quad), {
	BackgroundTransparency = 0
}):Play()

-- Donate Logic
donate.MouseButton1Click:Connect(function()
	local amount = tonumber(input.Text)
	if amount and amount >= 1 and amount <= 300 then
		-- Reset bar
		progress.Size = UDim2.new(0, 0, 1, 0)
		progress.BackgroundTransparency = 0
		loadingBar.BackgroundTransparency = 1
		loadingText.TextTransparency = 1

		-- Show loading screen
		loading.Visible = true
		tweenService:Create(loading, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
		tweenService:Create(loadingText, TweenInfo.new(0.4), {TextTransparency = 0}):Play()
		tweenService:Create(loadingBar, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()
		tweenService:Create(progress, TweenInfo.new(0.4), {BackgroundTransparency = 0}):Play()

		-- Animate progress bar
		tweenService:Create(progress, TweenInfo.new(3, Enum.EasingStyle.Linear), {
			Size = UDim2.new(1, 0, 1, 0)
		}):Play()

		-- Finish loading
		task.delay(3, function()
			tweenService:Create(loading, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
			tweenService:Create(loadingText, TweenInfo.new(0.4), {TextTransparency = 1}):Play()
			tweenService:Create(loadingBar, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
			tweenService:Create(progress, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()

			-- Show notification
			tweenService:Create(notification, TweenInfo.new(0.4), {
				TextTransparency = 0,
				BackgroundTransparency = 0
			}):Play()

			task.delay(3, function()
				tweenService:Create(notification, TweenInfo.new(0.4), {
					TextTransparency = 1,
					BackgroundTransparency = 1
				}):Play()
			end)
		end)
	else
		input.Text = ""
		input.PlaceholderText = "Enter 1 - 300 only!"
	end
end)

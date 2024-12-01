-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Player = Players.LocalPlayer
local Character = Player.Character or Player.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Variables
local ESPEnabled = false
local ESP2Enabled = false
local ESPColor = Color3.fromRGB(189, 31, 37) -- Couleur par défaut (Rouge)
local ESP2Color = Color3.fromRGB(0, 0, 255)  -- Couleur par défaut pour ESP 2 (Bleu)

-- Couleurs disponibles
local Colors = {
    Red = Color3.fromRGB(189, 31, 37),
    Blue = Color3.fromRGB(0, 0, 255),
    Green = Color3.fromRGB(0, 255, 0)
}

-- Interface principale
local ScreenGui = Instance.new("ScreenGui")
local MainButton = Instance.new("ImageButton")
local ExtendedFrame = Instance.new("Frame")
local ESPButton = Instance.new("TextButton")
local SpeedButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

-- ESP Section
local ESPFrame = Instance.new("Frame")
local ToggleESPButton = Instance.new("TextButton")
local ToggleESP2Button = Instance.new("TextButton")
local ColorRedButton = Instance.new("TextButton")
local ColorBlueButton = Instance.new("TextButton")
local ColorGreenButton = Instance.new("TextButton")
local BackButtonESP = Instance.new("TextButton") -- Bouton Retour ESP

-- Speed Section
local SpeedFrame = Instance.new("Frame")
local SpeedInput = Instance.new("TextBox")
local ApplySpeedButton = Instance.new("TextButton")
local ToggleSpeedButton = Instance.new("TextButton")
local BackButtonSpeed = Instance.new("TextButton") -- Bouton Retour Vitesse

-- Configuration de l'interface principale
ScreenGui.Parent = Player:WaitForChild("PlayerGui")

MainButton.Parent = ScreenGui
MainButton.Size = UDim2.new(0, 50, 0, 50)
MainButton.Position = UDim2.new(0.1, 0, 0.1, 0)
MainButton.BackgroundColor3 = Color3.new(0, 0, 0)
MainButton.Image = "rbxassetid://10207885652"
MainButton.Active = true
MainButton.Draggable = true -- Carré déplaçable

ExtendedFrame.Parent = ScreenGui
ExtendedFrame.Size = UDim2.new(0, 400, 0, 300)
ExtendedFrame.Position = UDim2.new(0.2, 0, 0.2, 0)
ExtendedFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
ExtendedFrame.Visible = false

ESPButton.Parent = ExtendedFrame
ESPButton.Text = "ESP"
ESPButton.Size = UDim2.new(0.4, 0, 0.2, 0)
ESPButton.Position = UDim2.new(0.1, 0, 0.1, 0)
ESPButton.BackgroundColor3 = Color3.fromRGB(100, 100, 200)

SpeedButton.Parent = ExtendedFrame
SpeedButton.Text = "Vitesse"
SpeedButton.Size = UDim2.new(0.4, 0, 0.2, 0)
SpeedButton.Position = UDim2.new(0.5, 0, 0.1, 0)
SpeedButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)

CloseButton.Parent = ExtendedFrame
CloseButton.Text = "Fermer"
CloseButton.Size = UDim2.new(0.3, 0, 0.1, 0)
CloseButton.Position = UDim2.new(0.35, 0, 0.85, 0)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

-- Configuration ESP Section
ESPFrame.Parent = ExtendedFrame
ESPFrame.Size = UDim2.new(1, 0, 1, 0)
ESPFrame.Position = UDim2.new(0, 0, 0, 0)
ESPFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
ESPFrame.Visible = false

ToggleESPButton.Parent = ESPFrame
ToggleESPButton.Text = "Activer/Désactiver ESP"
ToggleESPButton.Size = UDim2.new(0.6, 0, 0.1, 0)
ToggleESPButton.Position = UDim2.new(0.2, 0, 0.3, 0)
ToggleESPButton.BackgroundColor3 = Color3.fromRGB(100, 100, 200)

ToggleESP2Button.Parent = ESPFrame
ToggleESP2Button.Text = "Activer/Désactiver ESP 2"
ToggleESP2Button.Size = UDim2.new(0.6, 0, 0.1, 0)
ToggleESP2Button.Position = UDim2.new(0.2, 0, 0.45, 0)
ToggleESP2Button.BackgroundColor3 = Color3.fromRGB(100, 100, 200)

ColorRedButton.Parent = ESPFrame
ColorRedButton.Text = "Rouge"
ColorRedButton.Size = UDim2.new(0.6, 0, 0.1, 0)
ColorRedButton.Position = UDim2.new(0.2, 0, 0.6, 0)
ColorRedButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)

ColorBlueButton.Parent = ESPFrame
ColorBlueButton.Text = "Bleu"
ColorBlueButton.Size = UDim2.new(0.6, 0, 0.1, 0)
ColorBlueButton.Position = UDim2.new(0.2, 0, 0.75, 0)
ColorBlueButton.BackgroundColor3 = Color3.fromRGB(0, 0, 255)

ColorGreenButton.Parent = ESPFrame
ColorGreenButton.Text = "Vert"
ColorGreenButton.Size = UDim2.new(0.6, 0, 0.1, 0)
ColorGreenButton.Position = UDim2.new(0.2, 0, 0.9, 0)
ColorGreenButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)

BackButtonESP.Parent = ESPFrame
BackButtonESP.Text = "Retour"
BackButtonESP.Size = UDim2.new(0.3, 0, 0.1, 0)
BackButtonESP.Position = UDim2.new(0.35, 0, 0.85, 0)
BackButtonESP.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

-- Configuration Speed Section
SpeedFrame.Parent = ExtendedFrame
SpeedFrame.Size = UDim2.new(1, 0, 1, 0)
SpeedFrame.Position = UDim2.new(0, 0, 0, 0)
SpeedFrame.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
SpeedFrame.Visible = false

SpeedInput.Parent = SpeedFrame
SpeedInput.PlaceholderText = "Vitesse"
SpeedInput.Size = UDim2.new(0.6, 0, 0.1, 0)
SpeedInput.Position = UDim2.new(0.2, 0, 0.3, 0)
SpeedInput.BackgroundColor3 = Color3.new(1, 1, 1)

ApplySpeedButton.Parent = SpeedFrame
ApplySpeedButton.Text = "Appliquer"
ApplySpeedButton.Size = UDim2.new(0.3, 0, 0.1, 0)
ApplySpeedButton.Position = UDim2.new(0.2, 0, 0.5, 0)
ApplySpeedButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)

ToggleSpeedButton.Parent = SpeedFrame
ToggleSpeedButton.Text = "Activer/Désactiver"
ToggleSpeedButton.Size = UDim2.new(0.3, 0, 0.1, 0)
ToggleSpeedButton.Position = UDim2.new(0.55, 0, 0.5, 0)
ToggleSpeedButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)

BackButtonSpeed.Parent = SpeedFrame
BackButtonSpeed.Text = "Retour"
BackButtonSpeed.Size = UDim2.new(0.3, 0, 0.1, 0)
BackButtonSpeed.Position = UDim2.new(0.35, 0, 0.85, 0)
BackButtonSpeed.BackgroundColor3 = Color3.fromRGB(200, 50, 50)

-- ESP Script (ESP 1)
local function toggleESP()
    ESPEnabled = not ESPEnabled
    if ESPEnabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player then
                local character = player.Character or player.CharacterAdded:Wait()
                local highlight = Instance.new("Highlight")
                highlight.Adornee = character
                highlight.FillTransparency = 1
                highlight.OutlineColor = ESPColor
                highlight.OutlineTransparency = 0
                highlight.Parent = character
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            local character = player.Character
            if character then
                for _, obj in ipairs(character:GetChildren()) do
                    if obj:IsA("Highlight") then
                        obj:Destroy()
                    end
                end
            end
        end
    end
end

-- ESP 2 Script
local function toggleESP2()
    ESP2Enabled = not ESP2Enabled
    if ESP2Enabled then
        for _, player in ipairs(Players:GetPlayers()) do
            if player ~= Player then
                local character = player.Character or player.CharacterAdded:Wait()
                local highlight = Instance.new("Highlight")
                highlight.Adornee = character
                highlight.FillTransparency = 1
                highlight.OutlineColor = ESP2Color
                highlight.OutlineTransparency = 0
                highlight.Parent = character
            end
        end
    else
        for _, player in ipairs(Players:GetPlayers()) do
            local character = player.Character
            if character then
                for _, obj in ipairs(character:GetChildren()) do
                    if obj:IsA("Highlight") then
                        obj:Destroy()
                    end
                end
            end
        end
    end
end

-- Event Handlers
MainButton.MouseButton1Click:Connect(function()
    ExtendedFrame.Visible = not ExtendedFrame.Visible
end)

ESPButton.MouseButton1Click:Connect(function()
    ESPFrame.Visible = true
    ExtendedFrame.Visible = false
end)

SpeedButton.MouseButton1Click:Connect(function()
    SpeedFrame.Visible = true
    ExtendedFrame.Visible = false
end)

CloseButton.MouseButton1Click:Connect(function()
    ExtendedFrame.Visible = false
end)

BackButtonESP.MouseButton1Click:Connect(function()
    ESPFrame.Visible = false
    ExtendedFrame.Visible = true
end)

BackButtonSpeed.MouseButton1Click:Connect(function()
    SpeedFrame.Visible = false
    ExtendedFrame.Visible = true
end)

ToggleESPButton.MouseButton1Click:Connect(toggleESP)
ToggleESP2Button.MouseButton1Click:Connect(toggleESP2)
ColorRedButton.MouseButton1Click:Connect(function()
    ESPColor = Colors.Red
    toggleESP()  -- Met à jour l'ESP avec la nouvelle couleur
end)
ColorBlueButton.MouseButton1Click:Connect(function()
    ESPColor = Colors.Blue
    toggleESP()  -- Met à jour l'ESP avec la nouvelle couleur
end)
ColorGreenButton.MouseButton1Click:Connect(function()
    ESPColor = Colors.Green
    toggleESP()  -- Met à jour l'ESP avec la nouvelle couleur
end)
ApplySpeedButton.MouseButton1Click:Connect(function()
    local newSpeed = tonumber(SpeedInput.Text)
    if newSpeed then
        Humanoid.WalkSpeed = newSpeed
    end
end)

ToggleSpeedButton.MouseButton1Click:Connect(function()
    -- Logique pour activer ou désactiver la vitesse
end)

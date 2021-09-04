local Library = loadstring(game:HttpGet("https://pastebin.com/raw/k8nfrFKx"))()
local Window = Library:Window("Vans World")

Window:Label("Le Mod", Color3.fromRGB(255, 255, 255))

Window:Button("Max Level", function()
    local ohString1 = "Lenna"
game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
    while wait(0.1) do
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        
        local ohBoolean1 = true
        local ohNumber2 = 999999
        local ohNumber3 = 999999
        local ohTable4 = {
            [1] = {
                ["TrickName"] = "Kickflip",
                ["HasbeenReported"] = true,
                ["IsRampTrick"] = false,
                ["Value"] = 999999
            }
        }
        
        game:GetService("ReplicatedStorage").Tricks_TrickLanded:FireServer(ohBoolean1, ohNumber2, ohNumber3, ohTable4)
        end
    print("Leena Mod")
end)


Window:Button("Fake Coins Reward", function()
    local ohString1 = "Lenna"
game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
    local ohString1 = "QUEST REWARD"
    local ohTable2 = {
        ["Wafflecoins"] = {
            ["Title"] = "Hacked By Mostafa",
            ["Amount"] = 99999999999,
            ["Description"] = "Waffle coins",
            ["Icon"] = "rbxassetid://6966069020",
            ["Category"] = "Currency"
        }
    }
    game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
    print("Leena Mod")
end)

Window:Button("Fake Stars Reward", function()
    local ohString1 = "Lenna"
game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
local ohString1 = "Level Up"
local ohTable2 = {
	[1] = {
		["Icon"] = "rbxassetid://7281100015",
		["Title"] = "Hacked By Mostafa",
		["Amount"] = 99999999999
	}
}

game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
    print("Leena Mod")
end)

Window:Button("Fake XP Reward", function()
    local ohString1 = "Lenna"
game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
    local ohString1 = "COMPETITION REWARDS"
    local ohTable2 = {
        ["XP"] = {
            ["IconName"] = "",
            ["Title"] = "Hacked By Mostafa",
            ["Amount"] = 9999999999,
            ["Icon"] = "rbxassetid://7064712626",
            ["Description"] = ""
        }
    }
    
    game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)
    print("Leena Mod")
end)

Window:Slider("WalkSpeed", 0, 200, 16, function(Value)
    print(Value)
    game:GetService("Players").LocalPlayer.Character.Humanoid.WalkSpeed = tonumber(Value)
end)

Window:Box("JumpPower", function(Text, FocustLost)
    if FocustLost then
        print(Text)
        game:GetService("Players").LocalPlayer.Character.Humanoid.JumpPower = tonumber(Text)
    end
end)

local Tbl = {}
for I,V in pairs(game:GetService("Players"):GetPlayers()) do
    Tbl[I] = V.Name
end
Window:Dropdown("TP to Player", Tbl, function(Player)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Player].Character.HumanoidRootPart.CFrame
end)

local Window = Library:Window("Credits")

Window:Button("Copy My Discord Server Link", function()
setclipboard("https://discord.gg/YFe8auj6")
toclipboard("https://discord.gg/YFe8auj6")
end)

local ohString1 = "Leena"
game:GetService("Players").LocalPlayer.PlayerGui.HUD.RewardNotification.RewardNotificationController.DisplayRewards:Invoke(ohString1, ohTable2)

local Window =
    Fluent:CreateWindow(
    {
        Title = "Etronix",
        SubTitle = "by uerd",
        TabWidth = 160,
        Size = UDim2.fromOffset(580, 460),
        Acrylic = true,
        Theme = "Amethyst",
        MinimizeKey = Enum.KeyCode.RightControl
    }
)

local Tabs = {
    Home = Window:AddTab({Title = "Home", Icon = "home"}),
    Player = Window:AddTab({Title = "Player", Icon = "user"}),
    Main = Window:AddTab({Title = "Training", Icon = "infinity"}),
}

local Options = Fluent.Options

Window:SelectTab(1) -- Select the home tab

-- Home
Tabs.Home:AddParagraph(
    {
        Title = "Welcome to Etronix!",
        Content = "Enjoy using Etronix! Your current game is Money Grab Simulator."
    }
)

-- Player
Tabs.Player:AddParagraph(
    {
        Title = "General"
    }
)

-- Walkspeed & Jump power
local walkspeedSlider =
    Tabs.Player:AddSlider(
    "walkspeedSlider",
    {
        Title = "Walkspeed",
        Description = "Adjust your walkspeed",
        Default = 16,
        Min = 1,
        Max = 500,
        Rounding = 0,
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Value
        end
    }
)

local walkspeedInput =
    Tabs.Player:AddInput(
    "walkspeedInput",
    {
        Title = "Custom Walkspeed",
        Default = 16,
        Placeholder = "Enter a number",
        Numeric = true,
        Finished = true,
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Value
        end
    }
)

local jumpPowerSlider =
    Tabs.Player:AddSlider(
    "jumpPowerSlider",
    {
        Title = "Jump Power",
        Description = "Adjust your jump power",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 0,
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Value
        end
    }
)

local jumpPowerInput =
    Tabs.Player:AddInput(
    "jumpPowerInput",
    {
        Title = "Custom jump power",
        Default = 16,
        Placeholder = "Enter a number",
        Numeric = true,
        Finished = true,
        Callback = function(Value)
            game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").JumpPower = Value
        end
    }
)

-- Infinite Jump
local infiniteJumpToggle = Tabs.Player:AddToggle("infiniteJumpToggle", {Title = "Infinite Jump", Default = false})

function infiniteJump()
    local plr = game:GetService("Players").LocalPlayer
    local m = plr:GetMouse()
    m.KeyDown:connect(
        function(k)
            if _G.infinjump == true then
                if k:byte() == 32 then -- Spacebar
                    local humanoid = game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
                    if humanoid then
                        humanoid:ChangeState("Jumping")
                        wait()
                        humanoid:ChangeState("Seated")
                    end
                end
            end
        end
    )
end

infiniteJumpToggle:OnChanged(
    function()
        _G.infinjump = Options.infiniteJumpToggle.Value
        if _G.infinjump then
            infiniteJump()
        else
            _G.infinjump = false
            infiniteJump()
        end
    end
)

-- Main

local infiniteStrengthToggle = Tabs.Main:AddToggle("infiniteStrengthToggle", { Title = "Infinite Strength", Default = false })
local infiniteWinsToggle = Tabs.Main:AddToggle("infiniteWinsToggle", { Title = "Infinite Wins", Default = false })
local infiniteRebirthToggle = Tabs.Main:AddToggle("infiniteRebirthToggle", { Title = "Infinite Rebirths", Default = false })
local infiniteEnchantToggle = Tabs.Main:AddToggle("infiniteEnchantToggle", { Title = "Infinite Enchants", Default = false })

function infiniteStrength()
    if _G.infiniteStrength then
        game:GetService("ReplicatedStorage").Event.Train:FireServer(math.huge)
        wait(0.0001)
    end
end

function infiniteWins()
    if _G.infiniteWins then
        game:GetService("ReplicatedStorage").Event.WinGain:FireServer(math.huge)
        wait(0.0001)
    end
end

function infiniteRebirths()
    if _G.infiniteRebirths then
        game:GetService("ReplicatedStorage").Event.HealthAdd:FireServer(0)
        wait(0.0001)
    end
end

function infiniteEnchants()
    if _G.infiniteEnchants then
        game:GetService("ReplicatedStorage").Event.Enchanted:FireServer(0, math.huge)
        wait(0.0001)
    end
end

infiniteStrengthToggle:OnChanged(
    function()
        _G.infiniteStrength = Options.infiniteStrengthToggle.Value
        if _G.infiniteStrength then
            infiniteStrength()
        else
            _G.infiniteStrength = false
            infiniteStrength()
        end
    end
)

infiniteWinsToggle:OnChanged(
    function()
        _G.infiniteWins = Options.infiniteWinsToggle.Value
        if _G.infiniteWins then
            infiniteWins()
        else
            _G.infiniteWins = false
            infiniteWins()
        end
    end
)

infiniteRebirthToggle:OnChanged(
    function()
        _G.infiniteRebirths = Options.infiniteRebirthToggle.Value
        if _G.infiniteRebirths then
            infiniteRebirths()
        else
            _G.infiniteRebirths = false
            infiniteRebirths()
        end
    end
)

infiniteEnchantToggle:OnChanged(
    function()
        _G.infiniteEnchants = Options.infiniteEnchantToggle.Value
        if _G.infiniteEnchants then
            infiniteEnchants()
        else
            _G.infiniteEnchants = false
            infiniteEnchants()
        end
    end
)
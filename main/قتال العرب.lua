local DiscordLib = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()

local win = DiscordLib:Window("Outlaws Hack")

local serv = win:Server("Outlaws", "")

local btns = serv:Channel("Aimbot")

btns:Button("Aimbot", function()
DiscordLib:Notification("Notification", "Aimbot Active", "Okay")
local Camera = workspace.CurrentCamera
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local LocalPlayer = Players.LocalPlayer
local Holding = false

_G.AimbotEnabled = true
_G.TeamCheck = false 
_G.AimPart = "Head" 
_G.Sensitivity = 0

_G.CircleSides = 64 
_G.CircleColor = Color3.fromRGB(255, 255, 255)
_G.CircleTransparency = 0.7 
_G.CircleRadius = 0 
_G.CircleFilled = false
_G.CircleVisible = true
_G.CircleThickness = 0 

local FOVCircle = Drawing.new("Circle")
FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Filled = _G.CircleFilled
FOVCircle.Color = _G.CircleColor
FOVCircle.Visible = _G.CircleVisible
FOVCircle.Radius = _G.CircleRadius
FOVCircle.Transparency = _G.CircleTransparency
FOVCircle.NumSides = _G.CircleSides
FOVCircle.Thickness = _G.CircleThickness

local function GetClosestPlayer()
	local MaximumDistance = _G.CircleRadius
	local Target = nil

	for _, v in next, Players:GetPlayers() do
		if v.Name ~= LocalPlayer.Name then
			if _G.TeamCheck == true then
				if v.Team ~= LocalPlayer.Team then
					if v.Character ~= nil then
						if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
							if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
								local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
								local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
								
								if VectorDistance < MaximumDistance then
									Target = v
								end
							end
						end
					end
				end
			else
				if v.Character ~= nil then
					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
							
							if VectorDistance < MaximumDistance then
								Target = v
							end
						end
					end
				end
			end
		end
	end

	return Target
end

UserInputService.InputBegan:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = true
    end
end)

UserInputService.InputEnded:Connect(function(Input)
    if Input.UserInputType == Enum.UserInputType.MouseButton2 then
        Holding = false
    end
end)

RunService.RenderStepped:Connect(function()
    FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Filled = _G.CircleFilled
    FOVCircle.Color = _G.CircleColor
    FOVCircle.Visible = _G.CircleVisible
    FOVCircle.Radius = _G.CircleRadius
    FOVCircle.Transparency = _G.CircleTransparency
    FOVCircle.NumSides = _G.CircleSides
    FOVCircle.Thickness = _G.CircleThickness

    if Holding == true and _G.AimbotEnabled == true then
        TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
    end
end)
end)

btns:Slider("Aimbot Fov", 0, 500, 0, function(t)
    _G.CircleRadius = (t) 
print(t)
end)

btns:Button("Silent aim", function()
DiscordLib:Notification("Notification", "Silent aim Active", "Okay")
local CurrentCamera = workspace.CurrentCamera
local Players = game.GetService(game, "Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
function ClosestPlayer()
    local MaxDist, Closest = math.huge
    for I,V in pairs(Players.GetPlayers(Players)) do
        if V == LocalPlayer then continue end
        if V.Team == LocalPlayer then continue end
        if not V.Character then continue end
        local Head = V.Character.FindFirstChild(V.Character, "Head")
        if not Head then continue end
        local Pos, Vis = CurrentCamera.WorldToScreenPoint(CurrentCamera, Head.Position)
        if not Vis then continue end
        local MousePos, TheirPos = Vector2.new(Mouse.X, Mouse.Y), Vector2.new(Pos.X, Pos.Y)
        local Dist = (TheirPos - MousePos).Magnitude
        if Dist < MaxDist then
            MaxDist = Dist
            Closest = V
        end
    end
    return Closest
end
local MT = getrawmetatable(game)
local OldNC = MT.__namecall
local OldIDX = MT.__index
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Args, Method = {...}, getnamecallmethod()
    if Method == "FindPartOnRayWithIgnoreList" and not checkcaller() then
        local CP = ClosestPlayer()
        if CP and CP.Character and CP.Character.FindFirstChild(CP.Character, "Head") then
            Args[1] = Ray.new(CurrentCamera.CFrame.Position, (CP.Character.Head.Position - CurrentCamera.CFrame.Position).Unit * 1000)
            return OldNC(self, unpack(Args))
        end
    end
    return OldNC(self, ...)
end)
MT.__index = newcclosure(function(self, K)
    if K == "Clips" then
        return workspace.Map
    end
    return OldIDX(self, K)
end)
setreadonly(MT, true)
end)

btns:Button("HitBox", function()
DiscordLib:Notification("Notification", "HitBox Active", "Okay")
_G.HeadSize = 20
_G.Disabled = true

game:GetService('RunService').RenderStepped:connect(function()
if _G.Disabled then
for i,v in next, game:GetService('Players'):GetPlayers() do
if v.Name ~= game:GetService('Players').LocalPlayer.Name then
pcall(function()
v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
v.Character.HumanoidRootPart.Transparency = 0.7
v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue")
v.Character.HumanoidRootPart.Material = "Neon"
v.Character.HumanoidRootPart.CanCollide = false
end)
end
end
end
end)
end)

local btns = serv:Channel("Esp")

btns:Button("Box & Name", function()
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
DiscordLib:Notification("Notification", "Box Active", "Okay")
end)

local btns = serv:Channel("Map")

btns:Button("infinte jump", function()
InfiniteJumpEnabled = true
game:GetService("UserInputService").JumpRequest:connect(function()
	if InfiniteJumpEnabled then
		game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
	end
end)
end)

btns:Button("Fly", function()
    repeat wait() 
	until game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:findFirstChild("Head") and game.Players.LocalPlayer.Character:findFirstChild("Humanoid") 
local mouse = game.Players.LocalPlayer:GetMouse() 
repeat wait() until mouse
local plr = game.Players.LocalPlayer 
local torso = plr.Character.Head 
local flying = false
local deb = true 
local ctrl = {f = 0, b = 0, l = 0, r = 0} 
local lastctrl = {f = 0, b = 0, l = 0, r = 0} 
local maxspeed = 120
local speed = 0 

function Fly() 
local bg = Instance.new("BodyGyro", torso) 
bg.P = 9e4 
bg.maxTorque = Vector3.new(9e9, 9e9, 9e9) 
bg.cframe = torso.CFrame 
local bv = Instance.new("BodyVelocity", torso) 
bv.velocity = Vector3.new(0,0.1,0) 
bv.maxForce = Vector3.new(9e9, 9e9, 9e9) 
repeat wait() 
plr.Character.Humanoid.PlatformStand = true 
if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then 
speed = speed+.5+(speed/maxspeed) 
if speed > maxspeed then 
speed = maxspeed 
end 
elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then 
speed = speed-1 
if speed < 0 then 
speed = 0 
end 
end 
if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r} 
elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then 
bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed 
else 
bv.velocity = Vector3.new(0,0.1,0) 
end 
bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0) 
until not flying 
ctrl = {f = 0, b = 0, l = 0, r = 0} 
lastctrl = {f = 0, b = 0, l = 0, r = 0} 
speed = 0 
bg:Destroy() 
bv:Destroy() 
plr.Character.Humanoid.PlatformStand = false 
end 
mouse.KeyDown:connect(function(key) 
if key:lower() == "e" then 
if flying then flying = false 
else 
flying = true 
Fly() 
end 
elseif key:lower() == "w" then 
ctrl.f = 1 
elseif key:lower() == "s" then 
ctrl.b = -1 
elseif key:lower() == "a" then 
ctrl.l = -1 
elseif key:lower() == "d" then 
ctrl.r = 1 
end 
end) 
mouse.KeyUp:connect(function(key) 
if key:lower() == "w" then 
ctrl.f = 0 
elseif key:lower() == "s" then 
ctrl.b = 0 
elseif key:lower() == "a" then 
ctrl.l = 0 
elseif key:lower() == "d" then 
ctrl.r = 0 
end 
end)
Fly()
end)

btns:Button("Teleport", function()
    clicktpon = true                    
    plr = game.Players.LocalPlayer
    hum = plr.Character.HumanoidRootPart
    mouse = plr:GetMouse()
    mouse.KeyDown:connect(function(key)
    if key == 'q' then
    if mouse.Target then
    if clicktpon then
    hum.CFrame = CFrame.new (mouse.Hit.x, mouse.Hit.y + 5, mouse.Hit.z)
    end
    end
    end
    end)
end)

btns:Button("Freecam Shift+P", function()
    function sandbox(var,func)
        local env = getfenv(func)
        local newenv = setmetatable({},{
        __index = function(self,k)
        if k=="script" then
        return var
        else
        return env[k]
        end
        end,
        })
        setfenv(func,newenv)
        return func
        end
        cors = {}
        mas = Instance.new("Model",game:GetService("Lighting"))
        LocalScript0 = Instance.new("LocalScript")
        LocalScript0.Name = "FreeCamera"
        LocalScript0.Parent = mas
        table.insert(cors,sandbox(LocalScript0,function()

    
        local pi    = math.pi
        local abs   = math.abs
        local clamp = math.clamp
        local exp   = math.exp
        local rad   = math.rad
        local sign  = math.sign
        local sqrt  = math.sqrt
        local tan   = math.tan
        
        local ContextActionService = game:GetService("ContextActionService")
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local StarterGui = game:GetService("StarterGui")
        local UserInputService = game:GetService("UserInputService")
        
        local LocalPlayer = Players.LocalPlayer
        if not LocalPlayer then
        Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
        LocalPlayer = Players.LocalPlayer
        end
        
        local Camera = workspace.CurrentCamera
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
        local newCamera = workspace.CurrentCamera
        if newCamera then
        Camera = newCamera
        end
        end)
        
        ------------------------------------------------------------------------
        
        local TOGGLE_INPUT_PRIORITY = Enum.ContextActionPriority.Low.Value
        local INPUT_PRIORITY = Enum.ContextActionPriority.High.Value
        local FREECAM_MACRO_KB = {Enum.KeyCode.LeftShift, Enum.KeyCode.P}
        
        local NAV_GAIN = Vector3.new(1, 1, 1)*64
        local PAN_GAIN = Vector2.new(0.75, 1)*8
        local FOV_GAIN = 300
        
        local PITCH_LIMIT = rad(90)
        
        local VEL_STIFFNESS = 1.5
        local PAN_STIFFNESS = 1.0
        local FOV_STIFFNESS = 4.0
        
        ------------------------------------------------------------------------
        
        local Spring = {} do
        Spring.__index = Spring
        
        function Spring.new(freq, pos)
        local self = setmetatable({}, Spring)
        self.f = freq
        self.p = pos
        self.v = pos*0
        return self
        end
        
        function Spring:Update(dt, goal)
        local f = self.f*2*pi
        local p0 = self.p
        local v0 = self.v
        
        local offset = goal - p0
        local decay = exp(-f*dt)
        
        local p1 = goal + (v0*dt - offset*(f*dt + 1))*decay
        local v1 = (f*dt*(offset*f - v0) + v0)*decay
        
        self.p = p1
        self.v = v1
        
        return p1
        end
        
        function Spring:Reset(pos)
        self.p = pos
        self.v = pos*0
        end
        end
        
        ------------------------------------------------------------------------
        
        local cameraPos = Vector3.new()
        local cameraRot = Vector2.new()
        local cameraFov = 0
        
        local velSpring = Spring.new(VEL_STIFFNESS, Vector3.new())
        local panSpring = Spring.new(PAN_STIFFNESS, Vector2.new())
        local fovSpring = Spring.new(FOV_STIFFNESS, 0)
        
        ------------------------------------------------------------------------
        
        local Input = {} do
        local thumbstickCurve do
        local K_CURVATURE = 2.0
        local K_DEADZONE = 0.15
        
        local function fCurve(x)
        return (exp(K_CURVATURE*x) - 1)/(exp(K_CURVATURE) - 1)
        end
        
        local function fDeadzone(x)
        return fCurve((x - K_DEADZONE)/(1 - K_DEADZONE))
        end
        
        function thumbstickCurve(x)
        return sign(x)*clamp(fDeadzone(abs(x)), 0, 1)
        end
        end
        
        local gamepad = {
        ButtonX = 0,
        ButtonY = 0,
        DPadDown = 0,
        DPadUp = 0,
        ButtonL2 = 0,
        ButtonR2 = 0,
        Thumbstick1 = Vector2.new(),
        Thumbstick2 = Vector2.new(),
        }
        
        local keyboard = {
        W = 0,
        A = 0,
        S = 0,
        D = 0,
        E = 0,
        Q = 0,
        U = 0,
        H = 0,
        J = 0,
        K = 0,
        I = 0,
        Y = 0,
        Up = 0,
        Down = 0,
        LeftShift = 0,
        RightShift = 0,
        }
        
        local mouse = {
        Delta = Vector2.new(),
        MouseWheel = 0,
        }
        
        local NAV_GAMEPAD_SPEED  = Vector3.new(1, 1, 1)
        local NAV_KEYBOARD_SPEED = Vector3.new(1, 1, 1)
        local PAN_MOUSE_SPEED    = Vector2.new(1, 1)*(pi/64)
        local PAN_GAMEPAD_SPEED  = Vector2.new(1, 1)*(pi/8)
        local FOV_WHEEL_SPEED    = 1.0
        local FOV_GAMEPAD_SPEED  = 0.25
        local NAV_ADJ_SPEED      = 0.75
        local NAV_SHIFT_MUL      = 0.25
        
        local navSpeed = 1
        
        function Input.Vel(dt)
        navSpeed = clamp(navSpeed + dt*(keyboard.Up - keyboard.Down)*NAV_ADJ_SPEED, 0.01, 4)
        
        local kGamepad = Vector3.new(
        thumbstickCurve(gamepad.Thumbstick1.x),
        thumbstickCurve(gamepad.ButtonR2) - thumbstickCurve(gamepad.ButtonL2),
        thumbstickCurve(-gamepad.Thumbstick1.y)
        )*NAV_GAMEPAD_SPEED
        
        local kKeyboard = Vector3.new(
        keyboard.D - keyboard.A + keyboard.K - keyboard.H,
        keyboard.E - keyboard.Q + keyboard.I - keyboard.Y,
        keyboard.S - keyboard.W + keyboard.J - keyboard.U
        )*NAV_KEYBOARD_SPEED
        
        local shift = UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)
        
        return (kGamepad + kKeyboard)*(navSpeed*(shift and NAV_SHIFT_MUL or 1))
        end
        
        function Input.Pan(dt)
        local kGamepad = Vector2.new(
        thumbstickCurve(gamepad.Thumbstick2.y),
        thumbstickCurve(-gamepad.Thumbstick2.x)
        )*PAN_GAMEPAD_SPEED
        local kMouse = mouse.Delta*PAN_MOUSE_SPEED
        mouse.Delta = Vector2.new()
        return kGamepad + kMouse
        end
        
        function Input.Fov(dt)
        local kGamepad = (gamepad.ButtonX - gamepad.ButtonY)*FOV_GAMEPAD_SPEED
        local kMouse = mouse.MouseWheel*FOV_WHEEL_SPEED
        mouse.MouseWheel = 0
        return kGamepad + kMouse
        end
        
        do
        local function Keypress(action, state, input)
        keyboard[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
        return Enum.ContextActionResult.Sink
        end
        
        local function GpButton(action, state, input)
        gamepad[input.KeyCode.Name] = state == Enum.UserInputState.Begin and 1 or 0
        return Enum.ContextActionResult.Sink
        end
        
        local function MousePan(action, state, input)
        local delta = input.Delta
        mouse.Delta = Vector2.new(-delta.y, -delta.x)
        return Enum.ContextActionResult.Sink
        end
        
        local function Thumb(action, state, input)
        gamepad[input.KeyCode.Name] = input.Position
        return Enum.ContextActionResult.Sink
        end
        
        local function Trigger(action, state, input)
        gamepad[input.KeyCode.Name] = input.Position.z
        return Enum.ContextActionResult.Sink
        end
        
        local function MouseWheel(action, state, input)
        mouse[input.UserInputType.Name] = -input.Position.z
        return Enum.ContextActionResult.Sink
        end
        
        local function Zero(t)
        for k, v in pairs(t) do
        t[k] = v*0
        end
        end
        
        function Input.StartCapture()
        ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, INPUT_PRIORITY,
        Enum.KeyCode.W, Enum.KeyCode.U,
        Enum.KeyCode.A, Enum.KeyCode.H,
        Enum.KeyCode.S, Enum.KeyCode.J,
        Enum.KeyCode.D, Enum.KeyCode.K,
        Enum.KeyCode.E, Enum.KeyCode.I,
        Enum.KeyCode.Q, Enum.KeyCode.Y,
        Enum.KeyCode.Up, Enum.KeyCode.Down
        )
        ContextActionService:BindActionAtPriority("FreecamMousePan",          MousePan,   false, INPUT_PRIORITY, Enum.UserInputType.MouseMovement)
        ContextActionService:BindActionAtPriority("FreecamMouseWheel",        MouseWheel, false, INPUT_PRIORITY, Enum.UserInputType.MouseWheel)
        ContextActionService:BindActionAtPriority("FreecamGamepadButton",     GpButton,   false, INPUT_PRIORITY, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
        ContextActionService:BindActionAtPriority("FreecamGamepadTrigger",    Trigger,    false, INPUT_PRIORITY, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
        ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb,      false, INPUT_PRIORITY, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
        end
        
        function Input.StopCapture()
        navSpeed = 1
        Zero(gamepad)
        Zero(keyboard)
        Zero(mouse)
        ContextActionService:UnbindAction("FreecamKeyboard")
        ContextActionService:UnbindAction("FreecamMousePan")
        ContextActionService:UnbindAction("FreecamMouseWheel")
        ContextActionService:UnbindAction("FreecamGamepadButton")
        ContextActionService:UnbindAction("FreecamGamepadTrigger")
        ContextActionService:UnbindAction("FreecamGamepadThumbstick")
        end
        end
        end
        
        local function GetFocusDistance(cameraFrame)
        local znear = 0.1
        local viewport = Camera.ViewportSize
        local projy = 2*tan(cameraFov/2)
        local projx = viewport.x/viewport.y*projy
        local fx = cameraFrame.rightVector
        local fy = cameraFrame.upVector
        local fz = cameraFrame.lookVector
        
        local minVect = Vector3.new()
        local minDist = 512
        
        for x = 0, 1, 0.5 do
        for y = 0, 1, 0.5 do
        local cx = (x - 0.5)*projx
        local cy = (y - 0.5)*projy
        local offset = fx*cx - fy*cy + fz
        local origin = cameraFrame.p + offset*znear
        local part, hit = workspace:FindPartOnRay(Ray.new(origin, offset.unit*minDist))
        local dist = (hit - origin).magnitude
        if minDist > dist then
        minDist = dist
        minVect = offset.unit
        end
        end
        end
        
        return fz:Dot(minVect)*minDist
        end
        
        ------------------------------------------------------------------------
        
        local function StepFreecam(dt)
        local vel = velSpring:Update(dt, Input.Vel(dt))
        local pan = panSpring:Update(dt, Input.Pan(dt))
        local fov = fovSpring:Update(dt, Input.Fov(dt))
        
        local zoomFactor = sqrt(tan(rad(70/2))/tan(rad(cameraFov/2)))
        
        cameraFov = clamp(cameraFov + fov*FOV_GAIN*(dt/zoomFactor), 1, 120)
        cameraRot = cameraRot + pan*PAN_GAIN*(dt/zoomFactor)
        cameraRot = Vector2.new(clamp(cameraRot.x, -PITCH_LIMIT, PITCH_LIMIT), cameraRot.y%(2*pi))
        
        local cameraCFrame = CFrame.new(cameraPos)*CFrame.fromOrientation(cameraRot.x, cameraRot.y, 0)*CFrame.new(vel*NAV_GAIN*dt)
        cameraPos = cameraCFrame.p
        
        Camera.CFrame = cameraCFrame
        Camera.Focus = cameraCFrame*CFrame.new(0, 0, -GetFocusDistance(cameraCFrame))
        Camera.FieldOfView = cameraFov
        end
        
        ------------------------------------------------------------------------
        
        local PlayerState = {} do
        local mouseIconEnabled
        local cameraSubject
        local cameraType
        local cameraFocus
        local cameraCFrame
        local cameraFieldOfView
        local screenGuis = {}
        local coreGuis = {
        Backpack = true,
        Chat = true,
        Health = true,
        PlayerList = true,
        }
        local setCores = {
        BadgesNotificationsActive = true,
        PointsNotificationsActive = true,
        }
        
        -- Save state and set up for freecam
        function PlayerState.Push()
        for name in pairs(coreGuis) do
        coreGuis[name] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[name])
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], false)
        end
        for name in pairs(setCores) do
        setCores[name] = StarterGui:GetCore(name)
        StarterGui:SetCore(name, false)
        end
        local playergui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
        if playergui then
        for _, gui in pairs(playergui:GetChildren()) do
        if gui:IsA("ScreenGui") and gui.Enabled then
        screenGuis[#screenGuis + 1] = gui
        gui.Enabled = false
        end
        end
        end
        
        cameraFieldOfView = Camera.FieldOfView
        Camera.FieldOfView = 70
        
        cameraType = Camera.CameraType
        Camera.CameraType = Enum.CameraType.Custom
        
        cameraSubject = Camera.CameraSubject
        Camera.CameraSubject = nil
        
        cameraCFrame = Camera.CFrame
        cameraFocus = Camera.Focus
        
        mouseIconEnabled = UserInputService.MouseIconEnabled
        UserInputService.MouseIconEnabled = false
        
        mouseBehavior = UserInputService.MouseBehavior
        UserInputService.MouseBehavior = Enum.MouseBehavior.Default
        end
        
        -- Restore state
        function PlayerState.Pop()
        for name, isEnabled in pairs(coreGuis) do
        StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[name], isEnabled)
        end
        for name, isEnabled in pairs(setCores) do
        StarterGui:SetCore(name, isEnabled)
        end
        for _, gui in pairs(screenGuis) do
        if gui.Parent then
        gui.Enabled = true
        end
        end
        
        Camera.FieldOfView = cameraFieldOfView
        cameraFieldOfView = nil
        
        Camera.CameraType = cameraType
        cameraType = nil
        
        Camera.CameraSubject = cameraSubject
        cameraSubject = nil
        
        Camera.CFrame = cameraCFrame
        cameraCFrame = nil
        
        Camera.Focus = cameraFocus
        cameraFocus = nil
        
        UserInputService.MouseIconEnabled = mouseIconEnabled
        mouseIconEnabled = nil
        
        UserInputService.MouseBehavior = mouseBehavior
        mouseBehavior = nil
        end
        end
        
        local function StartFreecam()
        local cameraCFrame = Camera.CFrame
        cameraRot = Vector2.new(cameraCFrame:toEulerAnglesYXZ())
        cameraPos = cameraCFrame.p
        cameraFov = Camera.FieldOfView
        
        velSpring:Reset(Vector3.new())
        panSpring:Reset(Vector2.new())
        fovSpring:Reset(0)
        
        PlayerState.Push()
        RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
        Input.StartCapture()
        end
        
        local function StopFreecam()
        Input.StopCapture()
        RunService:UnbindFromRenderStep("Freecam")
        PlayerState.Pop()
        end
        
        ------------------------------------------------------------------------
        
        do
        local enabled = false
        
        local function ToggleFreecam()
        if enabled then
        StopFreecam()
        else
        StartFreecam()
        end
        enabled = not enabled
        end
        
        local function CheckMacro(macro)
        for i = 1, #macro - 1 do
        if not UserInputService:IsKeyDown(macro[i]) then
        return
        end
        end
        ToggleFreecam()
        end
        
        local function HandleActivationInput(action, state, input)
        if state == Enum.UserInputState.Begin then
        if input.KeyCode == FREECAM_MACRO_KB[#FREECAM_MACRO_KB] then
        CheckMacro(FREECAM_MACRO_KB)
        end
        end
        return Enum.ContextActionResult.Pass
        end
        
        ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, TOGGLE_INPUT_PRIORITY, FREECAM_MACRO_KB[#FREECAM_MACRO_KB])
        end
        end))
        for i,v in pairs(mas:GetChildren()) do
        v.Parent = game:GetService("Players").LocalPlayer.PlayerGui
        pcall(function() v:MakeJoints() end)
        end
        mas:Destroy()
        for i,v in pairs(cors) do
        spawn(function()
        pcall(v)
        end)
        end
end)

btns:Button("RemoveCameraZoom", function()
    getgenv().CameraMaxZoomDistance = 12000
  

    local RunService = game:GetService("RunService")
    
    RunService.Stepped:Connect(function()
        
        if getgenv().WS == true then
            game.Players.LocalPlayer.CameraMaxZoomDistance = getgenv().CameraMaxZoomDistance
        end
    end)
end)

btns:Slider("FovCame", 0, 120, 0, function(t)
game:GetService'Workspace'.Camera.FieldOfView = (t)
print(t)
end)


btns:Slider("WalkSpeed", 0, 300, 0, function(t)
    getgenv().WS = true 
    getgenv().WSSpeed = (t) 
    
    
    local RunService = game:GetService("RunService")
    
    RunService.Stepped:Connect(function()
    
        if getgenv().WS == true then
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").WalkSpeed = getgenv().WSSpeed
        end
    end)
print(t)
end)

btns:Slider("JumpPower", 0, 500, 0, function(t)
    getgenv().WS = true
    getgenv().JumpPower = (t)
    
    
    local RunService = game:GetService("RunService")
    
    RunService.Stepped:Connect(function()
        
        if getgenv().WS == true then
            game.Players.LocalPlayer.Character:FindFirstChild("Humanoid").JumpPower = getgenv().JumpPower
        end
    end)
print(t)
end)

local drops = serv:Channel("TP TO")

local Tbl = {}
for I,V in pairs(game:GetService("Players"):GetPlayers()) do
    Tbl[I] = V.Name
end
local drop = drops:Dropdown("TP to Player", Tbl, function(Player)
    game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[Player].Character.HumanoidRootPart.CFrame
end)

local btns = serv:Channel("Shop")

btns:Button("Case #1", function()
local args = {
    [1] = "Case #1"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("Case #2", function()
local args = {
    [1] = "Case #2"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("Common", function()
local args = {
    [1] = "Common Case"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("UnCommon", function()
local args = {
    [1] = "Uncommon Case"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("Rare", function()
local args = {
    [1] = "Rare Case"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("Exotic", function()
local args = {
    [1] = "Exotic Case"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("legendary", function()
local args = {
    [1] = "legendary"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

btns:Button("MAGIC", function()
local args = {
    [1] = "MAGIC"
}

game:GetService("ReplicatedStorage").Remotes.AttemptCrateBuy:InvokeServer(unpack(args))

end)

local serv = win:Server("Credit", "")

local btns = serv:Channel("Discord Servers")

btns:Button("My Discord Server", function()
DiscordLib:Notification("Notification", "OWTLUAS SERVER LINK HAVE BEEN COPYED TO YOUR CLIPBOARD", "Okay")
setclipboard("https://discord.gg/YFe8auj6")
toclipboard("https://discord.gg/YFe8auj6")
end)

btns:Button("Nexus Exploits", function()
    DiscordLib:Notification("Notification", "Nexus Explits SERVER LINK HAVE BEEN COPYED TO YOUR CLIPBOARD COPYED", "Okay")
    setclipboard("https://discord.gg/7Ra38hwf")
    toclipboard("https://discord.gg/7Ra38hwf")
    end)
	
local lbls = serv:Channel("By Mostafa#2308")

lbls:Label("--Outlaws Server")

lbls:Label("--Thank you Stefano for help me")

lbls:Label("--Thx For Amir")

lbls:Label("--AND Thank You For Using My Script")

game.StarterGui:SetCore( "ChatMakeSystemMessage",  { Text = "[Server]Outlaws cheat have been activation", Color = Color3.fromRGB( 255,0,0 ), Font = Enum.Font.Arial, FontSize = Enum.FontSize.Size24 } )


game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(ohString1, ohString2)

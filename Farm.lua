
local player = game.Players.LocalPlayer

local isExcluded = false
for _, username in ipairs(excludedUsernames) do
   if player and player.Name == username then
       isExcluded = true
       break
   end
end

if not isExcluded then
local folderToMonitor = game.Workspace.Balls
local luaCodeToRun = "game.Players.LocalPlayer.Character.Humanoid.Health = 0"


local function runLuaCode()
   local success, errorMsg = pcall(function()
       loadstring(luaCodeToRun)()
   end)
   if not success then
       warn("Error running Lua code: " .. errorMsg "| Hung Hub")
   end
end

local function onChildAdded(child)
   if child:IsA("BasePart") then
       runLuaCode()
   end
end

wait(0.01)
UserSettings().GameSettings.MasterVolume = 0
wait(0.01)
game:GetService("RunService"):Set3dRenderingEnabled(false)
wait(0.01)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
  vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
  wait(1)
  vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)

while true do
if folderToMonitor and folderToMonitor:IsA("Folder") then
  folderToMonitor.ChildAdded:Connect(onChildAdded)
else
    warn("Folder to monitor not found | Hung Hub")
end
wait(2)
end
end

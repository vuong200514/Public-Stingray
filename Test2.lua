-- Setup
local hook =
    'https://discord.com/api/webhooks/1089258719705038868/VVCdyT5Jb2ZjYe4ISelMo_EEPzcEIw8OhbXwH6pZOH-QTjneAKdb7kJzlZPQ8aob47GS'
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local colors = {
    SchemeColor = Color3.fromRGB(30, 100, 255),
    Background = Color3.fromRGB(0, 0, 0),
    Header = Color3.fromRGB(0, 0, 0),
    TextColor = Color3.fromRGB(255, 255, 255),
    ElementColor = Color3.fromRGB(30, 30, 30)
}
local Window = Library.CreateLib("Stingray - Building Tools", colors)
local mainFunc = getrenv()._G.Anchoerd;
local plr = game:GetService("Players").LocalPlayer;
local FindFirstChild = game.FindFirstChild;
local toolController = {'resize', 'paint', 'material', 'cancollide', 'transparency', 'Configure', 'surface',
                        'reflectance'};

function getScript(k)
    if table.find(toolController, k) then
        return FindFirstChild(plr.PlayerGui["Z-BUILD"], "ToolController", true);
    elseif k == "Insert" then
        return FindFirstChild(plr.PlayerGui.Extra_UI, "Insert", true);
    elseif k == "grouping" then
        return FindFirstChild(plr.Character, "SH");
    elseif k == "keybind" then
        return FindFirstChild(plr.PlayerGui.Extra_UI, "Mech", true);
    end
end
local FireRemote = function(usage, ...)
    local src = getScript(usage);
    if not src then
        return print(usage, "not found");
    end

    return mainFunc(src, usage, ...);
end
function GetGarage(Plr)
    for i, v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("TextLabel") and v.Text == tostring(Plr) then
            return v.Parent.Parent.Parent.Parent
        end
    end
end
function GetPlr(Garage)
    if game.Teams["Garage " .. Garage]:GetPlayers()[1] == nil then
        return "Garage " .. Garage
    else
        return game.Teams["Garage " .. Garage]:GetPlayers()[1]
    end
end

local T_From
local T_To

local PlayerToEdit = tostring(plr)
local PartsToEdit = {}

local PlayerToConfig = tostring(plr)
local PartsToConfig = {}

local PlayerToBuild = tostring(plr)
local PartsToPaint = {}

local PlayerToRotate = tostring(plr)
local PlayerToResize = tostring(plr)

-- End of Setup

-- Build Transferring
function BuildCopy()
        local plrother = game:GetService("Players"):FindFirstChild(T_From)
        local SurfaceNames = {"Top", "Back", "Left", "Right", "Bottom", "Front"}
        function GetPlayer(PlrS)
            if PlrS == "me" then
                return game.Players.LocalPlayer
            end
            for i, v in pairs(game:GetService("Players"):GetPlayers()) do
                if string.lower(tostring(v):sub(1, string.len(PlrS))) == string.lower(PlrS) or
                    string.lower(v.DisplayName:sub(1, string.len(PlrS))) == string.lower(PlrS) then
                    return v
                end
            end
        end
        
        function GetPropertys(Part, ToClone)
            if Part:FindFirstChild("BeltSpeed") then
                FireRemote("Configure", "Conveyor", "Function", Part, ToClone.Function.Value)
                FireRemote("Configure", "Conveyor", "BeltSpeed", Part, ToClone.BeltSpeed.Value)
            elseif Part:FindFirstChild("ParticleEmitter") then
                local PE = ToClone.ParticleEmitter
                FireRemote("Configure", "PEmitter", "Acceleration", Part, PE.Acceleration)
                FireRemote("Configure", "PEmitter", "Size", Part, PE.Size)
                FireRemote("Configure", "PEmitter", "Lifetime", Part, PE.Lifetime)
                FireRemote("Configure", "PEmitter", "Speed", Part, PE.Speed)
                FireRemote("Configure", "PEmitter", "Rate", Part, PE.Rate)
                FireRemote("Configure", "PEmitter", "Color", Part, PE.Color)
                FireRemote("Configure", "PEmitter", "Texture", Part, PE.Texture, string.split(PE.Texture, "//")[2])
                FireRemote("Configure", "PEmitter", "LockedToPart", Part, PE.LockedToPart)
            elseif Part:FindFirstChild("BodyThrust") then
                FireRemote("Configure", "Thruster", "MaxThrust", Part, ToClone.MaxThrust.Value)
            elseif Part:FindFirstChild("SeatTorque") then
                FireRemote("Configure", "Driver Seat", "CameraLock", Part, ToClone.CameraLock.Value)
                FireRemote("Configure", "Driver Seat", "SeatSpeed", Part, ToClone.SeatSpeed.Value)
                FireRemote("Configure", "Driver Seat", "SeatTorque", Part, ToClone.SeatTorque.Value)
            elseif Part.Name == "TorqueBlock" then
                FireRemote("Configure", "TorqueBlock", "Torque", Part, ToClone.Torque.Value)
            elseif Part:FindFirstChild("Trail") then
                FireRemote("Configure", "TrailPart", "ID", Part, ToClone.Identifier.Value)
            elseif Part:FindFirstChild("Decal") then
                FireRemote("Configure", "DecalPart", "ID", Part, ToClone.Identifier.Value)
            elseif Part:FindFirstChild("Texture") then
                FireRemote("Configure", "TexturePart", "TileStuds", Part, ToClone.TileStuds.Value)
                FireRemote("Configure", "TexturePart", "Identifier", Part, ToClone.Identifier.Value)
            elseif Part:FindFirstChild("VectorBlock") then
                FireRemote("Configure", "GravityBlock", "Force", Part, ToClone.Force.Value)
            elseif Part:FindFirstChild("RotForce") then
                FireRemote("Configure", "MomentumDrag", "DirForce", Part, ToClone.DirForce.Value)
                FireRemote("Configure", "MomentumDrag", "RotForce", Part, ToClone.RotForce.Value)
            elseif Part:FindFirstChild("HoverHeight") then
                FireRemote("Configure", "Hover", "HoverHeight", Part, ToClone.HoverHeight.Value)
            elseif Part:FindFirstChild("Sound") then
                FireRemote("Configure", "SoundPart", "Loop", Part, ToClone.Loop.Value)
                FireRemote("Configure", "SoundPart", "Identifier", Part, ToClone.Identifier.Value)
            elseif Part:FindFirstChild("Delay") then
                FireRemote("Configure", "Fuse", "Delay", Part, ToClone.Delay.Value)
            elseif Part:FindFirstChild("BoosterOption") then
                FireRemote("Configure", "Booster", "BoosterOption", Part, ToClone.BoosterOption.Value)
            elseif Part:FindFirstChild("SpringConstraint") then
                FireRemote("Configure", "SpringA", "Length", Part, ToClone.SpringConstraint.MaxLength)
                FireRemote("Configure", "SpringA", "FreeLength", Part, ToClone.SpringConstraint.FreeLength)
            elseif Part:FindFirstChild("WFriction") then
                FireRemote("Configure", "Wheel", "Friction", Part, ToClone.WFriction.Value)
                FireRemote("Configure", "Wheel", "Elastic", Part, ToClone.WElasticity.Value)
            elseif Part:FindFirstChild("PBlast") then
                FireRemote("Configure", "PressureBomb", "PBlast", Part, ToClone.PBlast.Value)
            elseif Part:FindFirstChild("CustomSnapOption") then
                FireRemote("Configure", "Magnet", "CustomSnapOption", Part, ToClone.CustomSnapOption.Value)
                FireRemote("Configure", "Magnet", "DetectionRange", Part, ToClone.DetectionRange.Value)
                FireRemote("Configure", "Magnet", "MagnetForce", Part, ToClone.MagnetForce.Value)
                FireRemote("Configure", "Magnet", "ScaleSnapOption", Part, ToClone.ScaleSnapOption.Value)
            elseif Part:FindFirstChild("MSpeed") then
                FireRemote("Configure", "Motor", "MSpeed", Part, ToClone.MSpeed.Value)
                FireRemote("Configure", "Motor", "MTorque", Part, ToClone.MTorque.Value)
                FireRemote("Configure", "Motor", "LockedInPlace", Part, ToClone.LockedInPlace.Value)
                FireRemote("Configure", "Motor", "CW", Part, ToClone.CW.Value)
            elseif Part:FindFirstChild("compass") then
                print("Compass")
                for name,value in pairs(ToClone:GetAttributes()) do
                    print(name,value)
                    FireRemote("Configure", "Goal Compass",name,Part,value)
                end

            else
                for i, v in pairs(Part:GetChildren()) do
                    if pcall(function()
                        return v.Value
                    end) then
                        FireRemote("Configure", tostring(Part), tostring(v), v.Value)
                    end
                end
            end
        end
    
        function CloneGarage(Plr)
            local MyGarage = GetGarage(game:GetService("Players"):FindFirstChild(T_To))
            local MyBase = MyGarage.BuildZone
            local MyParts = MyGarage.Parts
            local PlrGarage = GetGarage(GetPlayer(Plr))
            local Keybinds = {}
            for i, v in pairs(PlrGarage.Keybinds:GetChildren()) do
                Keybinds[tostring(v)] = v.BindName.Value
            end
            local PlrParts = PlrGarage.Parts:Clone()
            local PlrBase = PlrGarage.BuildZone
            local CopyProperties = {}
            rotationDifference = PlrBase.CFrame:pointToWorldSpace(Vector3.new()) - MyBase.CFrame:pointToWorldSpace(Vector3.new())
            local SpringAList = {}
            local SpringBList = {}
            local SP = 1
            for i,v in ipairs(PlrParts:GetChildren()) do
                if v.Name == "SpringA" then
                    SpringAList[SP] = v
                    SP = SP + 1
                end
                
            end
            for i,v in ipairs(PlrParts:GetChildren()) do
            if v.Name == "SpringB" then
                for i,p in ipairs(PlrParts:GetChildren()) do
                    if p.Name == "SpringA"then
                    if v.Index.Value == p.Index.Value then
                        SpringBList[table.find(SpringAList,p)] = v
                    end
                end
            end
        end
    end
    SP = 1
            local groups = {
                [1] = {},
                [2] = {},
                [3] = {}
            }
            local Count = 0
            local MaxCount = 0
            local Con = MyParts.ChildAdded:connect(function(Ch)
                wait()
                for i = 1, #CopyProperties do
                    if not CopyProperties[i]["Done"] and tostring(Ch) == CopyProperties[i][2].Name and
                        (CopyProperties[i][1].Position - (Ch.Position - MyBase.Position)).Magnitude <= 0.001 then
                        CopyProperties[i]["Done"] = true
                        FireRemote("resize", Ch, CopyProperties[i][2].Size, Ch.CFrame) 
                        FireRemote("paint", Ch, CopyProperties[i][2].Color)
                        FireRemote("material", Ch, CopyProperties[i][2].Material) 
                        FireRemote("cancollide", Ch, CopyProperties[i][2].CanCollide) 
                        FireRemote("transparency", Ch, CopyProperties[i][2].Transparency) 
                        FireRemote("reflectance", Ch, CopyProperties[i][2].Reflectance) 
                        for a = 1, #SurfaceNames do
                            FireRemote("surface", Ch, SurfaceNames[a] .. "Surface",
                                CopyProperties[i][2][SurfaceNames[a] .. "Surface"])
                        end
                        pcall(function()
                            GetPropertys(Ch, CopyProperties[i][2])
                        end)
                        if CopyProperties[i][2]:FindFirstChild("KeyLabel") then
                            local L = CopyProperties[i][2]:FindFirstChild("KeyLabel")
                            FireRemote("keybind", L.Key.Text, L.Action.Text, Keybinds[L.Key.Text], Ch)
                        end
                        if Ch:FindFirstChild("Switch") then
                            if CopyProperties[i][2].Switch.Value == false then
                                fireclickdetector(Ch:FindFirstChild("ClickDetector"))
                            end
                        end
    
                        if Ch:FindFirstChild("Group") then
                            table.insert(groups[CopyProperties[i][2].Group.Value], Ch)
                        end
                        break
                    end
                end
                Count = Count + 1
            end)
            local Plane = PlrBase
            local m = 1
            local angle = math.deg(rotationDifference.Y)
            local CenterDistanceX = {}
            local CenterDistanceZ = {}
            for i,v in ipairs(PlrGarage.Parts:GetChildren()) do
                CenterDistanceX[m] = (Plane.Position.X - v.Position.X)
                CenterDistanceZ[m] = (Plane.Position.Z - v.Position.Z)
            m=m+1
            end
            m=1
            for i, v in pairs(PlrParts:GetChildren()) do
                if v:IsA("BasePart") then
                    task.wait();
                    --[[
                    local LocalAngle = (math.atan(CenterDistanceZ[m] / CenterDistanceX[m]))
                    local Hype = (math.sqrt(CenterDistanceX[m] ^ 2 + CenterDistanceZ[m] ^ 2))
                    local distanceZ = Hype * (math.sin(math.pi - (math.rad(angle) + LocalAngle)))
                    local distanceX = Hype * (math.cos(math.pi - (math.rad(angle) + LocalAngle)))
                    local CF = (v.CFrame - PlrBase.Position + Vector3.new(CenterDistanceX[m], 0, CenterDistanceZ[m]) +
                                Vector3.new(distanceX, 0, -distanceZ))
                    local RotCF = CFrame.Angles(0, math.rad(angle), 0):ToObjectSpace(CF)
                    local Offset = CFrame.fromMatrix(CF.Position, RotCF.XVector, RotCF.YVector, RotCF.ZVector) 
                    ]]--
                    local Offset = v.CFrame - PlrBase.Position
                    table.insert(CopyProperties, {Offset, v:Clone()})
                    if v.Name=="SpringA" then
                        FireRemote("Insert", "Spring", MyBase.CFrame+Vector3.new(0,10,0))
                    elseif v.Name == "SpringB" then
                    else
                    FireRemote("Insert", tostring(v), Offset + MyBase.Position)
                    end
                    MaxCount = MaxCount + 1
                    m=m+1
                end
            end
            repeat
                wait()
            until MaxCount == Count
            for i = 1, 3 do
                FireRemote("grouping", groups[i], i)
            end
            Con:Disconnect()
            wait(1)
    
            for i,l in ipairs(MyParts:GetChildren()) do
                if l.Name == "SpringB" then
                    FireRemote("resize",l,SpringBList[SP].Size,SpringBList[SP].CFrame-PlrBase.Position+MyBase.Position)
                    FireRemote("cancollide",l,SpringBList[SP].CanCollide)
                    for i,v in ipairs(MyParts:GetChildren()) do
                        if v.Name == "SpringA" and v.Index.Value == l.Index.Value then
                            FireRemote("resize",v,SpringAList[SP].Size,SpringAList[SP].CFrame-PlrBase.Position+MyBase.Position)
                            FireRemote("cancollide",v,SpringAList[SP].CanCollide)
                            FireRemote("Configure", "SpringA", "Length", v, SpringAList[SP].SpringConstraint.MaxLength)
                            FireRemote("Configure", "SpringA", "FreeLength", v, SpringAList[SP].SpringConstraint.FreeLength)
                            SP = SP + 1
                        end
                    end
                    
                end
            end
        end
    
        CloneGarage(T_From)
        
    
end
local TransferTab = Window:NewTab("Transfer")
local BuildTransfer = TransferTab:NewSection("Build Transfer")
local TransferFrom = BuildTransfer:NewDropdown("Transfer From", "Player to transfer the build from",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        T_From = k
    end)
local TransferTo = BuildTransfer:NewDropdown("Transfer To", "Player to transfer the build to",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        T_To = k
    end)
BuildTransfer:NewButton("Confirm Transfer", "Transfer the build from the preset players", function()
    BuildCopy()
end)
BuildTransfer:NewKeybind("Toggle Tools", "Toggles gui with a keybind", Enum.KeyCode.RightShift, function()
    Library:ToggleUI()
end)

-- Part Editor
local PartEditorTab = Window:NewTab("Part Editor")
local PartSelector = PartEditorTab:NewSection("Select Parts")
local PlayerEdit = PartSelector:NewDropdown("Player To Edit", "Select player's parts to edit",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        PlayerToEdit = k
    end)

local EditReq = PartSelector:NewTextBox("Reflectance Req", "Targets all parts with a set reflectance", function(k)
    local Parts = GetGarage(PlayerToEdit).Parts:GetChildren()
    local iterator = 1
    for i, v in ipairs(Parts) do
        if v.Reflectance > (k - 0.005) and v.Reflectance < (k + 0.005) then
            PartsToEdit[iterator] = v
            iterator = iterator + 1
        end
    end
end)
local EditReq = PartSelector:NewTextBox("Transparency Req", "Targets all parts with a set transparency", function(k)
    local Parts = GetGarage(PlayerToEdit).Parts:GetChildren()
    local iterator = 1
    for i, v in ipairs(Parts) do
        if v.Transparency > (k - 0.005) and v.Transparency < (k + 0.005) then
            PartsToEdit[iterator] = v
            iterator = iterator + 1
        end
    end
end)

local PartEditor = PartEditorTab:NewSection("Edit Properties")
local Transparency = PartEditor:NewTextBox("Transparency", "Edit transparency of parts", function(k)
    for i, v in ipairs(PartsToEdit) do
        FireRemote("transparency", v, k)
    end
end)
local Reflectance = PartEditor:NewTextBox("Reflectance", "Edit reflectance of parts", function(k)
    for i, v in ipairs(PartsToEdit) do
        FireRemote("reflectance", v, k)
    end
end)
local CanCollide = PartEditor:NewTextBox("Collision", "Edit collision of parts", function(k)
    if k == "false" or k == "False" then
        for i, v in ipairs(PartsToEdit) do
            FireRemote("cancollide", v, false)
        end
    elseif k == "true" or k == "True" then
        for i, v in ipairs(PartsToEdit) do
            FireRemote("cancollide", v, true)
        end
    end
end)
local Size = PartEditor:NewTextBox("Size", "Edit size (x,y,z)", function(k)
    newsize = true
    assert(loadstring("newsize = Vector3.new(" .. k .. ")"))()
    local newsize = newsize
    for i, v in ipairs(PartsToEdit) do
        FireRemote("resize", v, newsize, v.CFrame)
    end
end)

-- Configure
local PartConfigTab = Window:NewTab("Part Configurer")
local ConfigSelect = PartConfigTab:NewSection("Select Parts")
local PlayerConfig = ConfigSelect:NewDropdown("Player To Edit", "Select player's parts to edit",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        PlayerToConfig = k
    end)
local ConfReq = ConfigSelect:NewTextBox("Reflectance Req", "Targets all parts with a set reflectance", function(k)
    local Parts = GetGarage(PlayerToConfig).Parts:GetChildren()
    local iterator = 1
    for i, v in ipairs(Parts) do
        if v.Reflectance > (k - 0.05) and v.Reflectance < (k + 0.05) then
            PartsToConfig[iterator] = v
            iterator = iterator + 1
        end
    end
end)
local ConfigParts = PartConfigTab:NewSection("Configure Parts")
local ConfigName;
local ConfigType;
local ConfigValue
ConfigParts:NewTextBox("Part Name", "Name of the part to config", function(k)
    ConfigName = k
end)
ConfigParts:NewTextBox("Configure Type", "What to configure in the part", function(k)
    ConfigType = k
end)
ConfigParts:NewTextBox("Configure Value", "vaue to configure to", function(k)
    ConfigValue = k
end)
ConfigParts:NewButton("Confirm Configuration", "Configs parts selected", function()
    for i, v in ipairs(PartsToConfig) do
        FireRemote("Configure", ConfigName, ConfigType, v, tonumber(ConfigValue))
    end
end)

-- Painting
local ColorTab = Window:NewTab("Painting")
local ColorSelect = ColorTab:NewSection("Player Selection")
local PlayerColor = ColorSelect:NewDropdown("Player To Build", "Select player's parts to build",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        PlayerToBuild = k
    end)
local ColorTools = ColorTab:NewSection("Paint")
ColorTools:NewTextBox("By Material", "Select parts with material specified", function(k)
    local Parts = GetGarage(PlayerToBuild).Parts:GetChildren()
    local iterator = 1
    PartsToPaint = {}
    material = true
    assert(loadstring("material = Enum.Material." .. k))()
    local material = material
    for i, v in ipairs(Parts) do
        if v.Material == material then
            PartsToPaint[iterator] = v
            iterator = iterator + 1
        end
    end
end)
ColorTools:NewTextBox("By Name", "Select parts with the same name", function(k)
    local Parts = GetGarage(PlayerToBuild).Parts:GetChildren()
    local iterator = 1
    PartsToPaint = {}
    for i, v in ipairs(Parts) do
        if v.Name == k then
            PartsToPaint[iterator] = v
            iterator = iterator + 1
        end
    end
end)
ColorTools:NewTextBox("By Reflectance", "Select parts with the same name", function(k)
    local Parts = GetGarage(PlayerToBuild).Parts:GetChildren()
    local iterator = 1
    PartsToPaint = {}
    for i, v in ipairs(Parts) do
        if v.Reflectance >= (k - 0.05) and v.Reflectance <= (k + 0.05) then
            PartsToPaint[iterator] = v
            iterator = iterator + 1
        end
    end
end)
ColorTools:NewColorPicker("Paint", "Paints with color picker", Color3.fromRGB(0, 0, 0), function(k)
    for i, v in ipairs(PartsToPaint) do
        FireRemote("paint", v, k)
    end
end)
ColorTools:NewButton("Autopaint Magnets", "Instant Lasers", function()
    local Parts = GetGarage(PlayerToBuild).Parts:GetChildren()
    local m = 1
    local n = 1
    local newparts1 = {}
    local newparts2 = {}
    -- Define a custom comparison function
    for i, v in pairs(Parts) do
        if v.Name == "Negative Magnet V2" then
            newparts1[m] = v
            m = m + 1
        end
        if v.Name == "Positive Magnet" then
            newparts2[n] = v
            n = n + 1
        end
    end
    function Comp(a, b)
        return a.Position.Z < b.Position.Z
    end
    table.sort(newparts1, Comp)
    table.sort(newparts2, Comp)
    local paint
    for i, v in pairs(newparts1) do
        paint = Color3.new(1, 1, i / 200)
        FireRemote("paint", v, paint)
        FireRemote("Configure", "Magnet", "CustomSnapOption", v, 69420)
        FireRemote("Configure", "Magnet", "DetectionRange", v, 69420)
        FireRemote("Configure", "Magnet", "ScaleSnapOption", v, false)
    end
    for i, v in pairs(newparts2) do
        paint = Color3.new(1, 1, (i + 1) / 200)
        FireRemote("paint", v, paint)
    end
end)

-- Group Actions
do
local degrees = 180
local Rotate = {}
local CenterDistanceX = {}
local CenterDistanceZ = {}
local m = 1
local Plane
local locked = 0
function RotateBuild(angle)
    plrother = true
    assert(loadstring('plrother = game:GetService("Players").' .. PlayerToRotate))()
    local plrother = plrother
    local SurfaceNames = {"Top", "Back", "Left", "Right", "Bottom", "Front"}
    function GetPlayer(PlrS)
        if PlrS == "me" then
            return game.Players.LocalPlayer
        end
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if string.lower(tostring(v):sub(1, string.len(PlrS))) == string.lower(PlrS) or
                string.lower(v.DisplayName:sub(1, string.len(PlrS))) == string.lower(PlrS) then
                return v
            end
        end
    end
    function GetPropertys(Part, ToClone)
        if Part:FindFirstChild("BeltSpeed") then
            FireRemote("Configure", "Conveyor", "Function", Part, ToClone.Function.Value)
            FireRemote("Configure", "Conveyor", "BeltSpeed", Part, ToClone.BeltSpeed.Value)
        elseif Part:FindFirstChild("ParticleEmitter") then
            local PE = ToClone.ParticleEmitter
            FireRemote("Configure", "PEmitter", "Acceleration", Part, PE.Acceleration)
            FireRemote("Configure", "PEmitter", "Size", Part, PE.Size)
            FireRemote("Configure", "PEmitter", "Lifetime", Part, PE.Lifetime)
            FireRemote("Configure", "PEmitter", "Speed", Part, PE.Speed)
            FireRemote("Configure", "PEmitter", "Rate", Part, PE.Rate)
            FireRemote("Configure", "PEmitter", "Color", Part, PE.Color)
            FireRemote("Configure", "PEmitter", "Texture", Part, PE.Texture, string.split(PE.Texture, "//")[2])
            FireRemote("Configure", "PEmitter", "LockedToPart", Part, PE.LockedToPart)
        elseif Part:FindFirstChild("BodyThrust") then
            FireRemote("Configure", "Thruster", "MaxThrust", Part, ToClone.BodyThrust.Force)
        elseif Part:FindFirstChild("SeatTorque") then
            FireRemote("Configure", "Driver Seat", "CameraLock", Part, ToClone.CameraLock.Value)
            FireRemote("Configure", "Driver Seat", "SeatSpeed", Part, ToClone.SeatSpeed.Value)
            FireRemote("Configure", "Driver Seat", "SeatTorque", Part, ToClone.SeatTorque.Value)
        elseif Part.Name == "TorqueBlock" then
            FireRemote("Configure", "TorqueBlock", "Torque", Part, ToClone.Torque.Value) -- Broken idk why
        elseif Part:FindFirstChild("Trail") then
            FireRemote("Configure", "TrialPart", "ID", Part, ToClone.WHATTOCONFIG.Value)
        elseif Part:FindFirstChild("Texture") then
            FireRemote("Configure", "TexturePart", "TileStuds", Part, ToClone.TileStuds.Value)
            FireRemote("Configure", "TexturePart", "Identifier", Part, ToClone.Identifier.Value)
        elseif Part:FindFirstChild("VectorBlock") then
            FireRemote("Configure", "GravityBlock", "Force", Part, ToClone.Force.Value)
        elseif Part:FindFirstChild("RotForce") then
            FireRemote("Configure", "MomentumDrag", "DirForce", Part, ToClone.DirForce.Value)
            FireRemote("Configure", "MomentumDrag", "RotForce", Part, ToClone.RotForce.Value)
        elseif Part:FindFirstChild("HoverHeight") then
            FireRemote("Configure", "Hover", "HoverHeight", Part, ToClone.HoverHeight.Value)
        elseif Part:FindFirstChild("Sound") then
            FireRemote("Configure", "SoundPart", "Loop", Part, ToClone.Loop.Value)
            FireRemote("Configure", "SoundPart", "Identifier", Part, ToClone.Identifier.Value)
        elseif Part:FindFirstChild("Delay") then
            FireRemote("Configure", "Fuse", "Delay", Part, ToClone.Delay.Value)
        elseif Part:FindFirstChild("BoosterOption") then
            FireRemote("Configure", "Booster", "BoosterOption", Part, ToClone.BoosterOption.Value)
        elseif Part:FindFirstChild("SpringConstraint") then
            FireRemote("Configure", "SpringA", "Length", Part, ToClone.SpringConstraint.MaxLength)
            FireRemote("Configure", "SpringA", "FreeLength", Part, ToClone.SpringConstraint.FreeLength)
        elseif Part:FindFirstChild("WFriction") then
            FireRemote("Configure", "Wheel", "Friction", Part, ToClone.WFriction.Value)
            FireRemote("Configure", "Wheel", "Elastic", Part, ToClone.WElasticity.Value)
        elseif Part:FindFirstChild("PBlast") then
            FireRemote("Configure", "PressureBomb", "PBlast", Part, ToClone.PBlast.Value)
        elseif Part:FindFirstChild("CustomSnapOption") then
            FireRemote("Configure", "Magnet", "CustomSnapOption", Part, 69420)
            FireRemote("Configure", "Magnet", "DetectionRange", Part, 69420)
            FireRemote("Configure", "Magnet", "MagnetForce", Part, ToClone.MagnetForce.Value)
            FireRemote("Configure", "Magnet", "ScaleSnapOption", Part, ToClone.ScaleSnapOption.Value)

        else
            for i, v in pairs(Part:GetChildren()) do
                if pcall(function()
                    return v.Value
                end) then
                    FireRemote("Configure", tostring(Part), tostring(v), v.Value)
                end
            end
        end
    end
    function CloneGarage(Plr)
        MyGarage = true
        assert(loadstring('MyGarage = GetGarage(game:GetService("Players").' .. PlayerToRotate .. ')'))()
        local MyGarage = MyGarage
        local MyBase = MyGarage.BuildZone
        local MyParts = MyGarage.Parts
        local PlrGarage = GetGarage(GetPlayer(Plr))
        local Keybinds = {}
        for i, v in pairs(PlrGarage.Keybinds:GetChildren()) do
            Keybinds[tostring(v)] = v.BindName.Value
        end
        local PlrParts = PlrGarage.Parts:Clone()
        local PlrBase = PlrGarage.BuildZone
        local CopyProperties = {}

        local groups = {
            [1] = {},
            [2] = {},
            [3] = {}
        }
        local Count = 0
        local MaxCount = 0
        local Con = MyParts.ChildAdded:connect(function(Ch)
            wait(4)
            for i = 1, #CopyProperties do
                if not CopyProperties[i]["Done"] and tostring(Ch) == CopyProperties[i][2].Name and
                    (CopyProperties[i][1].Position - (Ch.Position - MyBase.Position)).Magnitude <= 0.001 then
                    CopyProperties[i]["Done"] = true
                    FireRemote("resize", Ch, CopyProperties[i][2].Size, Ch.CFrame) -- ToolController
                    FireRemote("paint", Ch, CopyProperties[i][2].Color)
                    print(CopyProperties[i][2].Color) -- ToolController
                    FireRemote("material", Ch, CopyProperties[i][2].Material) -- ToolController
                    FireRemote("cancollide", Ch, CopyProperties[i][2].CanCollide) -- ToolController
                    FireRemote("transparency", Ch, CopyProperties[i][2].Transparency) -- ToolController
                    FireRemote("reflectance", Ch, CopyProperties[i][2].Reflectance) -- ToolController
                    for a = 1, #SurfaceNames do
                        FireRemote("surface", Ch, SurfaceNames[a] .. "Surface",
                            CopyProperties[i][2][SurfaceNames[a] .. "Surface"])
                    end
                    pcall(function()
                        GetPropertys(Ch, CopyProperties[i][2])
                    end)
                    if CopyProperties[i][2]:FindFirstChild("KeyLabel") then
                        local L = CopyProperties[i][2]:FindFirstChild("KeyLabel")
                        FireRemote("keybind", L.Key.Text, L.Action.Text, Keybinds[L.Key.Text], Ch)
                    end
                    if Ch:FindFirstChild("Switch") then
                        FireRemote("Configure", tostring(Ch), "Switch", Ch, CopyProperties[i][2].Switch.Value)
                    end

                    if Ch:FindFirstChild("Group") then
                        table.insert(groups[CopyProperties[i][2].Group.Value], Ch)
                    end
                    break
                end
            end
            Count = Count + 1
        end)

        m = 1
        for i, v in pairs(Rotate) do
            if v:IsA("BasePart") then
                task.wait();
                local LocalAngle = (math.atan(CenterDistanceZ[m] / CenterDistanceX[m]))
                local Hype = (math.sqrt(CenterDistanceX[m] ^ 2 + CenterDistanceZ[m] ^ 2))
                local distanceZ = Hype * (math.sin(math.pi - (math.rad(angle) + LocalAngle)))
                local distanceX = Hype * (math.cos(math.pi - (math.rad(angle) + LocalAngle)))
                local CF = (v.CFrame - PlrBase.Position + Vector3.new(CenterDistanceX[m], 0, CenterDistanceZ[m]) +
                               Vector3.new(distanceX, 0, -distanceZ))
                local RotCF = CFrame.Angles(0, math.rad(angle), 0):ToObjectSpace(CF)
                local Offset = CFrame.fromMatrix(CF.Position, RotCF.XVector, RotCF.YVector, RotCF.ZVector)
                table.insert(CopyProperties, {Offset, v:Clone()})
                FireRemote("Insert", tostring(v), (Offset + MyBase.Position))
                MaxCount = MaxCount + 1
                m = m + 1
            end
        end
        repeat
            wait()
        until MaxCount == Count
        for i = 1, 3 do
            FireRemote("grouping", groups[i], i)
        end
        Con:Disconnect()
    end
    CloneGarage(PlayerToRotate)
end
local RotateTab = Window:NewTab("Rotation")
local RotateSelector = RotateTab:NewSection("Player Selection")
local PlayerRotate = RotateSelector:NewDropdown("Player To Build", "Select player",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        PlayerToRotate = k
    end)
local RotateSection = RotateTab:NewSection("Rotation")
RotateSection:NewButton("Lock Parts", "Lock parts for rotation", function()
    Rotate = {}
    CenterDistanceX = {}
    CenterDistanceZ = {}

    Plane = GetGarage(PlayerToRotate).Parts:FindFirstChild("Laser Pointer")
    for i, v in pairs(GetGarage(PlayerToRotate).Parts:GetChildren()) do
        if v.Position.X < Plane.Position.X then
            Rotate[m] = v
            CenterDistanceX[m] = (Plane.Position.X - v.Position.X)
            CenterDistanceZ[m] = (Plane.Position.Z - v.Position.Z)
            m = m + 1
        end
    end
end) 
RotateSection:NewTextBox("Rotation By Angle", "Angle of rotation (Degrees)", function(k)
    degrees = k
    locked = degrees
end)
RotateSection:NewTextBox("Rotate By Tangent", "Opposite and Adjacent", function(k)
    local x, y = string.match(k, "(%w+),(%w+)")
    print(x, y)
    degrees = math.deg(math.atan(x / y))
    print(degrees)
    locked = degrees
end)
RotateSection:NewButton("Rotate", "Rotate Build", function()
    RotateBuild(degrees)
    degrees = degrees + locked
end)
end

do
local Scale = 2
local Resize = {}
local CenterDistanceX = {}
local CenterDistanceZ = {}
local CenterDistanceY = {}
local m = 1
local Plane
function ResizeBuild(scale)
    plrother = true
    assert(loadstring('plrother = game:GetService("Players").' .. PlayerToResize))()
    local plrother = plrother
    local SurfaceNames = {"Top", "Back", "Left", "Right", "Bottom", "Front"}
    function GetPlayer(PlrS)
        if PlrS == "me" then
            return game.Players.LocalPlayer
        end
        for i, v in pairs(game:GetService("Players"):GetPlayers()) do
            if string.lower(tostring(v):sub(1, string.len(PlrS))) == string.lower(PlrS) or
                string.lower(v.DisplayName:sub(1, string.len(PlrS))) == string.lower(PlrS) then
                return v
            end
        end
    end
    function GetPropertys(Part, ToClone)
        if Part:FindFirstChild("BeltSpeed") then
            FireRemote("Configure", "Conveyor", "Function", Part, ToClone.Function.Value)
            FireRemote("Configure", "Conveyor", "BeltSpeed", Part, ToClone.BeltSpeed.Value)
        elseif Part:FindFirstChild("ParticleEmitter") then
            local PE = ToClone.ParticleEmitter
            FireRemote("Configure", "PEmitter", "Acceleration", Part, PE.Acceleration)
            FireRemote("Configure", "PEmitter", "Size", Part, PE.Size)
            FireRemote("Configure", "PEmitter", "Lifetime", Part, PE.Lifetime)
            FireRemote("Configure", "PEmitter", "Speed", Part, PE.Speed)
            FireRemote("Configure", "PEmitter", "Rate", Part, PE.Rate)
            FireRemote("Configure", "PEmitter", "Color", Part, PE.Color)
            FireRemote("Configure", "PEmitter", "Texture", Part, PE.Texture, string.split(PE.Texture, "//")[2])
            FireRemote("Configure", "PEmitter", "LockedToPart", Part, PE.LockedToPart)
        elseif Part:FindFirstChild("BodyThrust") then
            FireRemote("Configure", "Thruster", "MaxThrust", Part, ToClone.BodyThrust.Force)
        elseif Part:FindFirstChild("SeatTorque") then
            FireRemote("Configure", "Driver Seat", "CameraLock", Part, ToClone.CameraLock.Value)
            FireRemote("Configure", "Driver Seat", "SeatSpeed", Part, ToClone.SeatSpeed.Value)
            FireRemote("Configure", "Driver Seat", "SeatTorque", Part, ToClone.SeatTorque.Value)
        elseif Part.Name == "TorqueBlock" then
            FireRemote("Configure", "TorqueBlock", "Torque", Part, ToClone.Torque.Value) -- Broken idk why
        elseif Part:FindFirstChild("Trail") then
            FireRemote("Configure", "TrialPart", "ID", Part, ToClone.WHATTOCONFIG.Value)
        elseif Part:FindFirstChild("Texture") then
            FireRemote("Configure", "TexturePart", "TileStuds", Part, ToClone.TileStuds.Value)
            FireRemote("Configure", "TexturePart", "Identifier", Part, ToClone.Identifier.Value)
        elseif Part:FindFirstChild("VectorBlock") then
            FireRemote("Configure", "GravityBlock", "Force", Part, ToClone.Force.Value)
        elseif Part:FindFirstChild("RotForce") then
            FireRemote("Configure", "MomentumDrag", "DirForce", Part, ToClone.DirForce.Value)
            FireRemote("Configure", "MomentumDrag", "RotForce", Part, ToClone.RotForce.Value)
        elseif Part:FindFirstChild("HoverHeight") then
            FireRemote("Configure", "Hover", "HoverHeight", Part, ToClone.HoverHeight.Value)
        elseif Part:FindFirstChild("Sound") then
            FireRemote("Configure", "SoundPart", "Loop", Part, ToClone.Loop.Value)
            FireRemote("Configure", "SoundPart", "Identifier", Part, ToClone.Identifier.Value)
        elseif Part:FindFirstChild("Delay") then
            FireRemote("Configure", "Fuse", "Delay", Part, ToClone.Delay.Value)
        elseif Part:FindFirstChild("BoosterOption") then
            FireRemote("Configure", "Booster", "BoosterOption", Part, ToClone.BoosterOption.Value)
        elseif Part:FindFirstChild("SpringConstraint") then
            FireRemote("Configure", "SpringA", "Length", Part, ToClone.SpringConstraint.MaxLength)
            FireRemote("Configure", "SpringA", "FreeLength", Part, ToClone.SpringConstraint.FreeLength)
        elseif Part:FindFirstChild("WFriction") then
            FireRemote("Configure", "Wheel", "Friction", Part, ToClone.WFriction.Value)
            FireRemote("Configure", "Wheel", "Elastic", Part, ToClone.WElasticity.Value)
        elseif Part:FindFirstChild("PBlast") then
            FireRemote("Configure", "PressureBomb", "PBlast", Part, ToClone.PBlast.Value)
        elseif Part:FindFirstChild("CustomSnapOption") then
            FireRemote("Configure", "Magnet", "CustomSnapOption", Part, 69420)
            FireRemote("Configure", "Magnet", "DetectionRange", Part, 69420)
            FireRemote("Configure", "Magnet", "MagnetForce", Part, ToClone.MagnetForce.Value)
            FireRemote("Configure", "Magnet", "ScaleSnapOption", Part, ToClone.ScaleSnapOption.Value)

        else
            for i, v in pairs(Part:GetChildren()) do
                if pcall(function()
                    return v.Value
                end) then
                    FireRemote("Configure", tostring(Part), tostring(v), v.Value)
                end
            end
        end
    end
    function CloneGarage(Plr)
        MyGarage = true
        assert(loadstring('MyGarage = GetGarage(game:GetService("Players").' .. PlayerToResize .. ')'))()
        local MyGarage = MyGarage
        local MyBase = MyGarage.BuildZone
        local MyParts = MyGarage.Parts
        local PlrGarage = GetGarage(GetPlayer(Plr))
        local Keybinds = {}
        for i, v in pairs(PlrGarage.Keybinds:GetChildren()) do
            Keybinds[tostring(v)] = v.BindName.Value
        end
        local PlrParts = PlrGarage.Parts:Clone()
        local PlrBase = PlrGarage.BuildZone
        local CopyProperties = {}

        local groups = {
            [1] = {},
            [2] = {},
            [3] = {}
        }
        local Count = 0
        local MaxCount = 0
        local Con = MyParts.ChildAdded:connect(function(Ch)
            wait(4)
            for i = 1, #CopyProperties do
                if not CopyProperties[i]["Done"] and tostring(Ch) == CopyProperties[i][2].Name and
                    (CopyProperties[i][1].Position - (Ch.Position - MyBase.Position)).Magnitude <= 0.001 then
                    CopyProperties[i]["Done"] = true
                    FireRemote("resize", Ch, CopyProperties[i][2].Size*scale, Ch.CFrame) -- ToolController
                    FireRemote("paint", Ch, CopyProperties[i][2].Color)
                    FireRemote("material", Ch, CopyProperties[i][2].Material) -- ToolController
                    FireRemote("cancollide", Ch, CopyProperties[i][2].CanCollide) -- ToolController
                    FireRemote("transparency", Ch, CopyProperties[i][2].Transparency) -- ToolController
                    FireRemote("reflectance", Ch, CopyProperties[i][2].Reflectance) -- ToolController
                    for a = 1, #SurfaceNames do
                        FireRemote("surface", Ch, SurfaceNames[a] .. "Surface",
                            CopyProperties[i][2][SurfaceNames[a] .. "Surface"])
                    end
                    pcall(function()
                        GetPropertys(Ch, CopyProperties[i][2])
                    end)
                    if CopyProperties[i][2]:FindFirstChild("KeyLabel") then
                        local L = CopyProperties[i][2]:FindFirstChild("KeyLabel")
                        FireRemote("keybind", L.Key.Text, L.Action.Text, Keybinds[L.Key.Text], Ch)
                    end
                    if Ch:FindFirstChild("Switch") then
                        FireRemote("Configure", tostring(Ch), "Switch", Ch, CopyProperties[i][2].Switch.Value)
                    end

                    if Ch:FindFirstChild("Group") then
                        table.insert(groups[CopyProperties[i][2].Group.Value], Ch)
                    end
                    break
                end
            end
            Count = Count + 1
        end)

    m = 1
    for i, v in pairs(Resize) do
    if v:IsA("BasePart") then
    task.wait();
    local distanceX = CenterDistanceX[m]*scale
    local distanceY = CenterDistanceY[m]*scale
    local distanceZ = CenterDistanceZ[m]*scale

            local CF = (v.CFrame - PlrBase.Position  + Vector3.new(CenterDistanceX[m],CenterDistanceY[m],CenterDistanceZ[m])+ Vector3.new(-distanceX,-distanceY,-distanceZ))
            local Offset = CF
            table.insert(CopyProperties, {Offset, v:Clone()})
            FireRemote("Insert", tostring(v), (Offset + MyBase.Position))
            MaxCount = MaxCount + 1
            m=m+1
        end
    end
    repeat
        wait()
    until MaxCount == Count
    for i = 1, 3 do
        FireRemote("grouping", groups[i], i)
    end
    Con:Disconnect()
end
    CloneGarage(PlayerToResize)
end
local ResizeTab = Window:NewTab("Resize")
local ResizeSelector = ResizeTab:NewSection("Player Selection")
local PlayerResize = ResizeSelector:NewDropdown("Player To Build", "Select player",
    {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)), tostring(GetPlr(5)),
     tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)), tostring(GetPlr(9)), tostring(GetPlr(10))},
    function(k)
        PlayerToResize = k
    end)
local ResizeSection = ResizeTab:NewSection("Resize")
ResizeSection:NewButton("Lock Parts", "Lock parts to be resized", function()
    Resize = {}
    CenterDistanceX = {}
    CenterDistanceZ = {}
    CenterDistanceY = {}
    m=1
    Plane = GetGarage(PlayerToResize).Parts:FindFirstChild("Laser Pointer")
    for i, v in pairs(GetGarage(PlayerToResize).Parts:GetChildren()) do
    if v.Position.X < Plane.Position.X then
    Resize[m] = v
    CenterDistanceX[m] = (Plane.Position.X-v.Position.X)
    CenterDistanceY[m] = (Plane.Position.Y-v.Position.Y)
    CenterDistanceZ[m] = (Plane.Position.Z-v.Position.Z)
    m=m+1
    end 
    end
end)
ResizeSection:NewTextBox("Scale Factor", "factor to scale", function(k)
    Scale = k
end)
ResizeSection:NewButton("Resize", "Resize Build", function()
    ResizeBuild(Scale)
end)
end


game.Players.PlayerAdded:Connect(function(player)
    local PlayerList = {tostring(GetPlr(1)), tostring(GetPlr(2)), tostring(GetPlr(3)), tostring(GetPlr(4)),
                        tostring(GetPlr(5)), tostring(GetPlr(6)), tostring(GetPlr(7)), tostring(GetPlr(8)),
                        tostring(GetPlr(9)), tostring(GetPlr(10))}

    TransferFrom:Refresh(PlayerList)
    TransferTo:Refresh(PlayerList)
    PlayerEdit:Refresh(PlayerList)
    PlayerConfig:Refresh(PlayerList)
    PlayerColor:Refresh(PlayerList)
    PlayerRotate:Refresh(PlayerList)
    PlayerResize:Refresh(PlayerList)
end)


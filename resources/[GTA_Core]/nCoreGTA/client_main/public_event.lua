--[=====[
        Spawn du player :
]=====]
AddEventHandler('playerSpawned', function()
	TriggerServerEvent("GTA:SetPositionPlayer")
	TriggerServerEvent("GTA:LoadJobsJoueur")
	TriggerServerEvent("nGetStats")
	TriggerServerEvent("GTA:CheckAdmin")
    TriggerServerEvent('GTA:requestSync')
end)

--[=====[
        Notification :
]=====]

RegisterNetEvent("NUI-Notification")
AddEventHandler("NUI-Notification", function(t)
    setmetatable(t,{__index={b = "success", c = "fa fa-handshake-o fa-2x", d = "row-reverse"}})
    local textNotif, tType, iCon, pPos = t[1] or t.a, t[2] or t.b, t[3] or t.c, t[4] or t.d

    exports.nMainNotification:GTA_NUI_ShowNotification({
        text = textNotif,
        type = tType,
        icon = iCon,
        position = pPos
    })
end)

RegisterNetEvent('nMenuNotif:showNotification')
AddEventHandler('nMenuNotif:showNotification', function(text)
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
	DrawNotification( false, false )
end)


--[=====[
            Marker Target :
]=====]
RegisterNetEvent("ShowMarkerTarget")
AddEventHandler("ShowMarkerTarget", function()
    afficherMarkerTarget()
end)

function GetPlayers()
    local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		players[#players + 1] = player
	end
    return players
end

local square = math.sqrt
function getDistance(a, b) 
    local x, y, z = a.x-b.x, a.y-b.y, a.z-b.z
    return square(x*x+y*y+z*z)
end

function afficherMarkerTarget()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for _,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = getDistance(targetCoords, plyCoords, true)
			if distance < 2 then
				if(closestDistance == -1 or closestDistance > distance) then
					closestPlayer = value
					closestDistance = distance
					DrawMarker(0, targetCoords["x"], targetCoords["y"], targetCoords["z"] + 1, 0, 0, 0, 0, 0, 0, 0.1, 0.1, 0.1, 255, 255, 255, 200, 0, 0, 0, 0)
				end
			end
		end
	end
end


--[=====[
            Play TaskStartScenarioInPlace :
]=====]
RegisterNetEvent("PlayTaskScenarioInPlace")
AddEventHandler("PlayTaskScenarioInPlace", function(handle, animation, timer) 
	TaskStartScenarioInPlace(handle, animation, 0, true)
	Citizen.Wait(timer)
	ClearPedTasks(handle)
end)


--[=====[
            Play TaskPlayAnim :
]=====]
RegisterNetEvent("TaskPlayAnimation")
AddEventHandler("TaskPlayAnimation", function(handle, dict, animation, duration, flags) 
	duration = duration or -1
	flags = flags or 0
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(10)
	end
	TaskPlayAnim(handle, dict, animation, 8.0, -8, duration, flags, 0, 0, 0, 0)
end)

--[=====[
           Anim Set Attitude (demarche) :
]=====]
RegisterNetEvent("BeginRequestAnimSet")
AddEventHandler("BeginRequestAnimSet", function(animSet) 
	if not HasAnimSetLoaded(animSet) then
		RequestAnimSet(animSet)

		while not HasAnimSetLoaded(animSet) do
			Citizen.Wait(1)
		end
		SetPedMotionBlur(GetPlayerPed(-1), true)
		SetPedMovementClipset(GetPlayerPed(-1), animSet, true)
	end
end)



--[=====[
            Show AlertNear :
]=====]
RegisterNetEvent("AlertNear")
AddEventHandler("AlertNear", function(message) 
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(message);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end)

--[=====[
            Spawn Vehicule :
]=====]
RegisterNetEvent("SpawnVehicule")
AddEventHandler("SpawnVehicule", function(pVeh, pos, imatricule)
    local pVeh = GetHashKey(pVeh)

    RequestModel(pVeh)
    while not HasModelLoaded(pVeh) do
        RequestModel(pVeh)
        Citizen.Wait(0)
    end

    local veh = CreateVehicle(pVeh, pos.x, pos.y, pos.z, pos.h, true, false)

	if (imatricule ~= nil) then
    	SetVehicleNumberPlateText(veh, imatricule)
	end

	SetEntityAsMissionEntity(veh, true, true)
end)


--[=====[
            Destroy Vehicule :
]=====]
RegisterNetEvent("DestroyVehicle")
AddEventHandler("DestroyVehicle", function(entity)
    SetEntityAsMissionEntity(entity,true,true)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
    TriggerEvent("NUI-Notification", {"Véhicule détruit."})
end)


--[=====[
            On Player death :
]=====]
RegisterNetEvent("GTA:OnPlayerDeath")
AddEventHandler("GTA:OnPlayerDeath", function()
    BeginDeathScreen()
end)
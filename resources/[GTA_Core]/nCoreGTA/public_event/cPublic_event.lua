--[=====[
        Spawn du player :
]=====]
AddEventHandler('playerSpawned', function()
	TriggerServerEvent("GTA:LoadJobsJoueur")
	TriggerServerEvent("nGetStats")
    TriggerServerEvent('GTA:requestSync')
	TriggerEvent("GTA_Armes:Init")
end)

--> [Event gérer par le core.]
RegisterNetEvent("GTA:RefreshJobInformation")
AddEventHandler("GTA:RefreshJobInformation", function(job, grade, service)
    config.Player.job = job
    config.Player.grade = grade
	config.Player.enService = service
end)

--> [Event gérer par le core.]
RegisterNetEvent("GTA:Refreshinventaire")
AddEventHandler("GTA:Refreshinventaire", function(inv, weight)
    config.Player.inventaire = inv
    config.Player.weight = weight
    TriggerEvent("GTA:UpdateInventaire", config.Player.inventaire, config.Player.weight)
end)


--> [Event gérer par le core.]
RegisterNetEvent("GTA:AfficherBanque")
AddEventHandler("GTA:AfficherBanque", function(value)
	config.Player.banque = value
end)

--[=====[
        Notification :
		Cette event peut être utilisé client-side/server-side exemple :
		Client-side : --> TriggerEvent("NUI-Notification", {"text"})
		Server-side : --> TriggerClientEvent("NUI-Notification", source, {"text"})
]=====]
RegisterNetEvent("NUI-Notification")
AddEventHandler("NUI-Notification", function(t)
    setmetatable(t,{__index={b = "success"}})
    local textNotif, tType, pPos = t[1] or t.a, t[2] or t.b

    exports.nMainNotification:GTA_NUI_ShowNotification({
        text = textNotif,
        type = tType
    })
end)


--[=====[
        Notification :
		Cette event peut être utilisé client-side/server-side exemple :
		Client-side : --> TriggerEvent("nMenuNotif:showNotification", "text")
		Server-side : --> TriggerClientEvent("nMenuNotif:showNotification", source, "text")
]=====]
RegisterNetEvent('nMenuNotif:showNotification')
AddEventHandler('nMenuNotif:showNotification', function(text)
    SetNotificationTextEntry( "STRING" )
    AddTextComponentString( text )
	DrawNotification( false, false )
end)


--[=====[
        Notification :
		Cette event peut être utilisé client-side/server-side exemple :
		Client-side : --> TriggerEvent("GTAO:NotificationIcon", "CHAR_BANK_MAZE", "Titre","Sous Titre", "TEXT LOREM SISISI ASASAASLLAALLA")
		Server-side : --> TriggerClientEvent("GTAO:NotificationIcon", source, "CHAR_BANK_MAZE", "Titre","Sous Titre", "TEXT LOREM SISISI ASASAASLLAALLA")
]=====]
RegisterNetEvent('GTAO:NotificationIcon')
AddEventHandler('GTAO:NotificationIcon', function(icon, title, soustitre, text)
	local soustitre = soustitre or " "
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	SetNotificationMessage(icon, icon, true, 1, title, soustitre, text)
	DrawNotification(false, true)
end)



--[=====[
        Marker Target utile pour afficher un marker au dessus de la tête du target le plus proche :
		Cette event est utilisé client-side exemple :
		--TriggerEvent("ShowMarkerTarget")
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
		Cette event est utilisé client-side exemple :
		--TriggerEvent("PlayTaskScenarioInPlace", GetPlayerPed(-1), "WORLD_HUMAN_SMOKING", -1)
]=====]
RegisterNetEvent("PlayTaskScenarioInPlace")
AddEventHandler("PlayTaskScenarioInPlace", function(handle, animation, timer) 
	TaskStartScenarioInPlace(handle, animation, 0, true)
	Citizen.Wait(timer)
	ClearPedTasks(handle)
end)





--[=====[
		Play TaskPlayAnim :
		Cette event est utilisé client-side exemple :
		--TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "amb@world_human_golf_player@male@idle_a", "idle_a", -1)
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
		Cette event est utilisé client-side exemple :
		--TriggerEvent("BeginRequestAnimSet", "move_m@hipster@a")
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
		Cette event est utilisé client-side exemple :
		--TriggerEvent("AlertNear", "Vous êtes proche d'une zone.")
]=====]
RegisterNetEvent("AlertNear")
AddEventHandler("AlertNear", function(message) 
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(message);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end)



--[=====[
		Spawn Vehicule :
		Cette event est utilisé client-side exemple :
		--TriggerEvent("SpawnVehicule", "luxor", position, "coucou")
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
		Cette event est utilisé client-side exemple :
		--TriggerEvent("DestroyVehicle", entity)
]=====]
RegisterNetEvent("DestroyVehicle")
AddEventHandler("DestroyVehicle", function(entity)
    SetEntityAsMissionEntity(entity,true,true)
	Citizen.InvokeNative(0xAE3CBE5BF394C9C9, Citizen.PointerValueIntInitialized(entity))
    TriggerEvent("NUI-Notification", {"Véhicule détruit."})
end)



--[=====[
		Play Sound List de sons : https://gtaforums.com/topic/795622-audio-for-mods
		Cette event est utilisé client-side exemple :
		--TriggerEvent("PlaySoundClient", GetPlayerPed(-1), "sound", "dict")
		--TriggerEvent("PlaySoundClient", GetPlayerPed(-1), "Radio_Off", "TAXI_SOUNDS")
]=====]
RegisterNetEvent("PlaySoundClient")
AddEventHandler("PlaySoundClient", function(handle,sound,dict)
	PlaySoundFromEntity(-1,tostring(sound),handle,tostring(dict), 0, 0)
end)


--[=====[
        Permet d'utilisé un item avec différent action possible :
		les "types" sont définis dans le fichier config de vos items.
]=====]
local items = config.itemList
RegisterNetEvent("GTA:UseItem")
AddEventHandler("GTA:UseItem", function(item_name, itemid)
    for k,v in pairs(items) do
        if k == item_name then
			if v.type == "boissons" then
				TriggerEvent("nAddSoif", 25, item_name, itemid) --> Nombre d'ajout au moment ou il boit.
			elseif v.type == "nourriture" then
				TriggerEvent("nAddFaim", 25, item_name, itemid)  --> Nombre d'ajout au moment ou il mange.
			elseif v.type == "armes" then 
				TriggerEvent("GTA_Armes:Init")
			elseif v.type == "medical" then 
				TriggerEvent("GTA_Items_Type:Medics", item_name, itemid)
			elseif v.type == "storage" then 
				TriggerEvent("GTA_Props:SpawnCoffre", item_name, v.prop)
			elseif v.type == "vide" then
				TriggerEvent("NUI-Notification", {"Item inutilisable", "warning"})
			end
            break
        end
    end
end)


--[=====[
        Permet de retirer un item de votre inventaire (cette event est utilisé client-side/server-side exemple) :
		Utilisation : TriggerClientEvent("GTA_Inventaire:RetirerItem", source, item_name, qty) --> Server-side.
		Utilisation : TriggerEvent("GTA_Inventaire:RetirerItem", item_name, qty) --> Client-side.
]=====]
RegisterNetEvent("GTA_Inventaire:RetirerItem")
AddEventHandler("GTA_Inventaire:RetirerItem", function(item_name, qty)
   	TriggerServerEvent("GTA_Inventaire:RemoveItem", item_name, qty)
end)


--[=====[
        Permet de donner un item a une target (Cette event est utilisé client-side/server-side exemple) :
		Utilisation : TriggerClientEvent("GTA_Inventaire:DonnerItem", target, item_name, itemid, qty) --> Server-side.
		Utilisation : TriggerEvent("GTA_Inventaire:DonnerItem", target, item_name, itemid, qty) --> Client-side.
]=====]
RegisterNetEvent("GTA_Inventaire:DonnerItem")
AddEventHandler("GTA_Inventaire:DonnerItem", function(target, item_name, itemid, qty)
   	TriggerServerEvent("GTA_Inventaire:GiveItem", target, item_name, itemid, qty)
end)


--[=====[
        Permet d'ajouter un item dans votre inventaire (cette event est utilisé client-side/server-side exemple) :
		Utilisation : TriggerClientEvent("GTA_Inventaire:AjouterItem", source, item_name, qty) --> Server-side.
		Utilisation : TriggerEvent("GTA_Inventaire:AjouterItem", item_name, qty) --> Client-side.
]=====]
RegisterNetEvent("GTA_Inventaire:AjouterItem")
AddEventHandler("GTA_Inventaire:AjouterItem", function(item_name, qty)
   	TriggerServerEvent("GTA_Inventaire:ReceiveItem", item_name, qty)
end)

--[=====[
        Permet d'afficher une Info d'intéraction (cette event est utilisé client-side/server-side exemple) :
		Utilisation : TriggerClientEvent("GTA-Notification:InfoInteraction", source, "~INPUT_PICKUP~ pour ouvrir le coffre.") --> Server-side.
		Utilisation : TriggerEvent("GTA-Notification:InfoInteraction", "~INPUT_PICKUP~ pour ouvrir le coffre.") --> Client-side.
]=====]
RegisterNetEvent("GTA-Notification:InfoInteraction")
AddEventHandler("GTA-Notification:InfoInteraction", function(msg)
	Ninja_Core__DisplayHelpAlert(msg)
end)

Ninja_Core__DisplayHelpAlert = function(msg)
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(msg);  
    EndTextCommandDisplayHelp(0, 0, 0, -1);
end
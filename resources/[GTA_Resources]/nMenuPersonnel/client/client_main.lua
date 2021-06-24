local waitRenderCarte = 1000
local enableIdentity = false



RegisterNetEvent("GTA_Interaction:UpdateInfoPlayers")
AddEventHandler("GTA_Interaction:UpdateInfoPlayers", function(identiter, banque)
    config.joueurs.nom = identiter["nom"] 
    config.joueurs.prenom = identiter["prenom"]
    config.joueurs.age = identiter["age"] 
    config.joueurs.nationaliter = identiter["nationaliter"]

	--print(identiter["nom"] , identiter["prenom"], identiter["age"], identiter["nationaliter"])

	config.joueurs.argentBanque = banque
	mainMenu.Title = config.joueurs.nom .. " ".. config.joueurs.prenom
end)

RegisterNetEvent("GTA_Interaction:UpdateInfoPlayersIdentiter")
AddEventHandler("GTA_Interaction:UpdateInfoPlayersIdentiter", function(identiter, targetID)
	config.showIdentiter = true

    config.identiter.nom = identiter["nom"] 
    config.identiter.prenom = identiter["prenom"]
    config.identiter.age = identiter["age"] 
    config.identiter.nationaliter = identiter["nationaliter"]
    config.identiter.travail = identiter["profession"]
    config.identiter.telephone = identiter["telephone"]
	
	local posx, posy = 0.777, 0.26
	local width, height = 0.07, 0.14
	local x, y = GetActiveScreenResolution()
	if x == 1920 and y == 1080 then
		posx, posy = 0.777, 0.26
		width, height = 0.07, 0.14
	elseif x == 1366 and y == 768 then
		posx, posy = 0.686, 0.366
		width, height = 0.086, 0.196
	elseif x == 1360 and y == 768 then
		posx, posy = 0.685, 0.366
		width, height = 0.087, 0.196
	elseif x == 1600 and y == 900 then
		posx, posy = 0.732, 0.3122
		width, height = 0.073, 0.168
	elseif x == 1400 and y == 1050 then
		posx, posy = 0.694, 0.267
		width, height = 0.083, 0.145
	elseif x == 1440 and y == 900 then
		posx, posy = 0.702, 0.312
		width, height = 0.082, 0.169
	elseif x == 1680 and y == 1050 then
		posx, posy = 0.745, 0.268
		width, height = 0.068, 0.1435
	elseif x == 1280 and y == 720 then
		posx, posy = 0.665, 0.3905
		width, height = 0.09, 0.2105
	elseif x == 1280 and y == 768 then
		posx, posy = 0.665, 0.366
		width, height = 0.091, 0.196
	elseif x == 1280 and y == 800 then
		posx, posy = 0.665, 0.3515
		width, height = 0.091, 0.1895
	elseif x == 1280 and y == 960 then
		posx, posy = 0.665, 0.2925
		width, height = 0.091, 0.1585
	elseif x == 1280 and y == 1024 then
		posx, posy = 0.665, 0.2745
		width, height = 0.091, 0.1475
	elseif x == 1024 and y == 768 then
		posx, posy = 0.5810, 0.366
		width, height = 0.115, 0.1965
	elseif x == 800 and y == 600 then
		posx, posy = 0.4635, 0.4685
		width, height = 0.1455, 0.251
	elseif x == 1152 and y == 864 then
		posx, posy = 0.6275, 0.325
		width, height = 0.1005, 0.175
	elseif x == 1280 and y == 600 then
		posx, posy = 0.665, 0.468
		width, height = 0.0905, 0.251
	end

	if (tonumber(targetID) ~= nil) then
		local targetPlayer = nil
		for i = 1, 255, 1 do
			if NetworkIsPlayerActive(i) then
				if GetPlayerServerId(i) == tonumber(targetID) then
					targetPlayer = GetPlayerPed(i)
					break
				end
			end
		end

		local handle = RegisterPedheadshot(targetPlayer)
		while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
			Citizen.Wait(0)
		end
		local txd = GetPedheadshotTxdString(handle)

		Citizen.CreateThread(function()
			while config.showIdentiter do
				Citizen.Wait(0)
				DrawSprite (txd, txd, posx, posy, width, height, 0.0, 255, 255, 255, 1000)
			end
		end)
	
		if not config.showIdentiter then
			UnregisterPedheadshot(txd)
		end
	else
		local handle = RegisterPedheadshot(GetPlayerPed(-1))
		while not IsPedheadshotReady(handle) or not IsPedheadshotValid(handle) do
			Citizen.Wait(0)
		end
		local txd = GetPedheadshotTxdString(handle)

		Citizen.CreateThread(function()
			while config.showIdentiter do
				Citizen.Wait(0)
				DrawSprite (txd, txd, posx, posy, width, height, 0.0, 255, 255, 255, 1000)
			end
		end)
	end

	if not config.showIdentiter then
		UnregisterPedheadshot(txd)
	end

	Wait(10000)

	config.showIdentiter = false
end)

RegisterNetEvent("GTA:RefreshUserSex")
AddEventHandler("GTA:RefreshUserSex", function(sexe)
	config.joueurs.sexe = sexe
end)

RegisterNetEvent("GTA:RefreshUserCapuche")
AddEventHandler("GTA:RefreshUserCapuche", function(drawCapuche)
	config.drawIDCapucheServer = drawCapuche
end)

RegisterNetEvent("GTA:MettreHautJoueur")
AddEventHandler("GTA:MettreHautJoueur", function(args)
	local playerPed = GetPlayerPed(-1)

	SetPedComponentVariation(playerPed, args[1], args[2], args[3], 0) --> TopsID
	SetPedComponentVariation(playerPed, args[4], args[5], args[6], 0) --> Undershirt
	SetPedComponentVariation(playerPed, args[7], args[8], 0, 0) --> Torsos
end)

RegisterNetEvent("GTA:MettreBasJoueur")
AddEventHandler("GTA:MettreBasJoueur", function(args)
	SetPedComponentVariation(GetPlayerPed(-1), args[1], args[2], args[3], 0) --> Legs
end)

RegisterNetEvent("GTA:MettreChaussureJoueur")
AddEventHandler("GTA:MettreChaussureJoueur", function(args)
	SetPedComponentVariation(GetPlayerPed(-1), args[1], args[2], args[3], 0) --> Shoes
end)

RegisterNetEvent("GTA:MettreBonnetJoueur")
AddEventHandler("GTA:MettreBonnetJoueur", function(args)
	SetPedPropIndex(GetPlayerPed(-1), args[1], args[2], args[3], 0) --> Hats
end)

RegisterNetEvent("GTA:MettreMaskJoueur")
AddEventHandler("GTA:MettreMaskJoueur", function(args)
	SetPedComponentVariation(GetPlayerPed(-1), args[1], args[2], 0, 0) --> Mask
end)

RegisterNetEvent("GTA:RetirerHautJoueur")
AddEventHandler("GTA:RetirerHautJoueur", function()
	local playerPed = GetPlayerPed(-1)
	if config.joueurs.sexe == "mp_m_freemode_01" then
		SetPedComponentVariation(playerPed, 11, 15, 0, 0)
		SetPedComponentVariation(playerPed, 8, 15, 0, 0)
		SetPedComponentVariation(playerPed, 3, 15, 0, 0)
	else
		SetPedComponentVariation(playerPed, 11, 15, 0, 0)
		SetPedComponentVariation(playerPed, 8, 2, 0, 0)
		SetPedComponentVariation(playerPed, 3, 15, 0, 0)
	end
end)

RegisterNetEvent("GTA:RetirerBasJoueur")
AddEventHandler("GTA:RetirerBasJoueur", function()
	local playerPed = GetPlayerPed(-1)
	if config.joueurs.sexe == "mp_m_freemode_01" then
		SetPedComponentVariation(playerPed, 4, 14, 0, 0)
	else
		SetPedComponentVariation(playerPed, 4, 17, 0, 0)
	end
end)

RegisterNetEvent("GTA:RetirerChaussureJoueur")
AddEventHandler("GTA:RetirerChaussureJoueur", function()
	local playerPed = GetPlayerPed(-1)
	if config.joueurs.sexe == "mp_m_freemode_01" then
		SetPedComponentVariation(playerPed, 6, 34, 0, 0)
	else
		SetPedComponentVariation(playerPed, 6, 35, 0, 0)
	end
end)

RegisterNetEvent("GTA:RetirerBonnetJoueur")
AddEventHandler("GTA:RetirerBonnetJoueur", function()
	local playerPed = GetPlayerPed(-1)
	if config.joueurs.sexe == "mp_m_freemode_01" then
		SetPedPropIndex(playerPed, 0, 8, 0, 0)
	else
		SetPedPropIndex(playerPed, 0, 57, 0, 0)
	end
end)

RegisterNetEvent("GTA:RetirerMaskJoueur")
AddEventHandler("GTA:RetirerMaskJoueur", function()
	SetPedComponentVariation(GetPlayerPed(-1), 1, 0, 0, 0)
end)


RegisterNetEvent("GTA:MettreCapucheTenue")
AddEventHandler("GTA:MettreCapucheTenue", function()
	for k,v in pairs(config.pull_capuche_retirer_hommme) do
		if config.joueurs.sexe == "mp_m_freemode_01" and config.drawIDCapucheServer == k then
			SetPedComponentVariation(GetPlayerPed(-1), 11, v, 0, 0)
			config.drawIDCapucheServer = v
			break
		end
	end

	for i, j in pairs(config.pull_capuche_retirer_femme) do 
		if config.joueurs.sexe == "mp_f_freemode_01" and config.drawIDCapucheServer == i then
			SetPedComponentVariation(GetPlayerPed(-1), 11, j, 0, 0)
			config.drawIDCapucheServer = j
			break
		end
	end
end)

RegisterNetEvent("GTA:RetirerCapucheTenue")
AddEventHandler("GTA:RetirerCapucheTenue", function()
	for k,v in pairs(config.pull_capuche_retirer_hommme) do
		if config.joueurs.sexe == "mp_m_freemode_01" and config.drawIDCapucheServer == k then
			SetPedComponentVariation(GetPlayerPed(-1), 11, v, 0, 0)
			config.drawIDCapucheServer = v
			break
		end
	end

	for i, j in pairs(config.pull_capuche_retirer_femme) do 
		if config.joueurs.sexe == "mp_f_freemode_01" and config.drawIDCapucheServer == j then
			SetPedComponentVariation(GetPlayerPed(-1), 11, i, 0, 0)
			config.drawIDCapucheServer = i
			break
		end
	end
end)

RegisterNetEvent("GTA_Inv:ReceiveItemAnim")
AddEventHandler("GTA_Inv:ReceiveItemAnim", function()
	TriggerEvent("TaskPlayAnimation", PlayerPedId(), "amb@world_human_security_shine_torch@male@enter", "enter", -1)
end)


local square = math.sqrt
function getDistance(a, b) 
    local x, y, z = a.x-b.x, a.y-b.y, a.z-b.z
    return square(x*x+y*y+z*z)
end

function GetInputNumber()
    local nb = 0
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TTTIP8", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(10)
    end
    if (GetOnscreenKeyboardResult()) then
        nb = GetOnscreenKeyboardResult()
        nb = nb:gsub("[^0-9]", "")
        nb = tonumber(nb)
        if nb == nil or nb < 0 then
           nb = 0
        end
    end
    return nb
end

function GetInputText(reason)
	local text = ""
	AddTextEntry('nombre', reason)
    DisplayOnscreenKeyboard(1, "nombre", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(10)
    end
    if (GetOnscreenKeyboardResult()) then
        text = GetOnscreenKeyboardResult()
    end
    return text
end

function RequestToSave()
	local pPed = GetPlayerPed(-1)
	local pCoords = GetEntityCoords(pPed)
	TriggerServerEvent("GTA:SavePos", pCoords)
	Wait(50)
	TriggerServerEvent("GTA:SyncPlayer")
	TriggerEvent("NUI-Notification", {"Synchronisation éfféctué."})
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for _,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if distance < 5 then
				if(closestDistance == -1 or closestDistance > distance) then
					closestPlayer = value
					closestDistance = distance
				end
			end
		end
	end

	return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		players[#players + 1] = player
	end
    return players
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)
		SendNUIMessage({
			type = "identiter",
			activate = config.showIdentiter,
			data_nom = config.identiter.nom,
			data_prenom = config.identiter.prenom,
			data_age = config.identiter.age,
			data_origine = config.identiter.nationaliter,
			data_travail = config.identiter.travail,
			data_telephone = config.identiter.telephone
		})
	end
end)


function InitSettings()
	config.settings.fDistance_vue_lod = GetResourceKvpFloat("view_lod")
    config.settings.fDistance_shadow = GetResourceKvpFloat("dist_shadow")

	if config.settings.fDistance_vue_lod == 0.0 then
		config.settings.fDistance_vue_lod = 1.0
		config.settings.fDistance_shadow = 0.5
        SetResourceKvpFloat("view_lod",config.settings.fDistance_vue_lod)
        SetResourceKvpFloat("dist_shadow",config.settings.fDistance_shadow)
    end
end

AddEventHandler("playerSpawned", function()
	Wait(1000)
	InitSettings()
end)
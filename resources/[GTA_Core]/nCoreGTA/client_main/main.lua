 --||@SuperCoolNinja. && RamexDeltaXOO||--


RegisterNetEvent("GTA:JoueurLoaded")
AddEventHandler("GTA:JoueurLoaded", function()
    --> Load le phone au spawn :
    TriggerServerEvent("GTA:TelephoneLoaded")

    --> PVP :
    if config.activerPvp == true then
        for _, player in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(player)
            SetCanAttackFriendly(ped, true, true)
            NetworkSetFriendlyFireOption(true)
        end
    end

    --> COPS :
    if config.activerPoliceWanted == false then
        Citizen.CreateThread(function()
            local myPlayer = GetEntityCoords(PlayerPedId())	
            while true do
                Citizen.Wait(0)
                
                --> Permet de ne pas recevoir d'indice de recherche :
                if (GetPlayerWantedLevel(PlayerId()) > 0) then
                    SetPlayerWantedLevel(PlayerId(), 0, false)
                    SetPlayerWantedLevelNow(PlayerId(), false)
                end

                --> Permet de ne pas spawn les véhicule de cops prés du poste de police :
                ClearAreaOfCops(myPlayer.x, myPlayer.y, myPlayer.z, 5000.0)
            end
        end)
    end

    --> Salaire :
    Citizen.CreateThread(function ()
        while true do
        Citizen.Wait(config.salaireTime)
            TriggerServerEvent("GTA:salaire")
        end
    end)

    local ipls = {'facelobby', 'farm', 'farmint', 'farm_lod', 'farm_props', 
                'des_farmhouse', 'post_hiest_unload', 'v_tunnel_hole',
                'rc12b_default', 'refit_unload', 'shr_int', 'Coroner_Int_on'}

    for _,v in pairs(ipls) do
        if not IsIplActive(v) then
            RequestIpl(v)
        end
    end
end)

RegisterNetEvent("GTA:AfficherArgentPropre")
AddEventHandler("GTA:AfficherArgentPropre", function(value)
	StatSetInt("MP0_WALLET_BALANCE", value, false)
    ShowHudComponentThisFrame(4)

    Wait(1000)
    RemoveMultiplayerBankCash(0xC7C6789AA1CFEDD0)
end)

RegisterNetEvent("GTA:AfficherBanque")
AddEventHandler("GTA:AfficherBanque", function(value)
	StatSetInt("BANK_BALANCE", value, true)
    ShowHudComponentThisFrame(3)
    
    Wait(1000)
    RemoveMultiplayerHudCash(0x968F270E39141ECA)
end)

RegisterNetEvent("GTA:AjoutSonPayer")
AddEventHandler("GTA:AjoutSonPayer", function()
    PlaySoundFrontend(-1, "Bus_Schedule_Pickup", "DLC_PRISON_BREAK_HEIST_SOUNDS", 0)
end)


--- System de distance de voix : 
local distance_voix = {}
local currentdistancevoice = 0 -- Current distance to voice (0 to 2)
distance_voix.Grande = 12.001
distance_voix.Normal = 8.001
distance_voix.Faible = 2.001


AddEventHandler('onClientMapStart', function()
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(distance_voix.Normal) -- 5 meters range
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(distance_voix.Grande) -- 12 meters range
	elseif currentdistancevoice == 2 then
		NetworkSetTalkerProximity(distance_voix.Faible) -- 1 meters range
	end
end)

--------------------------------> GESTION DU SYSTEM DE DISTANCE DE VOIX : .

RegisterCommand('+changevoice', function()
        currentdistancevoice = (currentdistancevoice + 1) % 3
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(distance_voix.Normal) -- 5 meters range

        exports.GTA_Notif:GTA_NUI_ShowNotification({
            text = "Niveau vocal : normal.",
            type = "success",
            icon = "fa fa-check fa-2x",
            position = "row-reverse"
        })
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(distance_voix.Grande) -- 12 meters range

        exports.GTA_Notif:GTA_NUI_ShowNotification({
            text = "Niveau vocal : crier.",
            type = "success",
            icon = "fa fa-check fa-2x",
            position = "row-reverse"
        })
	elseif currentdistancevoice == 2 then
        NetworkSetTalkerProximity(distance_voix.Faible) -- 1 meters range

        exports.GTA_Notif:GTA_NUI_ShowNotification({
            text = "Niveau vocal : chuchoter.",
            type = "success",
            icon = "fa fa-check fa-2x",
            position = "row-reverse"
        })
	end
end, false)

RegisterCommand('-changevoice', function() end, false)
RegisterKeyMapping('+changevoice', 'Distance de voix', 'keyboard', 'F1')

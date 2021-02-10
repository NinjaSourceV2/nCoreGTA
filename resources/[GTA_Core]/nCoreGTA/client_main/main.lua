--@Super.Cool.Ninja
local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local waitWantedLevel = 5
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
                Citizen.Wait(waitWantedLevel)
                
                --> Permet de ne pas recevoir d'indice de recherche :
                if (GetPlayerWantedLevel(PlayerId()) > 0) then
				    waitWantedLevel = 0
                    SetPlayerWantedLevel(PlayerId(), 0, false)
                    SetPlayerWantedLevelNow(PlayerId(), false)
				else
				    waitWantedLevel = 5
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
                'rc12b_default', 'refit_unload', 'shr_int'}

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
distance_voix.Normal = 5.001
distance_voix.Faible = 1.001


AddEventHandler('onClientMapStart', function()
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(distance_voix.Normal) -- 5 meters range
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(distance_voix.Grande) -- 12 meters range
	elseif currentdistancevoice == 2 then
		NetworkSetTalkerProximity(distance_voix.Faible) -- 1 meters range
	end
end)

--------------------------------> GESTION DU SYSTEM DE DISTANCE DE VOIX :

RegisterCommand('+changevoice', function()
        currentdistancevoice = (currentdistancevoice + 1) % 3
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(distance_voix.Normal) -- 5 meters range
	    exports.nCoreGTA:ShowNotification("~w~Niveau vocal : ~b~normal")
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(distance_voix.Grande) -- 12 meters range
	    exports.nCoreGTA:ShowNotification("~w~Niveau vocal : ~b~crier")
	elseif currentdistancevoice == 2 then
            NetworkSetTalkerProximity(distance_voix.Faible) -- 1 meters range
	    exports.nCoreGTA:ShowNotification("~w~Niveau vocal : ~b~chuchoter")
	end
end, false)

RegisterCommand('-changevoice', function() end, false)
RegisterKeyMapping('+changevoice', 'Distance de voix', 'keyboard', 'F1')

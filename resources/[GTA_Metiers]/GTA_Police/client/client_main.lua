DureeZone = 0
waitMenuPoliceOpen = 1000
waitMenotte = 1000
local isMenuEnableCar = false
local joueurEstMenotter = false
local prevMaleVariation = 0
local prevFemaleVariation = 0


--> TODO : 
--[[
    4. = COMMENCER LE MENU ACTION.
]]

RegisterNetEvent("GTA_Police:AfficherBlipsPoint")
AddEventHandler('GTA_Police:AfficherBlipsPoint', function ()
    --Sortie des veh :
    PoliceSortieVeh = AddBlipForCoord(459.21, -1008.07, 28.26)
    SetBlipSprite(PoliceSortieVeh,225)		
    SetBlipColour(PoliceSortieVeh, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('GARAGE VEHICULE ~r~LSPD')
	EndTextCommandSetBlipName(PoliceSortieVeh)
	
	--Rentrer veh :
	PoliceDeleteVeh = AddBlipForCoord(451.999, -997.16, 25.7613)
	SetBlipSprite(PoliceDeleteVeh,225)		
	SetBlipColour(PoliceDeleteVeh, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('RANGER VEHICULE ~r~LSPD')
    EndTextCommandSetBlipName(PoliceDeleteVeh)

    --Armurerie lspd :
	PoliceArmurerieBlip = AddBlipForCoord(452.372, -980.519, 30.6896)
	SetBlipSprite(PoliceArmurerieBlip,110)		
	SetBlipColour(PoliceArmurerieBlip, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('ARMURERIE ~r~LSPD')
    EndTextCommandSetBlipName(PoliceArmurerieBlip)
end)

RegisterNetEvent("GTA_Police:RetirerBlipsPoint")
AddEventHandler("GTA_Police:RetirerBlipsPoint", function ()
    --On retire le blip sortie véhicule :
    if PoliceSortieVeh ~= nil and DoesBlipExist(PoliceSortieVeh) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(PoliceSortieVeh))
        PoliceSortieVeh = nil
	end
	
	--On retire le blip garage véhicule :
	if PoliceDeleteVeh ~= nil and DoesBlipExist(PoliceDeleteVeh) then
		Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(PoliceDeleteVeh))
		PoliceDeleteVeh = nil
    end
    
    --On retire le blip Armurerie :
	if PoliceArmurerieBlip ~= nil and DoesBlipExist(PoliceArmurerieBlip) then
		Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(PoliceArmurerieBlip))
		PoliceArmurerieBlip = nil
	end
end)

RegisterNetEvent("GTA_Police:RecevoirArmes")
AddEventHandler("GTA_Police:RecevoirArmes", function(item, qty)
    qty = qty or 1
    TriggerEvent("player:receiveItem", item, qty)
    PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", true)
end)

RegisterNetEvent("GTA_Police:SortirPoliceVeh")
AddEventHandler("GTA_Police:SortirPoliceVeh", function(pVeh)
    local car = GetHashKey(pVeh)
    
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end
    
    local veh = CreateVehicle(car, 405.467, -951.877, -99.0041, 90.89, false, false) --> @thanks to MrDuarte pour les coords.
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleNumberPlateText(veh, "LSPD911")
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
    SetVehicleUndriveable(veh, 1)
end)

RegisterNetEvent("GTA_Police:ValiderVehLSPD")
AddEventHandler("GTA_Police:ValiderVehLSPD", function(pVeh, primaryColor, secondaryColor)
    DoScreenFadeOut(1000)
	Citizen.Wait(2000)
    local car = GetHashKey(pVeh)
    RequestModel(car)

    local waiting = 0
    while not HasModelLoaded(car) do
        waiting = waiting + 100
        Citizen.Wait(100)
        if waiting > 3000 then
            break
        end
    end
    
    isMenuEnableCar = false
    
    local monVeh = CreateVehicle(car, 462.95, -1019.51, 28.1, 90.31, true, false)
    SetVehicleColours(monVeh, tonumber(primaryColor), tonumber(secondaryColor))
    SetEntityAsMissionEntity(monVeh, true, true)
    SetVehicleNumberPlateText(monVeh, "LSPD911")
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), monVeh, -1)
    SetVehicleNitroEnabled(monVeh, true)
    SetVehicleTurboPressure(monVeh, 50)
    
    DisplayHud(true)
    DisplayRadar(true)
    TriggerEvent('EnableDisableHUDFS', true)
    Citizen.Wait(500)
	DoScreenFadeIn(1000)
end)

RegisterNetEvent('GTA_Police:Menotter_Demenotter')
AddEventHandler('GTA_Police:Menotter_Demenotter', function(estMenotter)
    joueurEstMenotter = estMenotter
    local ped = PlayerPedId()
    local homme = GetHashKey("mp_m_freemode_01")
    local femme = GetHashKey("mp_f_freemode_01")


    RequestAnimDict("mp_arresting")
    while not HasAnimDictLoaded("mp_arresting") do
        Citizen.Wait(0)
    end

    if joueurEstMenotter == true then 
        if GetEntityModel(ped) == femme then
            prevFemaleVariation = GetPedDrawableVariation(ped, 7)
            SetPedComponentVariation(ped, 7, 25, 0, 0)
        elseif GetEntityModel(ped) == homme then
            prevMaleVariation = GetPedDrawableVariation(ped, 7)
            SetPedComponentVariation(ped, 7, 41, 0, 0)
        end

        SetEnableHandcuffs(ped, true)
        TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
   else
        ClearPedTasks(ped)
        SetEnableHandcuffs(ped, false)
        UncuffPed(ped)

        if GetEntityModel(ped) == femme then
            SetPedComponentVariation(ped, 7, prevFemaleVariation, 0, 0)
        elseif GetEntityModel(ped) == homme then
            SetPedComponentVariation(ped, 7, prevMaleVariation, 0, 0)
        end
    end
end)

function BeginService()
    local ped = GetPlayerPed(-1)
    if ped ~= -1 then
        TriggerServerEvent("player:serviceOn", "police") --> On lui give le service pour recevoir les appel d'urgence.
        TriggerEvent("GTA_Police:AfficherBlipsPoint")  --> On ajoute les blips

        if Config.Police.grade == "Cadet" then --Cadet
            if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 59, 0, 0) --Gilet Cadet
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 36, 0, 0) --Gilet Cadet
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            end
        elseif Config.Police.grade == "Sergent" then --Sergent
            if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 35, 0, 0)
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            end
        elseif Config.Police.grade == "SergentChef" then --SergentChef
            if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedComponentVariation(ped, 10, 8, 2, 0)--Grade
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 35, 0, 0)
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            end
        elseif Config.Police.grade == "Lieutenant" then --Lieutenant
            if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedComponentVariation(ped, 10, 8, 2, 0)--Grade
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 35, 0, 0)
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            end
        elseif Config.Police.grade == "Capitaine" then --Capitaine
            if GetEntityModel(ped) == 1885233650 then
                SetPedComponentVariation(ped, 3, 30, 0, 0)--Gants
                SetPedComponentVariation(ped, 4, 35, 0, 0)--Jean
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 58, 0, 0)--mattraque
                SetPedComponentVariation(ped, 11, 55, 0, 0)--Veste
                SetPedComponentVariation(ped, 10, 8, 3, 0)--Grade
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 18, 2, 1)--Lunette
            elseif GetEntityModel(ped) == -1667301416 then
                SetPedComponentVariation(ped, 4, 34, 0, 0)--Pantalon
                SetPedComponentVariation(ped, 6, 24, 0, 0)--Chaussure
                SetPedComponentVariation(ped, 8, 35, 0, 0)
                SetPedComponentVariation(ped, 11, 48, 0, 0)--Veste
                SetPedPropIndex(ped, 2, 2, 0, 1)--Oreillete
                SetPedPropIndex(ped, 6, 3, 0, 1)--Montre
                SetPedPropIndex(ped, 1, 7, 0, 1)--Lunette
            end
        end
        exports.nCoreGTA:ShowNotification("~h~Prise de ~g~service.")
    end
end

function EndService()
    TriggerServerEvent("player:serviceOff", "police") --> On lui retire le service pour  ne plus recevoir les appel d'urgence.
    TriggerEvent("GTA_Police:RetirerBlipsPoint") --> On retire les blips 
    TriggerServerEvent("GTA:LoadVetement")
    exports.nCoreGTA:ShowNotification("~h~Fin de ~r~service.")
end

function SaveInfoCar(carSelected, veh, primaryColor, secondaryColor)
    DestroyMyCar(veh)
    TriggerEvent("GTA_Police:ValiderVehLSPD", carSelected, tonumber(primaryColor), tonumber(secondaryColor))
end

function DestroyMyCar(veh)
    SetEntityAsMissionEntity(veh, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
end

--> Core des gestion des zones LSPD :
Citizen.CreateThread(function()
    while true do
        DureeZone = 250

        if Config.Police.job ~= "LSPD" then
            return
        end

        if IsNearOfZones() then
            DureeZone = 0

            if GetLastInputMethod(0) then
                Ninja_Core__DisplayHelpAlert("~r~LSPD ~w~ ~INPUT_PICKUP~ pour ~b~intéragir")
            else
                Ninja_Core__DisplayHelpAlert("~r~LSPD ~w~ ~INPUT_CELLPHONE_EXTRA_OPTION~ pour ~b~intéragir")
            end
        end

        if GetNearZone() == "ServiceMenu" then 
             if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                TriggerServerEvent("GTA:LoadJobsJoueur")
                Wait(250)
                RageUI.Visible(vestiareMenu, not RageUI.Visible(vestiareMenu))
            end
        elseif GetNearZone() == "GarageMenu" then 
             if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then 
                isMenuEnableCar = true
                DoScreenFadeOut(1000)
                Citizen.Wait(1000)
                
                DisplayHud(false)
                DisplayRadar(false)
            	TriggerEvent('EnableDisableHUDFS', false)
                TriggerEvent("GTA_Police:SortirPoliceVeh", "police")
                RageUI.Visible(GarageMenu, not RageUI.Visible(GarageMenu))
                
                Citizen.Wait(500)
                DoScreenFadeIn(1000)
                Visible()
            end
        elseif GetNearZone() == "GarageRentrer" then 
             if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                local veh = GetVehiclePedIsIn(GetPlayerPed(-1)) 
                SetEntityAsMissionEntity(veh, true, true)
                Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
            end
        elseif GetNearZone() == "ArmurerieMenu" then 
             if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                RageUI.Visible(ArmurerieMenu, not RageUI.Visible(ArmurerieMenu))
            end
        elseif GetNearGarageMenu() == "GarageMenuPos" then 
            DureeZone = 0
            DisableControlAction(0, 75, true)
            DisableControlAction(0, 23, true)
            
            if (IsControlJustReleased(0, 177) or IsControlJustReleased(0, 214)) then
                isMenuEnableCar = false
                local veh = GetVehiclePedIsIn(GetPlayerPed(-1)) 
                SetEntityAsMissionEntity(veh, true, true)
                Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
                Wait(150)
                SetEntityCoords(GetPlayerPed(-1), 459.21, -1008.07, 28.26)
                RageUI.CloseAll(true)
            end
        end

       Citizen.Wait(DureeZone)
   end
end)

---> Core du menu Action LSPD :
Citizen.CreateThread(function()
    while true do
        if RageUI.Visible(vestiareMenu) or RageUI.Visible(ArmurerieMenu) or RageUI.Visible(GarageMenu) or RageUI.Visible(MenuAction) == true then
            waitMenuPoliceOpen = 0
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172,true) --> DESACTIVE CONTROLL HAUT  
	else
	    waitMenuPoliceOpen = 1000
        end
       Citizen.Wait(waitMenuPoliceOpen)
   end
end)

Citizen.CreateThread(function()
    while true do
        if joueurEstMenotter == true then
	    waitMenotte = 0
            DisableControlAction(0, 69, true) -- INPUT_VEH_ATTACK
            DisableControlAction(0, 92, true) -- INPUT_VEH_PASSENGER_ATTACK
            DisableControlAction(0, 114, true) -- INPUT_VEH_FLY_ATTACK
            DisableControlAction(0, 140, true) -- INPUT_MELEE_ATTACK_LIGHT
            DisableControlAction(0, 141, true) -- INPUT_MELEE_ATTACK_HEAVY
            DisableControlAction(0, 142, true) -- INPUT_MELEE_ATTACK_ALTERNATE
            DisableControlAction(0, 257, true) -- INPUT_ATTACK2
            DisableControlAction(0, 263, true) -- INPUT_MELEE_ATTACK1
            DisableControlAction(0, 264, true) -- INPUT_MELEE_ATTACK2
            DisableControlAction(0, 24, true) -- INPUT_ATTACK
            DisableControlAction(0, 25, true) -- INPUT_AIM
            DisableControlAction(0, 23, true)
            DisableControlAction(0, 75,  true) -- Leave Vehicle
        else
	    waitMenotte = 1000
        end

       Citizen.Wait(waitMenotte)
   end
end)

RegisterCommand('+menupolice', function()
    if Config.Police.job ~= "LSPD" then
    	TriggerServerEvent("GTA:LoadJobsJoueur")
        Wait(250)
        RageUI.Visible(MenuAction, not RageUI.Visible(MenuAction))	
    end
end, false)

RegisterCommand('-menupolice', function() end, false)
RegisterKeyMapping('+menupolice', 'Menu Police', 'keyboard', 'F6')

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        local ped = PlayerPedId()
        local IsCuffed = IsPedCuffed(ped) 
        if IsCuffed and not IsEntityPlayingAnim(PlayerPedId(), "mp_arresting", "idle", 3) then
            Citizen.Wait(500)
            TaskPlayAnim(ped, "mp_arresting", "idle", 8.0, -8, -1, 49, 0, 0, 0, 0)
        end
    end
end)

--> Retire les collision entre joueurs instance garage : 
function Collision()
	for _, player in ipairs(GetActivePlayers()) do
		SetEntityVisible(GetPlayerPed(player), false, false)
		SetEntityVisible(PlayerPedId(), true, true)
		SetEntityNoCollisionEntity(GetPlayerPed(player), GetPlayerPed(-1), false)
    end
end

function Visible()
    while isMenuEnableCar == true do
        Citizen.Wait(0)
        Collision()
    end
end

Citizen.CreateThread(function()
    blip = AddBlipForCoord(459.21, -1008.07, 28.26)

    SetBlipSprite(blip, 60)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 63)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("POSTE DE POLICE")
    EndTextCommandSetBlipName(blip)

    for i = 1, 12 do
        Citizen.InvokeNative(0xDC0F817884CDD856, i, false)
    end
end)

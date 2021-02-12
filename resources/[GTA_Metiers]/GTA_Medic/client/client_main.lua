--SuperCoolNinja && RamexDeltaXOO
DureeZone = 0
waitMenuMedicOpen = 1000
waitMenotte = 1000
local isMenuEnableCar = false
local prevMaleVariation = 0
local prevFemaleVariation = 0


--> TODO : 
--[[
    4. = COMMENCER LE MENU ACTION.
]]

RegisterNetEvent("GTA_Medic:AfficherBlipsPoint")
AddEventHandler('GTA_Medic:AfficherBlipsPoint', function ()
    --Sortie des veh :
    MedicSortieVeh = AddBlipForCoord(459.21, -1008.07, 28.26)
    SetBlipSprite(MedicSortieVeh,225)		
    SetBlipColour(MedicSortieVeh, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('GARAGE VEHICULE ~r~MEDIC')
	EndTextCommandSetBlipName(MedicSortieVeh)
	
	--Rentrer veh :
	MedicDeleteVeh = AddBlipForCoord(451.999, -997.16, 25.7613)
	SetBlipSprite(MedicDeleteVeh,225)		
	SetBlipColour(MedicDeleteVeh, 1)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('RANGER VEHICULE ~r~MEDIC')
    EndTextCommandSetBlipName(MedicDeleteVeh)
end)

RegisterNetEvent("GTA_Medic:RetirerBlipsPoint")
AddEventHandler("GTA_Medic:RetirerBlipsPoint", function ()
    --On retire le blip sortie véhicule :
    if MedicSortieVeh ~= nil and DoesBlipExist(MedicSortieVeh) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MedicSortieVeh))
        MedicSortieVeh = nil
	end
	
	--On retire le blip garage véhicule :
	if MedicDeleteVeh ~= nil and DoesBlipExist(MedicDeleteVeh) then
		Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MedicDeleteVeh))
		MedicDeleteVeh = nil
    end
end)

RegisterNetEvent("GTA_Medic:SortirMedicVeh")
AddEventHandler("GTA_Medic:SortirMedicVeh", function(pVeh)
    local car = GetHashKey(pVeh)
    
    RequestModel(car)
    while not HasModelLoaded(car) do
        Citizen.Wait(0)
    end
    
    local veh = CreateVehicle(car, 405.467, -951.877, -99.0041, 90.89, false, false) --> @thanks to MrDuarte pour les coords.
    SetEntityAsMissionEntity(veh, true, true)
    SetVehicleNumberPlateText(veh, "MEDIC911")
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), veh, -1)
    SetVehicleUndriveable(veh, 1)
end)

RegisterNetEvent("GTA_Medic:ValiderVehMEDIC")
AddEventHandler("GTA_Medic:ValiderVehMEDIC", function(pVeh, primaryColor, secondaryColor)
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
    SetVehicleNumberPlateText(monVeh, "MEDIC911")
    TaskWarpPedIntoVehicle(GetPlayerPed(-1), monVeh, -1)
    SetVehicleNitroEnabled(monVeh, true)
    SetVehicleTurboPressure(monVeh, 50)
    
    DisplayHud(true)
    DisplayRadar(true)
    TriggerEvent('EnableDisableHUDFS', true)
    Citizen.Wait(500)
	DoScreenFadeIn(1000)
end)

function BeginService()
    local ped = GetPlayerPed(-1)
    if ped ~= -1 then
        TriggerServerEvent("player:serviceOn", "medic") --> On lui give le service pour recevoir les appel d'urgence.
        TriggerEvent("GTA_Medic:AfficherBlipsPoint")  --> On ajoute les blips

        if Config.Medic.grade == "Aide Soignant" then --Cadet
            if GetEntityModel(ped) == 1885233650 then
                --Component ped soon
            elseif GetEntityModel(ped) == -1667301416 then
                --Component ped soon
            end
        elseif Config.Medic.grade == "Infirmier" then --Sergent
            if GetEntityModel(ped) == 1885233650 then
                --Component ped soon
            elseif GetEntityModel(ped) == -1667301416 then
                --Component ped soon
            end
        elseif Config.Medic.grade == "Medecin" then --SergentChef
            if GetEntityModel(ped) == 1885233650 then
                --Component ped soon
            elseif GetEntityModel(ped) == -1667301416 then
                --Component ped soon
            end
        elseif Config.Medic.grade == "Chirurgien" then --Lieutenant
            if GetEntityModel(ped) == 1885233650 then
                --Component ped soon
            elseif GetEntityModel(ped) == -1667301416 then
                --Component ped soon
            end
        end
        exports.nCoreGTA:ShowNotification("~h~Prise de ~g~service.")
    end
end

function EndService()
    TriggerServerEvent("player:serviceOff", "medic") --> On lui retire le service pour  ne plus recevoir les appel d'urgence.
    TriggerEvent("GTA_Medic:RetirerBlipsPoint") --> On retire les blips 
    TriggerServerEvent("GTA:LoadVetement")
    exports.nCoreGTA:ShowNotification("~h~Fin de ~r~service.")
end

function SaveInfoCar(carSelected, veh, primaryColor, secondaryColor)
    DestroyMyCar(veh)
    TriggerEvent("GTA_Medic:ValiderVehMEDIC", carSelected, tonumber(primaryColor), tonumber(secondaryColor))
end

function DestroyMyCar(veh)
    SetEntityAsMissionEntity(veh, true, true)
    Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
end

--> Core des gestion des zones MEDIC :
Citizen.CreateThread(function()
    while true do
        DureeZone = 250

        if Config.Medic.job ~= "MEDIC" then
            return
        end

        if IsNearOfZones() then
            DureeZone = 0

            if GetLastInputMethod(0) then
                Ninja_Core__DisplayHelpAlert("~r~EMS ~w~ ~INPUT_PICKUP~ pour ~b~intéragir")
            else
                Ninja_Core__DisplayHelpAlert("~r~EMS ~w~ ~INPUT_CELLPHONE_EXTRA_OPTION~ pour ~b~intéragir")
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
                TriggerEvent("GTA_Medic:SortirMedicVeh", "medic")
                RageUI.Visible(GarageMenu, not RageUI.Visible(GarageMenu))
                
                Citizen.Wait(500)
                DoScreenFadeIn(1000)
            end
        elseif GetNearZone() == "GarageRentrer" then 
             if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                local veh = GetVehiclePedIsIn(GetPlayerPed(-1)) 
                SetEntityAsMissionEntity(veh, true, true)
                Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
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

---> Core du menu Action MEDIC :
Citizen.CreateThread(function()
    while true do
        if RageUI.Visible(vestiareMenu) or RageUI.Visible(GarageMenu) or RageUI.Visible(MenuAction) == true then
            waitMenuMedicOpen = 0
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172,true) --> DESACTIVE CONTROLL HAUT  
	      else
	          waitMenuMedicOpen = 1000
        end
       Citizen.Wait(waitMenuMedicOpen)
   end
end)

RegisterCommand('+menumedic', function()
    if Config.Medic.job ~= "MEDIC" then
    	TriggerServerEvent("GTA:LoadJobsJoueur")
        Wait(250)
        RageUI.Visible(MenuAction, not RageUI.Visible(MenuAction))	
    end
end, false)

RegisterCommand('-menumedic', function() end, false)
RegisterKeyMapping('+menumedic', 'Menu Medic', 'keyboard', 'F6')

Citizen.CreateThread(function()
    blip = AddBlipForCoord(459.21, -1008.07, 28.26)

    SetBlipSprite(blip, 61)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 0.9)
    SetBlipColour(blip, 2)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("Hopital")
    EndTextCommandSetBlipName(blip)
end)

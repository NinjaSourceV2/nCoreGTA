local CARITEMS = {}
local PLAYTEMS = {}
local TimerOpti = 1000


function getPods()
    local pods = 0
    for _, v in pairs(CARITEMS) do
        pods = pods + v.quantity
    end
    return pods
end

RoundNumber = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end

--> [Event gérer par le core.]
RegisterNetEvent("GTA_Coffre:Client-UpdateNewData")
AddEventHandler("GTA_Coffre:Client-UpdateNewData", function(vehicleClass, items)
    vehicleClass = vehicleClass or 0
    if items then
        CARITEMS = items
    else
        CARITEMS = {}
    end

    mainMenuCoffre = RageUI.CreateMenu("Coffre", "" ..(getPods()) .. "/" .. tonumber(Config.maxCapacity[vehicleClass].size).. " emplacement")
    deposerMenu = RageUI.CreateSubMenu(mainMenuCoffre, "Déposer", "" ..(getPods()) .. "/" .. tonumber(Config.maxCapacity[vehicleClass].size).. " emplacement")
    RageUI.Visible(mainMenuCoffre, true)
end)

RegisterNetEvent("GTA_Coffre:GetPlayerInventory")
AddEventHandler("GTA_Coffre:GetPlayerInventory", function(items)
    if items then
        PLAYTEMS = items
    else
        PLAYTEMS = {}
    end
end)

--> Coffre menu :
function OnMenuCoffreVeh() 
    RageUI.IsVisible(mainMenuCoffre, function()
        RageUI.Button("Déposer", "", {}, true, {onSelected = function() TriggerServerEvent("GTA-Coffre:OnRefreshPlayerData") end}, deposerMenu)
        
        for k, v in pairs(CARITEMS) do 
            local arg = {v.item_id, v.item_name, v.quantity }
            if (v.quantity > 0) then
                RageUI.Button("~b~"..v.item_name.. " ~g~" .. RoundNumber(v.quantity), "", {}, true, {onSelected = function()
                    RemoveItem(arg)
                    RageUI.CloseAll(true)
                end})
            end
        end
    end, function()end)
end

--> Player Inventaire :
function OnMenuPlayerInventaire() 
    RageUI.IsVisible(deposerMenu, function()
        for _, v in pairs(PLAYTEMS) do 
            local arg = {v.itemId, v.item, v.count }
            if (v.count > 0) then
                RageUI.Button("~b~"..v.label.. " ~g~" .. RoundNumber(v.count), "", {}, true, {onSelected = function()
                    AddItem(arg)
                    RageUI.CloseAll(true)
                end})
            end
        end
    end, function()end)
end


function RemoveItem(arg)
    local id = arg[1]
    local lib = arg[2]
    local qtymax = arg[3]
    local foundVehicle, vehicle = GetVehicleInRage()
    if foundVehicle then
        local qty = DisplayInput()
        if (type(qty) ~= "number") then
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning"})
            return false
        end
        if tonumber(qty) <= tonumber(qtymax) and tonumber(qty) > -1 then
            TriggerServerEvent("GTA_Coffre:looseItem", GetVehicleNumberPlateText(vehicle), id, lib, tonumber(qty))
        else
            TriggerEvent("NUI-Notification", {"Il n'y a pas autant de " .. lib .. " dans votre inventaire", "warning"})
        end
    end
end

function AddItem(arg)
    local id = arg[1]
    local lib = arg[2]
    local qtymax = arg[3]
    local foundVehicle, vehicle = GetVehicleInRage()
    if foundVehicle then
        local qty = DisplayInput()
        if (type(qty) ~= "number") then
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning"})
            return false
        end
        if tonumber(qty) <= tonumber(qtymax) and tonumber(qty) > -1 then
            TriggerServerEvent("GTA-Coffre:ReceiveItem", GetVehicleClass(vehicle), GetVehicleNumberPlateText(vehicle), id, lib, tonumber(qty))
        else
            TriggerEvent("NUI-Notification", {"Il n'y a pas autant de " .. lib .. " dans le coffre", "warning"})
        end
    end
end


function GetVehicleInRage()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local forward = GetOffsetFromEntityInWorldCoords(ped, 0.0, 3.0, 0.0)
    local shapeTestHandle = StartExpensiveSynchronousShapeTestLosProbe(coords, forward, -1, ped, 4)
    local retval ,hit, endCoords, surfaceNormal, entityHit = GetShapeTestResult(shapeTestHandle)

    return entityHit > 0 and GetEntityType(entityHit) == 2, entityHit
end


function DisplayInput()
    DisplayOnscreenKeyboard(1, "FMMC_MPM_TYP8", "", "", "", "", "", 30)
    while UpdateOnscreenKeyboard() == 0 do
        DisableAllControlActions(0)
        Wait(1)
    end
    if GetOnscreenKeyboardResult() then
        return tonumber(GetOnscreenKeyboardResult())
    end
end


Citizen.CreateThread(function()
	while (true) do
        TimerOpti = 1000
        OnMenuCoffreVeh()
        OnMenuPlayerInventaire()


        local foundVehicle, vehicle = GetVehicleInRage()


        if foundVehicle then
            TimerOpti = 0
            if GetLastInputMethod(0) then
                TriggerEvent("GTA-Notification:InfoInteraction", "~INPUT_PICKUP~ pour ouvrir le coffre.")
            else
                TriggerEvent("GTA-Notification:InfoInteraction", "~INPUT_CELLPHONE_EXTRA_OPTION~ pour ouvrir le coffre.")
            end

            if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then --> E
                SetVehicleDoorOpen(vehicle, 5, false, false)
                TriggerServerEvent("GTA-Coffre:OnRefresh", GetVehicleClass(vehicle), GetVehicleNumberPlateText(vehicle))
            end
        end

        if RageUI.Visible(mainMenuCoffre) == true then 
            TimerOpti = 0
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
        end
        Citizen.Wait(TimerOpti)
    end
end)

--> Executer une fois la ressource restart : 
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
	end

    TriggerServerEvent("GTA-Coffre:OnCheckVehOwned")
end)

--> Executer une fois la ressource start : 
AddEventHandler('onClientResourceStart', function (resourceName)
    if(GetCurrentResourceName() ~= resourceName) then
      return
    end
    TriggerServerEvent("GTA-Coffre:OnCheckVehOwned")
end)
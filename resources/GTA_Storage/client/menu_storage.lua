local TimerOpti = 1000
local GLOBAL_COORDS = vector3(0, 0, 0)
local StorageData, StorageUnique, Storage, PlayerInventaire = {}, {}, {}, {}
local mainMenuList = RageUI.CreateMenu("", "Liste de coffres proche de vous.")
local mainMenuStorage = RageUI.CreateMenu("", "Contenant du coffre")
local deposerMenu = RageUI.CreateSubMenu(mainMenuStorage, "Déposer", "Item de votre inventaire à déposer :")
local getSecureCode = 0

--> Permet de refresh les data des coffres : 
RegisterNetEvent("GTA_Storage:ClientResfreshStorageData")
AddEventHandler("GTA_Storage:ClientResfreshStorageData", function(newData)
    table.insert(Storage, newData)
end)

--> Permet de refresh les data de l'inventaire de votre perso : 
RegisterNetEvent("GTA_Storage:GetPlayerInventory")
AddEventHandler("GTA_Storage:GetPlayerInventory", function(items, last_unique_id)
    if items then
        PlayerInventaire = items
    else
        PlayerInventaire = {}
    end
end)

--> Ouvre le menu du coffre séléctionner avec les nouvel donnée : 
RegisterNetEvent("GTA_Storage:ClientOpenMenuCoffreStorage")
AddEventHandler("GTA_Storage:ClientOpenMenuCoffreStorage", function(data, storage)
    --> On vide le cache de la table pour éviter des duplication :     
    for k in pairs(StorageData) do 
        StorageData[k] = nil
    end

    --> On insert les nouvel donnée :     
    table.insert(StorageData, data)
    StorageUnique = storage

    --> On ouvre le menu du coffre séléctionner :     
    RageUI.Visible(mainMenuStorage, true)
end)

--> Coffre list menu :
function OnMenuListCoffre() 
    RageUI.IsVisible(mainMenuList, function()
        for i, j in pairs(Storage) do
            local distance = #(vector3(j.pos.x, j.pos.y, j.pos.z) - GLOBAL_COORDS)
            if distance <= 2.0 then
                RageUI.Button(j.coffreName, "", {}, true, {onSelected = function()
                    local secureCode = GetInputNumber("Code de sécurité")
                    if tonumber(secureCode) ~= j.code then
                        TriggerEvent("NUI-Notification", {"Le code saisit est incorrect.", "warning"})
                        return
                    end
                    TriggerServerEvent("GTA_Storage:LoadStorageData_By_UniqueID", j.id_unique)
                    RageUI.CloseAll()
                    RageUI.Visible(mainMenuStorage, true)
                end,
            
                onActive = function()
                    DrawMarker(0, j.pos.x, j.pos.y, j.pos.z + 0.5, 0, 0, 0, 0, 0, 0, 0.1, 0.1, 0.1, 255, 255, 255, 200, 0, 0, 0, 0)
                end})
            end
        end
    end, function()end)
end

--> Coffre menu unique :
function OnMenuCoffre() 
    RageUI.IsVisible(mainMenuStorage, function()
        for k in pairs(StorageData) do
            RageUI.Button("Déposer", "Coffre avec maximum : "..maxCapacity[StorageData[k].model_entity].size .." slots.", {}, true, {onSelected = function() 
                TriggerServerEvent("GTA_Storage:OnPlayerDataInventaire", StorageData[k].id_unique)
            end}, deposerMenu)
        end

        if StorageUnique then
            for _,j in pairs(StorageUnique) do
                for i in pairs(StorageData) do
                    local arg = {j.item_id, j.item_name, j.quantity, StorageData[i].id_unique}
                    if (j.quantity > 0) then
                        RageUI.Button("~b~"..j.item_name.. " ~g~" .. RoundNumber(j.quantity), "" ..(getPods()) .. "/" .. tonumber(maxCapacity[StorageData[i].model_entity].size).. " emplacement", {}, true, {onSelected = function()
                            RemoveItem(arg)
                            RageUI.CloseAll(true)
                        end})
                    end
                end
            end
        end
    end, function()end)
end


--> Player Inventaire :
function OnMenuPlayerInventaire() 
    RageUI.IsVisible(deposerMenu, function()
        for _, v in pairs(PlayerInventaire) do 
            for _,j in pairs(StorageData) do
                local arg = {v.itemId, v.item, v.count, j.id_unique, j.model_entity}
                if (v.count > 0) then
                    RageUI.Button("~b~"..v.label.. " ~g~" .. RoundNumber(v.count), "", {}, true, {onSelected = function()
                        AddItem(arg)
                        RageUI.CloseAll(true)
                    end})
                end
            end
        end
    end, function()end)
end


function RemoveItem(arg)
    local id = arg[1]
    local lib = arg[2]
    local qtymax = arg[3]
    local id_unique = arg[4]
    local qty = GetInputNumber("Montant à récupérer")

    if (type(qty) ~= "number") then
        TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning"})
        return false
    end
    
    if tonumber(qty) <= tonumber(qtymax) and tonumber(qty) > -1 then
        TriggerServerEvent("GTA_Storage:looseItem", id_unique, id, lib, tonumber(qty))
    else
        TriggerEvent("NUI-Notification", {"Il n'y a pas autant de " .. lib .. " dans votre inventaire", "warning"})
    end
end

function AddItem(arg)
    local id = arg[1]
    local lib = arg[2]
    local qtymax = arg[3]
    local id_unique = arg[4]
    local model_entity = arg[5]
    local qty = GetInputNumber("Montant à déposer")

    if (type(qty) ~= "number") then
        TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning"})
        return false
    end

    if tonumber(qty) <= tonumber(qtymax) and tonumber(qty) > -1 then
        TriggerServerEvent("GTA_Storage:ReceiveItem", id_unique, id, lib, tonumber(qty), model_entity)
    else
        TriggerEvent("NUI-Notification", {"Il n'y a pas autant de " .. lib .. " dans le coffre", "warning"})
    end
end

function IsNearCoffre()
	local hit, coords, entity = RayCastGamePlayCamera(1000.0)
    if hit == 1 and GetEntityType(entity) ~= 0 and IsEntityAnObject(entity) then
	    for _,v in pairs(CoffreTypeHash) do
            if v == GetEntityModel(entity) then
                local objCoords = GetEntityCoords(entity)
                if entity ~= 0 then
                    local dist = #(GLOBAL_COORDS - objCoords)
                    
                    if dist <= 3.0 then
                        TimerOpti = 0 
                        
                        Visual.FloatingHelpText("~INPUT_PICKUP~ pour ouvrir le coffre.")

                        if IsControlJustReleased(0, 38) then --> E
                            RageUI.Visible(mainMenuList, true)
                            break
                        end
                    end
                end
            end
	    end
	end
end

function getPods()
    local pods = 0
    for _, v in pairs(StorageUnique) do
        pods = pods + v.quantity
    end
    return pods
end

Citizen.CreateThread(function()
	while (true) do
        TimerOpti = 1000

        IsNearCoffre()
        OnMenuCoffre()
        OnMenuListCoffre()
        OnMenuPlayerInventaire()

		local playerPed = GetPlayerPed(-1)
		GLOBAL_COORDS = GetEntityCoords(playerPed)

        if RageUI.Visible(mainMenuStorage) or RageUI.Visible(mainMenuList) or RageUI.Visible(deposerMenu) == true then
            TimerOpti = 0
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172, true) --> DESACTIVE CONTROLL HAUT  
        end

        Citizen.Wait(TimerOpti)
    end
end)

AddEventHandler('playerSpawned', function()
	TriggerServerEvent("GTA-Storage:Init")
end)

--> Executer une fois la ressource restart : 
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
	end

    TriggerServerEvent("GTA-Storage:Init")
end)
local CARS = {}

function IndexSearch(plate)
    for key in pairs(CARS) do
        if (key == plate) then
            return true
        end
    end
    return false
end

function getSlots(plate)
    local pods = 0
    if (IndexSearch(plate)) then
        for _, v in pairs(CARS[plate]) do
            pods = pods + v.quantity
        end
    end
    return pods
end

--[=====[
        C'est ici que l'on gére la suppresion des coffres sur les véhicule moldu + Initialisation des plaques : 
]=====]
RegisterServerEvent('GTA-Coffre:OnCheckVehOwned')
AddEventHandler('GTA-Coffre:OnCheckVehOwned', function()
    MySQL.Sync.execute("DELETE FROM `vehicle_inventory` WHERE owned = 0", {})

    Wait(150)

    MySQL.Async.fetchAll("SELECT * FROM vehicle_inventory", {}, function(result)
        if (result) then
            for _, v in pairs(result) do
                if (not IndexSearch(v.plate)) then
                    CARS[v.plate] = {}
                end
                CARS[v.plate][v.item_id] = {item_id = v.item_id, item_name = v.item_name, quantity = v.quantity}
                --print("NEW TABLE CREATED :", CARS[v.plate][v.item_id])
            end
        end
    end)
end)

--[=====[
        C'est ici que l'on recupère les data du coffre : 
]=====]
RegisterServerEvent('GTA-Coffre:OnRefresh')  --> cette event sert uniquement a créer votre perso.
AddEventHandler('GTA-Coffre:OnRefresh', function(vehicleClass, plate)
	local source = source
    local res = nil

    if CARS[plate] then --> si la plaque est enregistrer alors on affiche les donnée de celle ci.
        res = CARS[plate]
    end

   TriggerClientEvent("GTA_Coffre:Client-UpdateNewData", source, vehicleClass, res)
end)

--[=====[
        C'est ici que l'on recupère les data de l'inventaire du player : 
]=====]
RegisterServerEvent('GTA-Coffre:OnRefreshPlayerData')
AddEventHandler('GTA-Coffre:OnRefreshPlayerData', function()
	local source = source

    TriggerEvent('GTA_Inventaire:GetPlayerInventaire', source, function(data)
        TriggerClientEvent("GTA_Coffre:GetPlayerInventory", source, data)
    end)
end)

--[=====[
        C'est ici que l'on gére la récéption ou update des items des coffres : 
]=====]
RegisterServerEvent('GTA-Coffre:ReceiveItem')
AddEventHandler('GTA-Coffre:ReceiveItem', function(vehicleClass, plate, id, name, nb)
	local source = source
    local license = GetPlayerIdentifiers(source)[1]
    local weight = getSlots(plate)
    local limitslots = weight + nb
    local isOwner = 0
    local query
    local item

    if (limitslots <= Config.maxCapacity[vehicleClass].size) then
        TriggerEvent("GTA_Inventaire:GetItemQty", source, name, function(qty, itemid)
            if (qty > 0) then
                --> Check data proprietaire du véhicule :
                MySQL.Async.fetchAll("SELECT proprietaire FROM gta_joueurs_vehicle WHERE vehicle_plate = @vehicle_plate and identifier = @identifier", {['@vehicle_plate'] = plate, ['@identifier'] = license}, function(res)
                    if (res[1] ~= nil) then
                        if (res[1].proprietaire == "Volé") then 
                            isOwner = 0
                        else
                            isOwner = 1
                        end
                    else
                        isOwner = 0
                    end
                end)

                Wait(50)

                --> Si la plaque n'est pas enregistrer alors on créer une nouvel table contenant cette plaque :
                if not IndexSearch(plate) then
                    CARS[plate] = {}
                end

                --> Check Si la table à déjà un index contenant l'id de l'item alors on update seulement celle ci sinon on en créer une nouvel :
                if CARS[plate][id] then 
                    item = CARS[plate][id]
                    item.quantity = item.quantity + nb
                    query = "UPDATE vehicle_inventory SET `quantity` = @qty WHERE `plate` = @plate AND `item_name` = @item_name"
                else
                    CARS[plate][id] = {item_id = id, item_name = name, quantity = nb}
                    item = CARS[plate][id] 
                    query = "INSERT INTO vehicle_inventory (`quantity`,`plate`,`item_name`,`item_id`, `owned`) VALUES (@qty,@plate,@item_name,@itemid,@owned)"
                end
                
                --> plus tard a modifier pour de l'optimisation (pas important): 
                MySQL.Async.execute(query, { ['@plate'] = plate, ['@qty'] = item.quantity, ['@item_name'] = name, ['@itemid'] = id, ['@owned'] = isOwner })
                
                TriggerClientEvent("GTA_Inventaire:RetirerItem", source, name, nb)
            else
                TriggerClientEvent("NUI-Notification", source, {"Vous n'avez pas de " ..name .." sur vous."})
            end

            TriggerClientEvent("NUI-Notification", source, {"Vous avez déposer x"..nb .." " ..name})
        end)
    else
        if nb > Config.maxCapacity[vehicleClass].size then
            TriggerClientEvent("NUI-Notification", source, {"Ce vehicule ne peut contenir que " .. Config.maxCapacity[vehicleClass].size .. " item"})
        elseif weight >= Config.maxCapacity[vehicleClass].size then
            TriggerClientEvent("NUI-Notification", source, {"Le coffre de ce véhicule est plein !"})
        elseif limitslots > Config.maxCapacity[vehicleClass].size then
            TriggerClientEvent("NUI-Notification", source, {"Il n'y a plus assez de place !'"})
        end
    end
end)



RegisterServerEvent("GTA_Coffre:looseItem")
AddEventHandler("GTA_Coffre:looseItem", function(plate, id, item, quantity)
    local source = source
    CARS[plate][id].quantity = CARS[plate][id].quantity - quantity

    --> plus tard a modifier pour de l'optimisation (pas important): 
    MySQL.Async.execute("UPDATE vehicle_inventory SET `quantity` = @qty WHERE `plate` = @plate AND `item_name` = @item",
        { ['@plate'] = plate, ['@qty'] = CARS[plate][id].quantity, ['@item'] = item })
        
    TriggerClientEvent("GTA_Inventaire:AjouterItem", source, item, quantity)
end)
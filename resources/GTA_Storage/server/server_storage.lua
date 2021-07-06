local CoffreStorage = {}

--> Permet de vérifier si le coffre existe ou non :
function IndexSearch(id_unique)
    for key in pairs(CoffreStorage) do
        if (key == id_unique) then
            return true
        end
    end
    return false
end


--> Permet de vérifier le nombre de place que contient votre coffre :
function getSlots(id_unique)
    local pods = 0
    if CoffreStorage[id_unique].storage then
        if (IndexSearch(id_unique)) then
            for _, v in pairs(CoffreStorage[id_unique].storage) do
                pods = pods + v.quantity
            end
        end
    end
    return pods
end


--> Permet de vérifier si l'item est déjà présent dans le coffre :
function DoesItemExist(id_unique, item)
    if CoffreStorage[id_unique].storage then
        for _,v in pairs(CoffreStorage[id_unique].storage) do
            if v.item_name == item then
                return true, v.item_id
            end
        end
    end
    return false
end


--[=====[
        C'est ici que l'on gére la création des coffres : 
]=====]
RegisterNetEvent("GTA_Prop:SaveDataObject")
AddEventHandler("GTA_Prop:SaveDataObject", function(coffreNom, modelEntity, coffreID, model, spawnCoords, posVertical, posHorizontal, secureCode)
    local source = source

    CoffreStorage[coffreID] = {coffreName = coffreNom, model_entity = modelEntity, id_unique = coffreID, model = model, pos = spawnCoords, posY = posVertical, posHeading = posHorizontal, code = secureCode}
    CoffreStorage[coffreID].storage = {}

    local encodeData = json.encode(CoffreStorage[coffreID])
    local encodeDataStorage = json.encode(CoffreStorage[coffreID].storage)

    MySQL.Async.execute("INSERT gta_coffres SET dataCoffre = @dataCoffre, dataStorage = @dataStorage, id_unique = @id_unique", { ['@dataCoffre'] = encodeData, ['@dataStorage'] = encodeDataStorage, ['@id_unique'] = coffreID})

    TriggerClientEvent("GTA_Props:SpawnObjectClientSync", -1, encodeData)
    TriggerClientEvent("GTA_Storage:ClientResfreshStorageData", source, CoffreStorage[coffreID])
end)


--[=====[
        C'est ici que l'on gére l'Initialisation des coffres créer : 
]=====]
RegisterServerEvent('GTA-Storage:Init')
AddEventHandler('GTA-Storage:Init', function()
    local source = source
    local tempTableData = {}

    for k in pairs(tempTableData) do 
        tempTableData[k] = nil
    end

    MySQL.Async.fetchAll("SELECT id_unique, dataCoffre FROM gta_coffres", {}, function(result)
        if (result) then
            for _, v in pairs(result) do
                local data_Coffre = json.decode(v.dataCoffre)
                
                table.insert(tempTableData, data_Coffre)

                CoffreStorage[v.id_unique] = {}

                for _, j in pairs(tempTableData) do
                    CoffreStorage[v.id_unique] = {coffreName = j["coffreName"], model_entity = j["model_entity"], id_unique = j["id_unique"], model = j["model"], pos = j["pos"], posY = j["posY"], posHeading = j["posHeading"], code = j["code"]}
                end

                TriggerClientEvent("GTA_Props:InitObject", source, data_Coffre)
                TriggerClientEvent("GTA_Storage:ClientResfreshStorageData", source, CoffreStorage[v.id_unique])

                CoffreStorage[v.id_unique].storage = {}
            end
        end
    end)
end)


--[=====[
        C'est ici que l'on gére l'Initialisation du coffre séléctionner : 
]=====]
RegisterNetEvent("GTA_Storage:LoadStorageData_By_UniqueID")
AddEventHandler("GTA_Storage:LoadStorageData_By_UniqueID", function(unique_id) 
    local source = source
    local tempTableStorage = {}
    local dataStorage = nil 

    for i in pairs(tempTableStorage) do 
        tempTableStorage[i] = nil
    end

    MySQL.Async.fetchAll("SELECT dataStorage FROM gta_coffres WHERE id_unique = @id_unique", {['@id_unique'] = unique_id}, function(result)
        if (result) then
            for _, v in pairs(result) do
                dataStorage =  json.decode(v.dataStorage)
                table.insert(tempTableStorage, dataStorage)

                for _, l in pairs(dataStorage) do
                    if l.item_id == nil then break end
    
                    -- print("AAAAAAAAAAAAAAAAAAAA : ", l.item_id)
                    -- print("AAAAAAAAAAAAAAAAAAAA : ", l.item_name)
                    -- print("AAAAAAAAAAAAAAAAAAAA : ", l.quantity)
    
                    CoffreStorage[unique_id].storage[l.item_id] = {}
                    CoffreStorage[unique_id].storage[l.item_id].item_name = l.item_name
                    CoffreStorage[unique_id].storage[l.item_id].quantity = l.quantity
                    CoffreStorage[unique_id].storage[l.item_id].item_id = l.item_id
                end
            end
            TriggerClientEvent("GTA_Storage:ClientOpenMenuCoffreStorage", source, CoffreStorage[unique_id], CoffreStorage[unique_id].storage)
        end
    end)
end)


--[=====[
        C'est ici que l'on recupère les data de l'inventaire du player : 
]=====]
RegisterServerEvent('GTA_Storage:OnPlayerDataInventaire')
AddEventHandler('GTA_Storage:OnPlayerDataInventaire', function(id_unique)
	local source = source

    TriggerEvent('GTA_Inventaire:GetPlayerInventaire', source, function(data)
        TriggerClientEvent("GTA_Storage:GetPlayerInventory", source, data, id_unique)
    end)
end)


--[=====[
        C'est ici que l'on gére la création ou update des items des coffres : 
]=====]
RegisterServerEvent('GTA_Storage:ReceiveItem')
AddEventHandler('GTA_Storage:ReceiveItem', function(id_unique, id, name, nb, model)
	local source = source
    local weight = getSlots(id_unique)
    local limitslots = weight + nb
    local query
    local item

    if (limitslots <= maxCapacity[model].size) then
        TriggerEvent("GTA_Inventaire:GetItemQty", source, name, function(qty, itemid)
            if (qty > 0) then
                local exist, item_ID = DoesItemExist(id_unique, name)
                if (not exist) then
                    --print("Create new table item")
                    CoffreStorage[id_unique].storage[id] = {}
                    CoffreStorage[id_unique].storage[id].item_name = name
                    CoffreStorage[id_unique].storage[id].quantity = nb
                    CoffreStorage[id_unique].storage[id].item_id = id
                else
                    --print("Updating item")
                    CoffreStorage[id_unique].storage[id].quantity =  CoffreStorage[id_unique].storage[id].quantity + nb
                end

                MySQL.Sync.execute("UPDATE `gta_coffres` SET dataStorage = @dataStorage WHERE id_unique = @id_unique", {
                    ["@dataStorage"] = json.encode(CoffreStorage[id_unique].storage),
                    ["@id_unique"] = id_unique
                })
            
                TriggerClientEvent("GTA_Inventaire:RetirerItem", source, name, nb)
            else
                TriggerClientEvent("NUI-Notification", source, {"Vous n'avez pas de " ..name .." sur vous."})
            end

            TriggerClientEvent("NUI-Notification", source, {"Vous avez déposer x"..nb .." " ..name})
        end)
    else
        if nb > maxCapacity[model].size then
            TriggerClientEvent("NUI-Notification", source, {"Ce coffre ne peut contenir uniquement " .. maxCapacity[model].size .. " item"})
        elseif weight >= maxCapacity[model].size then
            TriggerClientEvent("NUI-Notification", source, {"Le coffre est plein !"})
        elseif limitslots > maxCapacity[model].size then
            TriggerClientEvent("NUI-Notification", source, {"Il n'y a plus assez de place !'"})
        end
    end
end)

--[=====[
        C'est ici que l'on gére la suppresion d'item : 
]=====]
RegisterServerEvent("GTA_Storage:looseItem")
AddEventHandler("GTA_Storage:looseItem", function(id_unique, id, name, nb)
    local source = source
    local exist, item_ID = DoesItemExist(id_unique, name)

    if exist and CoffreStorage[id_unique].storage[item_ID].quantity > 0 then
        CoffreStorage[id_unique].storage[item_ID].quantity = CoffreStorage[id_unique].storage[item_ID].quantity - nb

        MySQL.Sync.execute("UPDATE `gta_coffres` SET dataStorage = @dataStorage WHERE id_unique = @id_unique", {
            ["@dataStorage"] = json.encode(CoffreStorage[id_unique].storage),
            ["@id_unique"] = id_unique
        })

        TriggerClientEvent("NUI-Notification", source, {"Vous avez récuperer x ".. nb .. " " .. name .." dans votre inventaire."})
    
        TriggerClientEvent("GTA_Inventaire:AjouterItem", source, item, quantity)
    end
end)
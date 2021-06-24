local items = config.itemList

local __RoundNumber = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end


--[=====[
    	Permet de rename un item de votre inventaire : 
        Cette event est utilisé client-side exemple : 
        TriggerServerEvent("GTA_Inventaire:RenameItem", item_name, new_name, itemid)
]=====]
RegisterNetEvent("GTA_Inventaire:RenameItem")
AddEventHandler("GTA_Inventaire:RenameItem", function(item_name, newLabel, itemid) 
    local source = source
    PlayersSource[source].inventaire[itemid].label = newLabel
        
    TriggerClientEvent("NUI-Notification", source, {"Vous avez renomer votre item : " ..PlayersSource[source].inventaire[itemid].label})
    TriggerClientEvent("GTA:Refreshinventaire", source, PlayersSource[source].inventaire, GetInvWeight(PlayersSource[source].inventaire))
end)


--[=====[
    	Permet de retirer un item de votre inventaire ou target :
        Cette event est utilisé client-side exemple : 
        TriggerServerEvent("GTA_Inventaire:RemoveItem", item_name, qty)
]=====]
RegisterNetEvent("GTA_Inventaire:RemoveItem")
AddEventHandler("GTA_Inventaire:RemoveItem", function(item, count) 
    local source = source
    if items[item] ~= nil then
        local exist, itemidd = DoesItemExistWithArg(source, item, args)
        if PlayersSource[source].inventaire[itemidd] ~= nil then -- Item do not exist in inventory
            if  PlayersSource[source].inventaire[itemidd].count - __RoundNumber(count) <= 0 then -- If count < or = 0 after removing item count, then deleting it from player inv
                PlayersSource[source].inventaire[itemidd].count = 0
            else
                PlayersSource[source].inventaire[itemidd].count = PlayersSource[source].inventaire[itemidd].count - __RoundNumber(count)
            end

            TriggerClientEvent("GTA:Refreshinventaire", source, PlayersSource[source].inventaire, GetInvWeight(PlayersSource[source].inventaire))
            TriggerClientEvent("GTA_Armes:UpdateMunitions", source)
        end
    end
end)


--[=====[
    Permet de get l'inventaire d'un joueur cette event est utilisé server-side : 
    exemple :
     TriggerEvent('GTA_Inventaire:GetPlayerInventaire', source, function(data)
        for _, v in pairs (data) do 
            print(v) --> Le premier parametre return la qty de l'item le deuxieme parametre return l'id unique de l'item.
        end
    end)
]=====]
RegisterNetEvent("GTA_Inventaire:GetPlayerInventaire")
AddEventHandler("GTA_Inventaire:GetPlayerInventaire", function(source, callback)
    callback(PlayersSource[source].inventaire) 
end)

--[=====[
    Permet de get toute les informations concernant le nom de l'item séléctionner (id, qty, name) : 
    exemple :
     TriggerEvent('GTA_Inventaire:GetItemAllInformation', source, "cash", function(itemid, qty, name)
        print(itemid, qty, name)
    end)
]=====]
RegisterNetEvent("GTA_Inventaire:GetItemAllInformation")
AddEventHandler("GTA_Inventaire:GetItemAllInformation", function(source, item_name, callback)
    local isFound = false
    if items[item_name] ~= nil then
        for _,v in pairs(PlayersSource[source].inventaire) do
            if v.item == item_name then
                isFound = true
                callback(v.itemId, v.count, v.label)
            end
        end
        
        if (not isFound) then 
            TriggerClientEvent("NUI-Notification", source, {"Vous n'avez pas de " ..item_name .." sur vous."})
        end
    end
end)

--[=====[
    Permet de get la qty d'item que vous avez sur vous utilisé cette event est utilisé server-side : 
    exemple :
     TriggerEvent('GTA_Inventaire:GetItemQty', source, "dirty", function(qtyItem, itemid)
        print(qtyItem, itemid) --> Le premier parametre return la qty de l'item le deuxieme parametre return l'id unique de l'item.
    end)
]=====]
RegisterNetEvent("GTA_Inventaire:GetItemQty")
AddEventHandler("GTA_Inventaire:GetItemQty", function(source, item_name, callback)
    local isFound = false
    if items[item_name] ~= nil then
        for _,v in pairs(PlayersSource[source].inventaire) do
            if v.item == item_name then
                isFound = true
                callback(v.count, v.itemId) 
            end
        end

        if (not isFound) then 
            TriggerClientEvent("NUI-Notification", source, {"Vous n'avez pas de " ..item_name .." sur vous."})
        end
    end
end)


--[=====[
    Permet de check si l'item exist bien dans la liste des items (nCoreGta/config/config.lua) : 
    Cette event est utilisé server-side exemple d'utilisation :
     TriggerEvent('GTA_Inventaire:DoesItemExist', source, "cash", function(bool)
        print(bool) --> Il vous retourne un bool (true ou false). true veux dire qu'il exist, false est donc le contraire.
    end)
]=====]
RegisterNetEvent("GTA_Inventaire:DoesItemExist")
AddEventHandler("GTA_Inventaire:DoesItemExist", function(source, item_name, callback)
    if items[item_name] ~= nil then
        callback(true)
    else
        callback(false)
    end
end)


--[=====[
    Permet de recevoir un item :
    Cette event est utilisé coté client-side exemple : 
    TriggerServerEvent("GTA_Inventaire:ReceiveItem", "cash", 1) --> le premier parametre doit être le nom de l'item, le deuxieme la quantité.
]=====]
RegisterNetEvent("GTA_Inventaire:ReceiveItem")
AddEventHandler("GTA_Inventaire:ReceiveItem", function(item, count, args) 
    local count = count or 1
    local src = source
    if items[item] ~= nil then
        local exist, itemid = DoesItemExistWithArg(src, item, args)
        local iWeight = GetInvWeight(PlayersSource[src].inventaire)

        if iWeight + (items[item].weight * __RoundNumber(count)) <= config.maxWeight then
            if not exist then
                itemid = GenerateItemId()
                PlayersSource[src].inventaire[itemid] = {}
                PlayersSource[src].inventaire[itemid].item = item
                PlayersSource[src].inventaire[itemid].label = items[item].label
                PlayersSource[src].inventaire[itemid].count =  __RoundNumber(count)
                PlayersSource[src].inventaire[itemid].itemId = itemid
                PlayersSource[src].inventaire[itemid].args = {}
                if args ~= nil then
                    PlayersSource[src].inventaire[itemid].args = args
                end
            else
                PlayersSource[src].inventaire[itemid].count =  PlayersSource[src].inventaire[itemid].count +  __RoundNumber(count)
            end
            TriggerClientEvent("NUI-Notification", src, {"Vous avez reçu x" ..count.. " "..items[item].label})
            TriggerClientEvent("GTA:Refreshinventaire", src, PlayersSource[src].inventaire, GetInvWeight(PlayersSource[src].inventaire))
            TriggerClientEvent("GTA_Armes:UpdateMunitions", src)
        else
            TriggerClientEvent("NUI-Notification", src, {"Quantité maximum atteind.", "warning"})
        end
    end
end)



--[=====[
    Permet de give un item a un player:
    Cette event est utilisé client-side exemple :
    TriggerServerEvent("GTA_Inventaire:GiveItem", target, "nom de l'item", id_unique, qty)
]=====]
RegisterNetEvent("GTA_Inventaire:GiveItem")
AddEventHandler("GTA_Inventaire:GiveItem", function(target, item, itemid, count, args) 
    local src = source
    if items[item] ~= nil then
        local tWeight = GetInvWeight(PlayersSource[target].inventaire)
        if tWeight + (items[item].weight * count) <= config.maxWeight then

            -- Removing item from source
            if PlayersSource[src].inventaire[itemid] == nil then
                return
            else
                if PlayersSource[src].inventaire[itemid].count - count <= 0 then
                    PlayersSource[src].inventaire[itemid].count = 0
                else
                    PlayersSource[src].inventaire[itemid].count = PlayersSource[src].inventaire[itemid].count - count
                end
                TriggerClientEvent("NUI-Notification", src, {"Vous avez donner x" ..count.. " "..items[item].label})
                TriggerClientEvent("GTA:Refreshinventaire", src, PlayersSource[src].inventaire, GetInvWeight(PlayersSource[src].inventaire))
                TriggerClientEvent("GTA_Armes:UpdateMunitions", src)
            end

            -- Adding item to target
            local exist, itemid = DoesItemExistWithArg(target,item, args)
            if not exist then
                itemid = GenerateItemId()
                PlayersSource[target].inventaire[itemid] = {}
                PlayersSource[target].inventaire[itemid].item = item
                PlayersSource[target].inventaire[itemid].label = items[item].label
                PlayersSource[target].inventaire[itemid].count = count
                PlayersSource[target].inventaire[itemid].itemId = itemid
                PlayersSource[target].inventaire[itemid].args = {}
                if args ~= nil then
                    PlayersSource[target].inventaire[itemid].args = args
                end
            else
                PlayersSource[target].inventaire[itemid].count = PlayersSource[target].inventaire[itemid].count + count
            end

            TriggerClientEvent("GTA_Inv:ReceiveItemAnim", target)
            TriggerClientEvent("GTA_Inv:ReceiveItemAnim", source)

            TriggerClientEvent("NUI-Notification", target, {"Vous avez reçu x" ..count.. " "..items[item].label})
            TriggerClientEvent("GTA:Refreshinventaire", target, PlayersSource[target].inventaire, tWeight)
            TriggerClientEvent("GTA_Armes:UpdateMunitions", target)
        else
            TriggerClientEvent("NUI-Notification", src, {"Son inventaire est rempli.", "warning"})
            TriggerClientEvent("NUI-Notification", target, {"Vous n'avez pas assez de place dans votre inventaire.", "warning"})
        end
    end
end)



--[[ 
generated unique item id
]]--
math.randomseed(GetGameTimer())
function GenerateItemId()
    return ""..tostring(math.random(100001,900009)).."-"..tostring(math.random(100001,900009)).."-"..tostring(math.random(100001,900009))
end

function GetInvWeight(inv)
    local countWeight = 0
    for _,v in pairs(inv) do
        countWeight = items[v.item].weight * v.count
    end
    return countWeight
end

function DoesItemExistWithArg(source, item, arg)
    if arg == nil then arg = {} end
    for k,v in pairs(PlayersSource[source].inventaire) do
        if v.item == item then
            if json.encode(v.args) == json.encode(arg) then
                return true, v.itemId
            end
        end
    end
    return false
end

function SetItemArg(source, itemId, arg)
    for k,v in pairs(PlayersSource[source].inventaire) do
        if v.itemId == itemId then
            v.args = arg
        end
    end

    TriggerClientEvent("GTA:Refreshinventaire", source, PlayersSource[source].inventaire, GetInvWeight(PlayersSource[source].inventaire))
end


function RegisterNewItem(item, _label, _weight, _prop)
	if items[tostring(item)] == nil then
		items[tostring(item)] = {label = tostring(_label), weight = tonumber(_weight), prop = _prop}
	end
end

RegisterNetEvent("RegisterNewItem")
AddEventHandler("RegisterNewItem", function(item, _label, _weight, prop)
    if source == "" then
        RegisterNewItem(item, _label, _weight, prop)
    end
end)

Citizen.CreateThread(function()
    for _,v in pairs(config.weapons) do
        TriggerEvent("RegisterNewItem", v.name, v.label, 1, v.prop)
    end
end)

local pickups = {}
RegisterNetEvent("GTA_Inventaire:DropPropsItem")
AddEventHandler("GTA_Inventaire:DropPropsItem", function(label, item, count, coords)
    TriggerClientEvent("GTA_Inventaire:RetirerItem", source, item, count)
    pickups[#pickups+1] = {itemLabel = label, item = item, count = count, coords = coords, added = false}
    TriggerClientEvent("GTA_Inventaire:SyncPropsItems", -1, pickups)
end)

RegisterNetEvent("GTA_Inventaire:RecupererPropsItem")
AddEventHandler("GTA_Inventaire:RecupererPropsItem", function(id, item, amount, count)
    if pickups[id] ~= nil then
        if pickups[id].count == count then
            TriggerClientEvent("GTA_Inventaire:AjouterItem", source, item, amount)
            if pickups[id].count - amount == 0 then
                pickups[id] = nil
                TriggerClientEvent("GTA_Inventaire:SyncPropsItems", -1, pickups, id, true, 0)
            elseif pickups[id].count - amount > 0 then
                pickups[id].count = pickups[id].count - amount
                TriggerClientEvent("GTA_Inventaire:SyncPropsItems", -1, pickups, id, false, pickups[id].count)
            elseif pickups[id].count - amount < 0 then
                return
            end
        end
    end
end)
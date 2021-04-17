----------------------||Inventaire||--------------------
ITEMS = {}
NewItems = {}
local maxCapacity = 100 -->Max the slot dans votre inventaire par item
local indexInv = 1

--[[INFO : TYPE 1 = SOIF, TYPE 2 = FOOD, TYPE 3 = OBJECT,  TYPE 4 = UTILISATION OBJET POUR TARGET]]





RegisterNetEvent("item:reset")
RegisterNetEvent("item:getItems")
RegisterNetEvent("item:sell")

RegisterNetEvent("gui:getItems")
AddEventHandler("gui:getItems", function(THEITEMS)
	ITEMS = {}
	ITEMS = THEITEMS
end)

function getPods()
	local pods = 0
	for _, v in pairs(ITEMS) do
		pods = pods + v.quantity
	end
	return pods
end

RegisterNetEvent("player:receiveItem")
AddEventHandler("player:receiveItem", function(item_name, quantity)
	if (getPods() + quantity <= maxCapacity) then
		item_name = tostring(item_name)
		if (ITEMS[item_name] == nil) then
			new(item_name, quantity)
		else
			add({ item_name, quantity })
		end

		exports.GTA_Notif:GTA_NUI_ShowNotification({
			text = "Vous avez reçu x"..tonumber(quantity) ..item_name,
			type = "success",
			icon = "fa fa-check fa-2x",
			position = "row-reverse"
		})
	else
		exports.GTA_Notif:GTA_NUI_ShowNotification({
			text = "Quantité trop grande ou Inventaire rempli.",
			type = "warning",
			icon = "fa fa-exclamation-circle fa-2x",
			position = "row-reverse"
		})
	end
end)

RegisterNetEvent("player:looseItem")
AddEventHandler("player:looseItem", function(item, quantity)
	item = tostring(item)
	if (ITEMS[item].quantity >= quantity) then
		delete({ item, quantity })
	end
end)

RegisterNetEvent("player:sellItem")
AddEventHandler("player:sellItem", function(item, price)
	item = tostring(item)
	if (ITEMS[item].quantity > 0) then
		sell(item, price)
	end
end)

RegisterNetEvent("farm:updateQuantity")
AddEventHandler("farm:updateQuantity", function(qty, id)
	ITEMS[id].quantity = qty
end)

AddEventHandler("player:resetItem", function(item)
	item = tostring(item)
	delete({ item, ITEMS[item].quantity })
end)

function sell(itemName, price)
	local item = ITEMS[itemName]
	item.quantity = item.quantity - 1
	NewItems[itemName] = item.quantity
	TriggerServerEvent("item:sell", itemName, item.quantity, price)
end

function delete(arg)
	local itemName = tostring(arg[1])
	local qty = arg[2]
	local item = ITEMS[itemName]
	item.quantity = item.quantity - qty
	NewItems[itemName] = item.quantity
	TriggerServerEvent("item:updateQuantity", item.quantity, itemName)
	TriggerEvent("farm:updateQuantity", item.quantity, itemName)
end

function add(arg)
	local itemName = tostring(arg[1])
	local qty = arg[2]
	local item = ITEMS[itemName]
	item.quantity = item.quantity + qty
	NewItems[itemName] = item.quantity
	TriggerServerEvent("item:updateQuantity", item.quantity, itemName)
	TriggerEvent("farm:updateQuantity", item.quantity, itemName)
end

function new(item_name, quantity)
	TriggerServerEvent("item:setItem", item_name, quantity)
	TriggerServerEvent("item:getItems")
end

function updateQuantities()
    for item, quantity in pairs(NewItems) do
        TriggerServerEvent("item:updateQuantity", quantity, item)
    end
end

function getQuantity(itemName)
    if ITEMS[tostring(itemName)] ~= nil then
        return ITEMS[tostring(itemName)].quantity
    end
    return 0
end

AddEventHandler("player:getQuantity", function(item, call)
	 call({count=getQuantity(item)})
end)

function use(itemName, quantity)
	if ITEMS[tostring(itemName)].type == 1 then
	  	TriggerEvent("nAddSoif", 25) --> Nombre d'ajout au moment ou il boit
	elseif ITEMS[tostring(itemName)].type == 2 then
		TriggerEvent("nAddFaim", 25)  --> Nombre d'ajout au moment ou il mange
	elseif ITEMS[tostring(itemName)].type == 3 then --> Armes.
		TriggerEvent("GTA:LoadWeaponPlayer")

		exports.GTA_Notif:GTA_NUI_ShowNotification({
			text = "Objet ajouté dans votre séléction d'armes.",
			type = "success",
			icon = "fa fa-check fa-2x",
			position = "row-reverse"
		})

		return
	elseif ITEMS[tostring(itemName)].type == 4 then --> Seringue d'adrenaline.
		local target = GetPlayerServerId(GetClosestPlayer())
		if target ~= 0 then
			TaskStartScenarioInPlace(GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_KNEEL', 0, true)
			Citizen.Wait(8000)
			ClearPedTasks(GetPlayerPed(-1));
			TriggerServerEvent('GTA_Medic:ReanimerTarget', target)

			exports.GTA_Notif:GTA_NUI_ShowNotification({
				text = "Vous avez soigné une personne.",
				type = "success",
				icon = "fa fa-check fa-2x",
				position = "row-reverse"
			})

			TriggerEvent('player:looseItem',itemName,1)
		else
			exports.GTA_Notif:GTA_NUI_ShowNotification({
				text = "Aucune personne devant vous !",
				type = "warning",
				icon = "fa fa-exclamation-circle fa-2x",
				position = "row-reverse"
			})
		end
	else 
		exports.GTA_Notif:GTA_NUI_ShowNotification({
			text = "Objet non utilisable !",
			type = "warning",
			icon = "fa fa-exclamation-circle fa-2x",
			position = "row-reverse"
		})
		return
	end
	TriggerEvent('player:looseItem', itemName, quantity)
end

function round(n)
	return n % 1 >= 0.5 and math.ceil(n) or math.floor(n)
end


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)
        if NewItems then
            updateQuantities()
        end
        NewItems = {}
    end
end)

AddEventHandler("playerSpawned", function()
  TriggerServerEvent("item:getItems")
  TriggerEvent("GTA:LoadWeaponPlayer")
end)

AddEventHandler("playerDropped", function()
    updateQuantities()
end)
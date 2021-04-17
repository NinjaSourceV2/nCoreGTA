-----------||Inventaire||-----------
local items = {}
RegisterServerEvent("item:getItems")
AddEventHandler("item:getItems", function()
	items = {}
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM user_inventory JOIN items ON `user_inventory`.`item_name` = `items`.`libelle` WHERE license=@username", { ['@username'] = license}, function(result)
		if (result) then
			for _,v in ipairs(result) do
				t = { ["quantity"] = v.quantity, ["libelle"] = v.libelle, ["isUsable"] = v.isUsable, ["type"] = v.type }
				items[v.item_name] = t
			end
		end
		TriggerClientEvent("gui:getItems", source, items)
	end)
end)

RegisterServerEvent("item:setItem")
AddEventHandler("item:setItem", function(item, quantity)
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM user_inventory WHERE license = @username AND item_name = @item", {['@username'] = license, ['@item'] = item}, function(result)
		if(result[1] ~= nil) then
			MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ?", { {['quantity'] = quantity}, {['id'] = result[1].id} })
		else
			MySQL.Async.execute('INSERT INTO user_inventory SET ?', { {['license'] = license, ['item_name'] = item, ['quantity'] = quantity} })
		end
	end)
end)

RegisterServerEvent("item:reset")
AddEventHandler("item:reset", function()
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.execute("UPDATE user_inventory SET quantity=@quantity WHERE license=@username", {['@username'] = license, ['@quantity'] = 0})
end)

RegisterServerEvent("item:updateQuantity")
AddEventHandler("item:updateQuantity", function(qty, id)
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = qty}, {['license'] = license}, {['item_name'] = id}})
end)


RegisterServerEvent("item:sell")
AddEventHandler("item:sell", function(id, quantity, price)
	local source = source	
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.execute("UPDATE user_inventory SET quantity=@quantity WHERE license=@username AND item_name=@id", {['@username'] = license, ['@quantity'] = tonumber(quantity), ['@id'] = tostring(id)})
	
	TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
		local cash = data.argent_propre
		TriggerEvent('GTA:AjoutArgentPropre', source, tonumber(price))
	end)
end)


RegisterServerEvent("player:giveItem")
AddEventHandler("player:giveItem", function(NearestPlayerSID, item, id, quantity)
    local source = source
	local targetid = GetPlayerIdentifiers(NearestPlayerSID)[1]
    local quantity = math.floor(tonumber(quantity))
    MySQL.Async.fetchAll("SELECT SUM(quantity) FROM user_inventory WHERE license = @username", { ['@username'] = targetid }, function(result)
        if quantity < 101 then --Limit item max pour l'inventaire'
			TriggerClientEvent("player:looseItem", source, item, quantity)
			TriggerClientEvent("player:receiveItem", NearestPlayerSID, item, quantity)
			TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous avez donné : x" .. quantity .. " : " .. id, "success", "fa fa-check fa-2x")
			TriggerClientEvent("GTA_NUI_ShowNotif_client", NearestPlayerSID, "Une personne vous a donner x" .. quantity .. " " ..id, "success", "fa fa-check fa-2x")
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous ne pouvez pas porter plus d'item sur vous ! ~b~", "warning", "fa fa-exclamation-circle fa-2x")
			TriggerClientEvent("GTA_NUI_ShowNotif_client", NearestPlayerSID, "Cette Personne ne peut pas transporter plus d'item.", "warning", "fa fa-exclamation-circle fa-2x")
        end
    end)
end)


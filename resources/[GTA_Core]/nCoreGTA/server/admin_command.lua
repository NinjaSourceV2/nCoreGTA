RegisterServerEvent("GTA:CheckAdmin")
AddEventHandler("GTA:CheckAdmin", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local res = MySQL.Sync.fetchScalar("SELECT isAdmin FROM gta_joueurs WHERE license = @username", {['@username'] = license})
	if (res == true) then
		TriggerClientEvent("GTA:UpdatePlayerAdmin", source, res)
	end
end)

RegisterServerEvent("GTA_Admin:GiveItem")
AddEventHandler("GTA_Admin:GiveItem", function(itemName, qty)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM items WHERE libelle = @libelle", { ['@libelle'] = itemName}, function(res)
		if(res[1]) then
			TriggerClientEvent("GTA:GivePlayerItem", source, itemName, qty)
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "L'item saisit : "..itemName.." est introuvable.", "error", "fa fa-exclamation-circle fa-2x")
		end
	end)
end)

RegisterServerEvent("GTA_Admin:AjoutArgentPropre")
AddEventHandler("GTA_Admin:AjoutArgentPropre", function(qty)
	local source = source
	TriggerEvent("GTA:AjoutArgentPropre", source, tonumber(qty))
end)

RegisterServerEvent("GTA_Admin:AjoutArgentSale")
AddEventHandler("GTA_Admin:AjoutArgentSale", function(qty)
	local source = source
	TriggerEvent("GTA:AjoutArgentSale", source, tonumber(qty))
end)

RegisterServerEvent("GTA_Admin:AjoutArgentBanque")
AddEventHandler("GTA_Admin:AjoutArgentBanque", function(qty)
	local source = source
	TriggerEvent("GTA:AjoutArgentBanque", source, tonumber(qty))
end)
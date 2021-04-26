Player = {}
Player.__index = Player
PlayersSource = {}

RegisterServerEvent("GTA_Notif:OnPlayerJoin")
AddEventHandler('GTA_Notif:OnPlayerJoin', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	
	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs WHERE license = @username',  
	{
		['@username'] = license
	}, function(res)
		if(res[1].nom == "Sans Nom" and res[1].prenom == "Sans Prenom") then
			TriggerClientEvent("GTA_NUI_ShowNotif_client",  -1, "Un nouveau citoyen vient de rejoindre la ville.", "success", "fa fa-user fa-2x", "row", "playerjoin")
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client",  -1, res[1].nom.. " "..res[1].prenom.." vient de rejoindre la ville.", "success", "fa fa-user fa-2x", "row", "playerjoin")
		end
	end)

	PlayersSource[source] = license
end)

AddEventHandler('playerDropped', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs WHERE license = @username',{['@username'] = license}, function(res)
		if (res[1].nom == "Sans Nom" and res[1].prenom == "Sans Prenom") then
			TriggerClientEvent("GTA_NUI_ShowNotif_client",  -1, "Un nouveau citoyen vient de quitté la ville.", "success", "fa fa-user fa-2x", "row", "playerjoin")
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client",  -1, res[1].nom.. " "..res[1].prenom.."vient de quitté la ville.", "success", "fa fa-user fa-2x", "row", "playerjoin")
		end
	end)

	PlayersSource[source] = nil
end)

function Player:GetLicense(source)
	local license = GetPlayerIdentifiers(source)[1]
	return license
end

function Player:Find(source, callback)
	local src = source
	local pLicense = Player:GetLicense(src)

	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs WHERE license = @username',{['@username'] = pLicense}, function(res)
	        if callback then
	            for _, v in ipairs(res) do
	               callback(v)
	            end
	        end
	end)
end

function Player:New(license, banque)
	return MySQL.Async.execute(
		'INSERT INTO gta_joueurs (`license`, `banque`) VALUES (@license, @banque)',
		{ 
			['license'] = license,
			['banque'] = banque
		},
		function ()
	end)
end

RegisterServerEvent('GTA:LoadArgent')
AddEventHandler('GTA:LoadArgent', function()
	local source = source
	Player:Find(source, function(data)
		if data then
			local argentBanque = data.banque
			TriggerClientEvent('GTA:AfficherBanque', source, argentBanque)
		end
	end)
end)

RegisterServerEvent('GTA:GetInfoJoueurs')  --> cette event sert uniquement a get les donnée de votre perso.
AddEventHandler('GTA:GetInfoJoueurs', function(source, callback)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs WHERE license = @license',{['@license'] = license}, function(res)
		for _, v in pairs(res) do
			if callback then
				callback(v)
			end
		end
	end)
end)


RegisterServerEvent('GTA:GetUserQtyItem')  --> cette event sert uniquement a get la quantité d'un item server-side.
AddEventHandler('GTA:GetUserQtyItem', function(source, itemName, callback)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM user_inventory WHERE license = @username AND item_name = @item", {['@username'] = license, ['@item'] = tostring(itemName)}, function(result)
		if(result[1] ~= nil) then
			if callback then
				callback(result[1].quantity)
			end
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client",  source, "Vous ne possédez pas cette item sur vous.", "warning")
		end
	end)
end)

RegisterServerEvent('GTA:CreationJoueur')  --> cette event sert uniquement a créer votre perso.
AddEventHandler('GTA:CreationJoueur', function(source)
	local source = source
    local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchScalar("SELECT license FROM gta_joueurs WHERE license = @username", {['@username'] = license})
	if not result then
		if config.activerWhitelist == false then
			print('Creation de personnage pour : [' .. GetPlayerName(source) .. "] -  [License] : "..license)
		end

		Player:New(license, config.banque)
		MySQL.Async.execute('INSERT INTO user_inventory SET ?', { {['license'] = license, ['item_name'] = "Argent-Propre", ['quantity'] = tonumber(config.argentPropre)} })
		MySQL.Async.execute('INSERT INTO user_inventory SET ?', { {['license'] = license, ['item_name'] = "Argent-Sale", ['quantity'] = tonumber(config.argentSale)} })
	end
end)

RegisterServerEvent('GTA:salaire')
AddEventHandler('GTA:salaire', function()
	local source = source
    local license = GetPlayerIdentifiers(source)[1]

	Player:Find(source, function(data)
		if data then
			MySQL.Async.fetchAll('SELECT salaire FROM gta_joueurs INNER JOIN gta_metiers ON gta_joueurs.job = gta_metiers.metiers WHERE license = @license',{['@license'] = license}, function(res)
				local newValue = data.banque + res[1].salaire
				MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
				TriggerClientEvent('GTA:AfficherBanque', source, newValue)
				TriggerClientEvent("GTAO:NotificationIcon", source, "CHAR_BANK_MAZE", "Maze Bank", "+ : ~g~" ..res[1].salaire.. " $", "Salaire reçu")
			end)
		end
	end)
end)

RegisterServerEvent('GTA:AjoutArgentPropre') --> cette event sert uniquement a ajouté de l'argent propre.
AddEventHandler('GTA:AjoutArgentPropre', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Propre", function(argentPropreQty)
				local newValue = argentPropreQty + value
				MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = newValue}, {['license'] = tostring(data.license)}, {['item_name'] = "Argent-Propre"}})
				TriggerClientEvent("GTAO:NotificationIcon", src, "CHAR_BANK_MAZE", "Maze Bank", "+ : ~g~" ..value.. " $", "Argent reçu")
			end)
		end
	end)
end)


RegisterServerEvent('GTA:AjoutArgentSale') --> cette event sert uniquement a ajouté de l'argent sale.
AddEventHandler('GTA:AjoutArgentSale', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Sale", function(argentSaleQty)
				local newValue = argentSaleQty + value
				MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = newValue}, {['license'] = tostring(data.license)}, {['item_name'] = "Argent-Sale"}})
				TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Nouveau Solde Argent Sale : "..newValue)
				--> Si vous utilisé un hud autre que de base, veuillez le refresh ici.
			end)
		end
	end)
end)

RegisterServerEvent('GTA:AjoutArgentBanque') --> cette event sert uniquement a ajouté de l'argent en banque.
AddEventHandler('GTA:AjoutArgentBanque', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local newValue = data.banque + value
			MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
			TriggerClientEvent('GTA:AfficherBanque', src, newValue)
			TriggerClientEvent("GTAO:NotificationIcon", src, "CHAR_BANK_MAZE", "Maze Bank", "+  : ~g~" ..value.. " $", "Argent reçu en banque")
		end
	end)
end)

RegisterServerEvent('GTA:RetirerArgentPropre') --> cette event sert uniquement a retirer votre argent propre par une valeur en parametre.
AddEventHandler('GTA:RetirerArgentPropre', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Propre", function(argentPropreQty)
				local getArgentPropre = argentPropreQty
				if getArgentPropre >= value then
					local newCash = getArgentPropre - value
					MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = newCash}, {['license'] = tostring(data.license)}, {['item_name'] = "Argent-Propre"}})
					TriggerClientEvent('GTA:AjoutSonPayer', src)
					TriggerClientEvent("GTAO:NotificationIcon", src, "CHAR_BANK_MAZE", "Maze Bank", "- " ..value.. " $")
				else
					TriggerClientEvent("GTA_NUI_ShowNotif_client", src, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
				end
			end)
		end
	end)
end)

RegisterServerEvent('GTA:RetirerArgentSale') --> cette event sert uniquement a retirer votre argent sale par une valeur en parametre.
AddEventHandler('GTA:RetirerArgentSale', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Sale", function(argentSaleQty)
				local getArgentSale = argentSaleQty
				if getArgentSale >= value then
					local newValue = getArgentSale - value
					MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = newValue}, {['license'] = tostring(data.license)}, {['item_name'] = "Argent-Sale"}})
					TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Nouveau Solde Argent Sale : "..newValue)

					--> Si vous utilisé un hud autre que de base, veuillez le refresh ici.
					TriggerClientEvent('GTA:AjoutSonPayer', src)
				else
					TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
				end
			end)
		end
	end)
end)

RegisterServerEvent('GTA:RetirerArgentBanque') --> cette event sert uniquement a retirer votre argent en banque par une valeur en parametre. comme exemple payé une amende.
AddEventHandler('GTA:RetirerArgentBanque', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local newValue = data.banque - value
			MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
			TriggerClientEvent('GTA:AfficherBanque', src, newValue)
			TriggerClientEvent('GTA:AjoutSonPayer', src)
			TriggerClientEvent("GTAO:NotificationIcon", src, "CHAR_BANK_MAZE", "Maze Bank", "Nouveau Solde : ~g~" ..newValue.. " $", "Argent banque retirer")
		end
	end)
end)

RegisterServerEvent('GTA:RetirerAtmBanque') --> cette event sert uniquement a retirer votre argent en banque par une valeur en parametre.
AddEventHandler('GTA:RetirerAtmBanque', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Propre", function(argentPropreQty)
				local getArgentPropre = argentPropreQty
				local getArgentBanque = data.banque

				if getArgentBanque >= value then
					local newValue = data.banque - value
					local newArgentPropre = getArgentPropre + value

					MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
					MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = newArgentPropre}, {['license'] = tostring(data.license)}, {['item_name'] = "Argent-Propre"}})


					TriggerClientEvent('GTA:AfficherBanque', src, newValue)
					TriggerClientEvent("GTAO:NotificationIcon", src, "CHAR_BANK_MAZE", "Maze Bank", "Nouveau Solde : ~g~" ..newValue.. " $", "Argent banque retirer")
				else
					TriggerClientEvent("GTA_NUI_ShowNotif_client", src, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
				end
			end)
		end
	end)
end)


RegisterServerEvent('GTA:DeposerAtmBanque') --> cette event sert uniquement a retirer votre argent propre par une valeur en parametre.
AddEventHandler('GTA:DeposerAtmBanque', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Propre", function(argentPropreQty)
				local getArgentPropre = argentPropreQty
				if getArgentPropre >= value then
					local argentPropre = getArgentPropre - value
					local newValue = data.banque + value

					MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
					MySQL.Async.execute("UPDATE user_inventory SET ? WHERE ? AND ?", { {['quantity'] = argentPropre}, {['license'] = tostring(data.license)}, {['item_name'] = "Argent-Propre"}})

					TriggerClientEvent('GTA:AfficherBanque', src, newValue)
					TriggerClientEvent("GTAO:NotificationIcon",src, "CHAR_BANK_MAZE", "Maze Bank", "Nouveau Solde : ~g~" ..newValue.. " $", "Argent banque déposer")

				else
					TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
				end
			end)
		end
	end)
end)

AddEventHandler('GTA:GetJoueurs', function(cb)
    cb(PlayersSource)
end)

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
	            for k, v in ipairs(res) do
	               callback(v)
	            end
	        end
	end)
end

function Player:New(license, argent_propre, argent_sale, banque)
	return MySQL.Async.execute(
		'INSERT INTO gta_joueurs (`license`,`argent_propre`,`argent_sale`, `banque`) VALUES (@license, @argent_propre, @argent_sale, @banque)',
		{ 
			['license'] = license,
			['argent_propre'] = argent_propre,
			['argent_sale'] = argent_sale,
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
			local argentPropre = data.argent_propre
			local argentSale = data.argent_sale
			local argentBanque = data.banque
			
			TriggerClientEvent('GTA:AfficherArgentPropre', source, argentPropre)
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

RegisterServerEvent('GTA:CreationJoueur')  --> cette event sert uniquement a créer votre perso.
AddEventHandler('GTA:CreationJoueur', function(source)
	local source = source
    local license = GetPlayerIdentifiers(source)[1]

	local result = MySQL.Sync.fetchScalar("SELECT license FROM gta_joueurs WHERE license = @username", {['@username'] = license})
	if not result then
		if config.activerWhitelist == false then
			print('Creation de personnage pour : [' .. GetPlayerName(source) .. "] -  [License] : "..license)
		end

		Player:New(license, config.argentPropre, config.argentSale, config.banque)
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
			TriggerClientEvent("GTA_NUI_ShowNotif_client",  source, " Salaire reçu : + "..res[1].salaire.." $", "success", "fa fa-user fa-2x", "row")

			end)
		end
	end)
end)

RegisterServerEvent('GTA:AjoutArgentPropre') --> cette event sert uniquement a ajouté de l'argent propre.
AddEventHandler('GTA:AjoutArgentPropre', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local newValue = data.argent_propre + value
			MySQL.Async.execute('UPDATE gta_joueurs SET argent_propre=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
			TriggerClientEvent('GTA:AfficherArgentPropre', src, newValue)
		end
	end)
end)


RegisterServerEvent('GTA:AjoutArgentSale') --> cette event sert uniquement a ajouté de l'argent sale.
AddEventHandler('GTA:AjoutArgentSale', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local newValue = data.argent_sale + value
			MySQL.Async.execute('UPDATE gta_joueurs SET argent_sale=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
			--> Si vous utilisé un hud autre que de base, veuillez le refresh ici.
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
		end
	end)
end)

RegisterServerEvent('GTA:RetirerArgentPropre') --> cette event sert uniquement a retirer votre argent propre par une valeur en parametre.
AddEventHandler('GTA:RetirerArgentPropre', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local getArgentPropre = data.argent_propre
			if getArgentPropre >= value then
				local newCash = data.argent_propre - value
				MySQL.Async.execute('UPDATE gta_joueurs SET argent_propre=@newCash WHERE license = @license',{ ['@license'] = tostring(data.license),['@newCash'] = tostring(newCash)})
				TriggerClientEvent('GTA:AfficherArgentPropre', src, newCash)
				TriggerClientEvent('GTA:AjoutSonPayer', src)
			else
				TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
			end
		end
	end)
end)

RegisterServerEvent('GTA:RetirerArgentSale') --> cette event sert uniquement a retirer votre argent sale par une valeur en parametre.
AddEventHandler('GTA:RetirerArgentSale', function(source, value)
	local src = source

	Player:Find(src, function(data)
		if data then
			local getArgentSale = data.argent_sale
			if getArgentSale >= value then
				local newValue = data.argent_sale - value
				MySQL.Async.execute('UPDATE gta_joueurs SET argent_sale=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
				--> Si vous utilisé un hud autre que de base, veuillez le refresh ici.
				TriggerClientEvent('GTA:AjoutSonPayer', src)
			else
				TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
			end
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
		end
	end)
end)

RegisterServerEvent('GTA:RetirerAtmBanque') --> cette event sert uniquement a retirer votre argent en banque par une valeur en parametre.
AddEventHandler('GTA:RetirerAtmBanque', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local getArgentBanque = data.banque
			if getArgentBanque >= value then
				local newValue = data.banque - value
				local newArgentPropre = data.argent_propre + value

				MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
				MySQL.Async.execute('UPDATE gta_joueurs SET argent_propre=@newArgentPropre WHERE license = @license',{ ['@license'] = tostring(data.license),['@newArgentPropre'] = tostring(newArgentPropre)})

				TriggerClientEvent('GTA:AfficherBanque', src, newValue)
				TriggerClientEvent('GTA:AfficherArgentPropre', src, newArgentPropre)
			else
				TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
			end
		end
	end)
end)


RegisterServerEvent('GTA:DeposerAtmBanque') --> cette event sert uniquement a retirer votre argent propre par une valeur en parametre.
AddEventHandler('GTA:DeposerAtmBanque', function(source, value)
	local src = source
	Player:Find(src, function(data)
		if data then
			local getArgentPropre = data.argent_propre
			if getArgentPropre >= value then
				local argentPropre = data.argent_propre - value
				local newValue = data.banque + value

				MySQL.Async.execute('UPDATE gta_joueurs SET banque=@newValue WHERE license = @license',{ ['@license'] = tostring(data.license),['@newValue'] = tostring(newValue)})
				MySQL.Async.execute('UPDATE gta_joueurs SET argent_propre=@argentPropre WHERE license = @license',{ ['@license'] = tostring(data.license),['@argentPropre'] = tostring(argentPropre)})
				
				TriggerClientEvent('GTA:AfficherBanque', src, newValue)
				TriggerClientEvent('GTA:AfficherArgentPropre', src, argentPropre)
			else
				TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous n'avez cette somme d'argent sur vous.", "warning", "fa fa-exclamation-circle fa-2x")
			end
		end
	end)
end)

AddEventHandler('GTA:GetJoueurs', function(cb)
    cb(PlayersSource)
end)

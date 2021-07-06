local items = config.itemList
local __RoundNumber = function(value, numDecimalPlaces)
	return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", value))
end


--[=====[
    	Cette event est utilisé pour récuperer le sex de votre perso : 
		Cette event est utilisé server-side exemple : 
		TriggerEvent('GTA:GetUserSex', license, function(sex)
			print(sex) --> return votre sex.
		end)
]=====]
RegisterNetEvent('GTA:GetUserSex')  --> cette event sert uniquement a get la quantité d'un item server-side.
AddEventHandler('GTA:GetUserSex', function(license, callback)
	MySQL.Async.fetchAll("SELECT data_personnage FROM gta_joueurs_humain WHERE license = @username", {['@username'] = license}, function(res)
		local decodeData = json.decode(res[1].data_personnage)
		if callback then
			if decodeData ~= nil then
				callback(decodeData["sex"])
			end
		end
	end)
end)

--[=====[
    	Cette event est utilisé pour donné un salaire au joueur toute les 15 minute : 
]=====]
RegisterNetEvent('GTA:salaire')
AddEventHandler('GTA:salaire', function()
	local source = source
    local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll('SELECT salaire FROM gta_joueurs INNER JOIN gta_metiers ON gta_joueurs.job = gta_metiers.metiers WHERE license = @license',{['@license'] = license}, function(res)
		PlayersSource[source].banque = PlayersSource[source].banque + res[1].salaire
		TriggerClientEvent('GTA:AfficherBanque', source, PlayersSource[source].banque)
		TriggerClientEvent("GTAO:NotificationIcon", source, "CHAR_BANK_MAZE", "Maze Bank", "+ : ~g~" ..res[1].salaire.. " $", "Salaire reçu")
	end)
end)


--[=====[
    	Cette event est utilisé pour update les nouvel donnée "faim" du joueur : 
		Cette event est utilisé client-side exemple :
		TriggerServerEvent("nSetFaim", nombre)
]=====]
RegisterNetEvent("nSetFaim")
AddEventHandler("nSetFaim", function(faim)
	local source = source
	PlayersSource[source].faim = faim
end)

--[=====[
    	Cette event est utilisé pour update les nouvel donnée "soif" du joueur : 
		Cette event est utilisé client-side exemple :
		TriggerServerEvent("nSetSoif", nombre)
]=====]
RegisterNetEvent("nSetSoif")
AddEventHandler("nSetSoif", function(soif)
	local source = source
	PlayersSource[source].soif = soif
end)



--[=====[
    	Cette event est utile pour sauvegardé la pos du joueur : 
		Cette event est utilisé client-side exemple : 
		--[[
			local pPed = GetPlayerPed(-1)
			local pCoords = GetEntityCoords(pPed)
			TriggerServerEvent("GTA:SavePos", pCoords)
		]]--
]=====]
RegisterNetEvent("GTA:SavePos")
AddEventHandler("GTA:SavePos", function(pos)
	local source = source
    PlayersSource[source].pos = pos
end)



--[=====[
    	Cette event est utile pour le changement d'identité :
		Cette event est utilisé client-side exemple : 
    	TriggerServerEvent("GTA:UpdateIdentiter", "nom", "prenom", age, "nationaliter")
]=====]
RegisterNetEvent("GTA:UpdateIdentiter")
AddEventHandler("GTA:UpdateIdentiter", function(nom, prenom, age, nationaliter)
	local source = source
	if nom ~= nil then PlayersSource[source].identiter.nom = nom end
    if prenom ~= nil then PlayersSource[source].identiter.prenom = prenom end
    if age ~= nil then PlayersSource[source].identiter.age = age end
    if nationaliter ~= nil then PlayersSource[source].identiter.nationaliter = nationaliter end

	local t = { 
		["nom"] = PlayersSource[source].identiter.nom or "Sans Nom",
		["prenom"] = PlayersSource[source].identiter.prenom or "Sans Prenom",
		["age"] = PlayersSource[source].identiter.age or "0",
		["nationaliter"] = PlayersSource[source].identiter.nationaliter or "N/A"
	}

	TriggerClientEvent("GTA_Interaction:UpdateInfoPlayers", source, t)
end)


--[=====[
	Cette event vous retourne les informations de votre player utile pour afficher les info de la carte d'identité :
	Cette event est utilisé client-side exemple : 
	TriggerServerEvent("GTA:GetPlayerInformationsIdentiter") --> return l'identité de votre player puis vous l'affiche pour vous.
]=====]
RegisterNetEvent("GTA:GetPlayerInformationsIdentiter")
AddEventHandler("GTA:GetPlayerInformationsIdentiter", function()
	local source = source
	local t = { 
		["nom"] = PlayersSource[source].identiter.nom,
		["prenom"] = PlayersSource[source].identiter.prenom,
		["age"] = PlayersSource[source].identiter.age,
		["nationaliter"] = PlayersSource[source].identiter.nationaliter,
		["profession"] = PlayersSource[source].job,
		["telephone"] = PlayersSource[source].phone_number
	}

	TriggerClientEvent("GTA_Interaction:UpdateInfoPlayersIdentiter", source, t)
end)



--[=====[
		Cette event vous retourne les informations de votre player utile pour afficher les info de la carte d'identité a une target proche de vous :
		Cette event est utilisé client-side exemple : 
		TriggerServerEvent("GTA:GetPlayerInformationsIdentiter", target) --> return l'identité de votre player puis vous l'affiche au target le plus proche.
]=====]
RegisterNetEvent("GTA:GetPlayerInformationsIdentiterTarget")
AddEventHandler("GTA:GetPlayerInformationsIdentiterTarget", function(target)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local t = { 
		["nom"] = PlayersSource[source].identiter.nom,
		["prenom"] = PlayersSource[source].identiter.prenom,
		["age"] = PlayersSource[source].identiter.age,
		["origine"] = PlayersSource[source].identiter.origine,
		["profession"] = PlayersSource[source].job,
		["telephone"] = PlayersSource[source].phone_number,
	}

	TriggerClientEvent("GTA_Inv:ReceiveItemAnim", target)
	TriggerClientEvent("GTA_Inv:ReceiveItemAnim", source)
	
	getSourceFromIdentifier(license, function(osou) --> permet de get la source id de la target.
		if tonumber(osou) ~= nil then 
			TriggerClientEvent("GTA_Interaction:UpdateInfoPlayersIdentiter", target, t, tonumber(osou))
		end
	end)
end)
function getSourceFromIdentifier(identifier, cb) --> Converted.
	TriggerEvent('GTA:GetJoueurs', function(joueurs)
		for k, v in pairs(joueurs) do
			print(joueurs[k])
			if(joueurs[k] ~= nil and joueurs[k] == identifier) or (joueurs[k] == identifier) then
				cb(k)
				return
			end
		end
	end)
	cb(nil)
end


--[=====[
    	cette event sert uniquement a get l'argent de banque utile pour faire des condition avant vos achat ou autre.
		Cette event est utilisé server-side exemple : 
		TriggerEvent("GTA:GetArgentBanque", source, function(qty)
			print(qty) --> Vous retourne la qty d'argent en banque.
		end)
]=====]
RegisterServerEvent('GTA:GetArgentBanque')
AddEventHandler('GTA:GetArgentBanque', function(source, callback)
	callback(PlayersSource[source].banque)
end)



--[=====[
    	cette event sert uniquement a get l'identiter de votre player :
		Cette event est utilisé server-side exemple : 
		TriggerEvent("GTA:GetIdentityPlayer", source, function(data)
			print(data["nom"], data["prenom"], data["age"], data["origine"], data["origine"], data["profession"], data["telephone"]) --> Vous retourne les valeur de vos info.
		end)
]=====]
RegisterServerEvent('GTA:GetIdentityPlayer')
AddEventHandler('GTA:GetIdentityPlayer', function(source, callback)
	local t = { 
		["nom"] = PlayersSource[source].identiter.nom,
		["prenom"] = PlayersSource[source].identiter.prenom,
		["age"] = PlayersSource[source].identiter.age,
		["origine"] = PlayersSource[source].identiter.origine,
		["profession"] = PlayersSource[source].job,
		["telephone"] = PlayersSource[source].phone_number
	}
	callback(t)
end)


--[=====[
    	cette event sert uniquement a faire des paiement avec votre argent propre a utilisé :
		Cette event est utilisé client-side exemple : 
		TriggerServerEvent("GTA:PaiementCash", itemname, itemid, prix)
]=====]
RegisterServerEvent('GTA:PaiementCash')
AddEventHandler('GTA:PaiementCash', function(item, itemid, count)
	local source = source
    if items[item] ~= nil then
        if PlayersSource[source].inventaire[itemid] ~= nil then -- Item do not exist in inventory
            if  PlayersSource[source].inventaire[itemid].count - __RoundNumber(count) <= 0 then -- If count < or = 0 after removing item count, then deleting it from player inv
                PlayersSource[source].inventaire[itemid].count = 0
            else
                PlayersSource[source].inventaire[itemid].count = PlayersSource[source].inventaire[itemid].count - __RoundNumber(count)
				TriggerClientEvent("GTAO:NotificationIcon", source, "CHAR_BANK_MAZE", "Maze Bank", "- : ~g~" ..count.. " $", "Paiement reussi")
            end

            TriggerClientEvent("GTA:Refreshinventaire", source, PlayersSource[source].inventaire, GetInvWeight(PlayersSource[source].inventaire))
        end
    end
end)


--[=====[
    	cette event sert uniquement a update votre job :
		Cette event est utilisé client-side exemple : 
		TriggerServerEvent("GTA_Metier:UpdateJob", nom_metier, grade, bService)
]=====]
RegisterServerEvent('GTA_Metier:UpdateJob')
AddEventHandler('GTA_Metier:UpdateJob', function(metiers, grade, service)
	local source = source
	local job = tostring(metiers)
	PlayersSource[source].job = job or PlayersSource[source].job
	PlayersSource[source].grade = grade or PlayersSource[source].grade
	PlayersSource[source].enService = service or PlayersSource[source].enService

    TriggerClientEvent("GTA:RefreshJobInformation", source, PlayersSource[source].job, PlayersSource[source].grade, PlayersSource[source].enService)
end)
RegisterServerEvent("GTA_Interaction:GetinfoPlayers")
AddEventHandler("GTA_Interaction:GetinfoPlayers", function()
    local source = source 
	local license = GetPlayerIdentifiers(source)[1]

	TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
		local argentBanque = data.banque 
		local nom = data.nom
		local prenom = data.prenom
        TriggerClientEvent('GTA_Interaction:UpdateInfoPlayers', source, nom, prenom)
		TriggerClientEvent('GTA_Interaction:UpdateMoneyPlayers', source, argentBanque)
	end)
end)

RegisterServerEvent("GTA:GetPlayerSexServer")
AddEventHandler("GTA:GetPlayerSexServer", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local sex = MySQL.Sync.fetchScalar("SELECT sex FROM gta_joueurs_humain WHERE license = @username", {['@username'] = license})
	TriggerClientEvent("GTA:GetSexJoueur", source, sex)
end)



RegisterServerEvent('nArgent:DonnerArgentPropre')
AddEventHandler('nArgent:DonnerArgentPropre', function(toPlayer, amount)
	local source = source
	if (toPlayer ~= nil and tonumber(amount) > 0) then
		fromPlayer = tonumber(source)
		toPlayer = tonumber(toPlayer)
		amount = tonumber(amount)
		TriggerClientEvent('bank:givecash', source, toPlayer, amount)
	else
		TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Veuillez entrer une valeur numérique !", "warning", "fa fa-exclamation-circle fa-2x")
		return false
	end
end)



RegisterServerEvent('bank:givecash')
AddEventHandler('bank:givecash', function(toPlayer, amount)
	local source = source
	TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Propre", function(argentPropreQty)
		TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Sale", function(argentSaleQty)
			TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
				local argentPropre = argentPropreQty
				local argentSale = argentSaleQty
				local argentBanque = data.banque 
		
				if (tonumber(argentPropre) >= tonumber(amount)) then
					TriggerEvent('GTA:RetirerArgentPropre', source, tonumber(amount))
					TriggerEvent('GTA:GetInfoJoueurs', toPlayer, function(data)
						TriggerEvent('GTA:AjoutArgentPropre', toPlayer, tonumber(amount))
						TriggerClientEvent('GTA_Interaction:UpdateMoneyPlayers', source, argentBanque)
						TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous avez donné : x" .. amount, "success", "fa fa-check fa-2x")
						TriggerClientEvent("GTA_NUI_ShowNotif_client", toPlayer, "Une personne vous a donner de l'argent propre: ~g~$".. amount, "success", "fa fa-check fa-2x")
					end)
				else
					TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Pas assez d'argent!", "warning", "fa fa-exclamation-circle fa-2x")
					CancelEvent()
				end
			end)
		end)
	end)
end)

RegisterServerEvent('GTA:DonnerArgentSale')
AddEventHandler('GTA:DonnerArgentSale', function(toPlayer, amount)
	local source = source

	if (toPlayer ~= nil and tonumber(amount) > 0) then
		fromPlayer = tonumber(source)
		toPlayer = tonumber(toPlayer)
		amount = tonumber(amount)
		TriggerClientEvent('bank:givesale', source, toPlayer, amount)
	else
		TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Veuillez entrer une valeur numérique !", "warning", "fa fa-exclamation-circle fa-2x")
		return false
	end
end)


RegisterServerEvent('bank:givesale')
AddEventHandler('bank:givesale', function(toPlayer, amount)
	local source = source
	TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Propre", function(argentPropreQty)
		TriggerEvent('GTA:GetUserQtyItem', source, "Argent-Sale", function(argentSaleQty)
			TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
				local argentPropre = argentPropreQty
				local argentSale = argentSaleQty
				local argentBanque = data.banque 
				if (tonumber(argentSale) >= tonumber(amount)) then
					TriggerEvent('GTA:RetirerArgentSale', source, tonumber(amount))
					TriggerEvent('GTA:GetInfoJoueurs', toPlayer, function(data)
						TriggerEvent('GTA:AjoutArgentSale', toPlayer, tonumber(amount))
						TriggerClientEvent('GTA_Interaction:UpdateMoneyPlayers', source, argentBanque)

						TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Vous avez donné: -$".. amount, "success", "fa fa-check fa-2x")
						TriggerClientEvent("GTA_NUI_ShowNotif_client", toPlayer, "Une personne vous a donner de l'argent sale : ~r~$".. amount, "success", "fa fa-check fa-2x")
					end)
				else
					TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Pas assez d'argent dans le portefeuille !", "warning", "fa fa-exclamation-circle fa-2x")
					CancelEvent()
				end
			end)
		end)
	end)
end)



RegisterServerEvent("GTA:GetHautJoueur")
AddEventHandler('GTA:GetHautJoueur', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM gta_joueurs_vetement WHERE license = @license", { ['@license'] = license}, function(res)
		TriggerClientEvent("GTA:MettreHautJoueur", source, {res[1].topsID, res[1].topsDraw, res[1].topsCouleur, res[1].undershirtsID, res[1].undershirtsDraw, res[1].undershirtsCouleur, res[1].torsosID, res[1].torsosDraw})
	end)
end)

RegisterServerEvent("GTA:GetBasJoueur")
AddEventHandler('GTA:GetBasJoueur', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM gta_joueurs_vetement WHERE license = @license", { ['@license'] = license}, function(res)
		TriggerClientEvent("GTA:MettreBasJoueur", source, {res[1].legsID, res[1].legsDraw, res[1].legsCouleur})
	end)
end)


RegisterServerEvent("GTA:GetChaussureJoueur")
AddEventHandler('GTA:GetChaussureJoueur', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM gta_joueurs_vetement WHERE license = @license", { ['@license'] = license}, function(res)
		TriggerClientEvent("GTA:MettreChaussureJoueur", source, {res[1].shoesID, res[1].shoesDraw, res[1].shoesCouleur})
	end)
end)

RegisterServerEvent("GTA:GetBonnetJoueur")
AddEventHandler('GTA:GetBonnetJoueur', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM gta_joueurs_vetement WHERE license = @license", { ['@license'] = license}, function(res)
		TriggerClientEvent("GTA:MettreBonnetJoueur", source, {res[1].HatsID, res[1].HatsDraw, res[1].HatsCouleurs})
	end)
end)

RegisterServerEvent('GTA:ChercherSonIdentiter')
AddEventHandler('GTA:ChercherSonIdentiter', function()
	local source = source	

	TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
		local nom = data.nom
		local prenom = data.prenom
		local travail = data.job
		local age = data.age
		local origine = data.origine
		local grade = data.grade
		
		TriggerClientEvent('GTA:RegarderIdentiter', source, tostring(nom), tostring(prenom), tostring(travail), tonumber(age), tostring(origine), tostring(grade))
	end)
end)


RegisterServerEvent('GTA:MontrerSonIdentiter')
AddEventHandler('GTA:MontrerSonIdentiter', function(NearestPlayerSID)
	local source = source	

	TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
		local nom = data.nom
		local prenom = data.prenom
		local travail = data.job
		local age = data.age
		local origine = data.origine
		local grade = data.grade

		if NearestPlayerSID ~= 0 then
			TriggerClientEvent('GTA:RegarderIdentiter', NearestPlayerSID, tostring(nom), tostring(prenom), tostring(travail), tonumber(age), tostring(origine), tostring(grade))
			TriggerClientEvent("GTA_NUI_ShowNotif_client", NearestPlayerSID, "Une personne vous montre son identité.", "success", "fa fa-check fa-2x")
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Aucune personne devant vous", "warning", "fa fa-exclamation-circle fa-2x")
		end
	end)
end)
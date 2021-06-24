RegisterServerEvent("GTA:GetPlayerSexServer")
AddEventHandler("GTA:GetPlayerSexServer", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	TriggerEvent('GTA:GetUserSex', license, function(sex)
		TriggerClientEvent("GTA:RefreshUserSex", source, sex)
	end)
end)

RegisterServerEvent("GTA:GetPlayerCapucheServer")
AddEventHandler('GTA:GetPlayerCapucheServer', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT license, topsDraw FROM gta_joueurs_vetement WHERE license = @license", { ['@license'] = license}, function(res)
		TriggerClientEvent("GTA:RefreshUserCapuche", source, res[1].topsDraw)
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


RegisterServerEvent("GTA:GetMaskJoueur")
AddEventHandler('GTA:GetMaskJoueur', function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM gta_joueurs_vetement WHERE license = @license", { ['@license'] = license}, function(res)
		TriggerClientEvent("GTA:MettreMaskJoueur", source, {res[1].MaskID, res[1].MaskDraw})
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
			
			TriggerClientEvent("GTA_Inv:ReceiveItemAnim", NearestPlayerSID)
			TriggerClientEvent("GTA_Inv:ReceiveItemAnim", source)
		else
			TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Aucune personne devant vous", "warning", "fa fa-exclamation-circle fa-2x")
		end
	end)
end)




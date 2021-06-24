 --||@SuperCoolNinja||--

 RegisterServerEvent("GTA:UpdateCharacterData")
AddEventHandler("GTA:UpdateCharacterData", function(table)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.execute('UPDATE gta_joueurs_humain SET data_personnage=@data_personnage WHERE license = @license',{ ['@license'] = license, ['@data_personnage'] = table})
	
	local decodeData = json.decode(table)
	if decodeData["sex"] == "mp_m_freemode_01" then
		MySQL.Async.execute('UPDATE gta_joueurs_vetement SET HatsDraw=@HatsDraw WHERE license = @license',{ ['@license'] = license,['@HatsDraw'] = 8})
	elseif decodeData["sex"] == "mp_f_freemode_01" then
		MySQL.Async.execute('UPDATE gta_joueurs_vetement SET HatsDraw=@HatsDraw WHERE license = @license',{ ['@license'] = license,['@HatsDraw'] = 15})
	end

	MySQL.Async.execute('UPDATE gta_joueurs SET isFirstConnexion=@isFirstConnexion WHERE license = @license',{ ['@license'] = license,['@isFirstConnexion'] = 0})
end)

RegisterServerEvent("GTA:TenueHomme") 
AddEventHandler("GTA:TenueHomme", function(TenueHomme)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	
	MySQL.Async.execute(
	"UPDATE gta_joueurs_vetement SET topsID=@topsid, topsDraw=@topdraw, topsCouleur=@topscouleur, undershirtsID=@undershirtsid, undershirtsDraw=@undershirtsdraw, undershirtsCouleur=@undershirtscouleur, shoesID=@shoesid, shoesDraw=@shoesdraw, shoesCouleur=@shoescouleur, legsID=@legsid, legsDraw=@legsdraw, legsCouleur=@legscouleur, torsosID=@torsosid, torsosDraw=@torsosdraw, AccessoiresID=@accessoiresid, AccessoiresDraw=@Accessoiresdraw, AccessoiresCouleur=@Accessoirescouleur WHERE license=@license", {
	['@license'] = license,
	['@topsid'] = 				TenueHomme["Tops"].componentId,
	['@topdraw'] = 				TenueHomme["Tops"].drawableId, 
	['@topscouleur'] = 			TenueHomme["Tops"].textureId, 
	['@undershirtsid'] = 		TenueHomme["Undershirts"].componentId,
	['@undershirtsdraw'] = 		TenueHomme["Undershirts"].drawableId, 
	['@undershirtscouleur'] = 	TenueHomme["Undershirts"].textureId,
	['@shoesid'] = 				TenueHomme["Shoes"].componentId, 
	['@shoesdraw'] = 			TenueHomme["Shoes"].drawableId,
	['@shoescouleur'] = 		TenueHomme["Shoes"].textureId,
	['@legsid'] = 				TenueHomme["Legs"].componentId, 
	['@legsdraw'] = 			TenueHomme["Legs"].drawableId, 
	['@legscouleur'] = 			TenueHomme["Legs"].textureId, 
	['@torsosid'] = 			TenueHomme["Torsos"].componentId, 
	['@torsosdraw'] = 			TenueHomme["Torsos"].drawableId,
	['@accessoiresid'] = 		TenueHomme["Accessories"].componentId,
	['@Accessoiresdraw'] = 		TenueHomme["Accessories"].drawableId,
	['@Accessoirescouleur'] = 	TenueHomme["Accessories"].textureId})
end)

RegisterServerEvent("GTA:TenueFemme")
AddEventHandler("GTA:TenueFemme", function(TenueFemme)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	
	MySQL.Async.execute(
	"UPDATE gta_joueurs_vetement SET topsID=@topsid, topsDraw=@topdraw, topsCouleur=@topscouleur, undershirtsID=@undershirtsid, undershirtsDraw=@undershirtsdraw, undershirtsCouleur=@undershirtscouleur, shoesID=@shoesid, shoesDraw=@shoesdraw, shoesCouleur=@shoescouleur, legsID=@legsid, legsDraw=@legsdraw, legsCouleur=@legscouleur, torsosID=@torsosid, torsosDraw=@torsosdraw, AccessoiresID=@accessoiresid, AccessoiresDraw=@Accessoiresdraw, AccessoiresCouleur=@Accessoirescouleur WHERE license=@license", {
	['@license'] = license,
	['@topsid'] = 				TenueFemme["Tops"].componentId,
	['@topdraw'] = 				TenueFemme["Tops"].drawableId, 
	['@topscouleur'] = 			TenueFemme["Tops"].textureId, 
	['@undershirtsid'] = 		TenueFemme["Undershirts"].componentId,
	['@undershirtsdraw'] = 		TenueFemme["Undershirts"].drawableId, 
	['@undershirtscouleur'] = 	TenueFemme["Undershirts"].textureId,
	['@shoesid'] = 				TenueFemme["Shoes"].componentId, 
	['@shoesdraw'] = 			TenueFemme["Shoes"].drawableId,
	['@shoescouleur'] = 		TenueFemme["Shoes"].textureId,
	['@legsid'] = 				TenueFemme["Legs"].componentId, 
	['@legsdraw'] = 			TenueFemme["Legs"].drawableId, 
	['@legscouleur'] = 			TenueFemme["Legs"].textureId, 
	['@torsosid'] = 			TenueFemme["Torsos"].componentId, 
	['@torsosdraw'] = 			TenueFemme["Torsos"].drawableId,
	['@accessoiresid'] = 		TenueFemme["Accessories"].componentId,
	['@Accessoiresdraw'] = 		TenueFemme["Accessories"].drawableId,
	['@Accessoirescouleur'] = 	TenueFemme["Accessories"].textureId})
end)

RegisterServerEvent("GTA:LoadVetement")
AddEventHandler("GTA:LoadVetement",function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs_vetement WHERE license = @license',{['@license'] = license}, function(res1)
		TriggerClientEvent("GTA:UpdateVetement", source,{res1[1].topsID, res1[1].topsDraw, res1[1].topsCouleur, res1[1].undershirtsID, res1[1].undershirtsDraw, res1[1].undershirtsCouleur, res1[1].torsosID, res1[1].torsosDraw, res1[1].legsID, res1[1].legsDraw, res1[1].legsCouleur, res1[1].shoesID, res1[1].shoesDraw, res1[1].shoesCouleur, res1[1].AccessoiresID, res1[1].AccessoiresDraw, res1[1].AccessoiresCouleur, res1[1].HatsID, res1[1].HatsDraw, res1[1].HatsCouleurs, res1[1].MaskID, res1[1].MaskDraw})
	end)
end)
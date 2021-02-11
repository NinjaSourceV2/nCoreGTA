 --||@SuperCoolNinja. && RamexDeltaXOO||--
 
 math.randomseed(os.time()) --> permet de generer un nombre aleatoire pour votre numero de phone.

 --- Pour les numero du style XXX-XXX
 local function getPhoneRandomNumber()
    local numBase0 = math.random(100,999)
    local numBase1 = math.random(0,999)
    local num = string.format("%03d-%03d", numBase0, numBase1)

	return num
end

function getHistoriqueCall (num)
	local res = MySQL.Async.execute("SELECT * FROM phone_calls WHERE owner = @num ORDER BY time DESC LIMIT 120", {['@num'] = num})	
    return res
end

function sendHistoriqueCall(src, num) 
	MySQL.Async.fetchAll('SELECT * FROM phone_calls WHERE owner = @num ORDER BY time DESC LIMIT 120',{['@num'] = num}, function(res)
		TriggerClientEvent('gcPhone:historiqueCall', src, res)
	end)
end

RegisterServerEvent("GTA:CreationPersonnage") --> Check a chaque spawn, si vous avez un personnage ou non.
AddEventHandler("GTA:CreationPersonnage", function()
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
    
	--> Si le joueurs n'a pas de perso on lui renvoi au menu de création sinon on charge le perso : 
	local isFirstConnection = MySQL.Sync.fetchScalar("SELECT isFirstConnection FROM gta_joueurs WHERE license = @username", {['@username'] = license})
	if isFirstConnection then
		MySQL.Async.execute('INSERT INTO gta_joueurs_humain (`license`) VALUES (@license)',{ ['@license'] = license})
		MySQL.Async.execute('INSERT INTO gta_joueurs_vetement (`license`) VALUES (@license)',{ ['@license'] = license})
		
		local randomPhoneNumber = getPhoneRandomNumber() 
		MySQL.Async.execute('UPDATE gta_joueurs SET phone_number=@phone_number WHERE license = @license',{ ['@license'] = license,['@phone_number'] = randomPhoneNumber})
		MySQL.Async.execute('UPDATE gta_joueurs SET isFirstConnection=@isFirstConnection WHERE license = @license',{ ['@license'] = license,['isFirstConnection'] = 0})
		TriggerClientEvent("GTA:BeginCreation", source)
	else
		MySQL.Async.fetchAll('SELECT * FROM gta_joueurs_humain WHERE license = @license',{['@license'] = license}, function(res2)
			TriggerClientEvent("GTA:UpdatePersonnage", source, res2[1].sex, res2[1].cheveux, res2[1].couleurCheveux, res2[1].couleurYeux, res2[1].pere, res2[1].mere, res2[1].couleurPeau, res2[1].visage)
		end)
	end

	Wait(1000)
	
	--GCPHONE Chargement du numéro : 
	local Myphone_number = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @username", {['@username'] = license})
		if Myphone_number then
			TriggerClientEvent("gcPhone:myPhoneNumber", source, Myphone_number)
			
			MySQL.Async.fetchAll('SELECT * FROM phone_users_contacts WHERE identifier = @identifier',{['@identifier'] = license}, function(res2)
				TriggerClientEvent("gcPhone:contactList", source, res2)
			end)

			MySQL.Async.execute('SELECT phone_messages.* FROM phone_messages LEFT JOIN gta_joueurs ON gta_joueurs.license = @identifier WHERE phone_messages.receiver = gta_joueurs.phone_number',{ ['identifier'] = license},function(result) 
				if (result) then
					TriggerClientEvent("gcPhone:allMessage", source, result)
				end
			end)

			sendHistoriqueCall(source, Myphone_number)
		end

	TriggerClientEvent("GTA:JoueurLoaded", source) --> Load l'argent du joueur.
end)


RegisterServerEvent("GTA:UpdateSexPersonnage")
AddEventHandler("GTA:UpdateSexPersonnage",function(sex)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET sex=@sex WHERE license = @license',{ ['@license'] = license,['@sex'] = sex})

	if sex == "mp_m_freemode_01" then
		MySQL.Async.execute('UPDATE gta_joueurs_vetement SET HatsDraw=@HatsDraw WHERE license = @license',{ ['@license'] = license,['@HatsDraw'] = 8})
	elseif sex == "mp_f_freemode_01" then
		MySQL.Async.execute('UPDATE gta_joueurs_vetement SET HatsDraw=@HatsDraw WHERE license = @license',{ ['@license'] = license,['@HatsDraw'] = 15})
	end

	TriggerClientEvent("GTA:ChangerSex", source, sex)
end)

RegisterServerEvent("GTA:UpdateVisage")
AddEventHandler("GTA:UpdateVisage", function(visage)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET visage=@visage WHERE license = @license',{ ['@license'] = license,['@visage'] = visage})
	TriggerClientEvent("GTA:ChangerVisage", source, visage)
end)

RegisterServerEvent("GTA:UpdateCouleurPeau")
AddEventHandler("GTA:UpdateCouleurPeau",function(peauID)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET couleurPeau=@couleurPeau WHERE license = @license',{ ['@license'] = license,['@couleurPeau'] = peauID})
	TriggerClientEvent("GTA:ChangerCouleurPeau", source, peauID)
end)

RegisterServerEvent("GTA:UpdateYeux")
AddEventHandler("GTA:UpdateYeux",function(yeux)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET couleurYeux=@couleurYeux WHERE license = @license',{ ['@license'] = license,['@couleurYeux'] = yeux})
	TriggerClientEvent("GTA:ChangerCouleurYeux", source, yeux)
end)

RegisterServerEvent("GTA:UpdateDad")
AddEventHandler("GTA:UpdateDad",function(dad)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET pere=@pere WHERE license = @license',{ ['@license'] = license,['@pere'] = dad})
	TriggerClientEvent("GTA:ChangerDad", source, dad)
end)

RegisterServerEvent("GTA:UpdateMom")
AddEventHandler("GTA:UpdateMom",function(mom)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET mere=@mere WHERE license = @license',{ ['@license'] = license,['@mere'] = mom})
	TriggerClientEvent("GTA:ChangerMom", source, mom)
end)

RegisterServerEvent("GTA:UpdateCheveux")
AddEventHandler("GTA:UpdateCheveux",function(cheveuxID)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET cheveux=@cheveux WHERE license = @license',{ ['@license'] = license,['@cheveux'] = cheveuxID})
	TriggerClientEvent("GTA:ChangerCoupeCheveux", source, cheveuxID)
end)


RegisterServerEvent("GTA:UpdateCouleurCheveux")
AddEventHandler("GTA:UpdateCouleurCheveux",function(couleurID)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute('UPDATE gta_joueurs_humain SET couleurCheveux=@couleurCheveux WHERE license = @license',{ ['@license'] = license,['@couleurCheveux'] = couleurID})
	TriggerClientEvent("GTA:ChangerCouleurCheveux", source, couleurID)
end)


RegisterServerEvent("GTA:TenueHomme") 
AddEventHandler("GTA:TenueHomme", function(TenueHomme)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	
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
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	
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
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end

	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs_vetement WHERE license = @license',{['@license'] = license}, function(res1)
		TriggerClientEvent("GTA:UpdateVetement", source,{res1[1].topsID, res1[1].topsDraw, res1[1].topsCouleur, res1[1].undershirtsID, res1[1].undershirtsDraw, res1[1].undershirtsCouleur, res1[1].torsosID, res1[1].torsosDraw, res1[1].legsID, res1[1].legsDraw, res1[1].legsCouleur, res1[1].shoesID, res1[1].shoesDraw, res1[1].shoesCouleur, res1[1].AccessoiresID, res1[1].AccessoiresDraw, res1[1].AccessoiresCouleur, res1[1].HatsID, res1[1].HatsDraw, res1[1].HatsCouleurs})
	end)
end)


RegisterServerEvent("GTA:UpdateNom") --> Update votre nom de famille a la création d'identité.
AddEventHandler("GTA:UpdateNom", function(nameInput)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	local newName = nameInput
	if tostring(newName) == nil then
		return false
	end

	MySQL.Async.execute("UPDATE gta_joueurs SET nom=@nom WHERE license=@license", {['@license'] = license, ['@nom'] = tostring(newName)})
end)


RegisterServerEvent("GTA:UpdatePrenom") --> Update votre prénom a la création d'identité.
AddEventHandler("GTA:UpdatePrenom", function(prenomInput)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	local newPrenom = prenomInput
	if tostring(newPrenom) == nil then
		return false
	end
	
	MySQL.Async.execute("UPDATE gta_joueurs SET prenom=@prenom WHERE license=@license", { ['@license'] = license, ['@prenom'] = tostring(newPrenom)})
end)

RegisterServerEvent("GTA:UpdateAge")  --> Update votre age a la création d'identité.
AddEventHandler("GTA:UpdateAge", function(ageInput)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	local newAge = ageInput
	if tonumber(ageInput) == nil then
      return false
	end

	MySQL.Async.execute("UPDATE gta_joueurs SET age=@age WHERE license=@license", { ['@license'] = license, ['@age'] = tostring(newAge)})
end)

RegisterServerEvent("GTA:UpdateTaille") --> Update votre taille exemple 180 = 1.80 metre a la création d'identié.
AddEventHandler("GTA:UpdateTaille", function(tailleInput)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	local newTaille = tailleInput
	if tonumber(tailleInput) == nil then
		return false
	end

	MySQL.Async.execute("UPDATE gta_joueurs SET taille=@taille WHERE license=@license", { ['@license'] = license, ['@taille'] = tostring(newTaille)})
end)

RegisterServerEvent("GTA:UpdateOrigin") --> Update votre orgine a la création d'identité.
AddEventHandler("GTA:UpdateOrigin", function(oriInput)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	local newName = oriInput
	if tostring(newName) == nil then
		return false
	end

	MySQL.Async.execute("UPDATE gta_joueurs SET origine=@origine WHERE license=@license", { ['@license'] = license, ['@origine'] = tostring(newName)})
end)

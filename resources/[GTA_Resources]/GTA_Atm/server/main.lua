--||@SuperCoolNinja.||--

RegisterServerEvent('nBanqueSolde:SRender')
AddEventHandler('nBanqueSolde:SRender', function()
	local source = source	
	TriggerEvent("GTA:GetArgentBanque", source, function(qtyBank)
		TriggerClientEvent('nBanqueSolde:CRender', source, qtyBank)
	end)
end)


--> Retirer de l'argent de votre compte en banque :
RegisterServerEvent('nBanqueSolde:RequestRetirerArgentBanque')
AddEventHandler('nBanqueSolde:RequestRetirerArgentBanque', function(somme)
	local source = source 
	TriggerEvent("GTA:GetArgentBanque", source, function(qtyBank)
		if(tonumber(qtyBank) >= tonumber(somme)) then 
			TriggerClientEvent("GTA_Banque:ClientRetirerArgentBanque", source, somme)
			TriggerClientEvent("GTA_Inventaire:AjouterItem", source, "cash", somme)
        else
			TriggerClientEvent("NUI-Notification", source, {"Vous n'avez pas autant d'argent en banque !"})
        end
	end)
end)


--> Deposer de l'argent dans votre compte en banque :
RegisterServerEvent('nBanqueSolde:RequestDeposerArgentBanque')
AddEventHandler('nBanqueSolde:RequestDeposerArgentBanque', function(somme)
	local source = source 
	TriggerEvent("GTA_Inventaire:GetItemQty", source, "cash", function(qtyArgentPropre, itemid)
		if(tonumber(qtyArgentPropre) >= tonumber(somme)) then 
			TriggerClientEvent("GTA_Banque:ClientDeposerArgentBanque", source, somme)
			TriggerClientEvent("GTA_Inventaire:RetirerItem", source, "cash", somme)
        else
			TriggerClientEvent("NUI-Notification", source, {"Vous n'avez pas autant de cash sur vous !"})
        end
	end)
end)
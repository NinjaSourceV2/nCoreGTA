RegisterNetEvent("GTA_Medic:AnalyseTarget")
AddEventHandler("GTA_Medic:AnalyseTarget", function(target)
    local source = source
    local targetPed = GetPlayerPed(target)
    local targetHealth = GetEntityHealth(targetPed)

    if(targetHealth >= 190)then 
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen est en bonne santer.", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Vous êtes en bonne santer.", "success"})
    elseif(targetHealth >= 175) then 
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen présente quelque ématone mais rien de critique.", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Vous présenter quelque ématone mais rien de critique.", "success"})
    else
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen présente quelque bléssure grave il doit être soigner sur le champ.", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Vous présenter quelque bléssure grave.", "success"})
    end
end)

RegisterNetEvent("GTA_Medic:RequestHealTarget")
AddEventHandler("GTA_Medic:RequestHealTarget", function(target)
    local source = source
    TriggerClientEvent("GTA_Medic:HealhTarget", target)
    TriggerClientEvent("NUI-Notification", source, {"Citoyen soigné", "success"})
    TriggerClientEvent("NUI-Notification", target, {"Le médecin vous a soigner", "success"})
end)

RegisterNetEvent("GTA_Medic:RequestReviveTarget")
AddEventHandler("GTA_Medic:RequestReviveTarget", function(target)
    local source = source
    local targetPed = GetPlayerPed(target)
    local targetHealth = GetEntityHealth(targetPed)

    if (targetHealth < 100) then
        TriggerClientEvent("GTA_Medic:ReviveTargetAnimationSource", source)

        Wait(5000)

        TriggerClientEvent("GTA_Medic:ReviveTarget", target)
        TriggerClientEvent("NUI-Notification", source, {"Citoyen réanimer", "success"})
        TriggerClientEvent("NUI-Notification", target, {"Le médecin vous a fait reprendre conscience.", "success"})
    else
        TriggerClientEvent("NUI-Notification", source, {"Le Citoyen est conscien", "success"})
    end
end)

RegisterNetEvent("GTA_Medic:RequestFactureServer")
AddEventHandler("GTA_Medic:RequestFactureServer", function(target, facture)
    local source = source
    TriggerClientEvent("GTA_Medic:RequestFactureTarget", target, facture)
    TriggerClientEvent("NUI-Notification", source, {"Vous avez envoyé une demande de facture.", "success"})
    TriggerClientEvent("NUI-Notification", target, {"Vous avez reçu une facture.", "success"})
end)

RegisterNetEvent("GTA_Medic:FactureAutoriser")
AddEventHandler("GTA_Medic:FactureAutoriser", function(target, facture)
    local source = source

    MySQL.Async.fetchAll('SELECT argent FROM gta_medic_stockage',{}, function(res)
        local argent = res[1].argent + facture
        MySQL.Async.execute("UPDATE gta_medic_stockage SET argent=@newArgent", {['@newArgent'] = tonumber(argent)})
    end)

    TriggerClientEvent("NUI-Notification", target, {"Le citoyen a payé la facture.", "success"})
    TriggerClientEvent("NUI-Notification", source, {"Vous avez payé votre facture.", "success"})
end)


RegisterNetEvent("GTA_Medic:FactureRefuser")
AddEventHandler("GTA_Medic:FactureRefuser", function(target)
    local source = source
    TriggerClientEvent("NUI-Notification", target, {"Le citoyen a refuser de payé la facture.", "success"})
    TriggerClientEvent("NUI-Notification", source, {"Vous avez refuser de payé votre facture.", "success"})
end)

RegisterNetEvent("GTA_Medic:GetAllStock")
AddEventHandler("GTA_Medic:GetAllStock", function()
    local source = source
    MySQL.Async.fetchAll('SELECT * FROM gta_medic_stockage',{}, function(res2)
        TriggerClientEvent("GTA_Medic:RefreshStockage", source, res2)
    end)
end)

RegisterNetEvent("GTA_Medic:RetirerArgentPropreStockage")
AddEventHandler("GTA_Medic:RetirerArgentPropreStockage", function(qty)
    local source = source
    MySQL.Async.fetchAll('SELECT argent FROM gta_medic_stockage',{}, function(res)
        local argentPropre = res[1].argent
        if (argentPropre >= qty) then
            argentPropre = argentPropre - qty
            MySQL.Async.execute("UPDATE gta_medic_stockage SET argent=@newArgent", {['@newArgent'] = tonumber(argentPropre)})
            TriggerClientEvent("GTA_Inventaire:AjouterItem", source, "cash", qty)
            TriggerClientEvent("NUI-Notification", source, {"Vous avez retirer de l'argent propre dans le coffre."})
        else
            TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning"})
        end
    end)
end)

RegisterNetEvent("GTA_Medic:RetirerArgentSaleStockage")
AddEventHandler("GTA_Medic:RetirerArgentSaleStockage", function(qty)
    local source = source
    MySQL.Async.fetchAll('SELECT argent_sale FROM gta_medic_stockage',{}, function(res)
        local argentSale = res[1].argent_sale
        if (argentSale >= qty) then
            argentSale = argentSale - qty
            MySQL.Async.execute("UPDATE gta_medic_stockage SET argent_sale=@newArgent", {['@newArgent'] = tonumber(argentSale)})
            TriggerClientEvent("GTA_Inventaire:AjouterItem", source, "dirty", qty)
            TriggerClientEvent("NUI-Notification",source, {"Vous avez retirer de l'argent sale dans le coffre."})
        else
            TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning"})
        end
    end)
end)

RegisterNetEvent("GTA_Medic:DeposerArgentPropreStockage")
AddEventHandler("GTA_Medic:DeposerArgentPropreStockage", function(qty)
    local source = source

    TriggerEvent('GTA_Inventaire:GetItemQty', source, "cash", function(qtyItem, itemid)
        if (qtyItem >= qty) then 
            MySQL.Async.fetchAll('SELECT argent FROM gta_medic_stockage',{}, function(res)
                local argentPropre = res[1].argent + qty
                MySQL.Async.execute("UPDATE gta_medic_stockage SET argent=@newArgent", {['@newArgent'] = tonumber(argentPropre)})
                TriggerClientEvent('GTA_Inventaire:RetirerItem', source, "cash", itemid, qty)
                TriggerClientEvent("NUI-Notification", source, {"Vous avez deposer de l'argent propre dans le coffre."})
            end)
        else
			TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end)
end)

RegisterNetEvent("GTA_Medic:DeposerArgentSaleStockage")
AddEventHandler("GTA_Medic:DeposerArgentSaleStockage", function(qty)
    local source = source

    TriggerEvent('GTA_Inventaire:GetItemQty', source, "dirty", function(qtyItem, itemid)
        if (qtyItem >= qty) then 
            MySQL.Async.fetchAll('SELECT argent_sale FROM gta_medic_stockage',{}, function(res)
                local argentSale = res[1].argent_sale + qty
                MySQL.Async.execute("UPDATE gta_medic_stockage SET argent_sale=@newArgent", {['@newArgent'] = tonumber(argentSale)})
                TriggerClientEvent('GTA_Inventaire:RetirerItem', source, "dirty", itemid, qty)
                TriggerClientEvent("NUI-Notification", source, {"Vous avez deposer de l'argent sale dans le coffre."})
            end)
        else
			TriggerClientEvent("NUI-Notification", source, {"Montant supérieur au montant disponible.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end)
end)
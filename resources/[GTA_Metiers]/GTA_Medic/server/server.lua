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
    TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
        if (data.argent_propre >= facture) then 
            TriggerEvent('GTA:RetirerArgentPropre', source, facture)
        else
            TriggerEvent('GTA:RetirerArgentBanque', source, facture)
        end
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
RegisterNetEvent("GTA_NUI_ShowNotif_server")
AddEventHandler("GTA_NUI_ShowNotif_server", function()
    TriggerClientEvent("GTA_NUI_ShowNotif_client", source, "Notification Hello World ahahahahah.", "success", "fas fa-check fa-2x", "row", "success")
end)
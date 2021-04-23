RegisterNetEvent("NUI-Notification")
AddEventHandler("NUI-Notification", function(t)
    nuiNotif(t)
end)

function nuiNotif(t)
    setmetatable(t,{__index={b = "success", c = "fa fa-handshake-o fa-2x"}})
    local textNotif, tType, iCon = t[1] or t.a, t[2] or t.b, t[3] or t.c

    exports.GTA_Notif:GTA_NUI_ShowNotification({
        text = textNotif,
        type = tType,
        icon = iCon,
        position = "row-reverse"
    })
end
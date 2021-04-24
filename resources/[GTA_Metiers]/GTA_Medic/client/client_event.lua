local requestFacture = false
local factureMontant = 0
local Duree = 1000

RegisterNetEvent("GTA_Medic:HealhTarget")
AddEventHandler("GTA_Medic:HealhTarget", function()
    local ped = GetPlayerPed(-1)
    SetEntityHealth(ped, 200)
end)

RegisterNetEvent("GTA_Medic:ReviveTarget")
AddEventHandler("GTA_Medic:ReviveTarget", function()
    local ped = GetPlayerPed(-1)
    local x, y, z = table.unpack(GetEntityCoords(ped , true))

    SetEntityHealth(ped, 100.0)
    local pos = GetEntityCoords(ped)
	local h = GetEntityHeading(ped)
	ResurrectPed(ped)
	SetEntityHealth(ped, 200)
	ClearPedTasksImmediately(ped)
	NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z + 0.0, h, true, true, false)
end)

RegisterNetEvent("GTA_Medic:ReviveTargetAnimationSource")
AddEventHandler("GTA_Medic:ReviveTargetAnimationSource", function()
    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_def', 'cpr_pumpchest_idle', _, 262144) 

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144) 

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)

    Wait(1000)

    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'mini@cpr@char_a@cpr_str', 'cpr_pumpchest', _, 262144)
end)


RegisterNetEvent("GTA_Medic:RequestFactureTarget")
AddEventHandler("GTA_Medic:RequestFactureTarget", function(montant)
    Duree = 0
    requestFacture = true
    factureMontant = montant
    PlaySound(-1, "Out_Of_Bounds_Timer", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0, 0, 1)
    TriggerEvent("NUI-Notification", {"Y pour payer votre facture L pour refuser", "success"})
end)


Citizen.CreateThread(function() 
	while true do
		Citizen.Wait(Duree)
        local target = GetPlayerServerId(GetClosestPlayer())
        
        if requestFacture then
            DrawRect(0.912000000000001, 0.292, 0.185, 0.205, 0, 0, 0, 150)
			DrawAdvancedText(0.966000000000001, 0.220, 0.005, 0.0028, 0.7, "Facture ~b~Medic", 255, 255, 255, 255, 1, 1)
			DrawAdvancedText(0.924000000000001, 0.278, 0.005, 0.0028, 0.4, "Montant ~g~"..factureMontant .. "$", 255, 255, 255, 255, 6, 1)
        end
        
		if IsControlJustPressed(1, 246) and requestFacture then --Y
            if target ~= 0 then
				requestFacture = false
				TriggerServerEvent("GTA_Medic:FactureAutoriser", target, tonumber(factureMontant))
			else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
            end
            Duree = 1000
        elseif IsControlJustPressed(1, 182) and requestFacture then --L
            if target ~= 0 then
				TriggerServerEvent("GTA_Medic:FactureRefuser", target)
			else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
			end
            requestFacture = false
            Duree = 1000
        end
	end
end)
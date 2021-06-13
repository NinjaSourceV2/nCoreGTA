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

    RequestAnimDict('mini@cpr@char_b@cpr_str')
    while not HasAnimDictLoaded('mini@cpr@char_b@cpr_str') do
        Citizen.Wait(10)
    end
        
    local myPed = PlayerPedId()
    local animation = 'cpr_success'
    local flags = 262144
    TaskPlayAnim(myPed, 'mini@cpr@char_b@cpr_str', animation, 8.0, -8, -1, flags, 0, 0, 0, 0)

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

--on affiche les blips :
local medicSortieVeh, medicRangerVeh  = nil, nil
RegisterNetEvent("GTA_Medic:AfficherBlipsPoint")
AddEventHandler('GTA_Medic:AfficherBlipsPoint', function ()
    MedicSortieVeh = AddBlipForCoord(1157.5, -1597.98, 34.69)
    SetBlipSprite(MedicSortieVeh,225)		
    SetBlipColour(MedicSortieVeh, 5)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('SORTIE VEHICULE') 
	EndTextCommandSetBlipName(MedicSortieVeh)
	
	medicRangerVeh = AddBlipForCoord(1141.03, -1602.0, 34.69)
	SetBlipSprite(medicRangerVeh,225)		
	SetBlipColour(medicRangerVeh, 69)
	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString('RANGER VEHICULE')
	EndTextCommandSetBlipName(medicRangerVeh)
end)

RegisterNetEvent("GTA_Medic:RetirerBlipsPoint")
AddEventHandler("GTA_Medic:RetirerBlipsPoint", function ()
    if MedicSortieVeh ~= nil and DoesBlipExist(MedicSortieVeh) then
        Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(MedicSortieVeh))
        MedicSortieVeh = nil
	end
	
	if medicRangerVeh ~= nil and DoesBlipExist(medicRangerVeh) then
		Citizen.InvokeNative(0x86A652570E5F25DD,Citizen.PointerValueIntInitialized(medicRangerVeh))
		medicRangerVeh = nil
	end
end)


RegisterNetEvent("GTA_Medic:OnService")
AddEventHandler("GTA_Medic:OnService", function()
    local ped = GetPlayerPed(-1)
    if  exports.nCoreGTA:GetPlayerJobGrade() == "Stagiaire" then
        if GetEntityModel(ped) == 1885233650 then --> Homme
            SetPedComponentVariation(ped, 11, 13, 3, 2)
            SetPedComponentVariation(ped, 8, 15, 0, 2)
            SetPedComponentVariation(ped, 4, 9, 3, 2)
            SetPedComponentVariation(ped, 3, 92, 0, 2)
            SetPedComponentVariation(ped, 6, 25, 0, 2)
            SetPedComponentVariation(ped, 10, 57, 0, 2)
        elseif GetEntityModel(ped) == -1667301416 then --> Femme
            SetPedComponentVariation(ped, 11, 9, 2, 2)
            SetPedComponentVariation(ped, 8, 9, 0, 2)
            SetPedComponentVariation(ped, 4, 3, 3, 2)
            SetPedComponentVariation(ped, 3, 98, 0, 2)
            SetPedComponentVariation(ped, 6, 27, 0, 2)
            SetPedComponentVariation(ped, 10, 57, 0, 2)
        end
    elseif exports.nCoreGTA:GetPlayerJobGrade() == "Medecin" then
        if GetEntityModel(ped) == 1885233650 then --> Homme
            SetPedComponentVariation(ped, 11, 13, 3, 2)
            SetPedComponentVariation(ped, 8, 15, 0, 2)
            SetPedComponentVariation(ped, 4, 9, 3, 2)
            SetPedComponentVariation(ped, 3, 92, 0, 2)
            SetPedComponentVariation(ped, 6, 25, 0, 2)
            SetPedComponentVariation(ped, 10, 8, 1, 2)
        elseif GetEntityModel(ped) == -1667301416 then --> Femme
            SetPedComponentVariation(ped, 11, 9, 2, 2)
            SetPedComponentVariation(ped, 8, 9, 0, 2)
            SetPedComponentVariation(ped, 4, 3, 3, 2)
            SetPedComponentVariation(ped, 3, 98, 0, 2)
            SetPedComponentVariation(ped, 6, 27, 0, 2)
            SetPedComponentVariation(ped, 10, 7, 1, 2)
        end
    end
end)

RegisterNetEvent("GTA_Medic:RefreshStockage")
AddEventHandler("GTA_Medic:RefreshStockage", function(res2)
    Config.Stockage = res2
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
                TriggerServerEvent("GTA:RetirerArgentBanque", factureMontant)
				TriggerServerEvent("GTA_Medic:FactureAutoriser", target, factureMontant)
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
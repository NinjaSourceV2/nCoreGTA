
----> MENU :
mainVestiaire = RageUI.CreateMenu("Vestiaire", "Los Santos Medical Service.")

--> VAR :
local bisPlayerOnService, bisGiletOrangeOn = false, false

--> Main Menu :
function OnVestiaireMenu()
    RageUI.IsVisible(mainVestiaire, function()
        RageUI.Checkbox('Prise de service', "", bisPlayerOnService, {}, {
            onChecked = function()
                TriggerServerEvent("GTA:UpdateService", 1)
                TriggerEvent("GTA_Medic:AfficherBlipsPoint")  --> On ajoute les blips.
                TriggerEvent("NUI-Notification", {"Prise de service"})
                TriggerEvent("GTA_Medic:OnService")
                TriggerServerEvent("player:serviceOn", "medic") --> On lui give le service pour recevoir les appel d'urgence.
            end,
            onUnChecked = function()
                TriggerServerEvent("GTA:LoadVetement")
                TriggerServerEvent("GTA:UpdateService", 0)
                TriggerEvent("NUI-Notification", {"Fin de service"})
                TriggerEvent("GTA_Medic:RetirerBlipsPoint") --> On retire les blips 
                TriggerServerEvent("player:serviceOff", "medic") --> On lui retire le service pour  ne plus recevoir les appel d'urgence.
            end,
            onSelected = function(Index)
                bisPlayerOnService = Index
            end
        })

        RageUI.Checkbox('Veste orange', "", bisGiletOrangeOn, {}, {
            onChecked = function()
                if GetEntityModel(GetPlayerPed(-1)) == 1885233650 then --Homme
					SetPedComponentVariation(GetPlayerPed(-1), 8, 59, 1, 0)
				elseif GetEntityModel(GetPlayerPed(-1)) == -1667301416 then --Femme
					SetPedComponentVariation(GetPlayerPed(-1), 8, 36, 1, 0)
				end
            end,
            onUnChecked = function()
                SetPedComponentVariation(GetPlayerPed(-1), 8, 15, 0, 0)
            end,
            onSelected = function(Index)
                bisGiletOrangeOn = Index
            end
        })
    end, function()end)
end
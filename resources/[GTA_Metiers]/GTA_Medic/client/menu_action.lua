
----> MENU :
local mainMenu = RageUI.CreateMenu("Menu Medic", "Los Santos Medical Service.")
local subInterCitoyen = RageUI.CreateSubMenu(mainMenu, "Menu Medic", "gestion medical.")


--> Main Menu :
function OnMainMenu()
    RageUI.IsVisible(mainMenu, function()
        RageUI.Button("Intéraction Citoyen", "", {}, true, {onSelected = function() end}, subInterCitoyen)
    end, function()end)
end


--> Citoyen menu :
function OnSubCitoyenMenu() 
    RageUI.IsVisible(subInterCitoyen, function()
        
        TriggerEvent("ShowMarkerTarget")

        RageUI.Button("Analyser", "", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            if target ~= 0 then
                TriggerEvent("PlayTaskScenarioInPlace", GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_TIME_OF_DEATH', 8000)
                Wait(8000)
                TriggerServerEvent('GTA_Medic:AnalyseTarget',target)
            else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
            end
        end})

        RageUI.Button("Soigner", "", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            if target ~= 0 then
                TriggerEvent("PlayTaskScenarioInPlace", GetPlayerPed(-1), 'CODE_HUMAN_MEDIC_KNEEL', 8000)
                Wait(8000)
                TriggerServerEvent('GTA_Medic:RequestHealTarget',target)
            else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
            end
        end})

        RageUI.Button("Réanimer", "", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            if target ~= 0 then
                TriggerServerEvent('GTA_Medic:RequestReviveTarget',target)
            else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
            end
        end})

        RageUI.Button("Facture", "", {}, true, {onSelected = function()
            local target = GetPlayerServerId(GetClosestPlayer())
            if target ~= 0 then
                local facture = InputNombre("Facture medic")
                if facture == nil then
                    TriggerEvent("NUI-Notification", {"Facture non valide.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
                else
                    TriggerServerEvent('GTA_Medic:RequestFactureServer', target, facture)
                end
            else
                TriggerEvent("NUI-Notification", {"Aucune personne devant vous.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
            end
        end})
    end, function()end)
end

-------------------------------> Control :
Keys.Register('F6', 'F6', 'Menu Medic.', function()
    --if (Config.Medic.job ~= "Medic") then return end
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
end)



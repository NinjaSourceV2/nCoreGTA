mainMenu = RageUI.CreateMenu("",  "Menu Interaction")
local subInventaire =  RageUI.CreateSubMenu(mainMenu, "Inventaire", "inventaire.")
local subPapiers =  RageUI.CreateSubMenu(mainMenu, "Information personnel", "portefeuille.")
local subTenues =  RageUI.CreateSubMenu(mainMenu, "Tenue", "tenues.")
local subOptions =  RageUI.CreateSubMenu(mainMenu, "Paramètre", "optimisation + option souris.")

local isMouseEnable, hautMis, basMis, chaussureMis, ChapeauMis, isFoodHudEnable, maskMis, capucheMis = true, true, true, true, false, true, true, true
local isEssenceHudActiver = true
local index_vue = 1
local index_ombre = 2

local pInv = {}
local pWeight = 0
local item = {
    item = "",
    label = "",
    count = 0,
    args = {},
    id = 0
}

RegisterNetEvent("GTA:UpdateInventaire")
AddEventHandler("GTA:UpdateInventaire", function(inv, weight)
    if inv ~= nil then pInv = inv end
    if weight ~= nil then pWeight = weight end

    for _,v in pairs(pInv) do
        if v.itemId == item.id then
            item.count = v.count
        end
    end
end)

local pVehListCles = {}
RegisterNetEvent("GTA:UpdateClesVehicule")
AddEventHandler("GTA:UpdateClesVehicule", function(tCles)
    pVehListCles = {}

    for k in pairs(pVehListCles) do
		pVehListCles[k] = nil
	end

    if (tCles ~= nil) then
        for _,v in pairs(tCles) do
            if (v ~= nil) then
                table.insert(pVehListCles, {
                    label = '~g~Clés immatricule ~w~- ~b~'.. v.label,
                    plate = v.plate
                })
            end
        end
    end
end)

Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)
        RageUI.IsVisible(mainMenu, function()
            RageUI.Button('Inventaire', "", {}, true, {
                onSelected = function()
                playerInventaire = exports.nCoreGTA:GetPlayerInv()
                pInv = playerInventaire.inventaire
                pWeight = playerInventaire.weight or 0
                Wait(50)
            end}, subInventaire)

            RageUI.Button('Mon Portefeuille', "", {}, true, {}, subPapiers);
            RageUI.Button('Tenue', "", {}, true, {}, subTenues);
            RageUI.Checkbox('Activer/désactiver hud faim/soif', "", isFoodHudEnable, {}, {
                onChecked = function()
                    TriggerEvent("EnableDisableHUDFS", true)
                end,
                onUnChecked = function()
                    TriggerEvent("EnableDisableHUDFS", false)
                end,
                onSelected = function(Index)
                    isFoodHudEnable = Index
                end
            })
            RageUI.Checkbox('Activer/désactiver hud essence', "", isEssenceHudActiver, {}, {
                onChecked = function()
                    TriggerEvent("fuel-vehicle:AfficherHud", true)
                end,
                onUnChecked = function()
                    TriggerEvent("fuel-vehicle:AfficherHud", false)
                end,
                onSelected = function(Index)
                    isEssenceHudActiver = Index
                end
            })
            RageUI.Button('~g~Sauvegarder', "", {}, true, { onSelected = function() RequestToSave() end});
            RageUI.Button('Paramètre optimisation', "", {}, true, {}, subOptions);
        end, function()end)

        --> SubMenu Inventaire : 
        RageUI.IsVisible(subInventaire, function()
            TriggerEvent("ShowMarkerTarget")
            for _,valeur in pairs(pVehListCles) do
                if (valeur.plate ~= nil) then 
                    RageUI.List(valeur.label, {
                        { Name = "~b~Donner"},
                        { Name = "~h~Donner un double"},
                        { Name = "~h~Renommer"},
                        { Name = "~r~Détruire"},
                    }, valeur.index or 1, "", {}, true, {
                        onListChange = function(Index, Item)
                            valeur.index = Index;
                        end,
                        onSelected = function(Index, Item)
                        if (Index == 1) then --> Give
                            local target = GetPlayerServerId(GetClosestPlayer())
                            if target ~= 0 then
                                TriggerServerEvent("GTA_Garage:DonnerCles", target, valeur.plate)
                                TriggerServerEvent("GTA_Garage:RequestNewCles")
                                TriggerServerEvent("GTA_Garage:RequestNewCles", target)
                            else
                                TriggerEvent("NUI-Notification", {"Aucune personne devant vous !", "warning"})
                            end
                            RageUI.CloseAll()
                        elseif (Index == 2) then  --> Give double
                            local target = GetPlayerServerId(GetClosestPlayer())
                            if target ~= 0 then
                                TriggerServerEvent("GTA_Garage:CopierCles", target, valeur.plate)
                                TriggerServerEvent("GTA_Garage:RequestNewCles")
                                TriggerServerEvent("GTA_Garage:RequestNewCles", target)
                            else
                                TriggerEvent("NUI-Notification", {"Aucune personne devant vous !", "warning"})
                            end
                            RageUI.CloseAll()
                        elseif (Index == 3) then --> Renommer
                            local newLabel = GetInputText("Veuillez saisir un nouveau nom pour votre clé :")
                            TriggerServerEvent("GTA_Garage:RenomerCles", valeur.plate, newLabel)
                            TriggerEvent("NUI-Notification", {"Vous avez renommer votre clé."})
                            RageUI.CloseAll()
                        elseif (Index == 4) then --> Jeter
                            TriggerServerEvent("GTA_Garage:SupprimerCles", valeur.plate)
                            TriggerEvent("NUI-Notification", {"Vous avez jeter votre clé immatricule : " ..valeur.plate})
                            RageUI.CloseAll()
                        end
                    end,
                })
                end
            end

            for _,v in pairs(pInv) do
                if v.count > 0 then 
                    RageUI.List(v.label .. " ".. v.count, {
                            { Name = "Utiliser"},
                            { Name = "~b~Donner"},
                            { Name = "~h~Renomer"},
                            { Name = "~r~Jeter"},
                        }, v.index or 1, "", {}, true, {
                            onListChange = function(Index, Item)
                                v.index = Index;
                            end,

                            onSelected = function(Index, Item)
                                item.label = v.label  
                                item.count = v.count
                                item.args = v.args
                                item.item = v.item
                                item.id = v.itemId

                            if (Index == 1) then --> Use
                                RageUI.CloseAll()
                                TriggerEvent("GTA:UseItem", item.item, item.id)
                            elseif (Index == 2) then  --> Give
                                local target = GetPlayerServerId(GetClosestPlayer())
                                if target ~= 0 then
                                    local qty = GetInputNumber()
                    
                                    if not tonumber(qty) or tonumber(qty) == nil then
                                        TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct. ", "warning"})
                                        return nil
                                    end

                                    if (tonumber(v.count) >= qty) then
                                        TriggerEvent("GTA_Inventaire:DonnerItem", target, item.item, item.id, qty)
                                    else
                                        TriggerEvent("NUI-Notification", {"Vous n'avez pas assez d'items.", "warning"})
                                    end
                                else
                                    TriggerEvent("NUI-Notification", {"Aucune personne devant vous !", "warning"})
                                end
                            elseif (Index == 3) then --> Renomer
                                    local newNameItem = GetInputText("Entrez le nouveau nom de l'item")
                                    TriggerServerEvent("GTA_Inventaire:RenameItem", item.item, newNameItem, item.id)
                                    RageUI.CloseAll()
                            elseif (Index == 4) then  --> Jeter
                                local count = GetInputNumber()
                                if count ~= nil and count > 0 and count <= item.count then
                                    TriggerServerEvent("GTA_Inventaire:DropPropsItem", item.label, item.item, count, GetEntityCoords(GetPlayerPed(-1)))
                                    TriggerEvent("NUI-Notification", {"Vous avez jeter x" ..count.. " "..item.label})
                                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), 'weapons@projectile@sticky_bomb', 'plant_floor') 
                                end
                            end
                        end,
                    })
                end
            end
        end, function() end)

        --> SubMenu Portefeuille : 
        RageUI.IsVisible(subPapiers, function()
            
            TriggerEvent("ShowMarkerTarget")

            RageUI.Button('Regarder votre identité', "", {}, true, {
                onSelected = function()
                    TriggerServerEvent("GTA:GetPlayerInformationsIdentiter")
                    RageUI.CloseAll()
            end});

            RageUI.Button('Montrer votre identité', "", {}, true, {
                onSelected = function()
                    local target = GetPlayerServerId(GetClosestPlayer())
                    if target ~= 0 then
                        TriggerServerEvent("GTA:GetPlayerInformationsIdentiterTarget", target)
                    else
                        TriggerEvent("NUI-Notification", {"Aucune personne devant vous !", "warning"})
                    end
            end})
        end, function() end)

        --> Tenue Menu : 
        RageUI.IsVisible(subTenues, function()
            RageUI.Checkbox('Mettre/Retirer haut', "", hautMis, {}, {
                onChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "clothingtie", "try_tie_negative_a", 1500, 51)
                    TriggerServerEvent("GTA:GetHautJoueur")
                end,
                onUnChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "clothingtie", "try_tie_negative_a", 1500, 51)
                    TriggerEvent("GTA:RetirerHautJoueur")
                end,
                onSelected = function(Index)
                    hautMis = Index
                end
            })

            RageUI.Checkbox('Mettre/Retirer bas', "", basMis, {}, {
                onChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "re@construction", "out_of_breath", 1300, 51)
                    TriggerServerEvent("GTA:GetBasJoueur")
                end,
                onUnChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "re@construction", "out_of_breath", 1300, 51)
                    TriggerEvent("GTA:RetirerBasJoueur")
                end,
                onSelected = function(Index)
                    basMis = Index
                end
            })

            RageUI.Checkbox('Mettre/Retirer chaussures', "", chaussureMis, {}, {
                onChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "random@domestic", "pickup_low", 1200, 0)
                    TriggerServerEvent("GTA:GetChaussureJoueur")
                end,
                onUnChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "random@domestic", "pickup_low", 1200, 0)
                    TriggerEvent("GTA:RetirerChaussureJoueur")
                end,
                onSelected = function(Index)
                    chaussureMis = Index
                end
            })

            RageUI.Checkbox('Mettre/Retirer bonnets', "", ChapeauMis, {}, {
                onChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "mp_masks@standard_car@ds@", "put_on_mask", 600, 51)
                    TriggerServerEvent("GTA:GetBonnetJoueur")
                end,
                onUnChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "mp_masks@standard_car@ds@", "put_on_mask", 600, 51)
                    TriggerEvent("GTA:RetirerBonnetJoueur")
                end,
                onSelected = function(Index)
                    ChapeauMis = Index
                end
            })

            RageUI.Checkbox('Mettre/Retirer mask', "", maskMis, {}, {
                onChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "mp_masks@standard_car@ds@", "put_on_mask", 600, 51)
                    TriggerServerEvent("GTA:GetMaskJoueur")
                end,
                onUnChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "mp_masks@standard_car@ds@", "put_on_mask", 600, 51)
                    TriggerEvent("GTA:RetirerMaskJoueur")
                end,
                onSelected = function(Index)
                    maskMis = Index
                end
            })

            RageUI.Checkbox('Mettre/Retirer capuche', "", capucheMis, {}, {
                onChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "mp_masks@standard_car@ds@", "put_on_mask", 600, 51)
                    TriggerServerEvent("GTA:GetPullCapucheTypeMettre")
                end,
                onUnChecked = function()
                    TriggerEvent("TaskPlayAnimation", GetPlayerPed(-1), "mp_masks@standard_car@ds@", "put_on_mask", 600, 51)
                    TriggerServerEvent("GTA:GetPullCapucheTypeRetirer")
                end,
                onSelected = function(Index)
                    capucheMis = Index
                end
            })
        end, function()end)

        --> Option Menu : 
        RageUI.IsVisible(subOptions, function()
            RageUI.Checkbox('🖱️ Activer/désactiver souris', "", isMouseEnable, {}, {
                onChecked = function()
                    mainMenu:DisplayMouse(true)
                    subInventaire:DisplayMouse(true)
                    subPapiers:DisplayMouse(true)
                    subOptions:DisplayMouse(true)
                end,
                onUnChecked = function()
                    mainMenu:DisplayMouse(false)
                    subInventaire:DisplayMouse(false)
                    subPapiers:DisplayMouse(false)
                    subOptions:DisplayMouse(false)
                end,
                onSelected = function(Index)
                    isMouseEnable = Index
                end
            })

            RageUI.List("Ombre", {
                { Name = "Sans", Value = 0.0 },
                { Name = "Normal", Value = 0.5 },
                { Name = "Complex", Value = 1.0 },
            }, index_ombre, "", {}, true, {
                onListChange = function(Index, Item)
                    index_ombre = Index  
                    config.settings.fDistance_shadow = Item["Value"]
                end
            })

            RageUI.List("Distance d'affichage", {
                { Name = "Proche", Value = 0.5 },
                { Name = "Normal", Value = 1.0 },
                { Name = "Loin", Value = 200.0 },
            }, index_vue, "", {}, true, {
                onListChange = function(Index, Item)
                    index_vue = Index 
                    config.settings.fDistance_vue_lod = Item["Value"]
                end
            })
        end, function()end)
        

        if IsControlJustReleased(0, 244) then
            TriggerServerEvent("GTA:GetPlayerSexServer")
            TriggerServerEvent("GTA_Garage:RefreshTableCles")
            RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
        end

		if IsControlJustReleased(0, 202) and config.showIdentiter then
            config.showIdentiter = false
        end
        
        if RageUI.Visible(mainMenu) or RageUI.Visible(subInventaire) or RageUI.Visible(subPapiers) or RageUI.Visible(subTenues) or RageUI.Visible(subOptions) then 
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
        end

        CascadeShadowsClearShadowSampleType()
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetEntityTrackerScale(config.settings.fDistance_shadow)
        CascadeShadowsSetDynamicDepthValue(config.settings.fDistance_shadow)
        CascadeShadowsSetCascadeBoundsScale(config.settings.fDistance_shadow)
        SetFlashLightFadeDistance(config.settings.fDistance_vue_lod)
        OverrideLodscaleThisFrame(config.settings.fDistance_vue_lod)
        SetLightsCutoffDistanceTweak(config.settings.fDistance_vue_lod)
    end
end)
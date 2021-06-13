local mainMenu = RageUI.CreateMenu("Magasin de vêtement",  "Catégorie de vêtement.")
local tShirtMenu = RageUI.CreateSubMenu(mainMenu, "T-Shirt",  "Magasin de vetement.")
local pullMenu = RageUI.CreateSubMenu(mainMenu, "Pull",  "Magasin de vetement.")
local vesteMenu = RageUI.CreateSubMenu(mainMenu, "Veste",  "Magasin de vetement.")
local pantalonMenu = RageUI.CreateSubMenu(mainMenu, "Pantalon",  "Magasin de vetement.")
local chaussureMenu = RageUI.CreateSubMenu(mainMenu, "Chaussure",  "Magasin de vetement.")
local bonnetMenu = RageUI.CreateSubMenu(mainMenu, "Chapeau",  "Magasin de vetement.")
local accessMenu = RageUI.CreateSubMenu(mainMenu, "Accessoire",  "Magasin de vetement.")
local maskMenu = RageUI.CreateSubMenu(mainMenu, "Mask",  "Magasin de vetement.") --> Mask

local itemName = " "
local Duree = 0
local index_tShirt, index_pull, indexVeste, indexPantalon, indexChaussure, indexChapeau, indexAccess, indexMask = 1, 1, 1, 1, 1, 1, 1, 1

--> TShirt Menu : 
Citizen.CreateThread(function()
    while (true) do

        RageUI.IsVisible(mainMenu, function()
            RageUI.Button('T-Shirt', "", {}, true, {onSelected = function() end}, tShirtMenu)
            RageUI.Button('Pull', "", {}, true, {onSelected = function() end}, pullMenu)
            RageUI.Button('Veste', "", {}, true, {onSelected = function() end}, vesteMenu)
            RageUI.Button('Pantalon', "", {}, true, {onSelected = function() end}, pantalonMenu)
            RageUI.Button('Chaussure', "", {}, true, {onSelected = function() end}, chaussureMenu)
            RageUI.Button('Chapeau', "", {}, true, {onSelected = function() end}, bonnetMenu)
            RageUI.Button('Accessoire', "", {}, true, {onSelected = function() end}, accessMenu)
            RageUI.Button('Mask', "", {}, true, {onSelected = function() end}, maskMenu)
		end, function()end)

        RageUI.IsVisible(tShirtMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('TShirt', tTshirtLabel, index_tShirt, "", {}, true, {
                    onListChange = function(Index, Item)
                        index_tShirt = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 11, tTshirtValue[index_tShirt][1], tTshirtValue[index_tShirt][2], 0)
                        SetPedComponentVariation(GetPlayerPed(-1), 8, tTshirtValue[index_tShirt][5], 0, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), 3, tTshirtValue[index_tShirt][4], 0, 0)
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouveauTshirt", tTshirtValue[index_tShirt][1], tTshirtValue[index_tShirt][2], tTshirtValue[index_tShirt][3], tTshirtValue[index_tShirt][4], tTshirtValue[index_tShirt][5])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)

        RageUI.IsVisible(pullMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Pull', tPullLabel, index_pull, "", {}, true, {
                    onListChange = function(Index, Item)
                        index_pull = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 11, tPullValue[index_pull][1], tPullValue[index_pull][2], 0)
                        SetPedComponentVariation(GetPlayerPed(-1), 8,  tPullValue[index_pull][5], 0, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), 3,  tPullValue[index_pull][4], 0, 0)
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouveauPull", tPullValue[index_pull][1], tPullValue[index_pull][2], tPullValue[index_pull][3], tPullValue[index_pull][4], tPullValue[index_pull][5])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)

        RageUI.IsVisible(vesteMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Veste', tVesteLabel, indexVeste, "", {}, true, {
                    onListChange = function(Index, Item)
                        indexVeste = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 11, tVesteValue[indexVeste][1], tVesteValue[indexVeste][2], 0)
                        SetPedComponentVariation(GetPlayerPed(-1), 8,  tVesteValue[indexVeste][5], 0, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), 3,  tVesteValue[indexVeste][4], 0, 0)
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouvelVeste", tVesteValue[indexVeste][1], tVesteValue[indexVeste][2], tVesteValue[indexVeste][3], tVesteValue[indexVeste][4], tVesteValue[indexVeste][5])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)

        RageUI.IsVisible(pantalonMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Pantalon', tPantalonLabel, indexPantalon, "", {}, true, {
                    onListChange = function(Index, Item)
                        indexPantalon = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 4, tPantalonValue[indexPantalon][1], tPantalonValue[indexPantalon][2], 0)
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouveauPantalon", tPantalonValue[indexPantalon][1], tPantalonValue[indexPantalon][2], tPantalonValue[indexPantalon][3])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)

        RageUI.IsVisible(chaussureMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Chaussure', tChaussureLabel, indexChaussure, "", {}, true, {
                    onListChange = function(Index, Item)
                        indexChaussure = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 6, tChaussureValue[indexChaussure][1], tChaussureValue[indexChaussure][2], 0)
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouvelChaussure", tChaussureValue[indexChaussure][1], tChaussureValue[indexChaussure][2], tChaussureValue[indexChaussure][3])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)


        RageUI.IsVisible(bonnetMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Chapeau', tChapeauLabel, indexChapeau, "", {}, true, {
                    onListChange = function(Index, Item)
                        indexChapeau = Index;
                        SetPedPropIndex(GetPlayerPed(-1), 0, tChapeauValue[indexChapeau][1], 0, 0)
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouveauBonnet", tChapeauValue[indexChapeau][1], tChapeauValue[indexChapeau][2])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)


        RageUI.IsVisible(accessMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Accessoire', tAccessLabel, indexAccess, "", {}, true, {
                    onListChange = function(Index, Item)
                        indexAccess = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 7, tAccessValue[indexAccess][1], 0, 0)	
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouveauAccessoire", tAccessValue[indexAccess][1], tAccessValue[indexAccess][2])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)


        RageUI.IsVisible(maskMenu, function()
			for i = 1, #Config.Locations do
                RageUI.List('Mask', tMaskLabel, indexMask, "", {}, true, {
                    onListChange = function(Index, Item)
                        indexMask = Index;
                        SetPedComponentVariation(GetPlayerPed(-1), 1, tMaskValue[indexMask][1], 0, 0)	
                    end,
                    onSelected = function(Index, Item)
                        TriggerServerEvent("GTA_Vetement:NouveauMask", tMaskValue[indexMask][1], tMaskValue[indexMask][2])
                        RageUI.CloseAll(true)
                    end
                })
            end
		end, function()end)
    Citizen.Wait(Duree)
    end
end)

Citizen.CreateThread(function()
    while true do
        Duree = 250
        if IsNearOfZones() then
            Duree = 0
            
            if GetLastInputMethod(0) then
                Ninja_Core__DisplayHelpAlert("~INPUT_PICKUP~ pour ~b~intéragir")
            else
                Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_EXTRA_OPTION~ pour ~b~intéragir")
            end

            if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then 
                TriggerServerEvent("GTA_Vetement:GetPlayerSexServer")

                Wait(150)
        
                getSexMenu = getSexVetement()
            
                GetLabelTShirt()
                GetLabelPulls()
                GetLabelVeste()
                GetLabelPantalons()
                GetLabelChaussures()
                GetLabelChapeau()
                GetLabelAccessoire()
                GetLabelMask()

                
                RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
            end

            if RageUI.Visible(mainMenu) or RageUI.Visible(tShirtMenu) or RageUI.Visible(pullMenu) or RageUI.Visible(vesteMenu) or RageUI.Visible(pantalonMenu) or RageUI.Visible(chaussureMenu) or RageUI.Visible(bonnetMenu) or RageUI.Visible(accessMenu) == true then 
                DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
                DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
            end
        end
       Citizen.Wait(Duree)
   end
end)
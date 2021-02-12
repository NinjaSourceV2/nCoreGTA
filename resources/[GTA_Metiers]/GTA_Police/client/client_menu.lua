vestiareMenu = RageUI.CreateMenu("Vestiaire",  "vestiaire.")
ArmurerieMenu = RageUI.CreateMenu("Armurerie",  "armurerie.")
GarageMenu = RageUI.CreateMenu("Garage",  "garage lspd.")
MenuAction = RageUI.CreateMenu("Menu Action",  "menu action.")
MenuActionCivil = RageUI.CreateMenu("Intéraction",  "menu interaction.")

GarageMenu.EnableMouse = false

local isEnService, isGiletJauneOn, isGiletOn, isVitreTeinteOn = false, false, false, false
local isMenotter = false
local index = 1
local carSelected = "police"
local ped, isInVeh = nil, nil

Citizen.CreateThread(function()
    while (true) do
    local ped = PlayerPedId()

        if IsPedInAnyVehicle(ped) then
            isInVeh = GetVehiclePedIsIn(ped)
        end

        -- Menu Vestiaire :
        RageUI.IsVisible(vestiareMenu, function() 
            RageUI.Checkbox('Prise de service', "", isEnService, {}, {
                onChecked = function()
                    BeginService()
                end,
                onUnChecked = function()
                    EndService()
                end,
                onSelected = function(Index)
                    isEnService = Index
                end
            })

            RageUI.Checkbox("Gilet Orange", "", isGiletJauneOn, {}, {
                onChecked = function()
                    if GetEntityModel(ped) == 1885233650 then --Homme
                        SetPedComponentVariation(ped, 8, 59, 1, 0)
                    elseif GetEntityModel(ped) == -1667301416 then --Femme
                        SetPedComponentVariation(ped, 8, 36, 1, 0)
                    end
                end,
                onUnChecked = function()
                    SetPedComponentVariation(ped, 8, 15, 0, 0)
                end,
                onSelected = function(Index)
                    isGiletJauneOn = Index
                end
            })

            RageUI.Checkbox("Gilet par balle", "", isGiletOn, {}, {
                onChecked = function()
                    if GetEntityModel(ped) == 1885233650 then --Homme
                        SetPedComponentVariation(ped, 9, 10, 1, 2)
                        SetPedArmour(ped, 100)
                    elseif GetEntityModel(ped) == -1667301416 then --Femme
                        SetPedComponentVariation(ped, 9, 9, 1, 2)
                        SetPedArmour(ped, 100)
                    end
                end,
                onUnChecked = function()
                    SetPedComponentVariation(ped, 9, 14, 1, 2)	
                    SetPedArmour(ped, 0)
                end,
                onSelected = function(Index)
                    isGiletOn = Index
                end
            })
        end, function() end)


        -- Menu Armurerie LSPD :
        RageUI.IsVisible(ArmurerieMenu, function()
            for i = 1, #Config.Locations do
                local item = Config.Locations[i]["Armurerie"]["Items"]
                for _, v in pairs(item.itemName) do
                    RageUI.Button(v, "", {}, true, { 
                    onSelected = function()
                        local qty =  InputNombre("Montant : ")
                        if tonumber(qty) == nil then
                            exports.nCoreGTA:ShowNotification("Veuillez inserer un nombre correct !")
                            return nil
                        end
                        TriggerEvent("GTA_Police:RecevoirArmes",v, qty)
                    end});
                end
            end
        end, function() end)


        -- Menu Garage LSPD :
        RageUI.IsVisible(GarageMenu, function()
            RageUI.List('Véhicule', {
                { Name = "Police Cruiser"},
                { Name = "Buffalo de police"},
                { Name = "Interceptor"},
                { Name = "Police banalisée"},
                { Name = "Fourgon de transport"},
            }, index, "", {}, true, {
                onListChange = function(Index, Item)
                    index = Index;
                    Wait(150)
                    if index == 1 then 
                        carSelected = "police"
                        DestroyMyCar(isInVeh)
                        TriggerEvent("GTA_Police:SortirPoliceVeh", "police")
                    elseif index == 2 then 
                        carSelected = "police2"
                        DestroyMyCar(isInVeh)
                        TriggerEvent("GTA_Police:SortirPoliceVeh", "police2")
                    elseif index == 3 then
                        carSelected = "police3"
                        DestroyMyCar(isInVeh)
                        TriggerEvent("GTA_Police:SortirPoliceVeh", "police3")
                    elseif index == 4 then 
                        carSelected = "police4"
                        DestroyMyCar(isInVeh)
                        TriggerEvent("GTA_Police:SortirPoliceVeh", "police4")
                    elseif index == 5 then
                        carSelected = "policet"
                        DestroyMyCar(isInVeh)
                        TriggerEvent("GTA_Police:SortirPoliceVeh", "policet")
                    end
                end,
                onSelected = function(Index, Item)
                    local colors = table.pack(GetVehicleColours(isInVeh))
                    local primaryColor = colors[1]
                    local secondaryColor = colors[2]

                    SaveInfoCar(carSelected, isInVeh, primaryColor, secondaryColor)
                    RageUI.CloseAll(true)
                end,
            })
        end, function() end)


        -- Menu Action LSPD :
        RageUI.IsVisible(MenuAction, function()
            RageUI.Button("Intéraction Civil", "", {}, true, {}, MenuActionCivil)
        end, function() end)

        -- Menu Intéraction LSPD :
        RageUI.IsVisible(MenuActionCivil, function()
            afficherMarkerTarget()
            local target = GetPlayerServerId(GetClosestPlayer())

            RageUI.Checkbox("Menotter/Démenotter", "", isMenotter, {}, {
                onChecked = function()
                    if target ~= 0 then
                        if (exports.nMenuPersonnel:getQuantity("Menotte") > 0) then
                            TriggerServerEvent('GTA_Police:Menotter_DemenotterServer', true, target)
                        else
                            exports.nCoreGTA:ShowNotification("~r~ Vous n'avez pas de menotte sur vous !")
                        end
                    else
                        exports.nCoreGTA:ShowNotification("~y~ Aucune personne devant vous !")
                    end
                end,

                onUnChecked = function()
                    if target ~= 0 then
                        if (exports.nMenuPersonnel:getQuantity("Menotte") > 0) then
                            TriggerServerEvent('GTA_Police:Menotter_DemenotterServer', false, target)
                        else
                            exports.nCoreGTA:ShowNotification("~r~ Vous n'avez pas de menotte sur vous !")
                        end
                    else
                        exports.nCoreGTA:ShowNotification("~y~ Aucune personne devant vous !")
                    end
                end,
                
                onSelected = function(Index)
                    isMenotter = Index  
                end
            })
        end, function() end)
    Citizen.Wait(waitMenuPoliceOpen)
    end
end)

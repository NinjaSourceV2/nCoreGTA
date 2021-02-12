vestiareMenu = RageUI.CreateMenu("Vestiaire",  "vestiaire.")
GarageMenu = RageUI.CreateMenu("Garage",  "garage medic.")
MenuAction = RageUI.CreateMenu("Menu Action",  "menu action.")
MenuActionCivil = RageUI.CreateMenu("Intéraction",  "menu interaction.")

GarageMenu.EnableMouse = false

local isEnService, isGiletJauneOn, isGiletOn, isVitreTeinteOn = false, false, false, false
local index = 1
local carSelected = "medic"
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
        end, function() end)


        -- Menu Garage MEDIC :
        RageUI.IsVisible(GarageMenu, function()
            RageUI.List('Véhicule', {
                { Name = "Ambulance"},
            }, index, "", {}, true, {
                onListChange = function(Index, Item)
                    index = Index;
                    Wait(150)
                    if index == 1 then 
                        carSelected = "ambulance"
                        DestroyMyCar(isInVeh)
                        TriggerEvent("GTA_Medic:SortirMedicVeh", "medic")
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


        -- Menu Action MEDIC :
        RageUI.IsVisible(MenuAction, function()
            RageUI.Button("Intéraction Civil", "", {}, true, {}, MenuActionCivil)
        end, function() end)

        -- Menu Intéraction MEDIC :
        RageUI.IsVisible(MenuActionCivil, function()
            afficherMarkerTarget()
            local target = GetPlayerServerId(GetClosestPlayer())

            RageUI.Button("Réanimer", "", {}, true, {
                onSelected = function()  
                    TriggerServerEvent("GTA_Medic:Reanimation", target)
                    --système de réanimation à finalisé
                end
            });
        end, function() end)
    Citizen.Wait(waitMenuMedicOpen)
    end
end)

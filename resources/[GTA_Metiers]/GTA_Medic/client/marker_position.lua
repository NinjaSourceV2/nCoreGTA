local TimerSleep = 1000
Citizen.CreateThread(function()
    while (true) do
        TimerSleep = 250
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)
        if IsNearOfZones() then
            TimerSleep = 0

            if GetLastInputMethod(0) then
                TriggerEvent("AlertNear", "~INPUT_PICKUP~ pour ~b~intéragir")
            else
                TriggerEvent("AlertNear", "~INPUT_CELLPHONE_EXTRA_OPTION~ pour ~b~intéragir")
            end
        end

        if GetNearZone() == "VestiaireMenu" then 
            if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                RageUI.Visible(mainVestiaire, not RageUI.Visible(mainVestiaire))
            end
        end

        if GetNearZone() == "MenuVeh" then 
            if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                RageUI.Visible(mainGarage, not RageUI.Visible(mainGarage))
            end
        end

        if GetNearZone() == "RangerVeh" then 
            if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then  
                if IsPedInAnyVehicle(player) then
                    local veh = GetVehiclePedIsIn(player)
                    TriggerEvent("DestroyVehicle", veh)
                else
                    TriggerEvent("NUI-Notification", {"Aucun véhicule trouver.", "warning", "fa fa-exclamation-circle fa-2x", "warning"})
                end 
            end
        end
        Citizen.Wait(TimerSleep)
    end
end)
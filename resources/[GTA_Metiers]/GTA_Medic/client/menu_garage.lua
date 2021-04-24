
----> MENU :
mainGarage = RageUI.CreateMenu("Garage", "Los Santos Medical Service.")

--> Main Menu :
function OnMenuGarage()
    RageUI.IsVisible(mainGarage, function()
        RageUI.Button("Ambulance", "", {}, true, {onSelected = function()
            local vSpawnLocation = {x = 1149.96, y =-1611.23, z = 34.69, h = 281.25}
            TriggerEvent("SpawnVehicule", "Ambulance", vSpawnLocation)
            TriggerEvent("NUI-Notification", {"Votre véhicule vous attend !"})
            RageUI.CloseAll(true)
        end})
    end, function()end)
end
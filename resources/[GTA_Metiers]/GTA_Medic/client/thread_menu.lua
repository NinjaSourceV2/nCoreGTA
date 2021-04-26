-------------------------------> Main Thread :
Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)
        if (Config.Medic.job ~= "Medic") then return end
        OnMainMenu()
        OnSubCitoyenMenu()
        OnVestiaireMenu()
        OnMenuGarage()
        OnMenuStockage()
    end
end)
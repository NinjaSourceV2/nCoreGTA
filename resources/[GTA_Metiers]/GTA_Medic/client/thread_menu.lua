-------------------------------> Main Thread :
Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(1.0)
        OnMainMenu()
        OnSubCitoyenMenu()
        OnVestiaireMenu()
        OnMenuGarage()
        OnMenuStockage()
    end
end)
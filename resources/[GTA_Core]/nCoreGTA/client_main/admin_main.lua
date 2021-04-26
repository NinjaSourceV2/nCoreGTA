local isPlayerAdmin, godmode, isEnablePosition = false
local qtyArgentPropre = 0

--> Executer uniquement au spawn et au restart du core pour refresh si le joueur est admin :
RegisterNetEvent("GTA:UpdatePlayerAdmin")
AddEventHandler("GTA:UpdatePlayerAdmin", function(admin)
    isPlayerAdmin = admin
end)


--> Executer une fois que le joueur se give un item :
RegisterNetEvent("GTA:GivePlayerItem")
AddEventHandler("GTA:GivePlayerItem", function(itemName, qty, maxqty)
    TriggerEvent("player:receiveItem", itemName, qty, maxqty)
end)


--> Commande pour se tp sur un marker :
--> /tpt 
RegisterCommand("tpt", function()
    if (isPlayerAdmin == true) then 
        local waypoint = GetFirstBlipInfoId(8)
        if DoesBlipExist(waypoint) then
            local waypointCoords = GetBlipInfoIdCoord(waypoint)
    
            for height = 1, 1000 do
                SetPedCoordsKeepVehicle(LocalPed(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
    
                local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
    
                if foundGround then
                    SetPedCoordsKeepVehicle(LocalPed(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                    break
                end
                Citizen.Wait(1)
            end
        else
            TriggerEvent("NUI-Notification", {"Veuillez positionner un marker.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end
end, false)


--> Commande pour être invincible : 
--> /god
RegisterCommand("god", function()
    if (isPlayerAdmin == true) then 
        godmode = not godmode
        SetEntityInvincible(GetPlayerPed(-1), godmode)
        if (godmode == true) then
            TriggerEvent("NUI-Notification", {"God Mode activer."})
        else
            TriggerEvent("NUI-Notification", {"God Mode désactiver."})
        end
    end
end, false)

RegisterCommand("kill", function()
    local getPlayer = GetPlayerPed(-1)
    SetEntityHealth(getPlayer, 0)
end, false)


--> Commande pour s'ajouté de l'argent propre :
--> /gap montant 
RegisterCommand("gap", function(source, args, rawCommand)
    qtyArgentPropre = args[1]
    if (isPlayerAdmin == true) then
        if (tonumber(qtyArgentPropre) ~= nil) then
            TriggerServerEvent("GTA_Admin:AjoutArgentPropre", tonumber(qtyArgentPropre))
        else
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end
end, false)


--> Commande pour s'ajouté de l'argent sale :
--> /gas montant
RegisterCommand("gas", function(source, args, rawCommand)
    qtyArgentPropre = args[1]
    if (isPlayerAdmin == true) then
        if (tonumber(qtyArgentPropre) ~= nil) then
            TriggerServerEvent("GTA_Admin:AjoutArgentSale", tonumber(qtyArgentPropre))
        else
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end
end, false)


--> Commande pour s'ajouté de l'argent en banque :
--> /gab montant
RegisterCommand("gab", function(source, args, rawCommand)
    qtyArgentPropre = args[1]
    if (isPlayerAdmin == true) then
        if (tonumber(qtyArgentPropre) ~= nil) then
            TriggerServerEvent("GTA_Admin:AjoutArgentBanque", tonumber(qtyArgentPropre))
        else
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end
end, false)

--> Commande pour s'ajouté des menottes
--> Pour vous give des menottes faite exemple : /give pistol 1. Il recherche au niveau de la bdd item "NAME".
RegisterCommand("give", function(source, args, rawCommand)
    local itemName = args[1]
    local itemQty = args[2]

    itemQty = args[2] or 1
    if (isPlayerAdmin == true) then
        if (itemName == nil) then 
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nom d'item correct exemple : /give Marteau 1.", "error", "fa fa-exclamation-circle fa-2x"})
            return
        end

        TriggerServerEvent("GTA_Admin:GiveItem", itemName, tonumber(itemQty))
    end
end, false)


--> Commande pour supprimer un véhicule
--> Pour supprimer un véhicule faite /pv
RegisterCommand("pv", function(source, args, rawCommand)
    if (isPlayerAdmin == true) then
        local playerPed = GetPlayerPed(-1)
        local veh = GetVehiclePedIsIn(playerPed)
        if IsPedInVehicle(playerPed, veh, false) then
            SetEntityAsMissionEntity(veh, true, true )
            Citizen.InvokeNative(0xEA386986E786A54F, Citizen.PointerValueIntInitialized(veh))
            TriggerEvent("NUI-Notification", {"Véhicule supprimer."})
        else
            TriggerEvent("NUI-Notification", {"Veuillez monter dans un véhicule.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end
end, false)


--> Commande pour afficher votre position x,y,z,h
--> Pour afficher votre position faite /pos
RegisterCommand("pos", function(source, args, rawCommand)
    if (isPlayerAdmin == true) then
        isEnablePosition = not isEnablePosition

        if (isEnablePosition == true) then
            TriggerEvent("NUI-Notification", {"Position afficher", "success"})
        else
            TriggerEvent("NUI-Notification", {"Position retirer", "success"})
        end
    end
end, false)


--> Commande pour vous give un véhicule
--> Pour vous give un véhicule faite exemple: /v adder
RegisterCommand('v', function(source, args, rawCommand)
    if (isPlayerAdmin == true) then
        local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
        local veh = args[1] 
        if veh == nil then TriggerEvent("NUI-Notification", {"Veuillez saisir un nom d'un véhicule.", "warning"}) end
        vehiclehash = GetHashKey(veh)
        RequestModel(vehiclehash)
        
        Citizen.CreateThread(function() 
            local waiting = 0
            while not HasModelLoaded(vehiclehash) do
                waiting = waiting + 100
                Citizen.Wait(100)
                if waiting > 3000 then
                    TriggerEvent("NUI-Notification", {"Veuillez saisir un nom d'un véhicule correct.", "error", "fa fa-exclamation-circle fa-2x"})
                    break
                end
            end
            CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
            TriggerEvent("NUI-Notification", {veh.. " spawn !"})
        end)
    end
end)

-----> AFFICHER POSITION X,Y,Z :
local waitEnablePostition = 1000
Citizen.CreateThread(function () 
    while true do 
        Citizen.Wait(waitEnablePostition)
        if isEnablePosition then
		    waitEnablePostition = 0
            local playerPed = GetPlayerPed(-1)
            local pos = GetEntityCoords(playerPed)
            local posH = GetEntityHeading(playerPed)

            posX = (Floor((pos.x)*100))/100
            posY = (Floor((pos.y)*100))/100
            posZ = (Floor((pos.z)*100))/100
            posH = (Floor((posH)*100))/100

            if posH > 360 then 
                posH = 0.0
            elseif posH < 0 then  
                posH = 360.0
            end

            DrawMissionText("~r~x~w~ = ~r~"..posX.." ~g~y~w~ = ~g~"..posY.." ~b~z~w~ = ~b~"..posZ.." ~w~~h~h = "..posH)
		else
		   waitEnablePostition = 1000
        end
    end 
end)

--> Executer une fois la ressource restart : 
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
	end

    TriggerServerEvent("GTA:CheckAdmin")
end)
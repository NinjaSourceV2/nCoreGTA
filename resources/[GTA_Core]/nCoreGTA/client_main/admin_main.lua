local godmode, isEnablePosition = false, false

--> Commande pour se tp sur un marker :
--> /tpt 
RegisterCommand("tpt", function()
    if (GetIsPlayerAdmin() == true) then 
        local waypoint = GetFirstBlipInfoId(8)
        if DoesBlipExist(waypoint) then
            local waypointCoords = GetBlipInfoIdCoord(waypoint)
    
            for height = 1, 1000 do
                SetPedCoordsKeepVehicle(GetPlayerPed(-1), waypointCoords["x"], waypointCoords["y"], height + 0.0)
    
                local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
    
                if foundGround then
                    SetPedCoordsKeepVehicle(GetPlayerPed(-1), waypointCoords["x"], waypointCoords["y"], height + 0.0)
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
    if (GetIsPlayerAdmin() == true) then 
        godmode = not godmode
        SetEntityInvincible(GetPlayerPed(-1), godmode)
        if (godmode == true) then
            TriggerEvent("NUI-Notification", {"God Mode activer."})
        else
            TriggerEvent("NUI-Notification", {"God Mode désactiver."})
        end
    end
end, false)


--> Commande pour se kill : 
--> /kill
RegisterCommand("kill", function()
    local getPlayer = GetPlayerPed(-1)
    SetEntityHealth(getPlayer, 0)
end, false)


--> Commande pour s'ajouté de l'argent en banque :
--> /gab montant
RegisterCommand("gab", function(source, args, rawCommand)
    local qtyArgentBanque = args[1]
    if (GetIsPlayerAdmin() == true) then
        if (tonumber(qtyArgentBanque) ~= nil) then
            TriggerServerEvent("GTA_Admin:AjoutArgentBanque", tonumber(qtyArgentBanque))
        else
            TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct.", "warning", "fa fa-exclamation-circle fa-2x"})
        end
    end
end, false)


--> Commande pour se give un item :
--> /give "item_name" montant
RegisterCommand("give", function(source, args, rawCommand)
    if (GetIsPlayerAdmin() == true) then
        TriggerServerEvent("GTA_Inventaire:ReceiveItem", args[1], tonumber(args[2]))
    end
end, false)


--> Commande pour supprimer un véhicule
--> Pour supprimer un véhicule faite /dv
RegisterCommand("dv", function(source, args, rawCommand)
    if (GetIsPlayerAdmin() == true) then
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



--> Commande pour vous give un véhicule
--> Pour vous give un véhicule faite exemple: /v adder
RegisterCommand('v', function(source, args, rawCommand)
    if (GetIsPlayerAdmin() == true) then
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
            local vehicule = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
            SetVehicleNumberPlateText(vehicule, "XXXXX")
            TriggerEvent("NUI-Notification", {veh.. " spawn !"})
        end)
    end
end)


--> Commande pour afficher votre position x,y,z,h
--> Pour afficher votre position faite /pos
RegisterCommand("pos", function(source, args, rawCommand)
    if (GetIsPlayerAdmin() == true) then
        isEnablePosition = not isEnablePosition

        if (isEnablePosition == true) then
            TriggerEvent("NUI-Notification", {"Position afficher", "success"})
        else
            TriggerEvent("NUI-Notification", {"Position retirer", "success"})
        end
    end
end, false)


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




--> Basic Noclip Variables
local in_noclip_mode = false
local travelSpeed = 4
local curLocation, curRotation, curHeading
local target
local waitEnableNC = 1000
local rotationSpeed = 1.5
local forwardPush = 0.3
local moveUpKey = 44      -- Q
local moveDownKey = 46    -- E
local moveForwardKey = 32 -- W
local moveBackKey = 33    -- S
local rotateLeftKey = 34  -- A
local rotateRightKey = 35 -- D

--> Commande pour activer/desactiver le mode no clip
--> Pour activer/desactiver le mode no clip faite /nc
RegisterCommand("nc", function(source, args, rawCommand)
    if (GetIsPlayerAdmin() == true) then
        in_noclip_mode = not in_noclip_mode
        
        if (in_noclip_mode == true) then
            local playerPed = PlayerPedId()
            local x, y, z = table.unpack( GetEntityCoords( playerPed, false ) )
            curLocation = { x = x, y = y, z = z }
            curRotation = GetEntityRotation( playerPed, false )
            curHeading = GetEntityHeading( playerPed )
            TriggerEvent("NUI-Notification", {"No-Clip Activer", "success"})
        else
            TriggerEvent("NUI-Notification", {"No-Clip Désactiver", "success"})
        end
    end
end, false)

-- Credits to @Oui (Lambda Menu)
function degToRad( degs )
    return degs * 3.141592653589793 / 180
end

-- Updates the players position
function handleMovement(xVect,yVect)
    if ( IsControlPressed( 1, moveUpKey ) or IsDisabledControlPressed( 1, moveUpKey ) ) then
        curLocation.z = curLocation.z + forwardPush
    elseif ( IsControlPressed( 1, moveDownKey ) or IsDisabledControlPressed( 1, moveDownKey ) ) then
        curLocation.z = curLocation.z - forwardPush
    end

    if ( IsControlPressed( 1, moveForwardKey ) or IsDisabledControlPressed( 1, moveForwardKey ) ) then
        curLocation.x = curLocation.x + xVect
        curLocation.y = curLocation.y + yVect
    elseif ( IsControlPressed( 1, moveBackKey ) or IsDisabledControlPressed( 1, moveBackKey ) ) then
        curLocation.x = curLocation.x - xVect
        curLocation.y = curLocation.y - yVect
    end

    if ( IsControlPressed( 1, rotateLeftKey ) or IsDisabledControlPressed( 1, rotateLeftKey ) ) then
        curHeading = curHeading + rotationSpeed
    elseif ( IsControlPressed( 1, rotateRightKey ) or IsDisabledControlPressed( 1, rotateRightKey ) ) then
        curHeading = curHeading - rotationSpeed
    end
end

Citizen.CreateThread( function()
    while true do
    Citizen.Wait(waitEnableNC)
    if (in_noclip_mode) then
        waitEnableNC = 0
        local playerPed = PlayerPedId()

        if ( IsEntityDead( playerPed ) ) then
            in_noclip_mode = false
            waitEnableNC = 100
        else
            target = playerPed

            -- Handle Noclip Movement.
            local inVehicle = IsPedInAnyVehicle( playerPed, true )

            if ( inVehicle ) then
                target = GetVehiclePedIsUsing( playerPed )
            end

            SetEntityVelocity( playerPed, 0.0, 0.0, 0.0 )
            SetEntityRotation( playerPed, 0, 0, 0, 0, false )

            -- Prevent Conflicts/Damage
            local xVect = forwardPush * math.sin( degToRad(curHeading) ) * -1.0
            local yVect = forwardPush * math.cos( degToRad(curHeading) )

            handleMovement(xVect,yVect)

            -- Update player postion.
            SetEntityCoordsNoOffset( target, curLocation.x, curLocation.y, curLocation.z, true, true, true )
            SetEntityHeading( target, curHeading - rotationSpeed )
        end
    else
        waitEnableNC = 1000
    end
    end
end)
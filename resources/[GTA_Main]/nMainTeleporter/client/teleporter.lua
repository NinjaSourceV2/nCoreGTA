local positionConfig = json.decode(LoadResourceFile(GetCurrentResourceName(), 'json/config.json'))
local Duree = 0
local square = math.sqrt

local function getDistance(a, b) 
    local x, y, z = a.x-b.x, a.y-b.y, a.z-b.z
    return square(x*x+y*y+z*z)
end

local function DisplayHelpAlert(msg)
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(msg);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end

Citizen.CreateThread(function ()
    while true do
        Duree = 1000
        local player = GetPlayerPed(-1)
        local playerLoc = GetEntityCoords(player)

        for i=1, #positionConfig do

            local tpZone   = positionConfig[i]
            
            zone1 = {
                x       =  tpZone.posIn.x,
                y       =  tpZone.posIn.y,
                z       =  tpZone.posIn.z,
                heading =  tpZone.posIn.h
            }
            
            zone2 = {
                x       =  tpZone.posOut.x,
                y       =  tpZone.posOut.y,
                z       =  tpZone.posOut.z,
                heading =  tpZone.posOut.h
            }

            local distanceZone2 = getDistance(playerLoc, zone2)
            local distanceZone1 = getDistance(playerLoc, zone1)

            if distanceZone1 <= 15 then
                Duree = 8
                DrawMarker(tpZone.markerID, zone1.x, zone1.y, zone1.z-1, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, tpZone.markerColor.r, tpZone.markerColor.g, tpZone.markerColor.b, tpZone.markerColor.a)
            end
            
            if distanceZone2 <= 15 then
                Duree = 8
                DrawMarker(tpZone.markerID, zone2.x, zone2.y, zone2.z-1, 0, 0, 0, 0, 0, 0, 1.501, 1.5001, 0.5001, tpZone.markerColor.r, tpZone.markerColor.g, tpZone.markerColor.b, tpZone.markerColor.a)        
            end

            if distanceZone1 < 5 then
                Duree = 0

                if GetLastInputMethod(0) then
                    DisplayHelpAlert("~INPUT_PICKUP~ pour ~b~intéragir")
                else
                    DisplayHelpAlert("~INPUT_CELLPHONE_EXTRA_OPTION~ pour ~b~intéragir")
                end

                if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then 
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), zone2.x, zone2.y, zone2.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), zone2.heading)
                    else
                        SetEntityCoords(player, zone2.x, zone2.y, zone2.z)
                        SetEntityHeading(player, zone2.heading)
                    end
                end
            elseif distanceZone2 < 5 then
                Duree = 0

                if GetLastInputMethod(0) then
                    DisplayHelpAlert("~INPUT_TALK~ pour ~r~sortir")
                else
                    DisplayHelpAlert("~INPUT_CELLPHONE_RIGHT~ pour ~r~sortir")
                end

                if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then 
                    if IsPedInAnyVehicle(player, true) then
                        SetEntityCoords(GetVehiclePedIsUsing(player), zone1.x, zone1.y, zone1.z)
                        SetEntityHeading(GetVehiclePedIsUsing(player), zone1.heading)
                    else
                        SetEntityCoords(player, zone1.x, zone1.y, zone1.z)
                        SetEntityHeading(player, zone1.heading)
                    end
                end
            end
        end
        Citizen.Wait(Duree)
    end
end)
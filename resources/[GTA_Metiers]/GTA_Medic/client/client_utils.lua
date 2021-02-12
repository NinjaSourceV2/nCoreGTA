RegisterNetEvent("GTA:LoadClientJob")
AddEventHandler("GTA:LoadClientJob", function(newJobName, newService, newGrade)
	Config.Medic.grade = newGrade or "Aucun"
	Config.Medic.job = newJobName
	Config.Medic.service = newService
end)

--> No need native to check the distance with this :
local square = math.sqrt
function getDistance(a, b) 
    local x, y, z = a.x-b.x, a.y-b.y, a.z-b.z
    return square(x*x+y*y+z*z)
end

function afficherMarkerTarget()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for _,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = getDistance(targetCoords, plyCoords, true)
			if distance < 2 then
				if(closestDistance == -1 or closestDistance > distance) then
					closestPlayer = value
					closestDistance = distance
					DrawMarker(0, targetCoords["x"], targetCoords["y"], targetCoords["z"] + 1, 0, 0, 0, 0, 0, 0, 0.1, 0.1, 0.1, 255, 255, 255, 200, 0, 0, 0, 0)
				end
			end
		end
	end
end

Ninja_Core__DisplayHelpAlert = function(msg)
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(msg);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end

function InputNombre(reason)
	local text = ""
	AddTextEntry('nombre', reason)
    DisplayOnscreenKeyboard(1, "nombre", "", "", "", "", "", 4)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(10)
    end
    if (GetOnscreenKeyboardResult()) then
        text = GetOnscreenKeyboardResult()
    end
    return text
end

function dump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. dump(v) .. ','
       end
       return s .. '} '
    else
       return tostring(o)
    end
end
 
function LocalPed()
    return GetPlayerPed(-1)
end

function IsNearOfZones()
    for i = 1, #Config.Locations do
        local vestiareZone = Config.Locations[i]["Service"]
        local garagePostionMenu = Config.Locations[i]["Garage"]["GaragePosition"]
        local garageSortitZone =  Config.Locations[i]["Garage"]["SortieVehicule"]
        local garageRentrerZone = Config.Locations[i]["Garage"]["RentrerVehicule"]

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local distService = getDistance(plyCoords, vestiareZone, true)
        local distGarageMenu = getDistance(plyCoords, garagePostionMenu, true)
        local distGarageRentrer = getDistance(plyCoords, garageRentrerZone, true)

        if (distService <= 2.0 or distGarageMenu <= 2.0 or distGarageRentrer <= 2.0) then
            return true
        else
            return false 
        end
    end
end

function GetNearZone()
    for i = 1, #Config.Locations do
        local vestiareZone = Config.Locations[i]["Service"]
        local garagePostionMenu = Config.Locations[i]["Garage"]["GaragePosition"]
        local garageSortitZone =  Config.Locations[i]["Garage"]["SortieVehicule"]
        local garageRentrerZone = Config.Locations[i]["Garage"]["RentrerVehicule"]

        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local distService = getDistance(plyCoords, vestiareZone, true)
        local distGarageMenu = getDistance(plyCoords, garagePostionMenu, true)
        local distGarageRentrer = getDistance(plyCoords, garageRentrerZone, true)

        if (distService <= 2.0) then
            return "ServiceMenu"
        elseif (distGarageMenu <= 5.0) then 
            return "GarageMenu"
        elseif (distGarageRentrer <= 2.0) then
            return "GarageRentrer"
        else
            return nil 
        end
    end
end

function GetNearGarageMenu()
    for i = 1, #Config.Locations do
        local garageMenuPos = Config.Locations[i]["Garage"]["MenuGaragePos"]
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local distGarageMenu = getDistance(plyCoords, garageMenuPos, true)

        if (distGarageMenu <= 5.0) then
            return "GarageMenuPos"
        else
            return nil 
        end
    end
end

function GetClosestPlayer()
	local players = GetPlayers()
	local closestDistance = -1
	local closestPlayer = -1
	local ply = GetPlayerPed(-1)
	local plyCoords = GetEntityCoords(ply, 0)

	for _,value in ipairs(players) do
		local target = GetPlayerPed(value)
		if(target ~= ply) then
			local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
			local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if distance < 5 then
				if(closestDistance == -1 or closestDistance > distance) then
					closestPlayer = value
					closestDistance = distance
				end
			end
		end
	end

	return closestPlayer, closestDistance
end

function GetPlayers()
    local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		players[#players + 1] = player
	end
    return players
end

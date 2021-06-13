local square = math.sqrt
function getDistance(a, b) 
    local x, y, z = a.x-b.x, a.y-b.y, a.z-b.z
    return square(x*x+y*y+z*z)
end

--> Return vrais si vous êtes proche de la zone :
function IsNearOfZones()
    for i = 1, #Config.Locations do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

        --> Position : 
        local vestairePos = Config.Locations[i]["Service"]
        local menuVehicule = Config.Locations[i]["GaragePosition"]
        local rangerVeh = Config.Locations[i]["RentrerVehicule"]
        local stockage = Config.Locations[i]["StockageMenu"]

        --> Distance : 
        local dVestiaire = getDistance(plyCoords, vestairePos, true)
        local dMenuVeh = getDistance(plyCoords, menuVehicule, true)
        local dRangerVeh = getDistance(plyCoords, rangerVeh, true)
        local dStockage = getDistance(plyCoords, stockage, true)
      

        if (dVestiaire <= 5.0) or (dMenuVeh <= 5.0) or (dRangerVeh <= 5.0) or (dStockage <= 5.0) then
            return true
        else
            return false 
        end
    end
end

--> Retourne le nom de votre zone le plus proche :
function GetNearZone()
    for i = 1, #Config.Locations do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)

        --> Position : 
        local vestairePos = Config.Locations[i]["Service"]
        local menuVehicule = Config.Locations[i]["GaragePosition"]
        local rangerVeh = Config.Locations[i]["RentrerVehicule"]
        local stockage = Config.Locations[i]["StockageMenu"]

        --> Distance : 
        local dVestiaire = getDistance(plyCoords, vestairePos, true)
        local dMenuVeh = getDistance(plyCoords, menuVehicule, true)
        local dRangerVeh = getDistance(plyCoords, rangerVeh, true)
        local dStockage = getDistance(plyCoords, stockage, true)



        if (dVestiaire <= 3.0) then
            return "VestiaireMenu"
        elseif (dMenuVeh <= 3.0)then
            return "MenuVeh"
        elseif(dRangerVeh <= 3.0)then
            return "RangerVeh"
        elseif(dStockage <= 3.0)then 
            return "Stockage"
        else
            return nil 
        end
    end
end

local function GetPlayers()
    local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		players[#players + 1] = player
	end
    return players
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


--> Blips Medic : 
Citizen.CreateThread(function()
    for i = 1, #Config.Locations do
        local blip = Config.Locations[i]["Blip"]
        blip = AddBlipForCoord(blip["x"], blip["y"], blip["z"])

        SetBlipSprite(blip, 61)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.9)
        SetBlipColour(blip, 3)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Medic")
        EndTextCommandSetBlipName(blip)
    end
end)


function InputNombre(reason)
	local userNumber = ""
	AddTextEntry('nombre', reason)
    DisplayOnscreenKeyboard(1, "nombre", "", "", "", "", "", 4)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(10)
    end
    if (GetOnscreenKeyboardResult()) then
        userNumber = GetOnscreenKeyboardResult()
    end

	if userNumber == "" or userNumber == "0" then 
		return nil
	end

    return userNumber
end

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end
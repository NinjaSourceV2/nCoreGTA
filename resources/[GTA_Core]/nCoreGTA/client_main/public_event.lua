--[=====[
        Notification :
]=====]

RegisterNetEvent("NUI-Notification")
AddEventHandler("NUI-Notification", function(t)
    setmetatable(t,{__index={b = "success", c = "fa fa-handshake-o fa-2x", d = "row-reverse"}})
    local textNotif, tType, iCon, pPos = t[1] or t.a, t[2] or t.b, t[3] or t.c, t[4] or t.d

    exports.GTA_Notif:GTA_NUI_ShowNotification({
        text = textNotif,
        type = tType,
        icon = iCon,
        position = pPos
    })
end)


--[=====[
            Marker Target :
]=====]
RegisterNetEvent("ShowMarkerTarget")
AddEventHandler("ShowMarkerTarget", function()
    afficherMarkerTarget()
end)

function GetPlayers()
    local players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		players[#players + 1] = player
	end
    return players
end

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
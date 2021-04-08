--@Super.Cool.Ninja

--Intégration de la position dans MySQL
RegisterServerEvent("GTA:SAVEPOS")
AddEventHandler("GTA:SAVEPOS", function( LastPosX , LastPosY , LastPosZ )
	local source = source
	local license = GetPlayerIdentifiers(source)[1]
	local lastPosition = "{" .. LastPosX .. ", " .. LastPosY .. ",  " .. LastPosZ.. "}"
	MySQL.Async.execute("UPDATE gta_joueurs SET `lastpos`=@lastpos WHERE license = @username", {['@username'] = license, ['@lastpos'] = lastPosition})
end)

RegisterServerEvent("GTA:SPAWNPLAYER")
AddEventHandler("GTA:SPAWNPLAYER", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local res = MySQL.Sync.fetchScalar("SELECT lastpos FROM gta_joueurs WHERE license = @username", {['@username'] = license})	
	if (res ~= nil) then
		local newPos = json.decode(res)
		-- On envoie la derniere position vers le client pour le spawn
		TriggerClientEvent("GTA:LASTPOS", source, newPos[1], newPos[2], newPos[3])
	end
end)

RegisterServerEvent("GTA:SetPositionPlayer")
AddEventHandler("GTA:SetPositionPlayer", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local res = MySQL.Sync.fetchScalar("SELECT lastpos FROM gta_joueurs WHERE license = @username", {['@username'] = license})	
	if (res ~= nil) then
		local newPos = json.decode(res)
		-- On envoie la derniere position vers le client pour le spawn
		TriggerClientEvent("GTA:NewPlayerPosition", source, newPos[1], newPos[2], newPos[3])
	end
end)
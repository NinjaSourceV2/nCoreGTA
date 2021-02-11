RegisterServerEvent('nGetStats')
AddEventHandler('nGetStats', function()
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end

	MySQL.Async.fetchAll('SELECT * FROM gta_joueurs WHERE license = @license',{['@license'] = license}, function(res)
		TriggerClientEvent('nGetStats', source, res[1].faim, res[1].soif)
	end)
end)

RegisterServerEvent("nSetFaim")
AddEventHandler("nSetFaim", function(faim)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute("UPDATE gta_joueurs SET faim=@faim WHERE license=@license", { ['@license'] = license, ['@faim'] = tostring(faim)})
end)

RegisterServerEvent("nSetSoif")
AddEventHandler("nSetSoif", function(soif)
	local source = source
	local license = ""
        local Identifiers = GetPlayerIdentifiers(source)
        for _,identifier in ipairs(Identifiers) do
            if string.find(identifier, "license:") then
                license = identifier
            end
        end
	MySQL.Async.execute("UPDATE gta_joueurs SET soif=@soif WHERE license=@license", { ['@license'] = license, ['@soif'] = tostring(soif)})
end)

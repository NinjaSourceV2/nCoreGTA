--||@SuperCoolNinja.||--
local jobsDispo = {}

function nameJob(metiers)
	return MySQL.Async.execute("SELECT metiers FROM gta_metiers WHERE metiers = @metiers", {['@metiers'] = tostring(metiers)})
end

RegisterServerEvent('GTA:UpdateJob') --> Update le job du joueur.
AddEventHandler('GTA:UpdateJob', function(metiers)
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	local job = tostring(metiers)
	MySQL.Async.execute("UPDATE gta_joueurs SET job=@job WHERE license=@license", { ['@license'] = license, ['@job'] = job})
end)

RegisterServerEvent('GTA:LoadJobsJoueur')
AddEventHandler('GTA:LoadJobsJoueur', function()
	local source = source	
	TriggerEvent('GTA:GetInfoJoueurs', source, function(data)
		local travail = data.job
		local service = data.enService
		local grade = data.grade
		TriggerClientEvent('GTA:LoadClientJob', source, tostring(travail), service, tostring(grade)) --> Update les jobs en générale coté client.
	end)
end)

RegisterServerEvent("GTA:GetJobsList")
AddEventHandler("GTA:GetJobsList", function()
	local source = source
	local license = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchAll("SELECT * FROM gta_metiers WHERE emploi = @emploi", {['@emploi'] = "public"}, function(result)
		for k in pairs(jobsDispo) do
			jobsDispo[k] = nil
		end

		for k in ipairs(result) do 
			table.insert(jobsDispo, {
				jobName = result[k].metiers
			})
		end
		TriggerClientEvent("GTA:ListEmploi", source, jobsDispo)
	end)
end)

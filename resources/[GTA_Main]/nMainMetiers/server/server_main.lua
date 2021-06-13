--||@SuperCoolNinja.||--
local jobsDispo = {}

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
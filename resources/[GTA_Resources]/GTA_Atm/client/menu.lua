mainMenu = RageUI.CreateMenu("ATM",  " ")
local Duree = 0

Citizen.CreateThread(function()
	while (true) do
		RageUI.IsVisible(mainMenu, function()
            RageUI.Button('Retirer', "", {}, true, { 
			onSelected = function()
				local nb = GetInputNumber(0)
				if not tonumber(nb) or tonumber(nb) == nil then
	                TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct. ", "warning"})
					return nil
				end
				TriggerServerEvent("nBanqueSolde:PermissionRABanque", nb)
			end});
			 
			RageUI.Button('Deposer', "", {}, true, { onSelected = function()
				local nb = GetInputNumber(0)
				if not tonumber(nb) or tonumber(nb) == nil then
	                TriggerEvent("NUI-Notification", {"Veuillez saisir un nombre correct. ", "warning"})
					return nil
				end
				TriggerServerEvent("nBanqueSolde:PermissionDABanque", nb)
			 end});
			 
			RageUI.Button('Solde', "", {}, true, { onSelected = function()
				TriggerServerEvent("nBanqueSolde:SRender")
			end});
		end, function()end)
        Citizen.Wait(Duree)
    end
end)

Citizen.CreateThread(function()
	while true do
        Duree = 250
		local ply = GetPlayerPed(-1)
		local plyCoords = GetEntityCoords(ply, 0)
		for _, item in pairs(atms) do
			local distance = GetDistanceBetweenCoords(item.x, item.y, item.z,plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
			if(distance <= 5) then
				Duree = 0
				if GetLastInputMethod(0) then
					Ninja_Core__DisplayHelpAlert("~INPUT_PICKUP~ pour ~b~intéragir")
				else
					Ninja_Core__DisplayHelpAlert("~INPUT_CELLPHONE_EXTRA_OPTION~ pour ~b~intéragir")
				end
				
				if (IsControlJustReleased(0, 38) or IsControlJustReleased(0, 214)) then 
					RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))

				end

				if RageUI.Visible(mainMenu) == true then 
					DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
					DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
				end
			end
		end
		Citizen.Wait(Duree)
    end
end)
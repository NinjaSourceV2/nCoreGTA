mainMenu = RageUI.CreateMenu("ATM",  " ")
local Duree = 0

Citizen.CreateThread(function()
	while (true) do
		RageUI.IsVisible(mainMenu, function()
            RageUI.Button('Retirer', "", {}, true, { 
			onSelected = function()
				local quantityMoneyitems = InputNombre("Somme d'argent à retirer :")
				if tonumber(quantityMoneyitems) == nil then
					exports.GTA_Notif:GTA_NUI_ShowNotification({
						text = "Veuillez saisir un nombre correct.",
						type = "error",
						icon = "fa fa-exclamation-circle fa-2x",
						position = "row-reverse"
					})
					return nil
				end
				TriggerServerEvent("nBanqueSolde:PermissionRABanque", quantityMoneyitems)
			end});
			 
			RageUI.Button('Deposer', "", {}, true, { onSelected = function()
				local quantityMoneyBanqueitems = InputNombre("Somme d'argent à déposer :")
				if tonumber(quantityMoneyBanqueitems) == nil then

					exports.GTA_Notif:GTA_NUI_ShowNotification({
						text = "Veuillez saisir un nombre correct.",
						type = "error",
						icon = "fa fa-exclamation-circle fa-2x",
						position = "row-reverse"
					})
					return nil
				end
				TriggerServerEvent("nBanqueSolde:PermissionDABanque", quantityMoneyBanqueitems)
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
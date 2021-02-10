-- DEFAULT VALUES
local pFaim = 100
local pSoif = 100
local enableHud = false --> Ici pour changer le status du hud pour afficher votre faim/soif.

-- TIMER
Citizen.CreateThread(function ()
	while true do
	Citizen.Wait(390000) -->v390000
		RemoveCalories(1.2)
		RemoveWater(1.2)
	end
end)

-- CALORIES
function SetCalories(calories)
	pFaim = calories
	TriggerServerEvent("nSetFaim", pFaim)
end

function AddCalories(calories)
	if pFaim >= 100 then
		return 
	end
	if pFaim + calories <= 100 then
		pFaim = pFaim + calories
	else
		pFaim = 100
	end
	
	TriggerServerEvent("nSetFaim", pFaim)

	Citizen.CreateThread(function()
		RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
		while not HasAnimDictLoaded("amb@code_human_wander_eating_donut@male@idle_a") do
			Wait(0)
		end
		TaskPlayAnim(GetPlayerPed(-1), 'amb@code_human_wander_eating_donut@male@idle_a', 'idle_c', 8.0, -8, -1, 16, 0, 0, 0, 0)
		Citizen.Wait(5000)
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

function RemoveCalories(calories)
	if pFaim == 0 then return end
	if pFaim - calories >= 0 then
		pFaim = pFaim - calories
	else
		pFaim = 0
	end
	if pFaim <= 50 and pFaim > 0 then
		exports.GTA_NOTIF_EXPORT:nNotificationMain({
			text = "Vous avez ~o~faim ~w~!",
			type = 'basGauche',
			nTimeNotif = 6000,
		})
		exports.GTA_NOTIF_EXPORT:Ninja_Core_nRequestAnimSet('move_m@buzzed', 'move_m@buzzed')
	elseif pFaim == 0 then
		SetEntityHealth(GetPlayerPed(-1), 0)
	end
	TriggerServerEvent("nSetFaim", pFaim)
end

-- WATER
function SetWater(water)
	pSoif = water
	TriggerServerEvent("nSetSoif", pSoif)
end

function AddWater(water)
	if pSoif == 100 then return end
	if pSoif + water <= 100 then
		pSoif = pSoif + water
	else
		pSoif = 100
	end
	
	TriggerServerEvent("nSetSoif", pSoif)

	Citizen.CreateThread(function()
		RequestAnimDict('amb@world_human_drinking_fat@beer@male@idle_a')
		while not HasAnimDictLoaded("amb@world_human_drinking_fat@beer@male@idle_a") do
			Wait(0)
		end
		TaskPlayAnim(GetPlayerPed(-1), 'amb@world_human_drinking_fat@beer@male@idle_a', 'idle_a', 8.0, -8, -1, 16, 0, 0, 0, 0)
		Citizen.Wait(5000)
		ClearPedTasks(GetPlayerPed(-1))
	end)
end

function RemoveWater(water)
	if pSoif == 0 then return end
	if pSoif - water >= 0 then
		pSoif = pSoif - water
	else
		pSoif = 0
	end
	if pSoif <= 50 and pSoif > 0 then
	exports.GTA_NOTIF_EXPORT:nNotificationMain({
		text = "Vous êtes ~b~assoiffé~s~ !",
		type = 'basGauche',
		nTimeNotif = 6000,
	})
	elseif pSoif == 0 then
		SetEntityHealth(GetPlayerPed(-1), 0)
	end
	TriggerServerEvent("nSetSoif", pSoif)
end

-- GET VALUES
local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then
		TriggerServerEvent("nGetStats")
		firstspawn = 1
	end
end)

-- NETWORK EVENTS
RegisterNetEvent("nGetStats")
AddEventHandler("nGetStats", function(calories, water, needs)
	SetCalories(calories)
	SetWater(water)
end)

RegisterNetEvent("nAddFaim")
AddEventHandler("nAddFaim", function(calories)
	AddCalories(calories)
end)

RegisterNetEvent("nAddSoif")
AddEventHandler("nAddSoif", function(water)
	AddWater(water)
end)


RegisterNetEvent("nResetStatsFood")
AddEventHandler("nResetStatsFood", function()
	SetCalories(100)
	SetWater(100)
end)

--exports.nCoreStuff:Ninja_Core_nRequestAnimSet('move_m@buzzed', 'move_m@buzzed')
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10)
        if pFaim >= 50 and pSoif >= 50 then
            ResetPedMovementClipset(GetPlayerPed(-1), 0)
        else
           RequestAnimSet("move_m@buzzed")
            while not HasAnimSetLoaded("move_m@buzzed") do
                Citizen.Wait(0)
            end
            SetPedMovementClipset(GetPlayerPed(-1), "move_m@buzzed", 1 )
        end
    end
end) 


RegisterNetEvent('EnableDisableHUDFS')
AddEventHandler('EnableDisableHUDFS', function(bool)
	if bool == true then
		enableHud = true
	else
		enableHud = false
	end
end)

-- FUNCTIONS
local DrawRect = DrawRect
local waitDisplayHud = 1000
function drawStats(x,y,width,height,r,g,b,a)
	DrawRect(x + width/2, y + height/2, width, height, r, g, b, a)
end


--Chargement en boucle pour actualisé vos status Faim/Soif
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(waitDisplayHud)
		if enableHud == true then
			waitDisplayHud = 1
			drawStats(0.013, 0.757, 0.145, 0.0359999999999999, 0, 0, 0, 97) --Background 
			drawStats(0.015, 0.778, 0.141, 0.0109999999999999, 117, 163, 209, 50) --Blackground Water
			drawStats(0.015, 0.760, 0.141, 0.0109999999999999, 209, 163, 117, 50) --Blackground Food
			drawStats(0.015, 0.760, pFaim * 0.141 / 100, 0.0109999999999999, 194, 133, 71, 225) --Faim barre
			drawStats(0.015, 0.778, pSoif * 0.141 / 100, 0.0109999999999999, 71, 133, 194, 225) --Soif barre
		else
			waitDisplayHud = 1000
		end
	end
end)

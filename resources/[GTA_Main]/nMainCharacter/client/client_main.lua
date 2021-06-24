indexii = {}

--> Chargement des noms des tenues :
Citizen.CreateThread(function()
	GetLabelTenue()
end)

--> Spawn character aleatoire :
function GetPlayerModel(modelhash)
	if IsModelValid(modelhash) then
		if not IsPedModel(PlayerPedId(), modelHash) then
			RequestModel(modelhash)
			while not HasModelLoaded(modelhash) do
				Wait(500)
			end

			SetPlayerModel(PlayerId(), modelhash)
		end

		SetPedHeadBlendData(PlayerPedId(), 0, math.random(45), 0, math.random(45), math.random(5), math.random(5),1.0,1.0,1.0,true)
		SetPedHairColor(PlayerPedId(), math.random(1, 4), 1)

		if config.Sex == "mp_m_freemode_01" then
			SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 4,61,0, 0)
			SetPedComponentVariation(PlayerPedId(), 6,34,0, 0)
		else
			SetPedComponentVariation(PlayerPedId(), 4,15,0, 0)
			SetPedComponentVariation(PlayerPedId(), 8, 2, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)
			SetPedComponentVariation(PlayerPedId(), 6,35,0, 0)
		end

		SetModelAsNoLongerNeeded(modelhash)
	end
end

function SaisitText(actualtext, max)
    local text = ""
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TTTIP8", "", actualtext, "", "", "", max)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(10)
    end
    if (GetOnscreenKeyboardResult()) then
        text = GetOnscreenKeyboardResult()
    end
    return text
end

local function LoadAnim(dict)
	while not HasAnimDictLoaded(dict) do
		RequestAnimDict(dict)
		Wait(10)
	end
end

--> Gestion de l'introduction du personnage :
function AnimCam()
	--> Chargement de l'animation du player :
	LoadAnim("mp_character_creation@customise@male_a")
	
	DestroyAllCams(true)
	DoScreenFadeOut(1000)
	Citizen.Wait(2000)


	--> Setup des camera d'introduction :
	config.Camera.cam2 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", config.Camera['body'].x, config.Camera['body'].y, config.Camera['body'].z, 0.00, 0.00, 0.00, config.Camera['body'].fov, false, 0)
    SetCamActive(config.Camera.cam2, true)
    RenderScriptCams(true, false, 2000, true, true)

	Citizen.Wait(500)
	DoScreenFadeIn(1000)

	--> On charge un ped de sex homme :
	GetPlayerModel("mp_m_freemode_01")

	-->Spawn du ped juste avant de begin l'animation :
    SetEntityCoords(GetPlayerPed(-1), 405.59, -997.18, -99.00, 0.0, 0.0, 0.0, true)
	SetEntityHeading(GetPlayerPed(-1), 90.00)

	--> Setup de la derniere camera d'introduction :
	config.Camera.cam3 = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", 402.99, -998.02, -99.00, 0.00, 0.00, 0.00, 50.00, false, 0)
    PointCamAtCoord(config.Camera.cam3, 402.99, -998.02, -99.00)
    SetCamActiveWithInterp(config.Camera.cam2, config.Camera.cam3, 5000, true, true)

    TaskPlayAnim(GetPlayerPed(-1), "mp_character_creation@customise@male_a", "intro", 1.0, 1.0, 4000, 0, 1, 0, 0, 0)
    Citizen.Wait(4000)

	SetEntityCoords(PlayerPedId(), 402.9, -996.87, -99.01-2, 0.0, 0.0, 0.0, true)
	SetEntityHeading(GetPlayerPed(-1), 174.22)

	Wait(500)

	FreezeEntityPosition(GetPlayerPed(-1), true)
    
	--> Ouverture du menu :
	TriggerEvent("GTA:BeginMenuCreation")
end


--> Gestion des camera :
function CameraPosition(camera)
	if config.CamPerso then
		local newCam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", config.Camera[camera].x, config.Camera[camera].y, config.Camera[camera].z, 0.00, 0.00, 0.00, config.Camera[camera].fov, false, 0)
		PointCamAtCoord(newCam, config.Camera[camera].x, config.Camera[camera].y, config.Camera[camera].z)
   		SetCamActiveWithInterp(newCam, config.CamPerso, 1000, true, true)
   		config.CamPerso = newCam
	else
		config.CamPerso = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", config.Camera[camera].x, config.Camera[camera].y, config.Camera[camera].z, 0.00, 0.00, 0.00, config.Camera[camera].fov, false, 0)
	    SetCamActive(config.Camera.cam2, true)
	    RenderScriptCams(true, false, 1000, true, true)
	end
end

--> Gestion de la fin de la création du player :
function EndCreation()
	local playerPed = GetPlayerPed(-1)
	DoScreenFadeOut(1000)
	Wait(1000)

	--> Gestion des camera
	SetCamActive(config.CamPerso,  false)
	RenderScriptCams(false,  false,  0,  true,  true)
	config.isMenuEnable = false

	EnableAllControlActions(0)
	FreezeEntityPosition(GetPlayerPed(-1), false)

	--> Nouvel position du joueur :
	SetEntityCoords(playerPed, config.PlayerSpawnPos.x, config.PlayerSpawnPos.y, config.PlayerSpawnPos.z)
	SetEntityHeading(playerPed, config.PlayerSpawnPos.h)

    PlayerLoaded = true
	
	DoScreenFadeIn(1000)
	Wait(1000)
	
	RageUI.Visible(mainMenu, false)

	DisplayRadar(true)
	DisplayHud(true)
	TriggerEvent('EnableDisableHUDFS', true)
end

function Collision()
	for _, player in ipairs(GetActivePlayers()) do
		SetEntityVisible(GetPlayerPed(player), false, false)
		SetEntityVisible(PlayerPedId(), true, true)
		SetEntityNoCollisionEntity(GetPlayerPed(player), GetPlayerPed(-1), false)
    end
end

function Visible()
    while config.isMenuEnable == true do
        Citizen.Wait(0)
        DisableAllControlActions(0)
        Collision()
    end
end

-- Get le nom des tenues : 
function GetLabelTenue()
	for i=1, #config.Outfit, 1 do
		table.insert(indexii, config.Outfit[i].label)
	end
end

RegisterNetEvent("GTA:ChangerSex")
AddEventHandler("GTA:ChangerSex", function(skin)
	config.Sex = skin
end)

RegisterNetEvent("GTA:ChangerVisage")
AddEventHandler("GTA:ChangerVisage",function(aVisage)
	config.Parents.ShapeMixData = aVisage
end)

RegisterNetEvent("GTA:ChangerCouleurPeau")
AddEventHandler("GTA:ChangerCouleurPeau",function(aCPeau)
	config.Parents.SkinMixData = aCPeau
end)

RegisterNetEvent("GTA:ChangerCouleurYeux")
AddEventHandler("GTA:ChangerCouleurYeux",function(yeux)
	config.Character.eyesColorIndex = yeux
end)

RegisterNetEvent("GTA:ChangerDad")
AddEventHandler("GTA:ChangerDad",function(dad)
	config.Parents.dadIndex = dad
end)

RegisterNetEvent("GTA:ChangerMom")
AddEventHandler("GTA:ChangerMom",function(mom)
	config.Parents.momIndex = mom
end)

RegisterNetEvent("GTA:ChangerCoupeCheveux")
AddEventHandler("GTA:ChangerCoupeCheveux",function(aCheveux)
	config.Character.hairIndex = aCheveux
end)

RegisterNetEvent("GTA:ChangerCouleurCheveux")
AddEventHandler("GTA:ChangerCouleurCheveux",function(aCCheveux)
	config.Character.hairColorIndex = aCCheveux
end)

RegisterNetEvent("GTA:UpdatePersonnage")
AddEventHandler("GTA:UpdatePersonnage",function(data)
	config.Sex = data["sex"]
	config.Parents.ShapeMixData = data["visage"]
	config.Parents.SkinMixData =  data["couleurPeau"]
	config.Character.eyesColorIndex = data["yeux"]
	config.Parents.dadIndex = data["pere"]
	config.Parents.momIndex = data["mere"]
    config.Character.hairIndex = data["cheveux"]
	config.Character.hairColorIndex = data["couleur_cheveux"]
	config.Character.barbe_index = data["barbe"]
	config.Character.couleur_barbe_index = data["couleur_barbe"]
	config.Character.sourcil_index = data["sourcil"]
	config.Character.sourcil_couleur = data["couleur_sourcil"]
	config.Character.acnee_index = data["acnee"]
	config.Character.ride_index = data["ride"]
	config.Character.maquillage_index = data["maquillage"]
	config.Character.maquillage_levre_index = data["maquillage_levre"]
	config.Character.poil_index = data["poil"]
	config.Character.couleur_poil_index = data["couleur_poil"]

	local modelhashed = GetHashKey(config.Sex)
	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end
	
	SetPlayerModel(PlayerId(), modelhashed)
	SetModelAsNoLongerNeeded(modelhashed)
		
	--> Visage :
	SetPedHeadBlendData(GetPlayerPed(-1), config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.ShapeMixData, config.Parents.SkinMixData, nil, true)
	
	--> Cheveux : 
	SetPedComponentVariation(GetPlayerPed(-1), 2,config.Character.hairIndex,2,10)
	SetPedHairColor(GetPlayerPed(-1),config.Character.hairColorIndex)

	--> Yeux : 
	SetPedEyeColor(GetPlayerPed(-1), config.Character.eyesColorIndex)

	--> Barbe : 
	SetPedHeadOverlay(GetPlayerPed(-1), 1, config.Character.barbe_index, 1.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1), 1, 1, config.Character.couleur_barbe_index, 1)

	--> Poil au torse : 
	SetPedHeadOverlay(GetPlayerPed(-1), 10, config.Character.poil_index, 1.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1), 10, 1, config.Character.couleur_poil_index, 1)

	--> Sourcil : 
	SetPedHeadOverlay(GetPlayerPed(-1), 2, config.Character.sourcil_index, 1.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1), 2, 1, config.Character.sourcil_couleur_index, 1)

	--> Acnée : 
	SetPedHeadOverlay(GetPlayerPed(-1), 0, config.Character.acnee_index, 1.0)

	--> Peau ridé : 
	SetPedHeadOverlay(GetPlayerPed(-1), 3, config.Character.ride_index, 1.0)

	--> Maquillage : 
	SetPedHeadOverlay(GetPlayerPed(-1), 4, config.Character.maquillage_index, 1.0)

	--> Rouge a levre : 
	SetPedHeadOverlay(GetPlayerPed(-1), 8, config.Character.maquillage_levre_index, 1.0)
    SetPedHeadOverlayColor(GetPlayerPed(-1), 8, 1, config.Character.maquillage_levre_index, 1)


	TriggerServerEvent("GTA:LoadVetement")

	TriggerEvent("NUI-Notification", {"Personnage synchronisé."})
end)


RegisterNetEvent("GTA:UpdateVetement")
AddEventHandler("GTA:UpdateVetement",function(args)
	--> Chargement de vos vêtement accessoire mask :
	SetPedComponentVariation(GetPlayerPed(-1), args[1], args[2], args[3], 0)
	SetPedComponentVariation(GetPlayerPed(-1), args[7], args[8], 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), args[4], args[5], args[6], 0) 
	SetPedComponentVariation(GetPlayerPed(-1), args[9], args[10], args[11], 0) 
	SetPedComponentVariation(GetPlayerPed(-1), args[12], args[13], args[14], 0) 
	SetPedComponentVariation(GetPlayerPed(-1), args[15], args[16], args[17], 0) 
	SetPedComponentVariation(GetPlayerPed(-1), args[21], args[22], 0, 0) --> Mask.
	SetPedPropIndex(GetPlayerPed(-1), args[18], args[19], args[20], 0) --> Chapeau.
end)

RegisterNetEvent("GTA:BeginCreation")
AddEventHandler("GTA:BeginCreation", function()
	FreezeEntityPosition(GetPlayerPed(-1), false)
	DisplayRadar(false)
	DisplayHud(false)
	TriggerEvent('EnableDisableHUDFS', false)
	config.isMenuEnable = true
	AnimCam()
	Visible()
end)

--> Executer une fois la ressource restart : 
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
	end
	TriggerEvent("GTA:BeginCreation")
end)
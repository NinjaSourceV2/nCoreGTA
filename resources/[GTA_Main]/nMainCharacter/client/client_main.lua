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

		if IsPedMale(PlayerPedId()) then
			SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0) --> Accesoires
			SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0) --> Eyes
			SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0) --> Torso2
			SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0) --> Texture
			SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0) --> Torso
		else
			SetPedComponentVariation(PlayerPedId(), 8, 0, 0, 0) --> Accesoires
			SetPedComponentVariation(PlayerPedId(), 7, 0, 0, 0) --> Eyes
			SetPedComponentVariation(PlayerPedId(), 11, 15, 0, 0) --> Torso2
			SetPedComponentVariation(PlayerPedId(), 10, 0, 0, 0) --> Texture
			SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)--> Torso
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


function BeginCreation()
	config.isMenuEnable = true
	DisplayRadar(false)
	TriggerEvent('EnableDisableHUDFS', false)
	AnimCam()
	Visible()
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
	
	DoScreenFadeIn(1000)
	Wait(1000)
	
	RageUI.Visible(mainMenu, false)
	DisplayRadar(true)

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
AddEventHandler("GTA:UpdatePersonnage",function(sex, cheveux, couleurCheveux, couleurYeux, pere, mere, couleurPeau, visage)
	config.Sex = sex
	config.Parents.ShapeMixData = visage
    config.Character.hairIndex = cheveux
	config.Character.hairColorIndex = couleurCheveux
	config.Parents.SkinMixData = couleurPeau
	config.Character.eyesColorIndex = couleurYeux
	config.Parents.dadIndex = pere
	config.Parents.momIndex = mere

	local modelhashed = GetHashKey(config.Sex)
	RequestModel(modelhashed)
	while not HasModelLoaded(modelhashed) do 
	    RequestModel(modelhashed)
	    Citizen.Wait(0)
	end
	
	SetPlayerModel(PlayerId(), modelhashed)
	SetModelAsNoLongerNeeded(modelhashed)
	
	TriggerServerEvent("GTA:LoadVetement")
	
	--print(" Sex : " ..config.Sex .. " Visage : ".. config.Parents.ShapeMixData .. " Cheveux : " ..config.Character.hairIndex.. " couleurCheveux : " ..config.Character.hairColorIndex.. " couleurPeau : " ..config.Parents.SkinMixData.. " couleurYeux : " ..config.Character.eyesColorIndex.. " pere : " ..config.Parents.dadIndex.. " mere : " ..config.Parents.momIndex)
	
	--> Visage :
	SetPedHeadBlendData(GetPlayerPed(-1), config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.ShapeMixData, config.Parents.SkinMixData, nil, true)
	
	--> Cheveux : 
	SetPedComponentVariation(GetPlayerPed(-1), 2,config.Character.hairIndex,2,10)
	SetPedHairColor(GetPlayerPed(-1),config.Character.hairColorIndex)

	--> Yeux : 
	SetPedEyeColor(GetPlayerPed(-1), config.Character.eyesColorIndex)
end)


local topsID = 0; topsDraw = 0; topsCouleur = 0; torsosID = 0; torsosDraw = 0; undershirtsID = 0; undershirtsDraw = 0; legsID = 0;
local legsDraw = 0; legsCouleur = 0; shoesID = 0; shoesDraw = 0; AccessoiresID = 0; AccessoiresDraw = 0; AccessoiresCouleur = 0;
RegisterNetEvent("GTA:UpdateVetement")
AddEventHandler("GTA:UpdateVetement",function(args)
	topsID = tonumber(args[1])
	topsDraw = tonumber(args[2])
	topsCouleur = tonumber(args[3])
	undershirtsID = tonumber(args[4])
	undershirtsDraw = tonumber(args[5])
	undershirtsCouleur = tonumber(args[6])
	torsosID = tonumber(args[7])
	torsosDraw = tonumber(args[8])
	legsID = tonumber(args[9])
	legsDraw = tonumber(args[10])
	legsCouleur = tonumber(args[11])
	shoesID = tonumber(args[12])
	shoesDraw = tonumber(args[13])
	shoesCouleur = tonumber(args[14])
	AccessoiresID = tonumber(args[15])
	AccessoiresDraw = tonumber(args[16])
	AccessoiresCouleur = tonumber(args[17])
	HatsID = tonumber(args[18])
	HatsDraw = tonumber(args[19])
	HatsCouleurs = tonumber(args[20])

	--print("Torse : ", torsosID, torsosDraw, 0)
	--print("Legs : ",  legsID, 	legsDraw, 	legsCouleur)
	--print("Shoes : ", shoesID, 	shoesDraw, 	shoesCouleur)
	--print("undershirts : ", undershirtsID, undershirtsDraw, undershirtsCouleur)
	--print("Tops : ", topsID, topsDraw, topsCouleur)
	--print("Hats : ", HatsID, HatsDraw, HatsCouleurs)

	SetPedComponentVariation(GetPlayerPed(-1), tonumber(topsID), tonumber(topsDraw), tonumber(topsCouleur), 0)		
	SetPedComponentVariation(GetPlayerPed(-1), tonumber(torsosID), tonumber(torsosDraw), 0, 0) 	
	SetPedComponentVariation(GetPlayerPed(-1), tonumber(undershirtsID), tonumber(undershirtsDraw), 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), tonumber(legsID), tonumber(legsDraw), tonumber(legsCouleur), 0)
	SetPedComponentVariation(GetPlayerPed(-1), tonumber(shoesID), tonumber(shoesDraw), 0, 0)
	SetPedComponentVariation(GetPlayerPed(-1), tonumber(AccessoiresID), tonumber(AccessoiresDraw), tonumber(AccessoiresCouleur), 0)
	SetPedPropIndex(GetPlayerPed(-1), tonumber(HatsID), tonumber(HatsDraw), tonumber(HatsCouleurs), 0)
	SetPedComponentVariation(GetPlayerPed(-1), 10, 0, 0, 2)
end)

RegisterNetEvent("GTA:BeginCreation")
AddEventHandler("GTA:BeginCreation", function()
	BeginCreation()
end)
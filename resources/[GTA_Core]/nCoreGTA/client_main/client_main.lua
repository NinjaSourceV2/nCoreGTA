--@Super.Cool.Ninja
local itemsList = config.itemList
local departItemList = {}

--> On refresh les donnée de notre player  :
RegisterNetEvent("GTA:LoadPlayerData")
AddEventHandler("GTA:LoadPlayerData", function(playersInfo, itemsList)
    config.Player = playersInfo
    config.itemList = itemsList

    TriggerServerEvent("GTA:TelephoneLoaded")
	TriggerEvent("GTA_Armes:Init")
end)

--> C'est avec cette event que l'on charge le player au moment du spawn :
RegisterNetEvent("GTA:FirstSpawnPlayer")
AddEventHandler("GTA:FirstSpawnPlayer", function()
    DestroyAllCams(true)
    RenderScriptCams(false, false, 0, true, true)
    
    Wait(1000)

    GetDepartItemList()
    TriggerEvent("GTA:BeginCreation")
    for _, v in pairs(departItemList) do
        TriggerServerEvent("GTA_Inventaire:ReceiveItem", v.name, v.qty)
    end
    exports.spawnmanager:setAutoSpawn(false)
end)

RegisterNetEvent("GTA:SpawnPlayer")
AddEventHandler("GTA:SpawnPlayer", function(posX, posY, posZ)
    DestroyAllCams(true)
    RenderScriptCams(false, false, 0, true, true)

    Wait(3500)

    SetEntityCoords(PlayerPedId(), tonumber(posX), tonumber(posY), tonumber(posZ) + 0.5)

    DisplayRadar(true)
    DisplayHud(true)
    TriggerEvent('EnableDisableHUDFS', true)

    NetworkResurrectLocalPlayer(tonumber(posX), tonumber(posY), tonumber(posZ), 0, true, true, false)
    exports.spawnmanager:setAutoSpawn(false)
end)

function GetDepartItemList()
    for i=1, #config.itemDepart, 1 do
        table.insert(departItemList, {name = config.itemDepart[i]["item_name"], qty = config.itemDepart[i]["item_qty"]})
    end
end

local function AddTextEntry(key, value)
    Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

function DrawMissionText(m_text, showtime)
    ClearPrints()
	SetTextScale(0.5, 0.5)
	SetTextFont(0)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 255)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(2, 0, 0, 0, 150)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(m_text)
	DrawText(0.5, 0.9)
end


--> Création/Load du player :
Citizen.CreateThread(function()
    TriggerServerEvent("GTA:InitJoueur")
end)

--> Synchro toute les 5 minute des donnée du player sauvegarder dans la table PlayerSource :
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(config.timerPlayerSynchronisation)
        TriggerServerEvent("GTA:SyncPlayer")
		TriggerEvent("NUI-Notification", {"Synchronisation éfféctué."})
    end
end)

--> Main Thread :
Citizen.CreateThread(function()
    --> Nom de votre serveur :
    AddTextEntry("FE_THDR_GTAO","~b~Ninja Source ~w~")

    --Cops Dispatch desactiver : 
    for i = 1, 15 do
		EnableDispatchService(i, false)
    end

    --> PVP :
    if config.activerPvp == true then
        for _, v in ipairs(GetActivePlayers()) do
            local ped = GetPlayerPed(v)
            SetCanAttackFriendly(ped, true, true)
            NetworkSetFriendlyFireOption(true)
        end
    end

    --> IPL :
    local ipls = {'facelobby', 'farm', 'farmint', 'farm_lod', 'farm_props', 
    'des_farmhouse', 'post_hiest_unload', 'v_tunnel_hole',
    'rc12b_default', 'refit_unload', 'shr_int', 'Coroner_Int_on'}

    for _,v in pairs(ipls) do
        if not IsIplActive(v) then
            RequestIpl(v)
        end
    end

    --> COPS :
    if config.activerPoliceWanted == false then
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(0)
                local myPlayer = GetEntityCoords(PlayerPedId())	
                
                --> Permet de ne pas recevoir d'indice de recherche :
                if (GetPlayerWantedLevel(PlayerId()) > 0) then
                    SetPlayerWantedLevel(PlayerId(), 0, false)
                    SetPlayerWantedLevelNow(PlayerId(), false)
                end

                --> Permet de ne pas spawn les véhicule de cops prés du poste de police :
                ClearAreaOfCops(myPlayer.x, myPlayer.y, myPlayer.z, 5000.0)
            end
        end)
    end

    --> Salaire :
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(config.salaireTime)
            TriggerServerEvent("GTA:salaire")
        end
    end)

    --> Position Save :
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(config.timerPlayerSyncPos)
            local pPed = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(pPed)
            TriggerServerEvent("GTA:SavePos", pCoords)
        end
    end)
end)

--- System de distance de voix : 
local distance_voix = {}
local currentdistancevoice = 0
distance_voix.Grande = 12.001
distance_voix.Normal = 8.001
distance_voix.Faible = 2.001

RegisterCommand('+changevoice', function()
    currentdistancevoice = (currentdistancevoice + 1) % 3
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(distance_voix.Normal) -- 5 meters range
	    TriggerEvent("NUI-Notification", {"Niveau vocal : normal."})

	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(distance_voix.Grande) -- 12 meters range
	    TriggerEvent("NUI-Notification", {"Niveau vocal : crier."})
	elseif currentdistancevoice == 2 then
        NetworkSetTalkerProximity(distance_voix.Faible) -- 1 meters range
	    TriggerEvent("NUI-Notification", {"Niveau vocal : chuchoter."})
	end
end, false)
AddEventHandler('onClientMapStart', function()
	if currentdistancevoice == 0 then
		NetworkSetTalkerProximity(distance_voix.Normal) -- 5 meters range
	elseif currentdistancevoice == 1 then
		NetworkSetTalkerProximity(distance_voix.Grande) -- 12 meters range
	elseif currentdistancevoice == 2 then
		NetworkSetTalkerProximity(distance_voix.Faible) -- 1 meters range
	end
end)
RegisterCommand('-changevoice', function() end, false)
RegisterKeyMapping('+changevoice', 'Distance de voix', 'keyboard', 'F1')


--> Executer une fois la ressource restart : 
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
	end

	PlaySoundFrontend(-1, "Whistle", "DLC_TG_Running_Back_Sounds", 0)
    TriggerServerEvent("GTA:CreationJoueur")
	exports.spawnmanager:setAutoSpawn(false)
end)







local pickups = {}
local nearObjs = {}

local function DrawText3d(coords, text)
	local _, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
	SetTextScale(0.4, 0.4)
	SetTextFont(0)
	SetTextProportional(true)
	SetTextColour(201, 201, 201, 255)
	SetTextDropShadow()
	SetTextDropshadow(50, 0, 0, 0, 255)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	DrawText(_x, _y)
end

local function LoadModel(model)
	RequestModel(GetHashKey(model))
	while not HasModelLoaded(GetHashKey(model)) do Wait(1) end
end

local function SpawnProp(model, coords)
	LoadModel(model)
	local entity = CreateObject(GetHashKey(model), coords, 0, 0, 0)
	FreezeEntityPosition(entity, true)
	PlaceObjectOnGroundProperly(entity)

	return entity
end

local function KeyboardAmount()
    local amount = nil
    AddTextEntry("CUSTOM_AMOUNT", "Somme à récuperer :")
    DisplayOnscreenKeyboard(1, "CUSTOM_AMOUNT", '', "", '', '', '', 15)

    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(0)
    end

    if UpdateOnscreenKeyboard() ~= 2 then
        amount = GetOnscreenKeyboardResult()
        Citizen.Wait(1)
    else
        Citizen.Wait(1)
    end
    return tonumber(amount)
end

RegisterNetEvent("GTA_Inventaire:SyncPropsItems")
AddEventHandler("GTA_Inventaire:SyncPropsItems", function(pick, id, del, newCount)
    for _,v in pairs(nearObjs) do
        DeleteEntity(v.entity)
    end
    nearObjs = {}
    pickups = pick
    SyncPickups()
end)

function SyncPickups()
    local pPed = GetPlayerPed(-1)
    local pCoords = GetEntityCoords(pPed)
    
    for k,v in pairs(pickups) do
        if #(v.coords - pCoords) < 15 then
            if not v.added then
                table.insert(nearObjs, {itemLabel = v.itemLabel, item = v.item, count = v.count, id = k, coords = v.coords, prop = false, entity = nil})
                pickups[k].added = true
            end
        end
    end
end

function GetItemProp(item)
    for k,v in pairs(itemsList) do
        if k == item then
            if v.prop ~= nil then
                return v.prop
            else
                return "v_med_latexgloveboxblue"
            end
        end
    end
    return "v_med_latexgloveboxblue"
end


Citizen.CreateThread(function()
    while true do
        SyncPickups()
        Wait(500)
    end
end)


Citizen.CreateThread(function()
    while true do
        local isNear = false
        local pPed = GetPlayerPed(-1)
        local pCoords = GetEntityCoords(pPed)

        for k,v in pairs(nearObjs) do
            if v.count == nil then 
                nearObjs[k] = nil
                break
            end
            if not v.prop then
                if v.id == nil then break end
                local prop = GetItemProp(nearObjs[k].item)
                nearObjs[k].entity = SpawnProp(prop, v.coords)
                nearObjs[k].prop = true
            end
            if #(v.coords - pCoords) < 2 then
                isNear = true
                DrawText3d(GetEntityCoords(nearObjs[k].entity), "[~b~E~s~] récuperer x~b~"..v.count.."~s~ ~g~"..v.itemLabel)
                if IsControlJustReleased(0, 38) then
                    local amount = KeyboardAmount()
                    if amount <= v.count then
                        TriggerServerEvent("GTA_Inventaire:RecupererPropsItem", v.id, v.item, amount, v.count)
                        if amount == v.count then
                            if v.id == nil then break end
                            pickups[v.id].added = false
                            DeleteEntity(v.entity)
                            nearObjs[k] = nil
                        end
                    end
                end
                break
            end

            if #(v.coords - pCoords) > 15 then
                if v.id == nil then break end
                pickups[v.id].added = false
                DeleteEntity(v.entity)
                nearObjs[k] = nil
            end
        end

        if isNear then
            Wait(1)
        else
            if #nearObjs > 0 then
                Wait(500)
            else
                Wait(1000)
            end
        end
    end
end)
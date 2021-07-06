
--> Création d'une license unique pour chaque coffre créer :
math.randomseed(GetGameTimer())
function GenerateCoffreId()
    return ""..tostring(math.random(100001,900009)).."_"..tostring(math.random(100001,900009)).."_"..tostring(math.random(100001,900009))
end

--> Gére le preview pour placer le coffre : 
RegisterNetEvent('GTA_Props:SpawnCoffre')
AddEventHandler('GTA_Props:SpawnCoffre', function(item_name, model)
    Citizen.CreateThread(function()
        local instructions = CreateInstuctionScaleform("instructional_buttons")
        local prophash = GetHashKey(model)
        local coffreID = GenerateCoffreId()

        RequestModel(prophash)
        while not HasModelLoaded(prophash) do
            Citizen.Wait(0)
        end

        local spawnCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 5.0, 0.0)
        local _, worldZ = GetGroundZFor_3dCoord(spawnCoords.x, spawnCoords.y, spawnCoords.z)
        local propPreviewPos = CreateObjectNoOffset(prophash, spawnCoords.x, spawnCoords.y, worldZ)
        SetEntityAlpha(propPreviewPos, 200, false)
        SetEntityCollision(propPreviewPos, false)
        local posVertical = spawnCoords.z
        local posHorizontal = spawnCoords.x

        while true do
            Citizen.Wait(0)
            local spawnCoords = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 3.0, 0.0)
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 24, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
            SetFollowPedCamViewMode(4)

            if IsControlPressed(0, 188) then  --> UP
                posVertical = posVertical + 0.01
            end

            if IsControlPressed(0, 173) then  --> DOWN
                posVertical = posVertical - 0.01
            end

            if IsControlPressed(0, 175) then  --> RIGHT
                posHorizontal = posHorizontal + 0.5
            end

            if IsControlPressed(0, 174) then  --> LEFT
                posHorizontal = posHorizontal - 0.5
            end

            if IsControlPressed(0, 177) then --> BACK
                DeleteObject(propPreviewPos)
                return
            end

            if IsControlPressed(0, 106) then --> MOUSE LEFT CLICK
                local entityModel = GetEntityModel(propPreviewPos)

                local secureCode = GetInputNumber("Code de sécurité")
                if tonumber(secureCode) == nil or tonumber(secureCode) == 0 then
                    DeleteObject(propPreviewPos)
                    SetModelAsNoLongerNeeded(prophash)
                    SetEntityAsMissionEntity(propPreviewPos)
                    TriggerEvent("NUI-Notification", {"Placement annuler, Veuillez saisir un code correct.", "warning"})
                    return 
                end

                local nomCoffre = GetInputText("Nom de votre coffre")
                if tostring(nomCoffre) == nil or tostring(nomCoffre) == "" or tonumber(nomCoffre) then
                    DeleteObject(propPreviewPos)
                    SetModelAsNoLongerNeeded(prophash)
                    SetEntityAsMissionEntity(propPreviewPos) 
                    TriggerEvent("NUI-Notification", {"Placement annuler, Veuillez saisir un nom correct.", "warning"})
                    return 
                end

                DeleteObject(propPreviewPos)
                SetModelAsNoLongerNeeded(prophash)
                SetEntityAsMissionEntity(propPreviewPos)
                TriggerServerEvent("GTA_Prop:SaveDataObject", tostring(nomCoffre), entityModel, coffreID, model, spawnCoords, posVertical, posHorizontal, tonumber(secureCode))
                SetFollowPedCamViewMode(1)
                TriggerEvent("GTA_Inventaire:RetirerItem", item_name, 1)
                return
            end

            SetEntityCoordsNoOffset(propPreviewPos, spawnCoords.x, spawnCoords.y, posVertical)
            SetEntityHeading(propPreviewPos, posHorizontal)
            DrawScaleformMovieFullscreen(instructions, 255, 255, 255, 255, 0)
        end
    end)
end)


--> Gére la création du coffre synchronisé pour tout les joueurs :
RegisterNetEvent('GTA_Props:InitObject')
AddEventHandler('GTA_Props:InitObject', function(data)
    local tempTable = {}

    for k in pairs(tempTable) do 
        tempTable[k] = nil
    end

    Citizen.CreateThread(function()
        if (propsobj ~= nil) then
            return 
        end
        
        table.insert(tempTable, data)

        Wait(5000)

        for _, v in pairs(tempTable) do
            local model = GetHashKey(v["model"])
            
            RequestModel(model)
            while not HasModelLoaded(model) do
                Citizen.Wait(0)
            end
            
            local propsobj = CreateObjectNoOffset(model, v["pos"].x, v["pos"].y, v["posY"])
            SetEntityHeading(propsobj, v["posHeading"])
            FreezeEntityPosition(propsobj, true)
        end
    end)
end)

--> Gére l'initialisation des coffre au moment du spawn du player :
RegisterNetEvent('GTA_Props:SpawnObjectClientSync')
AddEventHandler('GTA_Props:SpawnObjectClientSync', function(data)
    local decodeData = json.decode(data)
    local model = GetHashKey(decodeData["model"])

    RequestModel(model)
    while not HasModelLoaded(model) do
        Citizen.Wait(0)
    end

    local propsobj = CreateObjectNoOffset(model, decodeData["pos"].x, decodeData["pos"].y, decodeData["posY"])
    SetEntityHeading(propsobj, decodeData["posHeading"])
    FreezeEntityPosition(propsobj, true)
end)
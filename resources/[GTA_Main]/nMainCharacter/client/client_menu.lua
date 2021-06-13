mainMenu =  RageUI.CreateMenu("Éditeur de personnage", "~b~NOUVEAU PERSONNAGE")
local heritage =  RageUI.CreateSubMenu(mainMenu, "Éditeur de personnage", "~b~HÉRÉDITÉ")
local apparence = RageUI.CreateSubMenu(mainMenu, "Éditeur de personnage", "~b~APPARENCE")
local vetements = RageUI.CreateSubMenu(mainMenu, "Éditeur de personnage", "~b~VÊTEMENTS")
local identity = RageUI.CreateSubMenu(mainMenu, "Éditeur de personnage", "~b~IDENTITÉ")

mainMenu.Controls.Back.Enabled = false

local index_tenue = 1
local waitMenuCreation = 1000

--> Init camera : 
CameraPosition('face')

heritage.Closed = function()
	CameraPosition('body')
end

apparence.Closed = function()
	CameraPosition('body')
end

--> Thread :
Citizen.CreateThread(function()
    while (true) do
        Citizen.Wait(waitMenuCreation)
        RageUI.IsVisible(mainMenu, function()
            mainMenu.Controls.Back.Enabled = false
            RageUI.List('Sexe', config.Character.sex, config.Character.index_sex, "Déterminez le sexe de votre personnage.", {}, true,
            {
                onListChange = function(Index)
                    config.Character.index_sex = Index;
                    if Index == 1 then
                        config.Sex = "mp_m_freemode_01"
                    elseif Index == 2 then
                        config.Sex = "mp_f_freemode_01"
                    end
                    GetPlayerModel(config.Sex)
                end,
            })
            RageUI.Button('Hérédité', "Choisissez vos parents.", {}, true, {onSelected = function() CameraPosition('face') end}, heritage);
            RageUI.Button('Apparence', "Changez votre apparence.", {}, true, {onSelected = function() CameraPosition('face') end}, apparence);
            RageUI.Button('Vêtements', "Changez vos vêtements", {}, true, {onSelected = function() end}, vetements);
            RageUI.Button('Identité', "Créer une identité", {}, true, {onSelected = function() end}, identity);
            RageUI.Button('Sauvegarder et continuer', "Êtes vous prêt à rejoindre le serveur ?", { RightLabel = "", Color = { HightLightColor = { 0, 155, 0, 150 }, BackgroundColor = { 38, 85, 150, 160 } }}, true, {onSelected = function() ValiderPersonnage() end});
        end, function()end)

        RageUI.IsVisible(heritage, function()
            heritage.Controls.Back.Enabled = true
            RageUI.Window.Heritage(config.Parents.momIndex, config.Parents.dadIndex)
            RageUI.List('mère',config.Character.mom, config.Parents.momIndex, "Choisissez votre mère.", {}, true, {
                onListChange = function(Index)
                    config.Parents.momIndex = Index
                    SetPedHeadBlendData(GetPlayerPed(-1), config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.ShapeMixData, config.Parents.SkinMixData, nil, true)
                end,
            })

            RageUI.List('père',config.Character.dad, config.Parents.dadIndex, "Choisissez votre père.", {}, true, {
                onListChange = function(Index)
                    config.Parents.dadIndex = Index
                    SetPedHeadBlendData(GetPlayerPed(-1), config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.ShapeMixData, config.Parents.SkinMixData, nil, true)
                end,
            })

            RageUI.UISliderHeritage('Ressemblance', config.Parents.ressemblance, "", {
                onSliderChange = function(Float, Index)
                    config.Parents.ressemblance = Index
                    config.Parents.ShapeMixData = Index/10
                    SetPedHeadBlendData(GetPlayerPed(-1), config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.ShapeMixData, config.Parents.SkinMixData, nil, true)
                end,
            })

            RageUI.UISliderHeritage('Couleur de peau', config.Parents.couleur, "", {
                onSliderChange = function(Float, Index)
                    config.Parents.couleur = Index
                    config.Parents.SkinMixData = Index/10
                    SetPedHeadBlendData(GetPlayerPed(-1), config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.momIndex, config.Parents.dadIndex, nil, config.Parents.ShapeMixData, config.Parents.SkinMixData, nil, true)
                end,
            })
        end, function() end)

        --> MENU APPARENCE :
        RageUI.IsVisible(apparence, function()
        apparence.Controls.Back.Enabled = true
        
        RageUI.List('Coupe de cheveux', config.Character.hairCut, config.Character.hairIndex, "Changer de coupe de cheveux.", {}, true, {
            onListChange = function(Index)
                config.Character.hairIndex = Index
                SetPedComponentVariation(GetPlayerPed(-1), 2,config.Character.hairIndex,2,10)
            end,
            onSelected = function() CameraPosition('face') end
        })

        RageUI.List('Couleur des cheveux', config.Character.hairColors, config.Character.hairColorIndex, "Séléctionner une couleur.", {}, true, {
            onListChange = function(Index)
                config.Character.hairColorIndex = Index
                SetPedHairColor(GetPlayerPed(-1),config.Character.hairColorIndex)
            end,
            onSelected = function() CameraPosition('face') end
        })
        end, function() end)

        --> MENU VÊTEMENTS :
        RageUI.IsVisible(vetements, function()
        vetements.Controls.Back.Enabled = true
            RageUI.List('Vêtement', indexii, index_tenue, "", {}, true, {
                onListChange = function(Index, Item)
                    index_tenue = Index;
                    if config.Sex == "mp_m_freemode_01" then 
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.male.Tops.componentId, config.Outfit[index_tenue].id.male.Tops.drawableId, config.Outfit[index_tenue].id.male.Tops.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.male.Legs.componentId, config.Outfit[index_tenue].id.male.Legs.drawableId, config.Outfit[index_tenue].id.male.Legs.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.male.Undershirts.componentId, config.Outfit[index_tenue].id.male.Undershirts.drawableId, config.Outfit[index_tenue].id.male.Undershirts.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.male.Shoes.componentId, config.Outfit[index_tenue].id.male.Shoes.drawableId,config.Outfit[index_tenue].id.male.Shoes.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.male.Accessories.componentId, config.Outfit[index_tenue].id.male.Accessories.drawableId,config.Outfit[index_tenue].id.male.Accessories.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.male.Torsos.componentId, config.Outfit[index_tenue].id.male.Torsos.drawableId, config.Outfit[index_tenue].id.male.Torsos.textureId, 0)
                    elseif config.Sex == "mp_f_freemode_01" then 
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.female.Tops.componentId, config.Outfit[index_tenue].id.female.Tops.drawableId, config.Outfit[index_tenue].id.female.Tops.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.female.Legs.componentId, config.Outfit[index_tenue].id.female.Legs.drawableId, config.Outfit[index_tenue].id.female.Legs.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.female.Undershirts.componentId, config.Outfit[index_tenue].id.female.Undershirts.drawableId, config.Outfit[index_tenue].id.female.Undershirts.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.female.Shoes.componentId, config.Outfit[index_tenue].id.female.Shoes.drawableId,config.Outfit[index_tenue].id.female.Shoes.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.female.Accessories.componentId, config.Outfit[index_tenue].id.female.Accessories.drawableId,config.Outfit[index_tenue].id.female.Accessories.textureId, 0)
                        SetPedComponentVariation(GetPlayerPed(-1), config.Outfit[index_tenue].id.female.Torsos.componentId, config.Outfit[index_tenue].id.female.Torsos.drawableId, config.Outfit[index_tenue].id.female.Torsos.textureId, 0)
                    end                        
                end,
            })
        end, function() end)

        --> MENU IDENTITER :
        RageUI.IsVisible(identity, function()
        identity.Controls.Back.Enabled = true
            RageUI.Button("Nom : ", "", { RightLabel = config.Character.nom}, true, {
                onSelected = function()  
                    config.Character.nom = SaisitText("", 10)

                    if tostring(config.Character.nom) == nil or tonumber(config.Character.nom) then
	                    TriggerEvent("NUI-Notification", {"Veuillez inserer un nom correct !.", "warning"})
                        return nil
                    end
                end
            });     
            
            RageUI.Button("Prénom : ", "", { RightLabel = config.Character.prenom}, true, {
                onSelected = function()  
                    config.Character.prenom = SaisitText("", 10)

                    if tostring(config.Character.prenom) == nil or tonumber(config.Character.prenom) then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer un prenom correct !.", "warning"})
                        return nil
                    end
                end
            });    

            RageUI.Button("Age : ", "", { RightLabel = config.Character.age}, true, {
                onSelected = function()  
                    config.Character.age = SaisitText("", 3)

                    if tonumber(config.Character.age) == nil then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer un age correct !.", "warning"})
                        return nil
                    end
                end
            });   

            RageUI.Button("Nationalité : ", "", { RightLabel = config.Character.nationaliter}, true, {
                onSelected = function()  
                    config.Character.nationaliter = SaisitText("", 15)

                    if tostring(config.Character.nationaliter) == nil then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer une nationalité correct !.", "warning"})
                        return nil
                    end
                end
            });   
        end, function() end)
        
        if RageUI.Visible(mainMenu) or RageUI.Visible(heritage) or RageUI.Visible(apparence) or RageUI.Visible(vetements) or RageUI.Visible(identity) then
            waitMenuCreation = 0
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
            DisableControlAction(0, 1, true) 
            DisableControlAction(0, 2, true) 
            DisableControlAction(0, 106, true) 
            DisableControlAction(0, 142, true) 
            DisableControlAction(0, 30, true) 
            DisableControlAction(0, 31, true) 
            DisableControlAction(0, 21, true)
            DisableControlAction(0, 24, true) 
            DisableControlAction(0, 25, true) 
            DisableControlAction(0, 47, true) 
            DisableControlAction(0, 58, true) 
            DisableControlAction(0, 263, true) 
            DisableControlAction(0, 264, true) 
            DisableControlAction(0, 257, true)
            DisableControlAction(0, 141, true) 
            DisableControlAction(0, 143, true)
            DisableControlAction(0, 75, true) 
            DisableControlAction(27, 75, true) 
        else
            waitMenuCreation = 1000
        end
    end
end)

function ValiderPersonnage()
    --> Tenue Update :
    if config.Sex == "mp_m_freemode_01" then 
        TriggerServerEvent("GTA:TenueHomme", config.Outfit[index_tenue].id.male)
    elseif config.Sex == "mp_f_freemode_01" then 
        TriggerServerEvent("GTA:TenueFemme", config.Outfit[index_tenue].id.female)
    end

    --> Data physic de votre character : 
    config.data = {
        sex = config.Sex,
        visage = config.Parents.ShapeMixData,
        couleurPeau = config.Parents.SkinMixData,
        pere = config.Parents.dadIndex,
        mere = config.Parents.momIndex,
        cheveux = config.Character.hairIndex,
        couleur_cheveux = config.Character.hairColorIndex
    }

    Wait(5)

    --> Update toute les informations du physic de votre character :
    TriggerServerEvent("GTA:UpdateCharacterData", json.encode(config.data))

    --> Identier Update : 
    TriggerServerEvent("GTA:UpdateIdentiter", tostring(config.Character.nom), tostring(config.Character.prenom), tonumber(config.Character.age), tostring(config.Character.nationaliter))

	--print(" Visage : ".. config.Parents.ShapeMixData .. " pere : " ..config.Parents.dadIndex.. " mere : " ..config.Parents.momIndex)

    EndCreation()
end

--> Ouverture du menu :
RegisterNetEvent("GTA:BeginMenuCreation")
AddEventHandler("GTA:BeginMenuCreation",function()
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
end)





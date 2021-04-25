--RageUI.Button(Label, Description, Style, Enabled, Callback, Submenu)
--RageUI.CreateSubMenu(ParentMenu, Title, Subtitle, X, Y, TextureDictionary, TextureName, R, G, B, A)
--RMenu:Get(Type, Name)
--RageUI.List(Label, Items, Index, Description, Style, Enabled, Actions, Submenu)
--RageUI.IsVisible(Menu, Items, Panels)

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
                        TriggerServerEvent("GTA:UpdateSexPersonnage", "mp_m_freemode_01")
                        GetPlayerModel("mp_m_freemode_01")
                        config.Sex = "mp_m_freemode_01"
                    elseif Index == 2 then
                        TriggerServerEvent("GTA:UpdateSexPersonnage", "mp_f_freemode_01")
                        GetPlayerModel("mp_f_freemode_01")
                        config.Sex = "mp_f_freemode_01"
                    end
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
        })

        RageUI.List('Couleur de cheveux', config.Character.hairColors, config.Character.hairColorIndex, "Séléctionner une couleur.", {}, true, {
            onListChange = function(Index)
                config.Character.hairColorIndex = Index
                SetPedHairColor(GetPlayerPed(-1),config.Character.hairColorIndex)
            end,
        })

        RageUI.List('Couleur des yeux', config.Character.eyesColor, config.Character.eyesColorIndex, "Séléctionner une couleur.", {}, true, {
            onListChange = function(Index)
                config.Character.eyesColorIndex = Index
                SetPedEyeColor(GetPlayerPed(-1), config.Character.eyesColorIndex)
            end,
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

                    TriggerServerEvent("GTA:UpdateNom", tostring(config.Character.nom))
                end
            });     
            
            RageUI.Button("Prénom : ", "", { RightLabel = config.Character.prenom}, true, {
                onSelected = function()  
                    config.Character.prenom = SaisitText("", 10)

                    if tostring(config.Character.prenom) == nil or tonumber(config.Character.prenom) then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer un prenom correct !.", "warning"})
                        return nil
                    end

                    TriggerServerEvent("GTA:UpdatePrenom", tostring(config.Character.prenom))
                end
            });    

            RageUI.Button("Age : ", "", { RightLabel = config.Character.age}, true, {
                onSelected = function()  
                    config.Character.age = SaisitText("", 3)

                    if tonumber(config.Character.age) == nil then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer un age correct !.", "warning"})
                        return nil
                    end

                    TriggerServerEvent("GTA:UpdateAge", tonumber(config.Character.age))
                end
            });   

            RageUI.Button("Taille : ", "", { RightLabel = config.Character.taille}, true, {
                onSelected = function()  
                    config.Character.taille = SaisitText("", 3)

                    if tonumber(config.Character.taille) == nil then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer une taille correct !.", "warning"})
                        return nil
                    end

                    TriggerServerEvent("GTA:UpdateTaille", tonumber(config.Character.taille))
                end
            });   

            RageUI.Button("Nationalité : ", "", { RightLabel = config.Character.nationaliter}, true, {
                onSelected = function()  
                    config.Character.nationaliter = SaisitText("", 15)

                    if tostring(config.Character.nationaliter) == nil then
                        TriggerEvent("NUI-Notification", {"Veuillez inserer une nationalité correct !.", "warning"})
                        return nil
                    end

                    TriggerServerEvent("GTA:UpdateOrigin", tostring(config.Character.nationaliter))
                end
            });   
        end, function() end)

        if RageUI.Visible(mainMenu) or RageUI.Visible(heritage) or RageUI.Visible(apparence) or RageUI.Visible(vetements) or RageUI.Visible(identity) then
	    waitMenuCreation = 1
            DisableControlAction(0, 140, true) --> DESACTIVER LA TOUCHE POUR PUNCH
            DisableControlAction(0, 172, true) --DESACTIVE CONTROLL HAUT  
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

    --> Sexe Update :
    TriggerServerEvent("GTA:UpdateSexPersonnage", config.Sex)

    --> Visage Update : 
    TriggerServerEvent("GTA:UpdateVisage", config.Parents.ShapeMixData)

    --> Couleur de peau Update : 
    TriggerServerEvent("GTA:UpdateCouleurPeau", config.Parents.SkinMixData)

    --> Couleur Yeux Update : 
    TriggerServerEvent("GTA:UpdateYeux", config.Character.eyesColorIndex)

    --> Dad Update : 
    TriggerServerEvent("GTA:UpdateDad", config.Parents.dadIndex)

    --> Mom Update : 
    TriggerServerEvent("GTA:UpdateMom", config.Parents.momIndex)

    --> Cheveux Update : 
    TriggerServerEvent("GTA:UpdateCheveux", config.Character.hairIndex)

    --> Couleur Cheveux Update : 
    TriggerServerEvent("GTA:UpdateCouleurCheveux", config.Character.hairColorIndex)

	--print(" Visage : ".. config.Parents.ShapeMixData .. " pere : " ..config.Parents.dadIndex.. " mere : " ..config.Parents.momIndex)

    --> Couleur 
    EndCreation()
end

--> Ouverture du menu :
RegisterNetEvent("GTA:BeginMenuCreation")
AddEventHandler("GTA:BeginMenuCreation",function()
    RageUI.Visible(mainMenu, not RageUI.Visible(mainMenu))
end)

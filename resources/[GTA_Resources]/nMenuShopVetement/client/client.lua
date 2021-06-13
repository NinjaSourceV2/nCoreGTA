tTshirtLabel, tTshirtValue = {}, {}
tPullLabel, tPullValue = {}, {}
tVesteLabel, tVesteValue = {}, {}
tPantalonLabel, tPantalonValue = {}, {}
tChaussureLabel, tChaussureValue = {}, {}
tChapeauLabel, tChapeauValue = {}, {}
tAccessLabel, tAccessValue = {}, {}
tMaskLabel, tMaskValue = {}, {}


Ninja_Core__DisplayHelpAlert = function(msg)
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(msg);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end

RegisterNetEvent("GTA_Vetement:PaiementAccepter")
AddEventHandler("GTA_Vetement:PaiementAccepter", function(itemid, prix)
    TriggerServerEvent("GTA:PaiementCash", "cash", itemid, prix)
end)

RegisterNetEvent("GTA_Vetement:RefreshUserSex")
AddEventHandler("GTA_Vetement:RefreshUserSex", function(sexe)
	Config.sexe = sexe
end)

square = math.sqrt
function getDistance(a, b) 
  local x, y, z = a.x-b.x, a.y-b.y, a.z-b.z
  return square(x*x+y*y+z*z)
end

--> Retourne le sex de votre joueurs :
function getSexVetement()
	for i = 1, #Config.Locations do
		if Config.sexe == "mp_m_freemode_01" then
			return Config.Locations[i]["Homme"]
        elseif Config.sexe == "mp_f_freemode_01" then
			return Config.Locations[i]["Femme"]
		end
	end
end

--> Return vrais si vous êtes proche de la zone :
function IsNearOfZones()
    for i = 1, #Config.Locations do
        local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
        local menuVetement = Config.Locations[i]["MagasinDeVetement"]
        local dMenuVetementPos = getDistance(plyCoords, menuVetement, true)

        if (dMenuVetementPos <= 1.0) then
            return true
        else
            return false 
        end
    end
end


-- Get le nom des TShirt : 
function GetLabelTShirt()
	for k, v in pairs(getSexMenu["Tshirt"]) do
        table.insert(tTshirtLabel, k)
        table.insert(tTshirtValue, v)
	end
end

-- Get le nom des Pull : 
function GetLabelPulls()
	for k, v in pairs(getSexMenu["Pull"]) do
        table.insert(tPullLabel, k)
        table.insert(tPullValue, v)
	end
end

-- Get le nom des Veste : 
function GetLabelVeste()
	for k, v in pairs(getSexMenu["Veste"]) do
        table.insert(tVesteLabel, k)
        table.insert(tVesteValue, v)
	end
end

-- Get le nom des Pantalons : 
function GetLabelPantalons()
	for k, v in pairs(getSexMenu["Pantalon"]) do
        table.insert(tPantalonLabel, k)
        table.insert(tPantalonValue, v)
	end
end

-- Get le nom des Chaussures : 
function GetLabelChaussures()
	for k, v in pairs(getSexMenu["Chaussure"]) do
        table.insert(tChaussureLabel, k)
        table.insert(tChaussureValue, v)
	end
end

-- Get le nom des Chapeau : 
function GetLabelChapeau()
	for k, v in pairs(getSexMenu["Chapeau"]) do
        table.insert(tChapeauLabel, k)
        table.insert(tChapeauValue, v)
	end
end

-- Get le nom des Accessoires : 
function GetLabelAccessoire()
	for k, v in pairs(getSexMenu["Accessoire"]) do
        table.insert(tAccessLabel, k)
        table.insert(tAccessValue, v)
	end
end

-- Get le nom des Mask : 
function GetLabelMask()
	for k, v in pairs(getSexMenu["Mask"]) do
        table.insert(tMaskLabel, k)
        table.insert(tMaskValue, v)
	end
end


--> Blips Magasin de vêtement : 
Citizen.CreateThread(function()
    for i = 1, #Config.Locations do
        local blip = Config.Locations[i]["MagasinDeVetement"]
        blip = AddBlipForCoord(blip["x"], blip["y"], blip["z"])

        SetBlipSprite(blip, 73)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.9)
        SetBlipColour(blip, 12)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Magasin de vêtement")
        EndTextCommandSetBlipName(blip)
    end
end)

local firstspawn = 0
AddEventHandler('playerSpawned', function(spawn)
	if firstspawn == 0 then

        TriggerServerEvent("GTA_Vetement:GetPlayerSexServer")

        Wait(150)

        getSexMenu = getSexVetement()
    
        GetLabelTShirt()
        GetLabelPulls()
        GetLabelVeste()
        GetLabelPantalons()
        GetLabelChaussures()
        GetLabelChapeau()
        GetLabelAccessoire()
        GetLabelMask()
        firstspawn = 1
    end
end)

--> Executer une fois la ressource restart : 
AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
        return
	end
	
    TriggerServerEvent("GTA_Vetement:GetPlayerSexServer")

    Wait(150)

    getSexMenu = getSexVetement()

    GetLabelTShirt()
    GetLabelPulls()
    GetLabelVeste()
    GetLabelPantalons()
    GetLabelChaussures()
    GetLabelChapeau()
    GetLabelAccessoire()
    GetLabelMask()
end)
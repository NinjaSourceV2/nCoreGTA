local Weapons = {}
local AmmoTypes = {}
local CurrentWeapon = nil
local IsShooting = false
local AmmoBefore = 0

--[=====[
        Boucle qui permet de refresh les data pour get le nom "key" de vos "armes/munitions".
]=====]
for name,item in pairs(config.weapons) do
    Weapons[GetHashKey(name)] = item
end
  
for name,item in pairs(config.munitions) do
    AmmoTypes[GetHashKey(name)] = item
end

--[=====[
        Cette event permet la gestion de vos armes/munitions 
        (Pour le moment j'ai recup mon ancien code pour l'adapter avec la nouvel version.
        je ferais surement prochainement un ajout pour les accessoires (pas sur car pas beaucoup de temps.))
]=====]
RegisterNetEvent("GTA_Armes:Init")
AddEventHandler("GTA_Armes:Init", function() 
    local playerPed = GetPlayerPed(-1)
    local inv = exports.nCoreGTA:GetPlayerInv()
    local inv = inv.inventaire

    for weaponHash, v in pairs(Weapons) do
        local found, id, count = InfoArmeItem(inv, v.name)
        
        if found and count > 0 then
            local ammo = 0
            local ammoType = GetPedAmmoTypeFromWeapon(playerPed, weaponHash)
            
            if ammoType and AmmoTypes[ammoType] then
                local found_ammo, qty, id_mun, name = InfoMunitionItem(inv, AmmoTypes[ammoType].name)
                if found_ammo then
                    ammo = qty
                end
            end

            if HasPedGotWeapon(playerPed, weaponHash, false) then
                if GetAmmoInPedWeapon(playerPed, weaponHash) ~= ammo then
                    SetPedAmmo(playerPed, weaponHash, ammo)
                end
            else
                GiveWeaponToPed(playerPed, weaponHash, ammo, false, false)
            end
        else
            RemoveWeaponFromPed(playerPed, weaponHash)
        end
    end
end)

--[=====[
        Cette function est utilisé pour update vos munitions une fois tirer.
]=====]
function PerdreMunition()  
    local playerPed = GetPlayerPed(-1)
    local AmmoAfter = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
    local ammoType = AmmoTypes[GetPedAmmoTypeFromWeapon(playerPed, CurrentWeapon)]

    if ammoType and ammoType.name then
        --print(ammoType.name)
        local ammoDiff = AmmoBefore - AmmoAfter
        if ammoDiff > 0 then
            TriggerServerEvent("GTA_Inventaire:RemoveItem", ammoType.name, ammoDiff)
        end
    end
    return AmmoAfter
end
  

--[=====[
        Cette function est utilisé pour récuperer les information de l'item des munitions :
        la quantité, l'id de l'item, le nom de l'item.
]=====]
function InfoMunitionItem(inv, name)
    for _,v in pairs(inv) do
        if v.item == name and v.count > 0 then
            return true, v.count, v.itemId, v.item
        end
    end
    return false
end


--[=====[
        Cette function est utilisé pour récuperer les information de l'item des armes :
        l'id de l'item, la quantité.
]=====]
function InfoArmeItem(inv, name)
    for _,v in pairs(inv) do
        if v.item == name and v.count > 0 then
            return true, v.itemId, v.count
        end
    end
    return false
end

RegisterNetEvent("GTA_Armes:UpdateMunitions")
AddEventHandler("GTA_Armes:UpdateMunitions", function()
	TriggerEvent("GTA_Armes:Init")
    if CurrentWeapon then
        AmmoBefore = GetAmmoInPedWeapon(GetPlayerPed(-1), CurrentWeapon)
    end
end)

--[=====[
        Ce thread gére le control de vos munitions :
        exemple vous tirer vous perdez une balle.
]=====]
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      local playerPed = GetPlayerPed(-1)
  
      if CurrentWeapon ~= GetSelectedPedWeapon(playerPed) then
        IsShooting = false
        PerdreMunition()
        CurrentWeapon = GetSelectedPedWeapon(playerPed)
        AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
      end
  
      if IsPedShooting(playerPed) and not IsShooting then
        IsShooting = true
      elseif IsShooting and IsControlJustReleased(0, 24) then
        IsShooting = false
        AmmoBefore = PerdreMunition()
      elseif not IsShooting and IsControlJustPressed(0, 45) then
        AmmoBefore = GetAmmoInPedWeapon(playerPed, CurrentWeapon)
      end
    end
end)
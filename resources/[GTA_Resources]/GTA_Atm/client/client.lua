 --||@SuperCoolNinja. && RamexDeltaXOO||--
local waitBanque = 1000
local activeSolde = false
local argentBanque = 0


atms = {
    {x=-386.733, y=6045.953, z=31.501},
    {x=-284.037, y=6224.385, z=31.187},
    {x=-284.037, y=6224.385, z=31.187},
    {x=-135.165, y=6365.738, z=31.101},
    {x=-110.753, y=6467.703, z=31.784},
    {x=-94.9690, y=6455.301, z=31.784},
    {x=155.4300, y=6641.991, z=31.784},
    {x=174.6720, y=6637.218, z=31.784},
    {x=1703.138, y=6426.783, z=32.730},
    {x=1735.114, y=6411.035, z=35.164},
    {x=1702.842, y=4933.593, z=42.051},
    {x=1967.333, y=3744.293, z=32.272},
    {x=1821.917, y=3683.483, z=34.244},
    {x=1174.532, y=2705.278, z=38.027},
    {x=540.0420, y=2671.007, z=42.177},
    {x=2564.399, y=2585.100, z=38.016},
    {x=2558.683, y=349.6010, z=108.050},
    {x=2558.051, y=389.4817, z=108.660},
    {x=1077.692, y=-775.796, z=58.218},
    {x=1139.018, y=-469.886, z=66.789},
    {x=1168.975, y=-457.241, z=66.641},
    {x=1153.884, y=-326.540, z=69.245},
    {x=381.2827, y=323.2518, z=103.270},
    {x=236.4638, y=217.4718, z=106.840},
    {x=265.0043, y=212.1717, z=106.780},
    {x=285.2029, y=143.5690, z=104.970},
    {x=157.7698, y=233.5450, z=106.450},
    {x=-164.568, y=233.5066, z=94.919},
    {x=-1827.04, y=785.5159, z=138.020},
    {x=-1409.39, y=-99.2603, z=52.473},
    {x=-1205.35, y=-325.579, z=37.870},
    {x=-1215.64, y=-332.231, z=37.881},
    {x=-2072.41, y=-316.959, z=13.345},
    {x=-2975.72, y=379.7737, z=14.992},
    {x=-2962.60, y=482.1914, z=15.762},
    {x=-2955.70, y=488.7218, z=15.486},
    {x=-3044.22, y=595.2429, z=7.595},
    {x=-3144.13, y=1127.415, z=20.868},
  }
  

Citizen.CreateThread(function()
    for _, item in pairs(atms) do
      item.blip = AddBlipForCoord(item.x, item.y, item.z)
      SetBlipSprite(item.blip, 277) --> Id du blip
      SetBlipAsShortRange(item.blip, true)
      SetBlipColour(item.blip, 25) --> Couleur du blip
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString("ATM") --> Nom du blip
      EndTextCommandSetBlipName(item.blip)
    end
end)


RegisterNetEvent('nBanqueSolde:CRender')
AddEventHandler('nBanqueSolde:CRender', function(qtyBank)
	argentBanque = qtyBank
    activeSolde = true
end)

RegisterNetEvent('GTA_Banque:ClientDeposerArgentBanque')
AddEventHandler('GTA_Banque:ClientDeposerArgentBanque', function(itemname, itemid, valeur)
    TriggerServerEvent("GTA_Inventaire:RemoveItem", itemname, itemid, valeur)
	TriggerServerEvent("GTA:DeposerArgentBanque", valeur)
	TriggerEvent("NUI-Notification", {"Vous avez déposé : " ..valeur.. "$"})
end)

RegisterNetEvent('GTA_Banque:ClientRetirerArgentBanque')
AddEventHandler('GTA_Banque:ClientRetirerArgentBanque', function(valeur)
    TriggerServerEvent('GTA:RetirerArgentBanque', valeur)
    TriggerServerEvent("GTA_Inventaire:ReceiveItem", "cash", valeur)
	TriggerEvent("NUI-Notification", {"Vous avez retirer : " ..valeur.. "$"})
end)


function Ninja_Core__DisplayHelpAlert(msg)
	BeginTextCommandDisplayHelp("STRING");  
    AddTextComponentSubstringPlayerName(msg);  
    EndTextCommandDisplayHelp(0, 0, 1, -1);
end

function GetInputNumber()
    local nb = 0
    DisplayOnscreenKeyboard(1, "FMMC_KEY_TTTIP8", "", "", "", "", "", 20)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(10)
    end
    if (GetOnscreenKeyboardResult()) then
        nb = GetOnscreenKeyboardResult()
        nb = nb:gsub("[^0-9]", "")
        nb = tonumber(nb)
        if nb == nil or nb < 0 then
           nb = 0
        end
    end
    return nb
end

function DrawAdvancedText(x,y ,w,h,sc, text, r,g,b,a,font,jus)
	SetTextFont(font)
	SetTextProportional(0)
	SetTextScale(sc, sc)
	N_0x4e096588b13ffeca(jus)
	SetTextColour(r, g, b, a)
	SetTextDropShadow(0, 0, 0, 0,255)
	SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
	SetTextOutline()
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(x - 0.1+w, y - 0.02+h)
end

function RenderSolde()
	DrawRect(0.912000000000001, 0.292, 0.185, 0.205, 0, 0, 0, 180)
	DrawAdvancedText(0.966000000000001, 0.220, 0.005, 0.0028, 0.5, "~h~Votre Solde:", 255, 255, 255, 255, 0, 1)
	DrawAdvancedText(0.924000000000001, 0.278, 0.005, 0.0028, 0.4, "~w~Banque ~b~" ..argentBanque .."~g~$",255, 255, 255, 255, 0, 1)
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(waitBanque)
		if activeSolde then
	        waitBanque = 1
			RenderSolde()
		else
		    waitBanque = 1000
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(waitBanque)
		if activeSolde then
			Wait(10000)
			activeSolde = false
		end
	end
end)
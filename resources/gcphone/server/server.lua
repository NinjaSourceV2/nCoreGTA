--====================================================================================
-- #Author: Jonathan D @Gannon
-- #Version 2.0
-- Rework by Super.Cool.Ninja for nCoreGTA.
--====================================================================================
math.randomseed(os.time()) 

--- Pour les numero du style XXX-XXXX
function getPhoneRandomNumber()
    local numBase0 = math.random(100,999)
    local numBase1 = math.random(0,999)
    local num = string.format("%03d-%03d", numBase0, numBase1)

	return num
end

local function getPlayerID(source)
    local license = GetPlayerIdentifiers(source)[1]
    return license
end

--====================================================================================
--  SIM CARDS // Thanks to AshKetchumza for the idea an some code.
--====================================================================================
RegisterServerEvent('gcPhone:useSimCard') --> Converted
AddEventHandler('gcPhone:useSimCard', function(source, identifier)
    local source = source
    local license = getPlayerID(source)
    local myPhoneNumber = nil
    
    repeat
        myPhoneNumber = getPhoneRandomNumber()
        local ress = MySQL.Sync.fetchScalar("SELECT license FROM gta_joueurs WHERE phone_number = @phone_number", {['@phone_number'] = myPhoneNumber})
        local id = ress
    until id == nil

    MySQL.Async.insert("UPDATE gta_joueurs SET phone_number = @myPhoneNumber WHERE license = @license", { 
        ['@myPhoneNumber'] = myPhoneNumber,
        ['@license'] = license
    }, function (rows)
        --xPlayer.removeInventoryItem('sim_card', 1)
        local num = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = license})

        TriggerClientEvent("gcPhone:myPhoneNumber", source, num)

        MySQL.Sync.fetchAll("SELECT * FROM phone_users_contacts WHERE identifier = @identifier", { ['@identifier'] = license}, function(res2)
            TriggerClientEvent("gcPhone:contactList", source, res2)
        end)
        
        
        MySQL.Sync.fetchAll("SELECT phone_messages.* FROM phone_messages LEFT JOIN gta_joueurs ON gta_joueurs.license = @identifier WHERE phone_messages.receiver = gta_joueurs.phone_number", { ['@identifier'] = license}, function(result)
            if (result) then
                TriggerClientEvent("gcPhone:allMessage", source, result)
            end
        end)
        
        sendHistoriqueCall(source, num)
    end)
end)


--====================================================================================
--  Utils
--====================================================================================
function getSourceFromIdentifier(identifier, cb) --> Converted.
    TriggerEvent('GTA:GetJoueurs', function(joueurs)
        for k in pairs(joueurs) do
            if(joueurs[k] ~= nil and joueurs[k] == identifier) or (joueurs[k] == identifier) then
                cb(k)
                return
            end
        end
    end)
    cb(nil)
end

--====================================================================================
--  Contacts
--====================================================================================
function addContact(source, identifier, number, display) --> Converted.
    MySQL.Async.execute("INSERT INTO phone_users_contacts (`identifier`, `number`,`display`) VALUES(@identifier, @number, @display)", {
        ['@identifier'] = identifier,
        ['@number'] = number,
        ['@display'] = display,
    },function()
        notifyContactChange(source, identifier)
    end)
end


function updateContact(source, identifier, id, number, display) --> Converted.
    MySQL.Async.execute("UPDATE phone_users_contacts SET number = @number, display = @display WHERE id = @id", { 
        ['@number'] = number,
        ['@display'] = display,
        ['@id'] = id,
    },function()
        notifyContactChange(source, identifier)
    end)
end

function deleteContact(source, identifier, id) --> Converted.
    MySQL.Async.execute("DELETE FROM phone_users_contacts WHERE `identifier` = @identifier AND `id` = @id", {
        ['@identifier'] = identifier,
        ['@id'] = id,
    })
    notifyContactChange(source, identifier)
end

function deleteAllContact(identifier) --> Converted.
    MySQL.Async.execute("DELETE FROM phone_users_contacts WHERE `identifier` = @identifier", {
        ['@identifier'] = identifier
    })
end

function notifyContactChange(source, identifier) --> Converted.
    if source ~= nil then 
        MySQL.Async.fetchAll("SELECT * FROM phone_users_contacts WHERE identifier = @identifier", { ['@identifier'] = identifier}, function(res2)
            TriggerClientEvent("gcPhone:contactList", source, res2)
        end)
    end
end

RegisterServerEvent('gcPhone:addContact') --> Converted.
AddEventHandler('gcPhone:addContact', function(display, phoneNumber)
    local source = source
	local license = getPlayerID(source)
    addContact(source, license, phoneNumber, display)
end)

RegisterServerEvent('gcPhone:updateContact') --> Converted.
AddEventHandler('gcPhone:updateContact', function(id, display, phoneNumber)
    local source = source
	local license = getPlayerID(source)
    updateContact(source, license, id, phoneNumber, display)
end)


RegisterServerEvent('gcPhone:deleteContact') --> Converted.
AddEventHandler('gcPhone:deleteContact', function(id)
    local source = source
	local license = getPlayerID(source)
    deleteContact(source, license, id)
end)

--====================================================================================
--  Messages
--====================================================================================
RegisterServerEvent('gcPhone:_internalAddMessage')
AddEventHandler('gcPhone:_internalAddMessage', function(transmitter, receiver, message, owner, cb)
    cb(_internalAddMessage(transmitter, receiver, message, owner))
end)

function _internalAddMessage(transmitter, receiver, message, owner)
    local Query = "INSERT INTO phone_messages (`transmitter`, `receiver`,`message`, `isRead`,`owner`) VALUES(@transmitter, @receiver, @message, @isRead, @owner);"
    local Query2 = 'SELECT * from phone_messages WHERE `id` = @id;'
	local Parameters = {
        ['@transmitter'] = transmitter,
        ['@receiver'] = receiver,
        ['@message'] = message,
        ['@isRead'] = owner,
        ['@owner'] = owner
    }
    local id = MySQL.Sync.insert(Query, Parameters)
    return MySQL.Sync.fetchAll(Query2, {
        ['@id'] = id
    })[1]
end

function addMessage(source, identifier, phone_number, message) --> Converted.
    local myPhone_number = MySQL.Sync.fetchScalar("SELECT license FROM gta_joueurs WHERE phone_number = @phone_number", {['@phone_number'] = phone_number})
    if myPhone_number ~= nil then
        local myPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = identifier})
        local tomess = _internalAddMessage(myPhone, phone_number, message, 0)
        getSourceFromIdentifier(myPhone_number, function(osou)
            if tonumber(osou) ~= nil then 
                TriggerClientEvent("gcPhone:receiveMessage", tonumber(osou), tomess)
            end
        end) 
        local memess = _internalAddMessage(phone_number, myPhone, message, 1)
        TriggerClientEvent("gcPhone:receiveMessage", source, memess)
    end
end

function setReadMessageNumber(identifier, num) --> Converted.
    local getNumberPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = identifier})
    MySQL.Sync.execute("UPDATE phone_messages SET phone_messages.isRead = 1 WHERE phone_messages.receiver = @receiver AND phone_messages.transmitter = @transmitter", { 
        ['@receiver'] = getNumberPhone,
        ['@transmitter'] = num
    })
end

function deleteMessage(msgId)
    MySQL.Sync.execute("DELETE FROM phone_messages WHERE `id` = @id", {
        ['@id'] = msgId
    })
end

function deleteAllMessageFromPhoneNumber(source, identifier, phone_number)
    local source = source
    local identifier = identifier
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Sync.execute("DELETE FROM phone_messages WHERE `receiver` = @mePhoneNumber and `transmitter` = @phone_number", {['@mePhoneNumber'] = mePhoneNumber,['@phone_number'] = phone_number})
end

function deleteAllMessage(identifier)
    local mePhoneNumber = getNumberPhone(identifier)
    MySQL.Sync.execute("DELETE FROM phone_messages WHERE `receiver` = @mePhoneNumber", {
        ['@mePhoneNumber'] = mePhoneNumber
    })
end

RegisterServerEvent('gcPhone:sendMessage') --> Converted.
AddEventHandler('gcPhone:sendMessage', function(phoneNumber, message)
    local source = source
	local license = getPlayerID(source)
    addMessage(source, license, phoneNumber, message)
end)

RegisterServerEvent('gcPhone:deleteMessage')
AddEventHandler('gcPhone:deleteMessage', function(msgId)
    deleteMessage(msgId)
end)

RegisterServerEvent('gcPhone:deleteMessageNumber') --> Converted.
AddEventHandler('gcPhone:deleteMessageNumber', function(number)
    local source = source
	local license = getPlayerID(source)
    deleteAllMessageFromPhoneNumber(source,license, number)
end)

RegisterServerEvent('gcPhone:deleteAllMessage') --> Converted.
AddEventHandler('gcPhone:deleteAllMessage', function()
    local source = source
	local license = getPlayerID(source)
    deleteAllMessage(license)
end)

RegisterServerEvent('gcPhone:setReadMessageNumber') --> Converted.
AddEventHandler('gcPhone:setReadMessageNumber', function(num)
    local source = source
	local license = getPlayerID(source)
    setReadMessageNumber(license, num)
end)

RegisterServerEvent('gcPhone:deleteALL') --> Converted.
AddEventHandler('gcPhone:deleteALL', function()
    local source = source
	local license = getPlayerID(source)
    deleteAllMessage(license)
    deleteAllContact(license)
    appelsDeleteAllHistorique(license)
    TriggerClientEvent("gcPhone:contactList", source, {})
    TriggerClientEvent("gcPhone:allMessage", source, {})
    TriggerClientEvent("appelsDeleteAllHistorique", source, {})
end)

--====================================================================================
--  Gestion des appels
--====================================================================================
local AppelsEnCours = {}
local PhoneFixeInfo = {}
local lastIndexCall = 10

function getHistoriqueCall(num)
    local result = MySQL.Sync.fetchAll("SELECT * FROM phone_calls WHERE phone_calls.owner = @num ORDER BY time DESC LIMIT 120", {
        ['@num'] = num
    })
    return result
end

function sendHistoriqueCall (src, num) 
    local histo = getHistoriqueCall(num)
    TriggerClientEvent('gcPhone:historiqueCall', src, histo)
end

function saveAppels(appelInfo) --> Converted.
    if appelInfo.extraData == nil or appelInfo.extraData.useNumber == nil then
        MySQL.Sync.execute("INSERT INTO phone_calls (`owner`, `num`,`incoming`, `accepts`) VALUES(@owner, @num, @incoming, @accepts)", {
            ['@owner'] = appelInfo.transmitter_num,
            ['@num'] = appelInfo.receiver_num,
            ['@incoming'] = 1,
            ['@accepts'] = appelInfo.is_accepts
        }, function()
            notifyNewAppelsHisto(appelInfo.transmitter_src, appelInfo.transmitter_num)
        end)
    end
    if appelInfo.is_valid == true then
        local num = appelInfo.transmitter_num
        if appelInfo.hidden == true then
            num = "###-###"
        end
        MySQL.Sync.execute("INSERT INTO phone_calls (`owner`, `num`,`incoming`, `accepts`) VALUES(@owner, @num, @incoming, @accepts)", {
            ['@owner'] = appelInfo.receiver_num,
            ['@num'] = num,
            ['@incoming'] = 0,
            ['@accepts'] = appelInfo.is_accepts
        }, function()
            if appelInfo.receiver_src ~= nil then
                notifyNewAppelsHisto(appelInfo.receiver_src, appelInfo.receiver_num)
            end
        end)
    end
end

function notifyNewAppelsHisto (src, num) 
    sendHistoriqueCall(src, num)
end

RegisterServerEvent('gcPhone:getHistoriqueCall') --> Converted.
AddEventHandler('gcPhone:getHistoriqueCall', function()
    local source = source
    local sourcePlayer = tonumber(source)
    local license = getPlayerID(source)
    local getNumberPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = license})
    sendHistoriqueCall(getNumberPhone, num)
end)


RegisterServerEvent('gcPhone:register_FixePhone')
AddEventHandler('gcPhone:register_FixePhone', function(phone_number, coords)
	Config.FixePhone[phone_number] = {name = 'Cabine téléphonique', coords = {x = coords.x, y = coords.y, z = coords.z}}
	TriggerClientEvent('gcPhone:register_FixePhone', -1, phone_number, Config.FixePhone[phone_number])
end)

RegisterServerEvent('gcPhone:internal_startCall') --> Converted.
AddEventHandler('gcPhone:internal_startCall', function(source, phone_number, rtcOffer, extraData)
    if Config.FixePhone[phone_number] ~= nil then
        onCallFixePhone(source, phone_number, rtcOffer, extraData)
        return
    end
    
    local rtcOffer = rtcOffer
    if phone_number == nil or phone_number == '' then 
        print('BAD CALL NUMBER IS NIL')
        return
    end

    local hidden = string.sub(phone_number, 1, 1) == '#'
    if hidden == true then
        phone_number = string.sub(phone_number, 2)
    end

    local indexCall = lastIndexCall
    lastIndexCall = lastIndexCall + 1

    local sourcePlayer = tonumber(source)
    local identifier = getPlayerID(source)

    local getNumberPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = identifier})
    local res = MySQL.Sync.fetchScalar("SELECT license FROM gta_joueurs WHERE phone_number = @phone_number", {['@phone_number'] = phone_number})

    local is_valid = res ~= nil and res ~= identifier
    AppelsEnCours[indexCall] = {
        id = indexCall,
        transmitter_src = sourcePlayer,
        transmitter_num = getNumberPhone,
        receiver_src = nil,
        receiver_num = phone_number,
        is_valid = res ~= nil,
        is_accepts = false,
        hidden = hidden,
        rtcOffer = rtcOffer,
        extraData = extraData
    }

    if is_valid == true then
        getSourceFromIdentifier(res, function (srcTo)
            if srcTo ~= nil then
                AppelsEnCours[indexCall].receiver_src = srcTo
                TriggerEvent('gcPhone:addCall', AppelsEnCours[indexCall])
                TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
                TriggerClientEvent('gcPhone:waitingCall', srcTo, AppelsEnCours[indexCall], false)
            else
                TriggerEvent('gcPhone:addCall', AppelsEnCours[indexCall])
                TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
            end
        end)
    else
        TriggerEvent('gcPhone:addCall', AppelsEnCours[indexCall])
        TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
    end
end)

RegisterServerEvent('gcPhone:startCall') --> Converted.
AddEventHandler('gcPhone:startCall', function(phone_number, rtcOffer, extraData)
    local source = source
    TriggerEvent('gcPhone:internal_startCall',source, phone_number, rtcOffer, extraData)
end)

RegisterServerEvent('gcPhone:candidates') --> Converted.
AddEventHandler('gcPhone:candidates', function (callId, candidates)
    if AppelsEnCours[callId] ~= nil then
        local source = source
        local to = AppelsEnCours[callId].transmitter_src
        if source == to then 
            to = AppelsEnCours[callId].receiver_src
        end
        TriggerClientEvent('gcPhone:candidates', to, candidates)
    end
end)

RegisterServerEvent('gcPhone:acceptCall')
AddEventHandler('gcPhone:acceptCall', function(infoCall, rtcAnswer)
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then
        if PhoneFixeInfo[id] ~= nil then
            onAcceptFixePhone(source, infoCall, rtcAnswer)
            return
        end
        AppelsEnCours[id].receiver_src = infoCall.receiver_src or AppelsEnCours[id].receiver_src
        if AppelsEnCours[id].transmitter_src ~= nil and AppelsEnCours[id].receiver_src~= nil then
            AppelsEnCours[id].is_accepts = true
            AppelsEnCours[id].rtcAnswer = rtcAnswer
            TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].transmitter_src, AppelsEnCours[id], true)
	    SetTimeout(2000, function() -- change to +1000, if necessary.
       		TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].receiver_src, AppelsEnCours[id], false)
	    end)
            saveAppels(AppelsEnCours[id])
        end
    end
end)

RegisterServerEvent('gcPhone:rejectCall')
AddEventHandler('gcPhone:rejectCall', function (infoCall)
    local source = source
    local id = infoCall.id
    if AppelsEnCours[id] ~= nil then
        if PhoneFixeInfo[id] ~= nil then
            onRejectFixePhone(source, infoCall)
            return
        end
        if AppelsEnCours[id].transmitter_src ~= nil then
            TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[id].transmitter_src)
        end
        if AppelsEnCours[id].receiver_src ~= nil then
            TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[id].receiver_src)
        end

        if AppelsEnCours[id].is_accepts == false then 
            saveAppels(AppelsEnCours[id])
        end
        TriggerEvent('gcPhone:removeCall', AppelsEnCours)
        AppelsEnCours[id] = nil
    end
end)

RegisterServerEvent('gcPhone:appelsDeleteHistorique') --> Converted.
AddEventHandler('gcPhone:appelsDeleteHistorique', function (numero)
    local source = source
    local sourcePlayer = tonumber(source)
    local identifier = getPlayerID(source)
    local getNumberPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = identifier})
    MySQL.Sync.execute("DELETE FROM phone_calls WHERE `owner` = @owner AND `num` = @num", {
        ['@owner'] = getNumberPhone,
        ['@num'] = numero
    })
end)

function appelsDeleteAllHistorique(srcIdentifier) --> Converted.
    local getNumberPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = srcIdentifier})
    MySQL.Sync.execute("DELETE FROM phone_calls WHERE `owner` = @owner", {
        ['@owner'] = getNumberPhone
    })
end

RegisterServerEvent('gcPhone:appelsDeleteAllHistorique') --> Converted.
AddEventHandler('gcPhone:appelsDeleteAllHistorique', function ()
    local source = source
    local sourcePlayer = tonumber(source)
    local identifier = getPlayerID(source)
    appelsDeleteAllHistorique(identifier)
end)

--====================================================================================
--  OnLoad --> Converted
--====================================================================================
RegisterServerEvent("GTA:TelephoneLoaded")
AddEventHandler("GTA:TelephoneLoaded",function()
    local source = source
	local license = getPlayerID(source)

    local Myphone_number = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = license})
    if Myphone_number then
        TriggerClientEvent("gcPhone:myPhoneNumber", source, Myphone_number)
        
        MySQL.Sync.fetchAll("SELECT * FROM phone_users_contacts WHERE identifier = @identifier", { ['@identifier'] = license}, function(res2)
            TriggerClientEvent("gcPhone:contactList", source, res2)
        end)

        MySQL.Sync.fetchAll("SELECT phone_messages.* FROM phone_messages LEFT JOIN gta_joueurs ON gta_joueurs.license = @identifier WHERE phone_messages.receiver = gta_joueurs.phone_number", { ['@identifier'] = license}, function(result)
            if (result) then
                TriggerClientEvent("gcPhone:allMessage", source, result)
            end
        end)
        
        sendHistoriqueCall(source, Myphone_number)
    end
end)

function onCallFixePhone (source, phone_number, rtcOffer, extraData) --> Converted.
    local indexCall = lastIndexCall
    lastIndexCall = lastIndexCall + 1

    local hidden = string.sub(phone_number, 1, 1) == '#'
    if hidden == true then
        phone_number = string.sub(phone_number, 2)
    end


    local sourcePlayer = tonumber(source)
    local identifier = getPlayerID(source)
    local getNumberPhone = MySQL.Sync.fetchScalar("SELECT phone_number FROM gta_joueurs WHERE license = @license", {['@license'] = identifier})
    
    
    AppelsEnCours[indexCall] = {
        id = indexCall,
        transmitter_src = sourcePlayer,
        transmitter_num = getNumberPhone,
        receiver_src = nil,
        receiver_num = phone_number,
        is_valid = false,
        is_accepts = false,
        hidden = hidden,
        rtcOffer = rtcOffer,
        extraData = extraData,
        coords = Config.FixePhone[phone_number].coords
    }
    
    PhoneFixeInfo[indexCall] = AppelsEnCours[indexCall]

    TriggerClientEvent('gcPhone:notifyFixePhoneChange', -1, PhoneFixeInfo)
    TriggerClientEvent('gcPhone:waitingCall', sourcePlayer, AppelsEnCours[indexCall], true)
end

function onAcceptFixePhone(source, infoCall, rtcAnswer)
    local id = infoCall.id
    
    AppelsEnCours[id].receiver_src = source
    if AppelsEnCours[id].transmitter_src ~= nil and AppelsEnCours[id].receiver_src~= nil then
        AppelsEnCours[id].is_accepts = true
        AppelsEnCours[id].forceSaveAfter = true
        AppelsEnCours[id].rtcAnswer = rtcAnswer
        PhoneFixeInfo[id] = nil
        TriggerClientEvent('gcPhone:notifyFixePhoneChange', -1, PhoneFixeInfo)
        TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].transmitter_src, AppelsEnCours[id], true)
        SetTimeout(1000, function() -- change to +1000, if necessary.
            TriggerClientEvent('gcPhone:acceptCall', AppelsEnCours[id].receiver_src, AppelsEnCours[id], false)
        end)
        saveAppels(AppelsEnCours[id])
    end
end

function onRejectFixePhone(source, infoCall, rtcAnswer)
    local id = infoCall.id
    PhoneFixeInfo[id] = nil
    TriggerClientEvent('gcPhone:notifyFixePhoneChange', -1, PhoneFixeInfo)
    TriggerClientEvent('gcPhone:rejectCall', AppelsEnCours[id].transmitter_src)
    if AppelsEnCours[id].is_accepts == false then
        saveAppels(AppelsEnCours[id])
    end
    AppelsEnCours[id] = nil 
end

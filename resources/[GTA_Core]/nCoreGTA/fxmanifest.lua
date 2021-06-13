fx_version 'cerulean'
game 'gta5'

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config/config.lua',
    'server/server_main.lua',
    'server/whitelist.lua',
    'server/server_inventory.lua',
    'synchronisation/server.lua',
    'services/server.lua',
    'public_event/sPublic_event.lua'
}

client_scripts {
    'config/config.lua',
    'client_main/admin_main.lua',
    'client_main/item_armes.lua',
    'client_main/client_main.lua',
    'client_main/getter_player.lua',
    'client_main/coma.lua',
    'synchronisation/client.lua',
    'services/client.lua',
    'public_event/cPublic_event.lua',
    'public_event/items_event.lua'
}


exports {
    "GetPlayerJob",
    "GetPlayerJobGrade",
    "GetIsPlayerInService",
    "GetPlayerInv",
    "GetIsPlayerAdmin",
    "GetIsFirstConnexion"
}

--@Super.Cool.Ninja

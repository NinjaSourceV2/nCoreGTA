fx_version 'cerulean'
game 'gta5'

client_scripts {
    "core_rageui/RMenu.lua",
    "core_rageui/menu/RageUI.lua",
    "core_rageui/menu/Menu.lua",
    "core_rageui/menu/MenuController.lua",
    "core_rageui/components/*.lua",
    "core_rageui/menu/elements/*.lua",
    "core_rageui/menu/items/*.lua",
    "core_rageui/menu/panels/*.lua",
    "core_rageui/menu/windows/*.lua",
}


client_scripts {
    'config/config.lua',
    'client/client_main.lua',
    'client/client_menu.lua'
}

server_script '@mysql-async/lib/MySQL.lua'
server_script 'server/server_main.lua'
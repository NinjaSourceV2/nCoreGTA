fx_version 'cerulean'
game 'gta5'

dependency 'nCoreGTA'

server_script '@mysql-async/lib/MySQL.lua'
server_script 'server/server_main.lua'

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

    'config/config.lua',
    'client/client_menu.lua'
}
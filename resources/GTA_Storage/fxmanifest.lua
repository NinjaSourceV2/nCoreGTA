fx_version 'bodacious'
game 'gta5'

author "SuperCoolNinja"


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


    'config.lua',
    'utils/utils_function.lua',
    'client/coffre_placement.lua',
    'client/coffre_storage.lua',
    'client/menu_storage.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
    'server/server_storage.lua'
}
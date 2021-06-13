fx_version 'cerulean'
game 'gta5'

dependency 'nCoreGTA'


server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'server/server_main.lua'
}

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
    'client/client_main.lua',
    'client/client_menu.lua'
}

ui_page "html/index.html"
files {
    "html/index.html",
    "html/script.js",
    "html/style.css",
    "html/idcard.png"
}
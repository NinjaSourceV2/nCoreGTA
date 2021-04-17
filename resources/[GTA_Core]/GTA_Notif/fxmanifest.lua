-- Resource Metadata
fx_version 'adamant'
game 'gta5'

author 'SuperCoolNinja'
description 'Experimented html stuff a simple notification.'
version '1.2.0'

client_scripts {
    "client/client_sounds.lua",
    "client/client_notification.lua"
}

server_script "server/server_sounds.lua"

ui_page "html/index.html"
files {
    "html/index.html",
    "html/script.js",
    "html/style.css",
    "html/sounds/*.ogg" --> all sounds need to be on .ogg
}

export 'GTA_NUI_ShowNotification'
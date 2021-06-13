fx_version 'cerulean'
game 'gta5'


dependency 'nCoreGTA'

client_script 'client.lua'
server_script '@mysql-async/lib/MySQL.lua'


ui_page "html/index.html"
files {
    "html/index.html",
    "html/script.js",
    "html/style.css",
    "html/*.png"
}
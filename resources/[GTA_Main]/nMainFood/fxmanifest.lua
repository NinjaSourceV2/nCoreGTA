fx_version 'cerulean'
game 'gta5'

client_script 'client.lua'
server_script '@mysql-async/lib/MySQL.lua'
server_script 'server.lua'


ui_page "html/index.html"
files {
    "html/index.html",
    "html/script.js",
    "html/style.css"
}
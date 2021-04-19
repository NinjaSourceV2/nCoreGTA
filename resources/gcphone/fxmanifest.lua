fx_version 'cerulean'
game 'gta5'

dependency 'nMenuPersonnel'

ui_page 'html/index.html'

files {
	'html/index.html',
	'html/static/css/*css',
	'html/static/js/*.js',

	'html/static/config/config.json',

	'html/static/img/*.png',
	'html/static/img/coque/*.png',
	'html/static/img/background/*.jpg',
	'html/static/img/icons_app/*.png',
	'html/static/img/icons_app/*.svg',
	'html/static/fonts/fontawesome-webfont.eot',
	'html/static/fonts/fontawesome-webfont.ttf',
	'html/static/fonts/fontawesome-webfont.woff',
	'html/static/fonts/fontawesome-webfont.woff2',
	'html/static/sound/*.ogg',
}

client_script {
	'config.lua',
	'client/animation.lua',
	'client/client.lua',
	'client/photo.lua'
}

server_script {
	'@mysql-async/lib/MySQL.lua',
	'config.lua',
	'server/server.lua'
}

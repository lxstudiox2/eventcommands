fx_version 'cerulean'
lua54 'yes' 
game 'gta5'
author 'LX Studio'
description 'Anuncio de Evento'
version '1.1.0'

shared_script '@ox_lib/init.lua'

client_scripts {
    'client.lua',
}

server_scripts {
    'server.lua',
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/script.js'
}


escrow_ignore {
    'client.lua',
    'server.lua',
}
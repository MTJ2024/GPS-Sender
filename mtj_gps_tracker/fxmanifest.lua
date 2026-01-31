fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'MTJ2024'
description 'Illegales GPS Tracker Script für ESX Legacy 1.12+ - Schwarzmarkt-System mit realistischen Laufzeiten'
version '2.1.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua',
    'items.lua'
}

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/ui.css',      -- stelle sicher, dass die Datei wirklich so heißt!
    'html/ui.js',       -- stelle sicher, dass die Datei wirklich so heißt!
    
}
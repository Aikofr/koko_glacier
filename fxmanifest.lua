fx_version 'adamant'
game 'gta5'

------------ RAGEUI ------------
client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}


client_scripts {
	'client/client.lua',
	'config.lua',
    '@es_extended/locale.lua',
}

server_scripts {
	'server/server.lua',
    '@es_extended/locale.lua',
}

dependencies {
	'es_extended'
}

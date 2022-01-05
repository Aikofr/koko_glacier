glacier = {}
Config = {}
Config.Locale = 'fr' -- Language


--marker
glacier.DrawDistance = 100
glacier.Size         = {x = 1.0, y = 1.0, z = 1.0}
glacier.Color        = {r = 0, g = 255, b = 232}
glacier.Type         = 31



--Achat bar
glacier.baritem = {
	{nom = "Glace chocolat", prix = 8, item = "glacechoco"},
	{nom = "Glace fraise", prix = 8, item = "glacefraise"},
	{nom = "Glace caramel", prix = 8, item = "glacecaramel"},
	{nom = "Glace menthe", prix = 8, item = "glacementhe"},
	{nom = "Glace vermicelle", prix = 15, item = "glacevermi"},
	{nom = "Glace Double boules", prix = 15, item = "glacedouble"},
}



--position des menus et marker
glacier.pos = {
	vestiaire = {
		position = {x = -1191.92, y = -1545.75, z = 4.37} --Position du vestiaire
	},

	bar = {
		position = {x = -1193.75, y = -1540.65, z = 4.38}
	},

	garage = {
		position = {x = -1180.68, y = -1506.05, z = 4.38}
	},

	spawnvoiture = {
		position = {x = -1184.93, y = -1493.17, z = 4.38, h = 124.75}
	},

	boss = {
		position = {x = -1190.03, y = -1537.54, z = 4.38} --Position de l'action patron + coffre
	}
}



--FARM
Config.FarmZones = {
	Recolte = { 
		Pos   = { x = 959.64, y = -1673.01, z = 30.19}, --Changer point récolte
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Color = { r = 0, g = 255, b = 232},
		Type  = 39
	},
	Transformation = {
		Pos   = { x = -1194.28, y = -1543.34, z = 4.37}, --Changer point transfo
		Size  = { x = 1.0, y = 1.0, z = 1.0 },
		Color = { r = 0, g = 255, b = 232},
		Type  = 24
	},
	Vente = {
		Pos   = {x = -471.74, y = -18.16, z = 45.76}, --Changer point de vente
		Size  = {x = 2.0, y = 2.0, z = 2.0},
		Color = {r = 0, g = 255, b = 232},
		Type  = 29
	},
}



--Blips sur la map
Config.Map = {
	{name="Garage",color=30, id=823, x = -1180.68, y = -1506.05, z = 4.38}, --Blips map de transfo
	{name="Récolte de crème glacée",color=30, id=85, x = 959.64, y = -1673.01, z = 30.19}, --Blips map de récolte
	{name="Fabrication des glaces",color=30, id=85, x = -1194.28, y = -1543.34, z = 4.37}, --Blips map de transfo
	{name="Vente de glace",color=30, id=85, x = -471.74, y = -18.16, z = 45.76}, --Blips map de vente
}

Config.DrawDistance               = 20.0 -- How close you need to be in order for the markers to be drawn (in GTA units).
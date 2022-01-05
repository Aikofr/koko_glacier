ESX.RegisterUsableItem('glacechoco', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacechoco', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacechoco'))
end)

ESX.RegisterUsableItem('glacefraise', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacefraise', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacefraise'))
end)

ESX.RegisterUsableItem('glacecaramel', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacecaramel', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacecaramel'))
end)

ESX.RegisterUsableItem('glacementhe', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacementhe', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacementhe'))
end)

ESX.RegisterUsableItem('glacevermi', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacevermi', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacevermi'))
end)

ESX.RegisterUsableItem('glacedouble', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacedouble', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 350000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacedouble'))
end)

ESX.RegisterUsableItem('glacevanille', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('glacevanille', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	xPlayer.showNotification(_U('used_glacevanille'))
end)



--- ADD IN YOUR ESX_BACICNEEDS TRANSLATION FILE
--- A AJOUTER DANS VOTRE FICHIER TRADUCTION DU ESX_BASICNEEDS
['used_glacechoco'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace chocolat~s~',
['used_glacefraise'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace fraise~s~',
['used_glacecaramel'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace caramel~s~',
['used_glacementhe'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace menthe~s~',
['used_glacevermi'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace vermicelle~s~',
['used_glacedouble'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace Double boules~s~',
['used_glacevanille'] = 'vous avez utilisé ~y~1x~s~ ~b~Glace vanille~s~',

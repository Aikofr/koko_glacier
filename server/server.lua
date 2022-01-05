ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- TriggerEvent('esx_gcphone:registerNumber', 'Glacier', 'alerte glacier', true, true) --Si vous avez gcphone
-- TriggerEvent('esx_addons_gcphone:registerNumber', 'Glacier', 'alerte glacier', true, true) --Si vous avez gcphone
-- TriggerEvent('esx_phone:registerNumber', 'Glacier', 'alerte glacier', true, true) --Si vous avez gcphone

TriggerEvent('esx_society:registerSociety', 'glacier', 'glacier', 'society_glacier', 'society_glacier', 'society_glacier', {type = 'public'})

RegisterServerEvent('koko_glacier:annonceopen')--Changer l'annonce d'ouverture
AddEventHandler('koko_glacier:annonceopen', function (target)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Glacier', '~b~Annonce', '~y~On est ouvert, venez goûter nos délicieux Glaciers !', 'WEB_FRUIT', 8)
    end
end)

RegisterServerEvent('koko_glacier:annoncefermer') --Changer l'annonce de fermeture
AddEventHandler('koko_glacier:annoncefermer', function (target)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Glacier', '~b~Annonce', '~y~On est Fermé, a bientôt !', 'WEB_FRUIT', 8)
    end 
end)

RegisterServerEvent('koko_glacier:annoncerecrutement') --Changer l'annonce de recrutement
AddEventHandler('koko_glacier:annoncerecrutement', function (target)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
    local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
    TriggerClientEvent('esx:showAdvancedNotification', xPlayers[i], 'Glacier', '~b~Annonce', '~y~Recrutement en cours, rendez-vous au glacier !', 'WEB_FRUIT', 8)
    end 
end)

RegisterServerEvent('koko_glacier:patronmess')
AddEventHandler('koko_glacier:patronmess', function(PriseOuFin, message)
    local _source = source
    local _raison = PriseOuFin
    local xPlayer = ESX.GetPlayerFromId(_source)
    local xPlayers = ESX.GetPlayers()
    local name = xPlayer.getName(_source)

    for i = 1, #xPlayers, 1 do
        local thePlayer = ESX.GetPlayerFromId(xPlayers[i])
        if thePlayer.job.name == 'glacier' then
            TriggerClientEvent('koko_glacier:infoservice', xPlayers[i], _raison, name, message)
        end
    end
end)





--------COFFRE
RegisterServerEvent('koko_glacier:getStockItem')
AddEventHandler('koko_glacier:getStockItem', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_glacier', function(inventory)
        local item = inventory.getItem(itemName)

        if item.count >= count then
            inventory.removeItem(itemName, count)
            xPlayer.addInventoryItem(itemName, count)
        else
            xPlayer.showNotification(_U('quantity_invalid'))
        end

        xPlayer.showNotification(_U('have_withdrawn') .. count .. ' ' .. item.label)
    end)
end)

ESX.RegisterServerCallback('koko_glacier:getStockItems', function(source, cb)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_glacier', function(inventory)
        cb(inventory.items)
    end)
end)

RegisterServerEvent('koko_glacier:putStockItems')
AddEventHandler('koko_glacier:putStockItems', function(itemName, count)
    local xPlayer = ESX.GetPlayerFromId(source)

    TriggerEvent('esx_addoninventory:getSharedInventory', 'society_glacier', function(inventory)
        local item = inventory.getItem(itemName)

        if item.count >= 0 then
            xPlayer.removeInventoryItem(itemName, count)
            inventory.addItem(itemName, count)
        else
            xPlayer.showNotification(_U('quantity_invalid'))
        end
        xPlayer.showNotification(_U('added') .. count .. ' ' .. item.label)
    end)
end)

ESX.RegisterServerCallback('koko_glacier:getPlayerInventory', function(source, cb)
    local xPlayer    = ESX.GetPlayerFromId(source)
    local items      = xPlayer.inventory
    cb({
        items      = items
    })
end)


ESX.RegisterServerCallback('koko_glacier:inventairejoueur', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local items   = xPlayer.inventory

    cb({items = items})
end)



--Machine a Glacier
RegisterServerEvent('koko_glacier:refillThirst')
AddEventHandler('koko_glacier:refillThirst', function()
	TriggerClientEvent('esx_status:add', source, 'hunger', 120000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 80000)
end)

RegisterServerEvent('koko_glacier:lamoney')
AddEventHandler('koko_glacier:lamoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getAccount('bank').money >= 100 then --> Changer le prix de la glace ici
		xPlayer.removeAccountMoney('bank', 100) --> Changer le prix de la glace ici
		--TriggerClientEvent('esx:showNotification', xPlayer.source, "Merci à bientot !" .. 2500) --Si vous n'avez pas de script notification
        TriggerClientEvent('dopeNotify2:Alert', source, "", "Merci à bientot !", 7000, 'success') --Si vous avez DopeNotify

		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_glacier', function(account)
			societyAccount = account
		end)
		if societyAccount ~= nil then
		societyAccount.addMoney(100) --> Changer le prix de la glace ici
		end
    else
		--TriggerClientEvent('esx:showNotification', xPlayer.source, "La maison ne fait pas credit !" .. 2500) --Si vous n'avez pas de script notification
		TriggerClientEvent('dopeNotify2:Alert', source, "", "La maison ne fait pas credit !", 7000, 'error') --Si vous avez DopeNotify
    end
end)



ESX.RegisterServerCallback('koko_glacier:lamoney', function(source, cb)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer.getAccount('bank').money >= 100 then
		xPlayer.removeAccountMoney('bank', 100)
        TriggerClientEvent('dopeNotify2:Alert', source, "", "Merci à bientot !", 7000, 'success')
		TriggerEvent('esx_addonaccount:getSharedAccount', 'society_glacier', function(account)
			societyAccount = account
		end)
		if societyAccount ~= nil then
			societyAccount.addMoney(100)
		end
		cb(true)
    else
		TriggerClientEvent('dopeNotify2:Alert', source, "", "La maison ne fait pas credit !", 7000, 'error')
		cb(false)
    end
end)
--Fin Machine a glace




--------FARM
local PlayersHarvesting  = {}
local PlayersTransfo  = {}
local PlayersSelling  = {}

local function Harvest(source)
	SetTimeout(5000, function()
		if PlayersHarvesting[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local grainedecafcaf = xPlayer.getInventoryItem('cremeglace').count
				xPlayer.addInventoryItem('cremeglace', 1)
				Harvest(source)
		end
	end)
end



--TRANSFO
local function Transfo(source)
	SetTimeout(5000, function()
		if PlayersTransfo[source] == true then
			local xPlayer = ESX.GetPlayerFromId(source)
			local cremeg = xPlayer.getInventoryItem('cremeglace').count
			local glacef = xPlayer.getInventoryItem('glacevanille').count

			if glacef > 50 then
				-- TriggerClientEvent('esx:showNotification', source, '~r~Il semble que tu ne puisses plus porter de tabac sec...')
				TriggerClientEvent('dopeNotify2:Alert', xPlayer.source, "", "Il semble que tu ne puisses plus porter de glace...", 3000, 'error')
			elseif cremeg < 1 then
				TriggerClientEvent('dopeNotify2:Alert', xPlayer.source, "", "Pas assez de crème pour traiter...", 3000, 'error')
				-- TriggerClientEvent('esx:showNotification', source, '~r~Pas assez de tabac pour traiter...')
			else
				xPlayer.removeInventoryItem('cremeglace', 1)
				xPlayer.addInventoryItem('glacevanille', 1)
			end
				Transfo(source)
		end
	end)
end
--FIN TRANSFO

RegisterServerEvent('koko_glacier:startHarvest')
AddEventHandler('koko_glacier:startHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = true
    TriggerClientEvent('dopeNotify2:Alert', _source, "", "Récolte de crème glacée", 3000, 'info') --Si vous utilisez dopeNotify2
	-- TriggerClientEvent('esx:showNotification', _source, "Récolte de glaçon") --Si vous utilisez esx_showNotification
	Harvest(source)
end)

RegisterServerEvent('koko_glacier:stopHarvest')
AddEventHandler('koko_glacier:stopHarvest', function()
	local _source = source
	PlayersHarvesting[_source] = false
end)


-- TRANSFO
RegisterServerEvent('koko_glacier:starttransfo')
AddEventHandler('koko_glacier:starttransfo', function()
	local _source = source
	PlayersTransfo[_source] = true
    TriggerClientEvent('dopeNotify2:Alert', _source, "", "Préparation des glaces", 3000, 'info') --Si vous utilisez dopeNotify2
	-- TriggerClientEvent('esx:showNotification', _source, "Récolte de glaçon") --Si vous utilisez esx_showNotification
	Transfo(source)
end)

RegisterServerEvent('koko_glacier:stoptransfo')
AddEventHandler('koko_glacier:stoptransfo', function()
	local _source = source
	PlayersTransfo[_source] = false
end)
-- FIN TRANSFO


local function Sell(source)
	SetTimeout(7500, function() 
	
		if PlayersSelling[source] == true then
			local xPlayer  = ESX.GetPlayerFromId(source)
			local societyAccount = nil

				if xPlayer.getInventoryItem('glacevanille').count <= 0 then
					TriggerClientEvent('esx:showNotification', source, "Tu n'as plus rien à vendre")
					return
				elseif xPlayer.getInventoryItem('glacevanille').count >= 1 then
					SetTimeout(1400, function()
						local money = 22
						xPlayer.removeInventoryItem('glacevanille', 1)
						local societyAccount = nil

						TriggerEvent('esx_addonaccount:getSharedAccount', 'society_glacier', function(account)
							societyAccount = account
						end)
						if societyAccount ~= nil then
							societyAccount.addMoney(140) --Argent société
							xPlayer.addMoney(140) --Argent Joueur
						end
						Sell(source)
					end)
				end
		end
	end)
end

RegisterServerEvent('koko_glacier:startVente')
AddEventHandler('koko_glacier:startVente', function()
	print ("DEBUG : START SELL")
	local _source = source
	if PlayersSelling[_source] == false then
		TriggerClientEvent('esx:showNotification', _source, '~r~C\'est pas bien de glitch ~w~')
		PlayersSelling[_source]=false
	else
		PlayersSelling[_source] = true
		TriggerClientEvent('dopeNotify2:Alert', _source, "", "Vente de glace", 3000, 'info')
		Sell(_source)
	end
end)

RegisterServerEvent('koko_glacier:stopVente')
AddEventHandler('koko_glacier:stopVente', function()
	local _source = source
	if PlayersSelling[_source] == true then
		PlayersSelling[_source]=false
		TriggerClientEvent('esx:showNotification', _source, 'Vous sortez de la ~r~zone')
	else
		TriggerClientEvent('esx:showNotification', _source, 'Vous pouvez ~g~vendre')
		PlayersSelling[_source]=true
	end
end)
--Fin farm



--Achat bar
RegisterNetEvent('koko_glacier:achatbar')
AddEventHandler('koko_glacier:achatbar', function(v, quantite)
    local xPlayer = ESX.GetPlayerFromId(source)
    local societyAccount = nil
    local playerMoney = xPlayer.getMoney()
    local playerlimite = xPlayer.getInventoryItem(v.item).count

    if playerlimite >= 10 then
        TriggerClientEvent('esx:showNotification', source, "Ton inventaire est plein!")

    else
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_glacier', function(account)
        societyAccount = account
    end)
    if playerMoney >= v.prix * quantite then
        xPlayer.addInventoryItem(v.item, quantite)
        societyAccount.removeMoney(v.prix * quantite)

       TriggerClientEvent('esx:showNotification', source, "Tu as acheté ~g~x"..quantite.." ".. v.nom .."~s~ pour ~g~" .. v.prix * quantite.. "$")
    else
        TriggerClientEvent('esx:showNotification', source, "Ta pas assez de sous pour acheter ~g~"..quantite.." "..v.nom)
    end
    
end
    
end)
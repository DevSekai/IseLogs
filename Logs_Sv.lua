WebHook = "https://discordapp.com/api/webhooks/744662231152590969/xM-M2QgINdjiho2CLQC3ZaEv8JE8Q0GozC8m0Ub-SBOzNmF7jP5jO81K-2cQZqSi_oV0"
Name = "Nom du webhook"
Logo = "https://media.discordapp.net/attachments/743953072266412056/744662695541735504/CoreoLogo.png" -- Le lien dois toujours finir par .png ou .jpg
LogsBlue = 3447003
LogsRed = 15158332
LogsYellow = 15844367
LogsOrange = 15105570
LogsGrey = 9807270
LogsPurple = 10181046
LogsGreen = 3066993
LogsLightBlue = 1752220

RegisterNetEvent('Ise_Logs')
AddEventHandler('Ise_Logs', function(Color, Titre, Description)
	Ise_Logs(Color, Titre, Description)
end)

function Ise_Logs(Color, Titre, Description)
	local Content = {
	        {
	            ["color"] = Color,
	            ["title"] = Titre,
	            ["description"] = Description,
		        ["footer"] = {
	                ["text"] = Name,
	                ["icon_url"] = Logo,
	            },
	        }
	    }
	PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({username = Name, embeds = Content}), { ['Content-Type'] = 'application/json' })
end

AddEventHandler('playerDropped', function()
	local identifier
	local playerId = source
	local PcName = GetPlayerName(playerId)
	local PcIp = GetPlayerEndpoint(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	Ise_Logs(LogsRed, "Deconnexion du serveur", "Nom : "..PcName..".\nIp : "..PcIp..".\nLicense : "..identifier..".")
end)

AddEventHandler("playerConnecting", function ()
	local identifier
	local playerId = source
	local PcName = GetPlayerName(playerId)
	local PcIp = GetPlayerEndpoint(playerId)
	for k,v in ipairs(GetPlayerIdentifiers(playerId)) do
		if string.match(v, 'license:') then
			identifier = string.sub(v, 9)
			break
		end
	end
	Ise_Logs(LogsGreen, "Connexion au serveur", "Nom : "..PcName..".\nIp : "..PcIp..".\nLicense : "..identifier..".")
end)
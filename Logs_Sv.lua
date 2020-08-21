WebHook = "Your webhook url"
Name = "Your webhook name"
Logo = "Your logo url" -- He must finish by .png or .jpg
LogsBlue = 3447003
LogsRed = 15158332
LogsYellow = 15844367
LogsOrange = 15105570
LogsGrey = 9807270
LogsPurple = 10181046
LogsGreen = 3066993
LogsLightBlue = 1752220

RegisterNetEvent('Ise_Logs')
AddEventHandler('Ise_Logs', function(Color, Title, Description)
	Ise_Logs(Color, Title, Description)
end)

function Ise_Logs(Color, Title, Description)
	local Content = {
	        {
	            ["color"] = Color,
	            ["title"] = Title,
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

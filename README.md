# IseLogs
How to use IseLogs ?

Set your webhook url in "Logo_Sv.lua" at line 1.

Set your webhook name in "Logo_Sv.lua" at line 2.

Set your webhook logo url in "Logo_Sv.lua" at line 3.
-- The logo url must finish by .png or .jpg --

After this just need use this Trigger :

		from client side :
		TriggerServerEvent('Ise_Logs', Color, Title, Description)
		
		
		from server side :
		TriggerEvent('Ise_Logs', Color, Title, Description)

Color = 

	LogsBlue = 3447003
	
	LogsRed = 15158332
	
	LogsYellow = 15844367
	
	LogsOrange = 15105570
	
	LogsGrey = 9807270
	
	LogsPurple = 10181046
	
	LogsGreen = 3066993
	
	LogsLightBlue = 1752220
	
You can find more color here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812

local library = {}

function library:CreateEmbed(content, WebhookURL, title, description, link, thumbnailURL, color)
    local url = WebhookURL
    local data = {
        ["content"] = content,
        ["embeds"] = {
            {
                ["title"] = title,
                ["description"] = description,
                ["url"] = link,
                ["thumbnail"] = {
                    ["url"] = thumbnailURL,
                },
                ["type"] = "rich",
                ["color"] = tonumber(color),
                ["timestamp"] = DateTime.now():ToIsoDate()
            }
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or request or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef) -- sending the request
end

function library:SendMessage(content, WebhookURL)
    local url = WebhookURL
    local data = {
        ["content"] = content,
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data)

    local headers = {
        ["content-type"] = "application/json"
    }
    request = http_request or request or HttpPost or request or syn.request
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers}
    request(abcdef) -- sending the request
end

function library:AddExecutionLogs()
    local webhookcheck = 
	is_sirhurt_closure and "sirhurt" or pebc_execute and "protosmasher" or syn and "Synapse X" or -- using inbuilt functions to see what executor theyre using
	secure_load and "sentinel" or
	KRNL_LOADED and "krnl" or
	SONA_LOADED and "sona" or
	isvm and "proxo" or
	shadow_env and "shadow" or
	jit and "easyexploits" or
	WrapGlobal and "WeAreDevs" or
	getscriptenvs and "calamari" or
	OXYGEN_LOADED and "oxygen u" or
	IsElectron and "electron" or
	"undetected probably a shit executor"


    if getexecutorname and type(getexecutorname) == "function" then -- using scriptwares built-in function
        webhookcheck = "scriptware"
    end

    local function getTime()
        local date = os.date("!t")
        return ("%02d:%02d %s"):format(((date.hour % 24) - 1) % 12 + 1, date.min, date.hour > 11 and "PM" or "AM") -- converting it to a more readable string like strftime in python
    end


    local plr = game.Players.LocalPlayer -- getting local player
    local Workspace = game:GetService("Workspace")
    local UserInputService = game:GetService("UserInputService")
    local Mouse = plr:GetMouse()
    local CurrentCamera = Workspace.CurrentCamera
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local GameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name -- getting current games name
    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
    local AvatarImage = Thing.imageUrl
    local HWID = game:GetService("RbxAnalyticsService"):GetClientId();  
    local premium = false
    local alt = true
    if player.MembershipType == Enum.MembershipType.Premium then
        premium = true
    end

    if not premium and player.AccountAge >= 70 then
        alt = "Possibly"
    elseif not premium and player.AccountAge >= 500 then
        alt = "Unlikely"
    elseif not premium and player.AccountAge >= 1500 then
        alt = false		
    elseif premium and player.AccountAge >= 70 then
        alt = false
    end




    local url =
        "https://discord.com/api/webhooks/1010871176140181596/TvuHdZC5f5Pp1G4HmFLLkQnHDZV6yTiq-pNcZ2TGU8XGyv4KzAtpl8ZG13l97Fr8UQN1" -- WEBHOOK THIS IS THE ONE I USED IN TESTING SO CHANGE IT TO YOUR LINK
    local data = { -- putting JSON in a variable so it can be converted to JSON later on
        ["embeds"] = { -- declaring that you want the webhook to post an embed, needed for embeds
            {
                ["title"] = "**Execution Detected**",
                ["url"] = "https://www.roblox.com/users/" ..plr.UserId.. "/profile", -- all self explanotory, must have the same names here for it to work properly (title is the title, description is the description, etc.)
                ["description"] = "**Username**: `" ..plr.Name.. "`",
                ["thumbnail"] = {
                    ["url"] = AvatarImage,
                },
                ["type"] = "rich",
                ["color"] = tonumber(0x36393F), -- setting colour of the embed, done in hexadecimal hence the "0x" instead of using "#"
                ["fields"] = { -- fields that hold all the data inside the embed, 
                    {
                        ['name'] = "Exploit",
                        ["value"] = "`" .. webhookcheck .. "`", -- using executor variable i set up earlier and getting players username
                        ['inline'] = true -- whether you want it to be inline or not, set it to true/false mess around with it to how you want it to look
                    },
                    {
                        ['name'] = "Game",
                        ["value"] = "`" .. GameName .. "`",
                        ['inline'] = true
                    },
                    {
                        ['name'] = "User Id",
                        ["value"] = "`" .. plr.UserId .. "`", -- put script name here
                        ['inline'] = true
                    },
                    {
                        ['name'] = "Display Name",
                        ["value"] = "`" .. plr.DisplayName .. "`", -- put script name here
                        ['inline'] = true

                    },
                    {
                        ["name"] = "Alt",
                        ["value"] = "`" ..alt.. "`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Account Age",
                        ["value"] = "`" ..player.AccountAge.." Days`",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Is Premium",
                        ["value"] = premium,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "HWID",
                        ["value"] = '```' ..HWID.. '```',
                        ["inline"] = true
                    },
                    {
                        ['name'] = "Join Code",
                        ["value"] = '```game:GetService("TeleportService"):TeleportToPlaceInstance('..game.PlaceId..','..'"'..game.JobId..'"'..',' .. 'game.Players.LocalPlayer' .. ')```',
                        ['inline'] = true

                    }
                },
                ["timestamp"] = DateTime.now():ToIsoDate()
            }
        }
    }
    local newdata = game:GetService("HttpService"):JSONEncode(data) -- encoding the "data" variable into a JSON so that discord understands what it is

    local headers = {
        ["content-type"] = "application/json" -- headers are things inside the website, these are the things we need to access in discord for us to be able to use its api to send a webhook
    }
    request = http_request or request or HttpPost or request or syn.request -- sending a http request to the headers and discord website using executors in-built functions
    local abcdef = {Url = url, Body = newdata, Method = "POST", Headers = headers} -- giving the data to the website so it knows what to send and where to give it to
    request(abcdef) -- sending the request
end

return library

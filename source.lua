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

return library

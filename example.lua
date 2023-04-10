local webhook = loadstring(game:HttpGet('https://raw.githubusercontent.com/globaldoeslua/Webhook-Library/main/source.lua'))()

webhook:SendMessage(
    'Hello World!', -- Content
    'WEBHOOK_URL' -- Webhook URL
)

webhook:CreateEmbed(
    '@everyone', -- Content
    'WEBHOOK_URL', -- Webhook URL
    'Webhook Title', -- Webhook Title
    'Webhook Description', -- Webhook Description
    'Embed Link', -- makes the title a clickable link
    'Thumbnail URL', -- Picture on the embed
    '0x36393F' -- Embed Color in hex
)

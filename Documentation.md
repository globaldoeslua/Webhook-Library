# Usage

## Loading the Library
```lua
local webhook = loadstring(game:HttpGet('https://raw.githubusercontent.com/globaldoeslua/Webhook-Library/main/source.lua'))()
```

## Sending a message through your webhook
```lua
webhook:SendMessage(
    'Hello World!', -- Content
    'WEBHOOK_URL' -- Webhook URL
)
```

## Sending an embed through your webhook
```lua
webhook:CreateEmbed(
    '@everyone', -- Content
    'WEBHOOK_URL', -- Webhook URL
    'Webhook Title', -- Webhook Title
    'Webhook Description', -- Webhook Description
    'Embed Link', -- makes the title a clickable link
    'Thumbnail URL', -- Picture on the embed
    '0x36393F' -- Embed Color in hex
)
```

## Adding inbuilt execution logs
```lua
webhook:AddExecutionLogs('WEBHOOK_URL')
```

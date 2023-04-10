# Usage

## Sending a message through your webhook
```lua
SendMessage(
    'Hello World!', -- Content
    'WEBHOOK_URL' -- Webhook URL
)
```

## Sending an embed through your webhook
```lua
CreateEmbed(
    '@everyone', -- Content
    'WEBHOOK_URL', -- Webhook URL
    'Webhook Title', -- Webhook Title
    'Webhook Description', -- Webhook Description
    'Embed Link', -- makes the title a clickable link
    'Thumbnail URL', -- Picture on the embed
    '0x36393F' -- Embed Color in hex
)
```

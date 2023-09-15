-- Change the embed images and color (icon_url, thumb_url Link and color must be changed, for ex. color = DecimalHere resets to a predefined standard)
Config.Discord = {
    icon_url = "https://cdn.discordapp.com/attachments/1113397827444424736/1135615896283529297/tx-discord-logo.png", --> Icon Logo
    thumb_url = "https://cdn.discordapp.com/attachments/1113397827444424736/1135615896283529297/tx-discord-logo.png", --> Thumbnail Logo
    color = 3800832 --> It must be decimal Color Code (Hex Color Code to Decimal https://convertingcolors.com/)
}

-- Enable/Disable Eventslog (webhook Link must be changed, for ex. restartAndShutdownWebhook = "link" is disabled too)
Config.Events = {

    --> Restart Log

    enableRestartAndShutdownLog = true,
    restartAndShutdownWebhook = "--Webook-here--",
    
    --> Player Kicked Log

    enableKickLog = true,
    kickWebhook = "--Webook-here--",
    
    --> Player Warned Log

    enableWarnLog = true,
    warnWebhook = "--Webook-here--",
    
    --> Player Banned Log

    enableBanLog = true,
    banWebhook = "--Webook-here--",
    
    --> Config Changed Log

    enableConfigChangedLog = true,
    configChangedWebhook = "--Webook-here--",
    
    --> Player healed Log

    enableHealLog = true,
    healWebhook = "--Webook-here--",
    
    --> Announcement Log

    enableAnnounceLog = true,
    announceWebhook = "--Webook-here--",
    
    --> Direct Message Log

    enableDirectMessageLog = true,
    directMessageWebhook = "--Webook-here--",

    --> Warn Revoked Log

    enableWarnRevokedLog = true,
    warnRevokedWebhook = "--Webook-here--",
    
    --> Ban Revoked Log

    enableBanRevokedLog = true,
    banRevokedWebhook = "--Webook-here--",

    --> Other Revoked Log

    enableOtherRevokedLog = true,
    otherRevokedWebhook = "--Webook-here--",
    
    --> Skipped next scheduled Restart Log
    
    enableSkippedNextScheduledRestartLog = true,
    skippedNextScheduledRestartWebhook = "--Webook-here--",

    --> Whitelist Player Log

    enableWhitelistPlayerLog = true,
    whitelistPlayerWebhook = "--Webook-here--",

    --> Admin Auth Log

    enableAdminAuthLog = true,
    adminAuthWebhook = "--Webook-here--",
}

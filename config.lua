--   _____  _   __      ______ _  __  ___        __            _         __                                _    __ ___ 
--  / ___/ / | / /     /_  __/| |/ / /   |  ____/ /____ ___   (_)____   / /   ____   ____ _ _____         | |  / //__ \
--  \__ \ /  |/ /______ / /   |   / / /| | / __  // __ `__ \ / // __ \ / /   / __ \ / __ `// ___/ ______  | | / / __/ /
-- ___/ // /|  //_____// /   /   | / ___ |/ /_/ // / / / / // // / / // /___/ /_/ // /_/ /(__  ) /_____/  | |/ / / __/ 
--/____//_/ |_/       /_/   /_/|_|/_/  |_|\__,_//_/ /_/ /_//_//_/ /_//_____/\____/ \__, //____/           |___/ /____/
--                                                                                /____/       

Config = {}

-- Username of the Webhook
Config.name = 'TxAdminLogs'

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
    restartAndShutdownWebhook = "link",
    
    --> Player Kicked Log

    enableKickLog = true,
    kickWebhook = "link",
    
    --> Player Warned Log

    enableWarnLog = true,
    warnWebhook = "link",
    
    --> Player Banned Log

    enableBanLog = true,
    banWebhook = "link",
    
    --> Config Changed Log

    enableConfigChangedLog = true,
    configChangedWebhook = "link",
    
    --> Player healed Log

    enableHealLog = true,
    healWebhook = "link",
    
    --> Announcement Log

    enableAnnounceLog = true,
    announceWebhook = "link",
    
    --> Direct Message Log

    enableDirectMessageLog = true,
    directMessageWebhook = "link",

    --> Warn Revoked Log

    enableWarnRevokedLog = true,
    warnRevokedWebhook = "link",
    
    --> Ban Revoked Log

    enableBanRevokedLog = true,
    banRevokedWebhook = "link",

    --> Other Revoked Log

    enableOtherRevokedLog = true,
    otherRevokedWebhook = "link",
    
    --> Skipped next scheduled Restart Log
    
    enableSkippedNextScheduledRestartLog = true,
    skippedNextScheduledRestartWebhook = "link",

    --> Whitelist Player Log

    enableWhitelistPlayerLog = true,
    whitelistPlayerWebhook = "link",

    --> Admin Auth Log

    enableAdminAuthLog = true,
    adminAuthWebhook = "link",
}

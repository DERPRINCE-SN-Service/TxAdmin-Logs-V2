ESX = exports["es_extended"].getSharedObject()

local logo = [===[^2   _____  _   __      ______ _  __  ___        __            _         __                      
  / ___/ / | / /     /_  __/| |/ / /   |  ____/ /____ ___   (_)____   / /   ____   ____ _ _____
  \__ \ /  |/ /______ / /   |   / / /| | / __  // __ `__ \ / // __ \ / /   / __ \ / __ `// ___/
 ___/ // /|  //_____// /   /   | / ___ |/ /_/ // / / / / // // / / // /___/ /_/ // /_/ /(__  ) 
/____//_/ |_/       /_/   /_/|_|/_/  |_|\__,_//_/ /_/ /_//_//_/ /_//_____/\____/ \__, //____/  
                                                                                /____/         

SN-Info^0 >>> ^1TXAdmin-Logs ^2v2^0 - ^1Better than ever! ^0
^2Los gehts!^0]===]

print(logo)



if Config.Events.enableRestartAndShutdownLog and Config.Events.restartAndShutdownWebhook ~= "link" or Config.Events.restartAndShutdownWebhook ~= "" then
	AddEventHandler("txAdmin:events:scheduledRestart", function(eventData)
		local time = toint(eventData.secondsRemaining/60)
		if time ~= 1 then
			sendToDiscord("Nächster Restart", "Der nächste Restart ist in **"..time.." Minuten**", "Tx-Admin Logs by SN-Service", Config.Events.restartAndShutdownWebhook)
		else
			sendToDiscord("Nächster Restart", "Der nächste Restart ist in **"..time.." Minute**\n*Jetzt disconnecten!*", "Tx-Admin Logs by SN-Service", Config.Events.restartAndShutdownWebhook)
		end
	end)
	AddEventHandler("txAdmin:events:skippedNextScheduledRestart", function(eventData)
		sendToDiscord("Nächster Restart", "Der nächste Restart wurde **deaktiviert**", "Tx-Admin Logs by SN-Service", Config.Events.restartAndShutdownWebhook)
	end)

	AddEventHandler("txAdmin:events:serverShuttingDown", function(eventData)
		local time = toint(eventData.delay/1000)
		sendToDiscord("Server wird heruntergefahren", "Der Server wird in **"..time.." Sekunden** heruntergefahren/gerestartet\n**Ausgelöst durch:** "..eventData.author, "Tx-Admin Logs by SN-Service", Config.Events.restartAndShutdownWebhook)
	end)
end

if Config.Events.enableKickLog and Config.Events.kickWebhook ~= "link" or Config.Events.kickWebhook ~= "" then
	AddEventHandler("txAdmin:events:playerKicked", function(eventData)
		local name = GetPlayerName(eventData.target)
		sendToDiscord("Spieler wurde gekickt", "Der Spieler **"..name.." (ID: "..eventData.target..")** wurde von **"..eventData.author.."** gekickt. \n\nGrund: **"..eventData.reason.."**", "Tx-Admin Logs by SN-Service", Config.Events.kickWebhook)
	end)
end

if Config.Events.enableWarnLog and Config.Events.warnWebhook ~= "link" or Config.Events.warnWebhook ~= "" then
	AddEventHandler("txAdmin:events:playerWarned", function(eventData)
		local name = GetPlayerName(eventData.target)
		sendToDiscord("Spieler wurde verwarnt", "Der Spieler **"..name.." (ID:"..eventData.target..")** wurde von **"..eventData.author.."** verwarnt. \n\nGrund: **"..eventData.reason.."**\nId von der Action: `"..eventData.actionId.."`", "Tx-Admin Logs by SN-Service", Config.Events.warnWebhook)
	end)
end

if Config.Events.enableBanLog and Config.Events.banWebhook ~= "link" or Config.Events.banWebhook ~= "" then
	AddEventHandler("txAdmin:events:playerBanned", function(eventData)
		local author = eventData.author 
		local reason = eventData.reason
		local actionId = eventData.actionId 
		local expiration = eventData.expiration
		local targetNetId = eventData.targetNetId
		local targetIds = extractIdentifiers(eventData.targetIds)     
		local targetHwids = eventData.targetHwids
		local targetName = eventData.targetName
		local kickMessage = eventData.kickMessage


		if expiration ~= false then
			if targetNetId == null then
				sendToDiscord("Spieler wurde temporär gebannt", "Der Spieler "..targetName.." wurde von "..author.." temporär wegen dem/den Grund/en `"..reason.."` gebannt.\n\nAls Kickmessage bekam er/sie \n`"..kickMessage.."` \nangezeigt.\n\n**Der Ban wird <t:"..expiration..":R> auslaufen**\n\nIdentifiers:\nSteam-ID: ||"..targetIds.steamid.."||\nLicense: ||"..targetIds.license.."||\nLicense2: ||"..targetIds.license2.."||\nXbl: ||"..targetIds.xbl.."||\nIP: ||"..targetIds.ip.."||\nDiscord: ||<@"..targetIds.discord..">||\nLive-ID: ||"..targetIds.liveid.."||\nFiveM: ||"..targetIds.fivem.."||\n\nAction Id: `"..actionId.."`", "Tx-Admin Logs by SN-Service", Config.Events.banWebhook)
			else
				sendToDiscord("Spieler wurde temporär gebannt", "Der Spieler "..targetName.." ("..targetNetId..") wurde von "..author.." temporär wegen dem/den Grund/en `"..reason.."` gebannt.\n\nAls Kickmessage bekam er/sie \n`"..kickMessage.."` \nangezeigt.\n\n**Der Ban wird <t:"..expiration..":R> auslaufen**\n\nIdentifiers:\nSteam-ID: ||"..targetIds.steamid.."||\nLicense: ||"..targetIds.license.."||\nLicense2: ||"..targetIds.license2.."||\nXbl: ||"..targetIds.xbl.."||\nIP: ||"..targetIds.ip.."||\nDiscord: ||<@"..targetIds.discord..">||\nLive-ID: ||"..targetIds.liveid.."||\nFiveM: ||"..targetIds.fivem.."||\n\nAction Id: `"..actionId.."`", "Tx-Admin Logs by SN-Service", Config.Events.banWebhook)
			end
		else
			if targetNetId == null then
				sendToDiscord("Spieler wurde permanent gebannt", "Der Spieler "..targetName.." wurde von "..author.." permanent wegen dem/den Grund/en `"..reason.."` gebannt.\n\nAls Kickmessage bekam er/sie \n`"..kickMessage.."` \nangezeigt.\n\n**Der Ban wird NIEMALS auslaufen**\n\nIdentifiers:\nSteam-ID: ||"..targetIds.steamid.."||\nLicense: ||"..targetIds.license.."||\nLicense2: ||"..targetIds.license2.."||\nXbl: ||"..targetIds.xbl.."||\nIP: ||"..targetIds.ip.."||\nDiscord: ||<@"..targetIds.discord..">||\nLive-ID: ||"..targetIds.liveid.."||\nFiveM: ||"..targetIds.fivem.."||\n\nAction Id: `"..actionId.."`", "Tx-Admin Logs by SN-Service", Config.Events.banWebhook)
			else
				sendToDiscord("Spieler wurde permanent gebannt", "Der Spieler "..targetName.." ("..targetNetId..") wurde von "..author.." permanent wegen dem/den Grund/en `"..reason.."` gebannt.\n\nAls Kickmessage bekam er/sie \n`"..kickMessage.."` \nangezeigt.\n\n**Der Ban wird NIEMALS auslaufen**\n\nIdentifiers:\nSteam-ID: ||"..targetIds.steamid.."||\nLicense: ||"..targetIds.license.."||\nLicense2: ||"..targetIds.license2.."||\nXbl: ||"..targetIds.xbl.."||\nIP: ||"..targetIds.ip.."||\nDiscord: ||<@"..targetIds.discord..">||\nLive-ID: ||"..targetIds.liveid.."||\nFiveM: ||"..targetIds.fivem.."||\n\nAction Id: `"..actionId.."`", "Tx-Admin Logs by SN-Service", Config.Events.banWebhook)
			end
		end
	end)
end

if Config.Events.enableConfigChangedLog and Config.Events.configChangedWebhook ~= "link" or Config.Events.configChangedWebhook ~= "" then
	AddEventHandler("txAdmin:events:configChanged", function(eventData)
		sendToDiscord("Config wurde verändert", "Es wurden Änderungen in den txAdmin Einstellungen vorgenommen, wenn du es nicht warst, überprüfe es so schnell es geht.", "Tx-Admin Logs by SN-Service", Config.Events.configChangedWebhook)
	end)
end

if Config.Events.enableHealLog and Config.Events.healWebhook ~= "link" or Config.Events.healWebhook ~= "" then
	AddEventHandler("txAdmin:events:healedPlayer", function(eventData) 
		local id = eventData.id
		if id == -1 then
			sendToDiscord("Alle Spieler geheilt", "Ein Admin hat soeben alle Spieler geheilt.", "Tx-Admin Logs by SN-Service", Config.Events.healWebhook)
		else
			local name = GetPlayerName(id)
			sendToDiscord("Spieler geheilt", "Der Admin "..name.." hat sich soeben geheilt", "Tx-Admin Logs by SN-Service", Config.Events.healWebhook)
		end
	end)
end


if Config.Events.enableAnnounceLog and Config.Events.announceWebhook ~= "link" or Config.Events.announceWebhook ~= "" then
	AddEventHandler("txAdmin:events:announcement", function(eventData)
		sendToDiscord("Ankündigung", "Von: "..eventData.author.."\nInhalt: **"..eventData.message.."**", "Tx-Admin Logs by SN-Service", Config.Events.configChangedWebhook)
	end)
end

AddEventHandler("txAdmin:events:actionRevoked", function(eventData)
	local id = eventData.actionId
	local atype = eventData.actionType
	local reason = eventData.actionReason
	local actionAuthor = eventData.actionAuthor
	local playerName = eventData.playerName
	local identifiers = extractIdentifiers(eventData.playerIds)
	local revokedBy = eventData.revokedBy
	
	if atype == "ban" then
		if Config.enableBanRevokedLog and Config.Events.banRevokedWebhook ~= "link" or Config.Events.banRevokedWebhook ~= "" then
			sendToDiscord("Ban wurde widerrufen", "Widerrufen von: "..revokedBy.."\n\n----------------Bandaten---------------\nGebannt von: **"..actionAuthor.."**\nBangrund: **"..reason.."**\nBan-ID: `"..id.."`\nSpielername: **"..playerName.."**\nDiscord: ||<@"..identifiers.discord..">||\nSteam: ||"..identifiers.steamid.."||\nLicense: ||"..identifiers.license.."||\nLicense2: ||"..identifiers.license2.."||\nXBL: ||"..identifiers.xbl.."||\nIP: ||"..identifiers.ip.."||\nLiveID: ||"..identifiers.liveid.."||", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		end
	elseif atype == "warn" then 
		if Config.enableWarnRevokedLog and Config.Events.warnRevokedWebhook ~= "link" or Config.Events.warnRevokedWebhook ~= "" then
			sendToDiscord("Warn wurde widerrufen", "Widerrufen von: "..revokedBy.."\n\n---------------Warndaten---------------\nGewarnt von: **"..actionAuthor.."**\nWarngrund: **"..reason.."**\nWarn-ID: `"..id.."`\nSpielername: **"..playerName.."**\nDiscord: ||<@"..identifiers.discord..">||\nSteam: ||"..identifiers.steamid.."||\nLicense: ||"..identifiers.license.."||\nLicense2: ||"..identifiers.license2.."||\nXBL: ||"..identifiers.xbl.."||\nIP: ||"..identifiers.ip.."||\nLiveID: ||"..identifiers.liveid.."||", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		end
	else
		if Config.enableOtherRevokedLog and Config.Events.otherRevokedWebhook ~= "link" or Config.Events.otherRevokedWebhook ~= "" then
			sendToDiscord("Aktion wurde widerrufen", "Widerrufen von: "..revokedBy.."\n\n------------Aktionsdaten--------------\nAktion von: **"..actionAuthor.."**\nAktionsgrund: **"..reason.."**\nAktions-ID: `"..id.."`\nSpielername: **"..playerName.."**\nDiscord: ||<@"..identifiers.discord..">||\nSteam: ||"..identifiers.steamid.."||\nLicense: ||"..identifiers.license.."||\nLicense2: ||"..identifiers.license2.."||\nXBL: ||"..identifiers.xbl.."||\nIP: ||"..identifiers.ip.."||\nLiveID: ||"..identifiers.liveid.."||", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		end
	end
end)


if Config.Events.enableWhitelistPlayerLog and Config.Events.whitelistPlayerWebhook ~= "link" or Config.Events.whitelistPlayerWebhook ~= "" then
	AddEventHandler("txAdmin:events:whitelistPlayer", function(eventData)
		local action = eventData.action
		local license = eventData.license
		local name = eventData.playerName
		local admin = eventData.adminName

		if action == "added" then
			sendToDiscord("Whitelist wurde hinzugefügt", "Der Spieler "..name.." ||(License: "..license..")|| wurde von "..admin.." gewhitelist", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		elseif action == "removed" then
			sendToDiscord("Whitelist wurde entfernt", "Dem Spieler "..name.." ||(License: "..license..")|| wurde von "..admin.." die Whitelist entzogen", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		end
	end)
	AddEventHandler("txAdmin:events:whitelistPreApproval", function(eventData)
		local action = eventData.action
		local license = eventData.license
		local name = eventData.playerName
		local admin = eventData.adminName

		if action == "added" then
			sendToDiscord("Whitelist wurde hinzugefügt", "Der Spieler "..name.." mit der License: `"..license.."` wurde von "..admin.." gewhitelist", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		elseif action == "removed" then
			sendToDiscord("Whitelist wurde entfernt", "Dem Spieler mit der License: `"..license.."` wurde von "..admin.." die Whitelist entzogen", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		end
	end)
	AddEventHandler("txAdmin:events:whitelistRequest", function(eventData)
		local action = eventData.action
		local license = eventData.license
		local name = eventData.playerName
		local admin = eventData.adminName

		if action == "requested" then
			sendToDiscord("Whitelist wurde angefragt", "Der Spieler "..name.."  mit der License: "..license.." hat eine Whitelist angefragt", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		elseif action == "approved" then
			sendToDiscord("Whitelistanfrage angenommen", "Der Spieler "..name.." mit der License: "..license.." wurde von "..admin.." angenommen.", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		elseif action == "denied" then
			sendToDiscord("Whitelistanfrage abgelehnt", "Der Spieler "..name.." mit der License: "..license.." wurde von "..admin.." abgelehnt.", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		elseif action == "deniedAll" then
			sendToDiscord("Whitelistanfragen abgelehnt", "Alle offenen Whitelistanfragen wurden von "..admin.." abgelehnt.", "Tx-Admin Logs by SN-Service", Config.Events.banRevokedWebhook)
		end
	end)
end

--> Functions


function sendToDiscord(title, text, footer, link)
	local embed = {
		{
			["title"] = title,
			["thumbnail"] = {
				["url"] = Config.Discord.thumb_url,
			},
			["color"] = Config.Discord.color,
			["description"] = text,
			["footer"] = {
				["text"] = footer, 
				["icon_url"] = Config.Discord.icon_url,
			}
		}
	}
	PerformHttpRequest(link, function(err, text, headers) end, 'POST', json.encode({username = Config.name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

function toint(n)
    local s = tostring(n)
    local i, j = s:find('%.')
    if i then
        return tonumber(s:sub(1, i-1))
    else
        return n
    end
end


function extractIdentifiers(identifiers)
    local result = {
        steamid = "not found",
        license = "not found",
        license2 = "not found",
        xbl = "not found",
        ip = "not found",
        discord = "not found",
        liveid = "not found",
        fivem = "not found"
    }

    for _, v in pairs(identifiers) do
        if string.sub(v, 1, string.len("steam:")) == "steam:" then
            result.steamid = v
        elseif string.sub(v, 1, string.len("license:")) == "license:" then
            result.license = v
        elseif string.sub(v, 1, string.len("fivem:")) == "fivem:" then
            result.fivem = v
        elseif string.sub(v, 1, string.len("license2:")) == "license2:" then
            result.license2 = v
        elseif string.sub(v, 1, string.len("xbl:")) == "xbl:" then
            result.xbl = v
        elseif string.sub(v, 1, string.len("ip:")) == "ip:" then
            result.ip = v
        elseif string.sub(v, 1, string.len("discord:")) == "discord:" then
            local discordID = {}
            for str in string.gmatch(v, "([^:]+)") do
                table.insert(discordID, str)
            end
            result.discord = discordID[2]
        elseif string.sub(v, 1, string.len("live:")) == "live:" then
            result.liveid = v
        end
    end

    return result
end

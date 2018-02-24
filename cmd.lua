ra_options = {}

SLASH_SAYRES1, SLASH_SAYRES2 = '/sayres', '/sr'
function SlashCmdList.SAYRES(msg, editbox)
  local cmd, opt = strsplit(" ", msg)
  local chatformat_cmd = "|cFFFF8080rA |\124|cffffff55"
  local chatformat_info = "|cFFFF8080rA |\124|cffff0000"
  if cmd == "chat" then
    if opt == "0" then
      DEFAULT_CHAT_FRAME:AddMessage(chatformat_cmd.."Chat Output set to: |cff00ff00DYNAMIC")
      ra_options.chat = "0"
    elseif opt == "1" then
      DEFAULT_CHAT_FRAME:AddMessage(chatformat_cmd.."Chat Output set to: |cffff7d00RAID")
      ra_options.chat = "1"
    elseif opt == "2" then
      DEFAULT_CHAT_FRAME:AddMessage(chatformat_cmd.."Chat Output set to: |rSAY")
      ra_options.chat = "2"
    else
      DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."Unknown Chat Option")
      return
    end
  ra_options[cmd] = opt
  elseif msg == "help" or "" then
    if msg ~= "help" then
      DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."Unkown Command")
      DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."----")
    end
    DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."About:|cffffff55 Announces when you resurrect a player in your Raid/Party")
    DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."Usage:|cffffff55 /sayres {chat\124|help}")
    DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."chat {number}:|cffffff55 0, Dynamic (Party/Raid); 1, Party; 2, Say")
    DEFAULT_CHAT_FRAME:AddMessage(chatformat_info.."help:|cffffff55 Shows this message")
    return
  end
end
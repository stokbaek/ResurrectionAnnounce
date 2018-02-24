ra_options = {}

rahealcomm = CreateFrame("Frame")
rahealcomm:RegisterEvent("CHAT_MSG_ADDON")
rahealcomm:SetScript("OnEvent", function()
  if event == "CHAT_MSG_ADDON" and arg1 == "HealComm" then
    this:ParseChatMessage(arg4, arg2)
  end
end)

function rahealcomm:ParseChatMessage(sender, msg)
  local _, _, evtype, target  = string.find(msg, '(Resurrection)/(%a+)/(start)/')
  if evtype and target then
    rahealcomm:Ress(sender, target)
    return
  end
end

function rahealcomm:Ress(sender, target)
  if sender ==  UnitName("player") and target ~= UnitName("player") then
    if ra_options.chat == "0" then
      SendChatMessage("Resurrecting " .. target, UnitInRaid("player") and "RAID" or "PARTY")
    elseif ra_options.chat == "1" then
      if UnitInRaid("player") and "Raid" then
        SendChatMessage("Resurrecting " .. target, "RAID")
      end
    else
      SendChatMessage("Resurrecting " .. target, "SAY")
    end
  end
end

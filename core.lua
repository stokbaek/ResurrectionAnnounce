local events = {}
local ress = {}

ra_options = {}

rahealcomm = CreateFrame("Frame")
rahealcomm:RegisterEvent("CHAT_MSG_ADDON")
rahealcomm:SetScript("OnEvent", function()
  if event == "CHAT_MSG_ADDON" and arg1 == "HealComm" then
    this:ParseChatMessage(arg4, arg2)
  end
end)

rahealcomm:SetScript("OnUpdate", function()
  for timestamp, targets in pairs(events) do
    if GetTime() >= timestamp then
  	  for id, target in pairs(targets) do
        rahealcomm:TriggerUpdate(target)
      end
      events[timestamp] = nil
    end
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
  ress[target] = ress[target] or {}
  ress[target][sender] = true

  if sender ==  UnitName("player") and target ~= UnitName("player") then
    if ra_options.chat == "0" then
      SendChatMessage("Resurrecting " .. target, UnitInRaid("player") and "Raid" or "Party")
    elseif ra_options.chat == "1" then
      if UnitInRaid("player") and "Raid" then
        SendChatMessage("Resurrecting " .. target, "Raid")
      end
    else
      SendChatMessage("Resurrecting " .. target, "Say")
    end
  end
end
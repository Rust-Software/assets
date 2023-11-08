local Blacklisted = {
    --[[ GROUP BLACKLIST TEMPLATE: 
    
    [ENTER GROUP ID HERE] = {
        groupName = "Enter name here!",
        reason = "Enter reason here!",
        exceptions = {} -- Exceptions are issued in user ids, for example: id1,id2,id3
    },
    
    ]]
}
--[[

Extras for message:

$group_id -> group id
$group_name -> group name
$ban_reason -> group ban reason

]]

local Message = "RW Protection: Blacklisted group, ##rw_GROUP_NAME (##rw_GROUP_ID)"

local Players = game:GetService("Players")

function pAdded(player)
    for GroupID, Data in pairs(Blacklisted) do
        if player:IsInGroup(GroupID) and not table.find(Data.exceptions) then
            local KickMessage = Message
            KickMessage = string.gsub(KickMessage, "$group_id", GroupID)
            KickMessage = string.gsub(KickMessage, "$group_name", Data.groupName)
            KickMessage = string.gsub(KickMessage, "$ban_reason", Data.reason)

            player:Kick(KickMessage)
        end
    end
end

Players.PlayerAdded:Connect(pAdded)
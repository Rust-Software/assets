type BlacklistTable = {{groupName: string,reason: string?,exceptions: {number | string}}}

--[[

`7MM"""Mq.`7MMF'     A     `7MF'
  MM   `MM. `MA     ,MA     ,V  
  MM   ,M9   VM:   ,VVM:   ,V   
  MMmmdM9     MM.  M' MM.  M'   
  MM  YM.     `MM A'  `MM A'    
  MM   `Mb.    :MM;    :MM;     
.JMML. .JMM.    VF      VF  
    -- R U S T W A R E --

Rust Software - All rights owned

]]

local Message = "RW Protection: Blacklisted group, $group_name ($group_id)"

--[[

Extras for message:

$group_id -> group id
$group_name -> group name
$ban_reason -> group ban reason

]]

local Blacklisted: BlacklistTable = {
    --[[ GROUP BLACKLIST TEMPLATE: 
    
    [ENTER GROUP ID HERE] = {
        groupName = "Enter name here!",
        reason = "Enter reason here!",
        exceptions = {} -- Exceptions are issued in user ids, for example: id1,id2,id3
    },
    
    ]]

	[32490251] = {
		groupName = "Alohi",
		reason = "bad",
		exceptions = {} -- Exceptions are issued in user ids and usernames, for example: id1,id2,id3,username1,username2
	},
}
































-- ADVANCED PROGRAMMERS AHEAD! DO NOT TOUCH IF YOU ARE NOT EXPERIENCED!

local Players = game:GetService("Players")
local gsub = string.gsub

Players.PlayerAdded:Connect(function(player: Player) 
	for GroupID, Data in pairs(Blacklisted) do
		if player:IsInGroup(GroupID) and not (table.find(Data.exceptions, player.UserId) or table.find(Data.exceptions, player.Name)) then
			local KickMessage = Message
			KickMessage = gsub(KickMessage, "$group_id", GroupID)
			KickMessage = gsub(KickMessage, "$group_name", Data.groupName or "N/A")
			KickMessage = gsub(KickMessage, "$ban_reason", Data.reason or "N/A")

			player:Kick(KickMessage)
		end
	end
end)
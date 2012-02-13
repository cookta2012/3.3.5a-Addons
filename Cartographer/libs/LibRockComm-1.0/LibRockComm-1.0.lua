--[[
Name: LibRockComm-1.0
Revision: $Rev: 263 $
Developed by: ckknight (ckknight@gmail.com)
Website: http://www.wowace.com/
Description: Library to allow for inter-player addon communications.
Dependencies: LibRock-1.0
License: LGPL v2.1
]]

local MAJOR_VERSION = "LibRockComm-1.0"
local MINOR_VERSION = tonumber(("$Revision: 263 $"):match("(%d+)")) + 90000

if not Rock then error(MAJOR_VERSION .. " requires LibRock-1.0") end

local RockComm, oldLib = Rock:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not RockComm then
	return
end

-- #AUTODOC_NAMESPACE RockComm

local _G = _G
local GetLocale = _G.GetLocale

local L = {
	["Send talent info"] = "Send talent info",
	["Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game."] = "Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game.",
	["Send addon version info"] = "Send addon version info",
	["Send out addon version information to those who request it. In turn, you will be able to request addon version info from others."] = "Send out addon version information to those who request it. In turn, you will be able to request addon version info from others.",
}
if GetLocale() == "deDE" then
	-- modify L here
elseif GetLocale() == "zhCN" then
--***************************************
-- zhCN Chinese Simplify
-- 2007/10/05 CN3 羽月 雪夜之狼
-- E=mail:xionglingfeng@Gmail.com
--***************************************
	L["Send talent info"] = "发送天赋信息"
	L["Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game."] = "发送天赋信息给需要它的人。你将能向他人请求天赋信息。除了可以在游戏中使用外，其它和Armory相同。"
	L["Send addon version info"] = "发送插件版本信息"
	L["Send out addon version information to those who request it. In turn, you will be able to request addon version info from others."] = "发送插件版本信息给需要它的人。你将能向他人请求插件版本信息。"
elseif GetLocale() == "zhTW" then
--*******************************
-- zhTW Chinses Traditional localiation
-- 2007/Oct/8 init. version
-- by 蕾艾莎塔@奧妮克希亞
--*******************************
	L["Send talent info"] = "傳送天賦資訊"
	L["Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game."] = "傳送你的天賦資料給要求者，從另一方面來說，你可以向別人要求天賦資料。這個功能，除了是在遊戲中可用的這一點外，其它和英雄榜 (Armory) 是相同的。"
	L["Send addon version info"] = "傳送插件版本號碼"
	L["Send out addon version information to those who request it. In turn, you will be able to request addon version info from others."] = "傳送你的版本資料給要求者，從另一方面來說，你可以向別人要求版本編號。"
elseif GetLocale() == "koKR" then
	L["Send talent info"] = "특성 정보 보냄"
	L["Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game."] = "그것을 부탁하는 사람들에게 특성 정보를 보냅니다. 당신은 다른 사람에게 특성 정보를 부탁할 수 있습니다."
	L["Send addon version info"] = "애드온 버전 정보 보냄"
	L["Send out addon version information to those who request it. In turn, you will be able to request addon version info from others."] = "그것을 부탁하는 사람들에게 애드온의 버전 정보를 보냅니다. 당신은 다른 사람에게 애드온의 버전 정보를 부탁할 수 있습니다."
elseif GetLocale() == "frFR" then
	L["Send talent info"] = "Envoyer les infos des talents"
	L["Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game."] = "Envoye les informations concernant vos talents à ceux qui en font la requête. En retour, vous pourrez demander les informations des talents des autres. Ceci est équivalent à l'Armurerie, mais en jeu."
	L["Send addon version info"] = "Envoyer les infos des versions"
	L["Send out addon version information to those who request it. In turn, you will be able to request addon version info from others."] = "Envoye les informations de version de vos addons à ceux qui en font la requête. En retour, vous pourrez demander les informations de version des addons des autres."
end

local Rock = _G.Rock
local ChatThrottleLib = _G.ChatThrottleLib
local error = _G.error
local pcall = _G.pcall
local unpack = _G.unpack
local pairs = _G.pairs
local ipairs =  _G.ipairs
local type = _G.type
local GetFramerate = _G.GetFramerate
local hooksecurefunc = _G.hooksecurefunc
local select = _G.select
local assert = _G.assert
local geterrorhandler = _G.geterrorhandler
local tostring = _G.tostring
local next = _G.next
local GetItemInfo = _G.GetItemInfo
local tonumber = _G.tonumber
local IsInGuild = _G.IsInGuild
local GetNumPartyMembers = _G.GetNumPartyMembers
local GetNumRaidMembers = _G.GetNumRaidMembers
local math_floor = _G.math.floor
local GetTime = _G.GetTime
local table_remove = _G.table.remove
local math_min = _G.math.min
local math_max = _G.math.max
local setmetatable = _G.setmetatable
local table_concat = _G.table.concat
local math_ldexp = _G.math.ldexp
local math_frexp = _G.math.frexp
local string_char = _G.string.char
local UnitName = _G.UnitName
local IsInInstance = _G.IsInInstance
local SetCVar = _G.SetCVar
local GetCVar = _G.GetCVar

RockComm.frame = oldLib and oldLib.frame or _G.CreateFrame("Frame")
local frame = RockComm.frame
frame:UnregisterAllEvents()
RockComm.data = setmetatable(oldLib and oldLib.data or {}, {__mode='k'})
local data = RockComm.data
RockComm.listeners = setmetatable(oldLib and oldLib.listeners or {}, {__mode='k'})
local listeners = RockComm.listeners
RockComm.hooks = setmetatable(oldLib and oldLib.hooks or {}, {__mode='k'})
local hooks = RockComm.hooks
RockComm.addonVersionReceptors = oldLib and oldLib.addonVersionReceptors or {}
local addonVersionReceptors = RockComm.addonVersionReceptors
RockComm.talentReceptors = oldLib and oldLib.talentReceptors or {}
local talentReceptors = RockComm.talentReceptors

local playerName = UnitName("player")

local prefixToObject = setmetatable({}, {__mode='v'})
for object,v in pairs(data) do
	if v.prefix then
		prefixToObject[v.prefix] = object
	end
end

local prefixesInUse = {}
for k,v in pairs(listeners) do
	for prefix in pairs(v) do
		prefixesInUse[prefix] = true
	end
end

local newList, del = Rock:GetRecyclingFunctions(MAJOR_VERSION, "newList", "del")

local precondition, postcondition, argCheck = Rock:GetContractFunctions(MAJOR_VERSION, "precondition", "postcondition", "argCheck")

local function GetChecksum(text)
	local counter = 1
	local len = text:len()
	for i = 1, len, 3 do
		counter = (counter*8257 % 16777259) +
			(text:byte(i)) +
			((text:byte(i+1) or 1)*127) +
			((text:byte(i+2) or 2)*16383)
	end
	counter = counter % 16777213

	local a = math_floor(counter / 256^2)
	local b = math_floor(counter / 256) % 256
	local c = counter % 256
	-- \000, \n, |, \176, %
	if a == 0 or a == 10 or a == 124 or a == 176 or a == 37 then
		a = a + 1
	-- \t, \255
	elseif a == 9 or a == 255 then
		a = a - 1
	end
	if b == 0 or b == 10 or b == 124 or b == 176 or b == 37 then
		b = b + 1
	elseif b == 9 or b == 255 then
		b = b - 1
	end
	if c == 0 or c == 10 or c == 124 or c == 176 or c == 37 then
		c = c + 1
	elseif c == 9 or c == 255 then
		c = c - 1
	end
	return a * 256^2 + b * 256 + c
end

--[[---------------------------------------------------------------------------
Notes:
	* Sets the prefix attached to this addon.
	* This can only be called once, and must be called before sending any messages.
	* Each addon must have its own prefix, they cannot be shared.
	* Prefixes must be 3 bytes and should be unique for your addon.
Arguments:
	string - Prefix of the addon if you are to send comm messages. Must be 3 bytes.
Example:
	MyAddon:SetCommPrefix("MAd")
-----------------------------------------------------------------------------]]
function RockComm:SetCommPrefix(prefix)
	local data_self = data[self]
	if prefixToObject[prefix] then -- not put as a precondition as it's not a single-addon situation.
		error(("Prefix %q already specified by another object: %s."):format(prefix, tostring(prefixToObject[prefix])), 2)
	end

	data_self.prefix = prefix
	prefixToObject[prefix] = self
end
precondition(RockComm, 'SetCommPrefix', function(self, prefix)
	argCheck(prefix, 2, "string")
	if #prefix ~= 3 then
		error(("Bad argument #2 to `SetCommPrefix'. Expected 3-character string, got %q"):format(prefix), 3)
	end

	local data_self = data[self]
	if data_self.prefix then
		error("Cannot call `SetCommPrefix' more than once.", 2)
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	* Registers a list of strings to be memoized.
	* This is useful because it can turn a longer string into a shorter string and as long as both sides have the proper memoizations registered, it will show up properly.
	* Sending a normal string has a cost of 2 + length. Sending a memoized string has a cost of 4.
	* If you register a tablized comm handler, the commands specified are automatically memoized.
Arguments:
	tuple or table - list of strings to be memoized.
Example:
	MyAddon:RegisterMemoizations("Register", "Version", "WARRIOR", "ROGUE", "Monkey")
	-- or
	MyAddon:RegisterMemoizations { "Register", "Version", "WARRIOR", "ROGUE", "Monkey" }
	-- now if I ever choose to send through one of these words, it will be properly memoized.
-----------------------------------------------------------------------------]]
function RockComm:AddMemoizations(...)
	local n = select('#', ...)
	if n == 1 and type((...)) == "table" then
		return RockComm.AddMemoizations(self, unpack((...), 1, n))
	end
	local data_self = data[self]
	local data_self_memoizations = data_self.memoizations
	local data_self_reverseMemoizations = data_self.reverseMemoizations
	if not data_self_memoizations then
		data_self_memoizations = newList()
		data_self.memoizations = data_self_memoizations
		data_self_reverseMemoizations = newList()
		data_self.reverseMemoizations = data_self_reverseMemoizations
	end
	for i = 1, n do
		local v = select(i, ...)
		if not data_self_memoizations[v] and #v >= 2 then
			local checksum = GetChecksum(v)
			if data_self_reverseMemoizations[checksum] then
				-- could be an issue between the provided strings
				error(("Bad argument #%d to `AddMemoizations'. Memoization match between %q and %q."):format(i+1, v, data_self_reverseMemoizations[checksum]), 2)
			end
			data_self_memoizations[v] = checksum
			data_self_reverseMemoizations[checksum] = v
		end
	end
end
precondition(RockComm, 'SetCommPrefix', function(self, ...)
	local t
	if type((...)) == "table" then
		t = (...)
	else
		t = newList(...)
	end
	for i,v in ipairs(t) do
		argCheck(v, i+1, "string")
	end
	if type((...)) ~= "table" then
		t = del(t)
	end
end)

local function _checkKosher(t, recurse)
	local type_t = type(t)
	if type_t == "table" then
		if recurse[t] then
			return false, "recurse"
		end
		recurse[t] = true
		for k,v in pairs(t) do
			local success, ret = _checkKosher(k, recurse)
			if not success then
				return success, ret
			end
			success, ret = _checkKosher(v, recurse)
			if not success then
				return success, ret
			end
		end
		return true
	end
	if type_t == "string" or type_t == "nil" or type_t == "number" or type_t == "boolean" then
		return true
	else
		return false, type_t
	end
end

local function checkKosher(t)
	local recurse = newList()
	local ret, reason = _checkKosher(t, recurse)
	recurse = del(recurse)
	return ret, reason
end

local function getCurrentGroupDistribution()
	if _G.MiniMapBattlefieldFrame.status == "active" then
		return "BATTLEGROUND"
	elseif UnitInRaid("player") then
		return "RAID"
	else
		return "PARTY"
	end
end

local function isInDistribution(distribution)
	if distribution == "GROUP" then
		return not not getCurrentGroupDistribution()
	elseif distribution == "WHISPER" then
		return true
	elseif distribution == "GUILD" then
		return not not IsInGuild()
	end
end

local encodeBytes, encodeString
do
	local encodedChar = {
		[176] = "\176\177",
		[255] = "\176\254", -- \255 (this is here because \000 is more common)
		[0] = "\255", -- \000
		[10] = "\176\011", -- \n
		[124] = "\176\125", -- |
		[("%"):byte()] = "\176\038", -- %
	}
	function encodeBytes(sb, ...)
		local sb_len = #sb
		for i = 1, select('#', ...) do
			local v = select(i, ...)
			sb[sb_len+i] = encodedChar[v] or string_char(v)
		end
	end
	local function encode_helper(char)
		return encodedChar[char:byte()]
	end
	function encodeString(str)
		return str:gsub("[\176\255%z\010\124%%]", encode_helper)
	end
end

local serializeAndEncode
do
	local function _serialize(value, memoizations, sb)
		local type_value = type(value)
		if type_value == "boolean" then
			if value then -- true
				sb[#sb+1] = "B"
			else -- false
				sb[#sb+1] = "b"
			end
			return 1
		elseif not value then -- nil
			sb[#sb+1] = "/"
			return 1
		elseif type_value == "number" then
			if value == 1/0 then -- infinity
				sb[#sb+1] = "@"
				return 1
			elseif value == -1/0 then -- -infinity
				sb[#sb+1] = "$"
				return 1
			elseif value ~= value then -- NaN
				sb[#sb+1] = "!"
				return 1
			elseif value == math_floor(value) then -- integer
				if value <= 2^7-1 and value >= -2^7 then
					if value < 0 then
						value = value + 2^8
					end
					sb[#sb+1] = "d"
					encodeBytes(sb, value)
					return 2
				elseif value <= 2^15-1 and value >= -2^15 then
					if value < 0 then
						value = value + 2^16
					end
					sb[#sb+1] = "D"
					encodeBytes(sb, math_floor(value / 256), value % 256)
					return 3
				elseif value <= 2^31-1 and value >= -2^31 then
					if value < 0 then
						value = value + 2^32
					end
					sb[#sb+1] = "e"
					encodeBytes(sb, math_floor(value / 256^3), math_floor(value / 256^2) % 256, math_floor(value / 256) % 256, value % 256)
					return 5
				end
			end
			-- otherwise, real

			local negative = value < 0 or value == 0 and tostring(value) == "-0"
			if negative then
				value = -value
			end
			local m, exp = math_frexp(value)
			m = m * 2^53
			local x = exp + 1023
			local b = m % 256
			local c = math_floor(m / 256) % 256
			m = math_floor(m / 256^2)
			m = m + x * 2^37
			if negative then
				sb[#sb+1] = "-"
			else
				sb[#sb+1] = "+"
			end
			encodeBytes(sb, math_floor(m / 256^5) % 256, math_floor(m / 256^4) % 256, math_floor(m / 256^3) % 256, math_floor(m / 256^2) % 256, math_floor(m / 256) % 256, m % 256, c, b)
			return 9
		elseif type_value == "string" then
			local memo = memoizations and memoizations[value]
			if memo then
				sb[#sb+1] = "m"
				encodeBytes(sb, math_floor(memo / 256^2), math_floor(memo / 256) % 256, memo % 256)
				return 4
			end

			local r,g,b,A,B,C,D,E,F,G,H,name = value:match("^|cff(%x%x)(%x%x)(%x%x)|Hitem:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%-?%d+):(%d+)|h%[(.+)%]|h|r$")
			if A then -- item link
				A = A+0 -- coerce to number
				B = B+0
				C = C+0
				D = D+0
				E = E+0
				F = F+0
				G = G+0
				H = H+0
				r = tonumber(r, 16)
				g = tonumber(g, 16)
				b = tonumber(b, 16)

				-- (1-35000):(1-3093):(1-3093):(1-3093):(1-3093):(?):(-57 to 2164):(0-4294967295)

				F = nil -- don't care
				if G < 0 then
					G = G + 256^2 -- handle negatives
				end

				H = H % 256^2 -- only lower 16 bits matter

				sb[#sb+1] = "I"
				encodeBytes(sb, r, g, b, math_floor(A / 256) % 256, A % 256, math_floor(B / 256) % 256, B % 256, math_floor(C / 256) % 256, C % 256, math_floor(D / 256) % 256, D % 256, math_floor(E / 256) % 256, E % 256, math_floor(G / 256) % 256, G % 256, math_floor(H / 256) % 256, H % 256, math_min(name:len(), 255))
				sb[#sb+1] = encodeString(name:sub(1, 255))
				return 19 + math_min(name:len(), 255)
			end

			-- normal string otherwise

			local len = #value
			if len <= 255 then
				sb[#sb+1] = "s"
				encodeBytes(sb, len)
				sb[#sb+1] = encodeString(value)
				return 2 + len
			else
				sb[#sb+1] = "S"
				encodeBytes(sb, math_floor(len / 256), len % 256)
				sb[#sb+1] = encodeString(value)
				return 3 + len
			end
		elseif type_value == "table" then
			local table_type = "dict"
			local n = #value
			if n >= 1 or next(value) == nil then
				table_type = "list"
				for k,v in pairs(value) do
					if type(k) ~= "number" or k < 1 or k > n then
						table_type = "dict"
						break
					end
				end
			end
			if table_type == "dict" then
				table_type = "set"
				for k,v in pairs(value) do
					if v ~= true then
						table_type = "dict"
						break
					end
				end
			end

			local other_sb = newList()

			local len
			if table_type == "list" then
				len = n
				for i = 1, n do
					_serialize(value[i], memoizations, other_sb)
				end
			elseif table_type == "set" then
				len = 0
				for k in pairs(value) do
					len = len + 1
					_serialize(k, memoizations, other_sb)
				end
			else
				len = 0
				for k,v in pairs(value) do
					len = len + 1
					_serialize(k, memoizations, other_sb)
					_serialize(v, memoizations, other_sb)
				end
			end

			local num
			if len <= 255 then
				if table_type == "list" then
					sb[#sb+1] = "u"
				elseif table_type == "set" then
					sb[#sb+1] = "v"
				else
					sb[#sb+1] = "t"
				end
				encodeBytes(sb, len)
				num = 2
			else
				if table_type == "list" then
					sb[#sb+1] = "U"
				elseif table_type == "set" then
					sb[#sb+1] = "V"
				else
					sb[#sb+1] = "T"
				end
				encodeBytes(sb, math_floor(len / 256), len % 256)
				num = 3
			end
			local sb_id = #sb
			for i,v in ipairs(other_sb) do
				sb[sb_id+i] = v
			end
			other_sb = del(other_sb)
			return num + len
		end
		error(("Unknown type to handle: %q"):format(type_value), 2)
	end
	function serializeAndEncode(memoizations, ...)
		local sb = newList()
		sb[1] = "" -- dummy
		local n = select('#', ...)
		encodeBytes(sb, n)
		for i = 1, n do
			_serialize(select(i, ...), memoizations, sb)
		end
		local len = 0
		for i = 1, #sb do
			len = len + #sb[i]
		end
		return sb, len
	end
end

local recentGuildMessage = 0
local firstGuildMessage = true
local stopGuildMessages = false

local function PLAYER_GUILD_UPDATE(name)
	if name and name ~= "player" then return end

	recentGuildMessage = 0
	firstGuildMessage = true
	stopGuildMessages = false
end

local timeToReenableErrorSpeech = 0
local function OnUpdate()
	if GetTime() > recentGuildMessage then
		SetCVar("Sound_EnableErrorSpeech", "1")
		frame:Hide()
	end
end
frame:Hide()
frame:SetScript("OnUpdate", OnUpdate)

local id = -1
local function sendMessage(self, priority, distribution, person, ...)
	local data_self = data[self]
	local memoizations = data_self.memoizations
	local n = select('#', ...)
	for i = 1, select('#', ...) do
		local kosher, reason = checkKosher((select(i, ...)))
		if not kosher then
			error(("Tried to send bad data. Reason: %q."):format(reason), 3)
		end
	end

	if not isInDistribution(distribution) then
		return false
	end
	if stopGuildMessages and distribution == "GUILD" then
		return
	end
	if distribution == "GROUP" then
		distribution = getCurrentGroupDistribution()
		if not distribution then
			return false
		end
	end

	local prefix = data_self.prefix

	local sb, messageLen = serializeAndEncode(memoizations, ...)
	id = (id+1)%52
	local byte_id
	if id < 26 then
		byte_id = ("a"):byte() + id
	else
		byte_id = ("A"):byte() + id - 26
	end

	local whisperToSelf = distribution == "WHISPER" and person == playerName

	if distribution == "GUILD" and firstGuildMessage then
		firstGuildMessage = false
		if GetCVar("Sound_EnableErrorSpeech") == "1" then
			SetCVar("Sound_EnableErrorSpeech", "0")
			frame:Show()
		end
		recentGuildMessage = GetTime() + 10
	end

	local segment = 243 
	local max = math_floor(messageLen/segment + 1 ) 
	if max > 1 then
		local last = 0
		local message = table_concat(sb)
		sb = del(sb)
		for i = 1, max do
			local bit
			if i == max then
				bit = message:sub(last + 1)
			else
				local next = segment * i
				if message:byte(next) == 176 then
					next = next + 1
				end
				bit = message:sub(last + 1, next)
				last = next
			end

			local point
			if i == 1 then
				point = "b"
			elseif i == max then
				point = "d"
			else
				point = "c"
			end

			bit = string_char(byte_id) .. point .. "-" .. bit
			if whisperToSelf then
				frame:GetScript("OnEvent")(frame, "CHAT_MSG_ADDON", prefix, bit, distribution, person)
			else
				ChatThrottleLib:SendAddonMessage(priority, prefix, bit, distribution, person)
			end
		end
	else
		sb[1] = string_char(byte_id, ("a"):byte(), ("-"):byte())
		local message = table_concat(sb)
		sb = del(sb)
		if whisperToSelf then
			frame:GetScript("OnEvent")(frame, "CHAT_MSG_ADDON", prefix, message, distribution, person)
		else
			ChatThrottleLib:SendAddonMessage(priority, prefix, message, distribution, person)
		end
	end
	return true
end

--[[---------------------------------------------------------------------------
Notes:
	* Sends a comm message to the appropriate stream determined by "distribution".
	* The messages are properly encoded to handle special characters like |, \000, and \n, then serialized so that any value can be sent through (not just strings), then properly split up if it is too large and datagrammed onto multiple messages.
	* Messages are properly throttled so that not too much is sent across at once.
	* This uses a NORMAL priority unless :SetDefaultCommPriority is called.
	* Do not be afraid to send more than one value, it is typically much cleaner to do so. e.g. sending "WARRIOR hits 42" is actually a lot less optimized than sending "WARRIOR", "hits", 42.
	* If you choose to use memoization (recommended), messages are transparently memoized an dememoized properly.
	* Messages sent over the stream won't trigger the OnCommReceive (or whatever you called it) function for the sender, even if you technically receive it, unless you whisper to yourself.
Arguments:
	string - distribution type that is used. One of "WHISPER", "GUILD", or "GROUP".
	string - person to whisper to (only used with "WHISPER").
	tuple - arguments to pass through.
Returns:
	boolean - whether the message properly sends through.
Example:
	MyAddon:SendCommMessage("GUILD", "Message", 52, { alpha = "bravo" }) -- sends the values across the guild stream.
	MyAddon:SendCommMessage("WHISPER", "Ckknight", "Here is my message") -- whispers a message to Ckknight.
	MyAddon:SendCommMessage("GROUP", "Here is a monkey-related message", 42, "ROGUE") -- Sends to your party/raid/battleground, based on which one you are in.
-----------------------------------------------------------------------------]]
function RockComm:SendCommMessage(distribution, person, ...)
	local data_self = data[self]
	local priority = data_self.priority or "NORMAL"

	if distribution == "WHISPER" then
		return sendMessage(self, priority, distribution, person, ...)
	else
		return sendMessage(self, priority, distribution, nil, person, ...)
	end
end
precondition(RockComm, 'SendCommMessage', function(self, distribution, person)
	argCheck(distribution, 2, "string")
	if distribution == "WHISPER" then
		argCheck(person, 3, "string")
		if #person == 0 then
			error(("Bad argument #3 to `SendCommMessage'. Expected non-zero-length string, got %q."):format(person), 3)
		end
	elseif distribution ~= "GROUP" and distribution ~= "GUILD" then
		error(("Bad argument #2 to `SendCommMessage'. Expected %q, %q, or %q, got %q"):format("WHISPER", "GROUP", "GUILD", distribution), 3)
	end

	local data_self = data[self]
	if not data_self.prefix then
		error("Cannot call `SendCommMessage' before `SetCommPrefix'.", 2)
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	* Sends a comm message to the appropriate stream determined by "distribution".
	* Priorities are useful for different tasks.
	; "BULK" : bulk messages that are by no means time-crucial. Example: roleplaying information.
	; "NORMAL" : normal messages. This is the default.
	; "ALERT" : alert messages that are very time-critical. Example: real-time raid information.
Arguments:
	string - priority that is used. One of "BULK", "NORMAL", or "ALERT".
	string - distribution type that is used. One of "WHISPER", "GUILD", or "GROUP".
	string - person to whisper to (only used with "WHISPER").
	tuple - arguments to pass through.
Example:
	MyAddon:SendPrioritizedCommMessage("BULK", "GUILD", "Message", 52, { alpha = "bravo" }) -- sends the values across the guild stream.
	MyAddon:SendPrioritizedCommMessage("NORMAL", "WHISPER", "Ckknight", "Here is my message") -- whispers a message to Ckknight.
	MyAddon:SendPrioritizedCommMessage("ALERT", "GROUP", "Here is a monkey-related message", 42, "ROGUE") -- Sends to your party/raid/battleground, based on which one you are in.
-----------------------------------------------------------------------------]]
function RockComm:SendPrioritizedCommMessage(priority, distribution, person, ...)
	if distribution == "WHISPER" then
		return sendMessage(self, priority, distribution, person, ...)
	else
		return sendMessage(self, priority, distribution, nil, person, ...)
	end
end
precondition(RockComm, 'SendPrioritizedCommMessage', function(self, priority, distribution, person)
	argCheck(priority, 2, "string")
	if priority ~= "NORMAL" and priority ~= "BULK" and priority ~= "ALERT" then
		error(("Bad argument #2 to `SendPrioritizedCommMessage'. Expected %q, %q, or %q, got %q."):format("ALERT", "NORMAL", "BULK", priority), 3)
	end
	argCheck(distribution, 3, "string")
	if distribution == "WHISPER" then
		argCheck(person, 4, "string")
		if #person == 0 then
			error(("Bad argument #4 to `SendPrioritizedCommMessage'. Expected non-zero-length string, got %q."):format(person), 3)
		end
	elseif distribution ~= "GROUP" and distribution ~= "GUILD" then
		error(("Bad argument #3 to `SendPrioritizedCommMessage'. Expected %q, %q, or %q, got %q"):format("WHISPER", "GROUP", "GUILD", distribution), 3)
	end

	local data_self = data[self]
	if not data_self.prefix then
		error("Cannot call `SendPrioritizedCommMessage' before `SetCommPrefix'.", 2)
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	* Sets the default priority for using :SendCommMessage.
	* "NORMAL" is the default priority
	* Priorities are useful for different tasks.
	; "BULK" : bulk messages that are by no means time-crucial. Example: roleplaying information.
	; "NORMAL" : normal messages. This is the default.
	; "ALERT" : alert messages that are very time-critical. Example: real-time raid information.
Arguments:
	string - priority to be used. One of "BULK", "NORMAL", or "ALERT".
Example:
	MyAddon:SetDefaultCommPriority("BULK")
-----------------------------------------------------------------------------]]
function RockComm:SetDefaultCommPriority(priority)
	data[self].priority = priority
end
precondition(RockComm, 'SendPrioritizedCommMessage', function(self, priority, distribution, person)
	argCheck(priority, 2, "string")
	if priority ~= "NORMAL" and priority ~= "BULK" and priority ~= "ALERT" then
		error(("Bad argument #2 to `SendPrioritizedCommMessage'. Expected %q, %q, or %q, got %q."):format("ALERT", "NORMAL", "BULK", priority), 3)
	end
end)

local function getAllStringKeys(value, t)
	if not t then
		t = newList()
	end
	for k, v in pairs(value) do
		if type(k) == "string" then
			t[#t+1] = k
		end
		if type(v) == "table" then
			getAllStringKeys(v, t)
		end
	end
	return t
end

--[[---------------------------------------------------------------------------
Notes:
	* Listen to a communication stream
	* The callback provided takes on the arguments ("prefix", "distribution", "sender", ...)
	* Also, you can use a table of methods, if you want, that will react to different commands specifically.
	* Callbacks will only receive messages set with the prefix you register for here.
Arguments:
	string - prefix identifier of the addon which controls the stream.
	string - distribution type that is used. One of "WHISPER", "GUILD", or "GROUP".
	[optional] string or function or table - the function to call, or table to handle. Default: "OnCommReceive"
Example:
	MyAddon.OnCommReceieve = function(self, prefix, distribution, sender, message)
	    print("message from", sender, "-", message)
	end
	-- then in OnEnable
	MyAddon:AddCommListener("MAd", "GUILD")

	-- alternatively

	MyAddon.OnCommReceive = {}

	MyAddon.OnCommReceive.Command1 = function(self, prefix, distribution, sender, message)
	    print("Command1 from", sender, "-", message)
	end

	MyAddon.OnCommReceive.Command2 = function(self, prefix, distribution, sender, otherMessage)
	    print("Command2 from", sender, "-", otherMessage)
	end
	-- then in OnEnable
	MyAddon:AddCommListener("MAd", "GUILD")
	MyAddon:SendCommMessage("GUILD", "Command1", ...)
	MyAddon:SendCommMessage("GUILD", "Command2", ...)
-----------------------------------------------------------------------------]]
function RockComm:AddCommListener(prefix, distribution, callback)
	if not callback then
		callback = "OnCommReceive"
	end
	local type_callback = type(callback)

	local listeners_self = listeners[self]
	if not listeners_self then
		listeners_self = newList()
		listeners[self] = listeners_self
	end

	local listeners_self_prefix = listeners_self[prefix]
	if not listeners_self_prefix then
		listeners_self_prefix = newList()
		listeners_self[prefix] = listeners_self_prefix
	end

	prefixesInUse[prefix] = true

	listeners_self_prefix[distribution] = callback

	if data[self] and prefix == data[self].prefix and (type_callback == "table" or (type_callback == "string" and type(self[callback]) == "table")) then
		local handler = type_callback == "table" and callback or self[callback]
		local t = getAllStringKeys(handler)
		RockComm.AddMemoizations(self, unpack(t))
		t = del(t)
	end
end
precondition(RockComm, 'AddCommListener', function(self, prefix, distribution, callback)
	argCheck(prefix, 2, "string")
	if #prefix ~= 3 then
		error(("Bad argument #2 to `AddCommListener'. Expected 3-byte string, got %q."):format(prefix), 3)
	end
	argCheck(distribution, 3, "string")
	if distribution ~= "GROUP" and distribution ~= "GUILD" and distribution ~= "WHISPER" then
		error(("Bad argument #3 to `AddCommListener'. Expected %q, %q, or %q, got %q."):format("GROUP", "GUILD", "WHISPER", distribution), 3)
	end
	argCheck(callback, 4, "string", "function", "table", "nil")
	if type(callback) == "string" or not callback then
		if not callback then
			callback = "OnCommReceive"
		end
		local handler = self[callback]
		if type(handler) ~= "function" and type(handler) ~= "table" then
			error(("Bad argument #4 to `AddCommListener'. Bad handler: expected %q or %q, got %q."):format("function", "table", type(handler)), 3)
		end
	end
end)
postcondition(RockComm, 'AddCommListener', function(ret, self, prefix, distribution, callback)
	assert(self:HasCommListener(prefix, distribution))
end)

--[[---------------------------------------------------------------------------
Arguments:
	string - prefix identifier of the addon which controls the stream.
	[optional] string - distribution type that is used. One of "WHISPER", "GUILD", or "GROUP". (default: any)
Returns:
	boolean or string - whether this is registered with a comm with the specified prefix (and distribution), or the handler which it is registered to.
Example:
	local registered = MyAddon:HasCommListener("MAd", "GUILD")
	-- or
	local registered = MyAddon:HasCommListener("MAd") -- any distribution
-----------------------------------------------------------------------------]]
function RockComm:HasCommListener(prefix, distribution)
	local listeners_self = listeners[self]
	if not listeners_self then
		return false
	end

	local listeners_self_prefix = listeners_self[prefix]
	if not listeners_self_prefix then
		return false
	end
	if not distribution then
		return true
	end

	return listeners_self_prefix[distribution] or false
end
precondition(RockComm, 'HasCommListener', function(self, prefix, distribution)
	argCheck(prefix, 2, "string")
	if #prefix ~= 3 then
		error(("Bad argument #2 to `HasCommListener'. Expected 3-byte string, got %q."):format(prefix), 3)
	end
	argCheck(distribution, 3, "nil", "string")
	if distribution and distribution ~= "GROUP" and distribution ~= "GUILD" and distribution ~= "WHISPER" then
		error(("Bad argument #3 to `HasCommListener'. Expected %q, %q, or %q, got %q."):format("GROUP", "GUILD", "WHISPER", distribution), 3)
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	Removes the listener from the comm stream.
Arguments:
	string - prefix identifier of the addon which controls the stream.
	[optional] string - distribution type that is used. One of "WHISPER", "GUILD", or "GROUP". (default: all)
Example:
	MyAddon:RemoveCommListener("MAd", "GUILD")
	-- or
	MyAddon:RemoveCommListener("MAd") -- all distributions
-----------------------------------------------------------------------------]]
function RockComm:RemoveCommListener(prefix, distribution)
	local listeners_self = listeners[self]
	if not listeners_self then
		return
	end

	local listeners_self_prefix = listeners_self[prefix]
	if not listeners_self_prefix then
		return
	end

	if distribution then
		listeners_self_prefix[distribution] = nil
	end
	if not distribution or not next(listeners_self_prefix) then
		listeners_self[prefix] = del(listeners_self_prefix)
	end
	if not next(listeners_self) then
		listeners[self] = del(listeners_self)
	end

	for k,v in pairs(listeners) do
		for p in pairs(v) do
			if p == prefix then
				return
			end
		end
	end
	prefixesInUse[prefix] = nil
end
precondition(RockComm, 'RemoveCommListener', function(self, prefix, distribution)
	argCheck(prefix, 2, "string")
	if #prefix ~= 3 then
		error(("Bad argument #2 to `RemoveCommListener'. Expected 3-byte string, got %q."):format(prefix), 3)
	end
	argCheck(distribution, 3, "nil", "string")
	if distribution and distribution ~= "GROUP" and distribution ~= "GUILD" and distribution ~= "WHISPER" then
		error(("Bad argument #3 to `RemoveCommListener'. Expected %q, %q, or %q, got %q."):format("GROUP", "GUILD", "WHISPER", distribution), 3)
	end
end)
postcondition(RockComm, 'RemoveCommListener', function(ret, self, prefix, distribution)
	assert(not self:HasCommListener(prefix, distribution))
end)

--[[---------------------------------------------------------------------------
Notes:
	* Removes all comm listeners
	* This is automatically done at :OnDisable.
Example:
	MyAddon:RemoveAllCommListeners()
-----------------------------------------------------------------------------]]
function RockComm:RemoveAllCommListeners()
	local listeners_self = listeners[self]
	if not listeners_self then
		return
	end

	for prefix, v in pairs(listeners_self) do
		listeners_self[prefix] = del(v)
	end
	listeners[self] = del(listeners_self)

	for prefix in pairs(prefixesInUse) do
		prefixesInUse[prefix] = nil
	end

	for k,v in pairs(listeners) do
		for prefix in pairs(v) do
			prefixesInUse[prefix] = true
		end
	end
end
postcondition(RockComm, 'RemoveAllCommListeners', function(ret, self, prefix, distribution)
	for prefix in pairs(prefixesInUse) do
		assert(not self:HasCommListener(prefix))
	end
end)

local decodedByte = {
	[177] = "\176",
	[254] = "\255",
	[11] = "\10",
	[125] = "\124",
	[38] = "%",
}

local function decode_helper(char)
	return decodedByte[char:byte()]
end
local function decode(message)
	return (message:gsub("\255", "\000"):gsub("\176([\177\254\011\125\038])", decode_helper))
end

local function _deserialize(message, start, reverseMemoizations)
	local type_value = message:sub(start, start)
	if not type_value then
		error("badness")
	end
	if type_value == "B" then
		return true, 1
	elseif type_value == "b" then
		return false, 1
	elseif type_value == "/" then
		return nil, 1
	elseif type_value == "@" then
		return 1/0, 1 -- infinity
	elseif type_value == "$" then
		return -1/0, 1 -- -infinity
	elseif type_value == "!" then
		return 0/0, 1 -- NaN
	elseif type_value == "m" then
		-- memoization
		local a, b, c = message:byte(start+1, start+3)
		local num = a*256^2 + b*256 + c
		local value = reverseMemoizations and reverseMemoizations[num]
		return value, 4
	elseif type_value == "s" then
		-- < 256-byte string
		local len = message:byte(start+1)
		return message:sub(start+2, start+1+len), 2+len
	elseif type_value == "S" then
		-- >= 256-byte string
		local len_a, len_b = message:byte(start+1, start+2)
		local len = len_a*256 + len_b
		return message:sub(start+3, start+2+len), 3+len
	elseif type_value == "I" then
		-- item link
		local r, g, b, a1, a2, b1, b2, c1, c2, d1, d2, e1, e2, g1, g2, h1, h2, len = message:byte(start + 1, start + 18)
		local A = a1 * 256 + a2
		local B = b1 * 256 + b2
		local C = c1 * 256 + c2
		local D = d1 * 256 + d2
		local E = e1 * 256 + e2
		local G = g1 * 256 + g2
		local H = h1 * 256 + h2
		if G >= 2^15 then
			G = G - 256^2
		end
		local s = ("item:%d:%d:%d:%d:%d:%d:%d:%d"):format(A, B, C, D, E, 0, G, H)
		local _, link = GetItemInfo(s)
		if not link then
			local name = message:sub(start + 19, start + 18 + len)

			link = ("|cff%02x%02x%02x|Hitem:%d:%d:%d:%d:%d:%d:%d:%d|h[%s]|h|r"):format(r, g, b, A, B, C, D, E, 0, G, H, name)
		end
		return link, 19 + len
	elseif type_value == "d" then
		-- 1-byte integer
		local a = message:byte(start + 1)
		if a >= 128 then
			a = a - 256
		end
		return a, 2
	elseif type_value == "D" then
		-- 2-byte integer
		local a, b = message:byte(start + 1, start + 2)
		local N = a * 256 + b
		if N >= 2^15 then
			N = N - 256^2
		end
		return N, 3
	elseif type_value == "e" then
		-- 4-byte integer
		local a, b, c, d = message:byte(start + 1, start + 4)
		local N = a * 256^3 + b * 256^2 + c * 256 + d
		if N >= 2^31 then
			N = N - 256^4
		end
		return N, 5
	elseif type_value == "-" or type_value == "+" then
		local negative = type_value == "-"
		local a, b, c, d, e, f, g, h = message:byte(start + 1, start + 8)
		local N = a * 256^5 + b * 256^4 + c * 256^3 + d * 256^2 + e * 256 + f
		local x = math_floor(N / 2^37)
		local m = (N % 2^37) * 256^2 + g * 256 + h
		local mantissa = m / 2^53
		local exp = x - 1023
		local val = math_ldexp(mantissa, exp)
		if negative then
			return -val, 9
		else
			return val, 9
		end
	elseif type_value == "u" or type_value == "U" then
		-- numerically-indexed list
		local len = message:byte(start+1)
		local num = 0
		local current = start + 2
		if type_value == "U" then
			local second = message:byte(start+2)
			len = len*256 + second
			current = current + 1
			num = 1
		end
		local t = newList()
		for i = 1, len do
			local ret, amount = _deserialize(message, current, reverseMemoizations)
			t[i] = ret
			current = current + amount
		end
		return t, current - start
	elseif type_value == "v" or type_value == "V" then
		-- set
		local len = message:byte(start+1)
		local num = 0
		local current = start + 2
		if type_value == "V" then
			local second = message:byte(start+2)
			len = len*256 + second
			current = current + 1
			num = 1
		end
		local t = newList()
		for i = 1, len do
			local ret, amount = _deserialize(message, current, reverseMemoizations)
			t[ret] = true
			current = current + amount
		end
		return t, current - start
	elseif type_value == "t" or type_value == "T" then
		-- dictionary
		local len = message:byte(start+1)
		local num = 0
		local current = start + 2
		if type_value == "T" then
			local second = message:byte(start+2)
			len = len*256 + second
			current = current + 1
			num = 1
		end
		local t = newList()
		for i = 1, len do
			local key, amount = _deserialize(message, current, reverseMemoizations)
			current = current + amount
			local value, amount = _deserialize(message, current, reverseMemoizations)
			current = current + amount
			t[key] = value
		end
		return t, current - start
	end
	error(("Bad string to deserialize for %s at byte %d"):format(("%q"):format(message:gsub("([\001-\031\128-\255])", function(char) return ("\\%03d"):format(char:byte()) end)), start), 2)
end

local function deserialize(message, start, reverseMemoizations)
	if not start then
		start = 1
	end
	-- numerically-indexed list
	local len = message:byte(start)
	local num = 0
	local current = start + 1
	local t = newList()
	for i = 1, len do
		local ret, amount = _deserialize(message, current, reverseMemoizations)
		t[i] = ret
		current = current + amount
	end
	return t, len
end

local halfMessages = {}

frame:RegisterEvent("CHAT_MSG_ADDON")
frame:RegisterEvent("PLAYER_GUILD_UPDATE")
frame:RegisterEvent("ADDON_LOADED")
frame:RegisterEvent("PLAYER_LOGIN")
local function CHAT_MSG_ADDON(prefix, message, distribution, person)
	if not prefixesInUse[prefix] then
		return
	end
	if distribution == "RAID" or distribution == "PARTY" or distribution == "BATTLEGROUND" then
		if distribution ~= getCurrentGroupDistribution() then
			-- in case you join a BG and your raid/party messages you.
			return
		end
		distribution = "GROUP"
	elseif not isInDistribution(distribution) then
		return
	end

	local callbacks = newList()
	for object, v in pairs(listeners) do
		local u = v[prefix]
		if u then
			local callback = u[distribution]
			if callback then
				callbacks[object] = callback
			end
		end
	end
	if not next(callbacks) then
		callbacks = del(callbacks)
		return
	end

	local id, status = message:match("([a-zA-Z])([a-d])%-")
	if not id then
		callbacks = del(callbacks)
		return
	end
	if status ~= "a" then
		local halfMessages_person = halfMessages[person]
		if status ~= "b" then
		 	if not halfMessages_person then
				callbacks = del(callbacks)
				return
			end
		else
			if not halfMessages_person then
				halfMessages_person = newList()
				halfMessages[person] = halfMessages_person
			end
		end
		local halfMessages_person_id = halfMessages_person[id]
		if status ~= "b" then
		 	if not halfMessages_person_id then
				callbacks = del(callbacks)
				return
			end
		else
			if not halfMessages_person_id then
				halfMessages_person_id = newList()
				halfMessages_person[id] = halfMessages_person_id
			end
		end
		if status == "b" then
			halfMessages_person_id[#halfMessages_person_id+1] = message
		else
			halfMessages_person_id[#halfMessages_person_id+1] = message:sub(4)
		end
		if status ~= "d" then
			callbacks = del(callbacks)
			return
		end

		message = table_concat(halfMessages_person_id)
		halfMessages_person[id] = del(halfMessages_person_id)
		if not next(halfMessages_person) then
			halfMessages[person] = del(halfMessages_person)
		end
	end

	local decodedMessage = decode(message)
	local object = prefixToObject[prefix]
	local reverseMemoizations = data[object] and data[object].reverseMemoizations
	local success, deserializedMessage, n = pcall(deserialize, decodedMessage, 4, reverseMemoizations)
	if not success then
		callbacks = del(callbacks)
		return
	end
	for object, callback in pairs(callbacks) do
		local type_callback = type(callback)
		if type_callback == "function" then
			local success, ret = pcall(callback, prefix, distribution, person, unpack(deserializedMessage, 1, n))
			if not success then
				geterrorhandler()(ret)
			end
		elseif type_callback == "string" then
			local handler = object[callback]
			local type_handler = type(handler)
			if type_handler ~= "table" and type_handler ~= "function" then
				local _, ret = pcall(error, ("Unknown handler %q for object %s."):format(callback, tostring(object)), 2)
				geterrorhandler()(ret)
			end
			if type_handler == "function" then
				local success, ret = pcall(handler, object, prefix, distribution, person, unpack(deserializedMessage, 1, n))
				if not success then
					geterrorhandler()(ret)
				end
			else
				local currentHandler = handler
				for i = 1, n do
					local bit = deserializedMessage[i]
					local currentHandler_bit = currentHandler[bit]
					local type_currentHandler_bit = type(currentHandler_bit)
					if type_currentHandler_bit == "function" then
						local success, ret = pcall(currentHandler_bit, object, prefix, distribution, person, unpack(deserializedMessage, i+1, n))
						if not success then
							geterrorhandler()(ret)
						end
						break
					elseif type_currentHandler_bit == "table" then
						currentHandler = currentHandler_bit
					else
						break
					end
				end
			end
		else
			local currentHandler = callback
			for i = 1, n do
				local bit = deserializedMessage[i]
				local currentHandler_bit = currentHandler[bit]
				local type_currentHandler_bit = type(currentHandler_bit)
				if type_currentHandler_bit == "function" then
					local success, ret = pcall(currentHandler_bit, prefix, distribution, person, unpack(deserializedMessage, i+1, n))
					if not success then
						geterrorhandler()(ret)
					end
					break
				elseif type_currentHandler_bit == "table" then
					currentHandler = currentHandler_bit
				else
					break
				end
			end
		end
	end
	callbacks = del(callbacks)
	deserializedMessage = del(deserializedMessage)
end

frame:SetScript("OnEvent", function(this, event, ...)
	if event == "CHAT_MSG_ADDON" then
		CHAT_MSG_ADDON(...)
	elseif event == "PLAYER_GUILD_UPDATE" then
		PLAYER_GUILD_UPDATE(...)
	else -- ADDON_LOADED or PLAYER_LOGIN
		local lib, minor = LibStub:GetLibrary(MAJOR_VERSION)
		if lib ~= RockComm or minor ~= MINOR_VERSION then
			return
		end
	end
end)

if not hooks.ChatFrame_MessageEventHandler then
	local orig = _G.ChatFrame_MessageEventHandler
	function _G.ChatFrame_MessageEventHandler(...)
		local hooks = RockComm.hooks
		if hooks and hooks.ChatFrame_MessageEventHandler then
			return hooks.ChatFrame_MessageEventHandler(orig, ...)
		else
			return orig(...)
		end
	end
end

local recentNotSeen = {}
local notSeenString, ambiguousString, ERR_GUILD_PERMISSIONS
function hooks.ChatFrame_MessageEventHandler(orig, self, event, ...)
	if event == "CHAT_MSG_SYSTEM" then
		local arg1 = ...
		if not notSeenString then
			notSeenString = '^' .. _G.ERR_CHAT_PLAYER_NOT_FOUND_S:gsub("%%s", "(.-)"):gsub("%%1%$s", "(.-)") .. '$'
			ambiguousString = '^' .. _G.ERR_CHAT_PLAYER_AMBIGUOUS_S:gsub("%%s", "(.-)"):gsub("%%1%$s", "(.-)") .. '$'
			ERR_GUILD_PERMISSIONS = _G.ERR_GUILD_PERMISSIONS
		end
		local player = arg1:match(notSeenString) or arg1:match(ambiguousString)
		if player then
			local t = GetTime()
			if recentNotSeen[player] and recentNotSeen[player] > t then
				recentNotSeen[player] = t + 15
				return
			else
				recentNotSeen[player] = t + 15
			end
		elseif arg1 == ERR_GUILD_PERMISSIONS then
			if recentGuildMessage > GetTime() then
				stopGuildMessages = true
				return
			end
		end
	end
	return orig(self, event, ...)
end

local function isSendingAddonVersions()
	local RockConfig = Rock("LibRockConfig-1.0", true, true)
	return not RockConfig or not RockConfig.sv2 or RockConfig.sv2 == 1
end

--[[---------------------------------------------------------------------------
Notes:
	* This is not exported as a mixin.
	* Sends a message to another player or group of players requesting the version of a specified addon or library.
	* This sends out the message, and the reply is sent back which is handled through :RegisterAddonVersionReceptor
Arguments:
	string - name of the addon or library.
	string - the distribution to send within. One of "WHISPER", "GROUP", or "GUILD".
	[optional] string - name of the player, only works with "WHISPER".
Example:
	Rock("LibRockComm-1.0"):QueryAddonVersion("BigWigs", "WHISPER", "Monkeyman")
-----------------------------------------------------------------------------]]
function RockComm:QueryAddonVersion(addon, distribution, player)
	if not isSendingAddonVersions() then
		-- you don't deserve it
		return
	end
	if player and player:match("%-$") then
		player = player:sub(1, -2)
	end
	if distribution == "WHISPER" then
		self.addonVersionPinger:SendCommMessage("WHISPER", player, "PING", addon)
	else
		self.addonVersionPinger:SendCommMessage(distribution, "PING", addon)
	end
end
precondition(RockComm, 'QueryAddonVersion', function(self, addon, distribution, player)
	argCheck(addon, 2, "string")
	argCheck(distribution, 3, "string")
	if distribution ~= "WHISPER" and distribution ~= "GROUP" and distribution ~= "GUILD" then
		error(("Bad argument #3 to `QueryAddonVersion'. Expected %q, %q, or %q, got %q."):format("WHISPER", "GROUP", "GUILD", distribution), 3)
	end
	if distribution == "WHISPER" then
		argCheck(player, 4, "string")
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	* This is not exported as a mixin.
	* Registers a receptor function that will be called when a player's addon version is sent.
	* The reception function takes the API of func("player", "addon", version)
	* version is false if it is not loaded, true if it is loaded but no version known, or a string which tells the specific version.
Arguments:
	function - function to call on reception
Example:
	Rock("LibRockComm-1.0"):AddAddonVersionReceptor(function(player, addon, version)
	    if version then
	        if version == true then
	            print("Player %s has %s", player, addon)
	        else
	            print("Player %s has %s version %s", player, addon, version)
	        end
	    else
	        print("Player %s does not have %s", player, addon)
	    end
	end)
-----------------------------------------------------------------------------]]
function RockComm:AddAddonVersionReceptor(callback)
	addonVersionReceptors[callback] = true
end
precondition(RockComm, 'AddAddonVersionReceptor', function(self, callback)
	argCheck(callback, 2, "function")
end)

local function isSendingTalents()
	local RockConfig = Rock("LibRockConfig-1.0", true, true)
	return not RockConfig or not RockConfig.sv1 or RockConfig.sv1 == 1
end

--[[---------------------------------------------------------------------------
Notes:
	* This is not exported as a mixin.
	* Sends a message to another player or group of players requesting their talent spec.
	* This sends out the message, and the reply is sent back which is handled through :RegisterTalentReceptor
Arguments:
	string - the distribution to send within. One of "WHISPER", "GROUP", or "GUILD".
	[optional] string - name of the player, only works with "WHISPER".
Example:
	Rock("LibRockComm-1.0"):QueryTalents("WHISPER", "Monkeyman")
-----------------------------------------------------------------------------]]
function RockComm:QueryTalents(distribution, player)
	if not isSendingTalents() then
		-- you don't deserve to query
		return
	end
	if player and player:match("%-$") then
		player = player:sub(1, -2)
	end
	if distribution == "WHISPER" then
		self.talentPinger:SendCommMessage("WHISPER", player, "PING")
	else
		self.talentPinger:SendCommMessage(distribution, "PING")
	end
end
precondition(RockComm, 'QueryTalents', function(self, distribution, player)
	argCheck(distribution, 2, "string")
	if distribution ~= "WHISPER" and distribution ~= "GROUP" and distribution ~= "GUILD" then
		error(("Bad argument #2 to `QueryTalents'. Expected %q, %q, or %q, got %q."):format("WHISPER", "GROUP", "GUILD", distribution), 3)
	end
	if distribution == "WHISPER" then
		argCheck(player, 3, "string")
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	* This is not exported as a mixin.
	* Registers a receptor function that will be called when a player's talents are sent.
	* The reception function takes the API of func("player", {
		class = "CLASS", -- e.g. "PRIEST", "ROGUE", etc.
		level = 10, -- some integer [1, 70]
		[1] = { -- for tree 1
			[1] = rankOfTalent1,
			[2] = rankOfTalent2,
			...
			[n] = rankOfTalentN,
		},
		[2] = { -- for tree 2
			[1] = rankOfTalent1,
			[2] = rankOfTalent2,
			...
			[n] = rankOfTalentN,
		},
		[3] = { -- for tree 3
			[1] = rankOfTalent1,
			[2] = rankOfTalent2,
			...
			[n] = rankOfTalentN,
		},
	})
	* version is false if it is not loaded, true if it is loaded but no version known, or a string which tells the specific version.
Arguments:
	function - function to call on reception
Example:
	Rock("LibRockComm-1.0"):AddTalentReceptor(function(player, data)
		local talentsUsed = 0
		for i,v in ipairs(data) do
			for j,u in ipairs(v) do
				talentsUsed = talentsUsed + u
			end
		end
	end)
-----------------------------------------------------------------------------]]
function RockComm:AddTalentReceptor(callback)
	talentReceptors[callback] = true
end
precondition(RockComm, 'AddTalentReceptor', function(self, callback)
	argCheck(callback, 2, "function")
end)

function RockComm:OnEmbed(object)
	local data_object = newList()
	data[object] = data_object
end

function RockComm:OnUnembed(object)
	self.RemoveAllCommListeners(object)
	data[object] = del(data[object])
	for k,v in pairs(prefixToObject) do
		if v == object then
			prefixToObject[k] = nil
		end
	end
end

function RockComm:OnEmbedDisable(object)
	self.RemoveAllCommListeners(object)
end

function RockComm:OnLibraryLoad(major, instance)
	if major == "LibRockConfig-1.0" then
		instance.rockOptions.args.talentQuery = {
			name = L["Send talent info"],
			desc = L["Send out talent information to those who request it. In turn, you will be able to request talent info from others. This is equivalent to Armory, except in-game."],
			type = 'boolean',
			get = function()
				return not instance.sv1 or instance.sv1 == 1
			end,
			set = function(value)
				instance.sv1 = value and 1 or 0
			end
		}
		instance.rockOptions.args.addonVersionQuery = {
			name = L["Send addon version info"],
			desc = L["Send out addon version information to those who request it. In turn, you will be able to request addon version info from others."],
			type = 'boolean',
			get = function()
				return not instance.sv2 or instance.sv2 == 1
			end,
			set = function(value)
				instance.sv2 = value and 1 or 0
			end
		}
	end
end

RockComm:SetExportedMethods("SetCommPrefix", "AddMemoizations", "SetDefaultCommPriority", "SendCommMessage", "SendPrioritizedCommMessage", "AddCommListener", "HasCommListener", "RemoveCommListener", "RemoveAllCommListeners")

Rock:FinalizeLibrary(MAJOR_VERSION)

do
	local addonVersionPinger
	if oldLib and oldLib.addonVersionPinger then
		addonVersionPinger = oldLib.addonVersionPinger
		RockComm:Unembed(addonVersionPinger)
		for k in pairs(addonVersionPinger) do
			addonVersionPinger[k] = nil
		end
	else
		addonVersionPinger = {}
	end
	RockComm.addonVersionPinger = addonVersionPinger
	addonVersionPinger.name = MAJOR_VERSION .. "_AddonVersionPinger"
	RockComm:Embed(addonVersionPinger)
	prefixToObject["VER"] = nil
	addonVersionPinger:SetCommPrefix("VER")
	addonVersionPinger.OnCommReceive = {
		PING = function(self, prefix, distribution, sender, addon)
			if not isSendingAddonVersions() then
				return
			end
			local version = ""
			if Rock:HasLibrary(addon) and  Rock(addon).GetLibraryVersion then
				local revision
				version, revision = Rock(addon):GetLibraryVersion()
				version = version .. "-" .. revision
			elseif Rock:HasAddon(addon) then
				local addon = Rock:GetAddon(addon)
				local revision = addon.revision
				version = addon.version
				if version then version = tostring(version) end
				if revision then revision = tostring(revision) end
				if revision and version and version:len() > 0 and not version:find(revision) then
					version = version .. "." .. revision
				end
				if not version and revision then version = revision end
			elseif AceLibrary and AceLibrary:HasInstance(addon) and AceLibrary(addon).GetLibraryVersion then
				-- Ace2
				local revision
				version, revision = AceLibrary(addon):GetLibraryVersion()
				version = version .. "-" .. revision
			elseif LibStub:GetLibrary(addon, true) then
				local _
				_, version = LibStub:GetLibrary(addon)
			else
				local revision
				local _G_addon = _G[addon]
				if not _G_addon then
					_G_addon = _G[addon:match("^[^_]+_(.*)$")]
				end
				if type(_G_addon) == "table" then
					if rawget(_G_addon, "version") then version = _G_addon.version
					elseif rawget(_G_addon, "Version") then version = _G_addon.Version
					elseif rawget(_G_addon, "VERSION") then version = _G_addon.VERSION
					end
					if type(version) == "function" then version = tostring(select(2, pcall(version()))) end
					local revision = nil
					if rawget(_G_addon, "revision") then revision = _G_addon.revision
					elseif rawget(_G_addon, "Revision") then revision = _G_addon.Revision
					elseif rawget(_G_addon, "REVISION") then revision = _G_addon.REVISION
					elseif rawget(_G_addon, "rev") then revision = _G_addon.rev
					elseif rawget(_G_addon, "Rev") then revision = _G_addon.Rev
					elseif rawget(_G_addon, "REV") then revision = _G_addon.REV
					end
					if type(revision) == "function" then revision = tostring(select(2, pcall(revision()))) end

					if version then version = tostring(version) end
					if revision then revision = tostring(revision) end
					if type(revision) == "string" and type(version) == "string" and version:len() > 0 and not version:find(revision) then
						version = version .. "." .. revision
					end

					if not version and revision then version = revision end
				end

				if _G[addon:upper().."_VERSION"] then
					version = _G[addon:upper() .. "_VERSION"]
				end
				if _G[addon:upper().."_REVISION"] or _G[addon:upper().."_REV"] then
					local revision = _G[addon:upper() .. "_REVISION"] or _G[addon:upper().."_REV"]
					if type(revision) == "string" and type(version) == "string" and version:len() > 0 and not version:find(revision) then
						version = version .. "." .. revision
					end
					if (not version or version == "") and revision then version = revision end
				end

				if not version or version == "" then
					version = GetAddOnMetadata(addon, "Version")
					if version and version ~= "" and not IsAddOnLoaded(addon) then
						version = version .. " (Off)"
					end
				end
				if not version or version == "" then
					version = IsAddOnLoaded(addon) and true or false
				end
			end
			self:SendCommMessage("WHISPER", sender, "PONG", addon, version)
		end,
		PONG = function(self, prefix, distribution, sender, addon, version)
			if not isSendingAddonVersions() then
				return
			end
			for func in pairs(addonVersionReceptors) do
				local success, err = pcall(func, sender, addon, version)
				if not success then
					geterrorhandler()(err)
				end
			end
		end
	}
	addonVersionPinger:AddCommListener("VER", "WHISPER")
	addonVersionPinger:AddCommListener("VER", "GUILD")
	addonVersionPinger:AddCommListener("VER", "GROUP")
end

do
	local talentPinger
	if oldLib and oldLib.talentPinger then
		talentPinger = oldLib.talentPinger
		RockComm:Unembed(talentPinger)
		for k in pairs(talentPinger) do
			talentPinger[k] = nil
		end
	else
		talentPinger = {}
	end
	RockComm.talentPinger = talentPinger
	talentPinger.name = MAJOR_VERSION .. "_TalentPinger"
	RockComm:Embed(talentPinger)
	prefixToObject["TAL"] = nil
	talentPinger:SetCommPrefix("TAL")
	talentPinger:AddMemoizations("WARRIOR", "WARLOCK", "PRIEST", "PALADIN", "MAGE", "HUNTER", "DRUID", "SHAMAN", "ROGUE")
	talentPinger.OnCommReceive = {
		PING = function(self, prefix, distribution, sender)
			if not isSendingTalents() then
				return
			end
			if distribution == "WHISPER" then
				local instance, style = IsInInstance()
				if instance and style == "arena" then
					local good = false
					for i = 1, GetNumRaidMembers() do
						if UnitName("raid" .. i) == sender then
							good = true
						end
					end
					if not good then
						return
					end
				end
			end
			local t = newList()
			local _, class = UnitClass("player")
			t[#t+1] = class
			local level = UnitLevel("player")
			t[#t+1] = level
			for i = 1, GetNumTalentTabs() do
				local num = GetNumTalents(i)
				t[#t+1] = num
				local u = newList()
				for j = 1, num do
					local spent = select(5, GetTalentInfo(i, j))
					u[#u+1] = (spent%2) >= 1
					u[#u+1] = (spent%4) >= 2
					u[#u+1] = (spent%8) >= 4
				end

				local w = newList()
				for j = 1, #u, 8 do
					local c = 0
					for k = 0, 7 do
						c = c + (u[j+k] and 1 or 0) * 2^k
					end
					w[#w+1] = c
				end
				u = del(u)
				t[#t+1] = string.char(unpack(w))
				w = del(w)
			end
			self:SendCommMessage("WHISPER", sender, "PONG", unpack(t))
			t = del(t)
		end,
		PONG = function(self, prefix, distribution, sender, class, level, ...)
			if not isSendingTalents() then
				return
			end
			if not next(talentReceptors) then
				return
			end
			local t = newList()
			t.class = class
			t.level = level
			for i = 1, select('#', ...), 2 do
				local tree = newList()
				t[#t+1] = tree
				local num, code = select(i, ...)

				local w = newList(code:byte(1, #code))

				local u = newList()
				for j = 1, #w do
					local c = w[j]
					for i = 0, 7 do
						u[#u+1] = math.floor(c/2^i)%2 == 1
					end
				end

				for j = 1, num do
					local a, b, c = u[j*3 - 2] and 1 or 0, u[j*3 - 1] and 2 or 0, u[j*3] and 4 or 0
					tree[j] = a + b + c
				end
			end
			local good = true
			if level < 1 or level > 70 then
				good = false
			elseif class ~= "WARRIOR" and class ~= "WARLOCK" and class ~= "ROGUE" and class ~= "PALADIN" and class ~= "DRUID" and class ~= "SHAMAN" and class ~= "PRIEST" and class ~= "HUNTER" and class ~= "MAGE" then
				good = false
			else
				local total = 0
				for i,v in ipairs(t) do
					for j,u in ipairs(v) do
						if u > 5 then
							good = false
							break
						end
						total = total + u
					end
					if not good then
						break
					end
				end
				if total > 61 then
					good = false
				end
			end
			if good then
				for func in pairs(talentReceptors) do
					local success, err = pcall(func, sender, t)
					if not success then
						geterrorhandler()(err)
					end
				end
			end
			for i,v in ipairs(t) do
				t[i] = del(v)
			end
			t = del(t)
		end
	}
	talentPinger:AddCommListener("TAL", "WHISPER")
	talentPinger:AddCommListener("TAL", "GUILD")
	talentPinger:AddCommListener("TAL", "GROUP")
end

Rock:AddUnitTest(MAJOR_VERSION, function()
	-- serialization + deserialization

	local function isEqual(alpha, bravo)
		local type_alpha = type(alpha)
		if type_alpha ~= type(bravo) then
			return false
		end
		if type_alpha ~= "table" then
			return alpha == bravo
		end
		local keys = newList()
		local tableKeys_alpha = newList()
		for k in pairs(alpha) do
			if type(k) ~= "table" then
				keys[k] = true
			else
				tableKeys_alpha[#tableKeys_alpha+1] = k
			end
		end
		local tableKeys_bravo = newList()
		for k in pairs(bravo) do
			if type(k) ~= "table" then
				keys[k] = true
			else
				tableKeys_bravo[#tableKeys_bravo+1] = k
			end
		end
		for k in pairs(keys) do
			if not isEqual(alpha[k], bravo[k]) then
				return false
			end
		end
		keys = del(keys)
		if #tableKeys_alpha ~= #tableKeys_bravo then
			return false
		end
		for _,v in ipairs(tableKeys_alpha) do
			local good = false
			for i,u in ipairs(tableKeys_bravo) do
				if isEqual(v, u) then
					good = true
					if not isEqual(alpha[v], bravo[u]) then
						return false
					end
					table_remove(tableKeys_bravo, i)
					break
				end
			end
			if not good then
				return false
			end
		end

		tableKeys_alpha = del(tableKeys_alpha)
		tableKeys_bravo = del(tableKeys_bravo)
		return true
	end

	local value = "Alpha"
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = ""
	for i = 0, 255 do
		value = value .. string_char(i)
	end
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	for j = 1, 100 do
		local value = ""
		for i = 1, 1000 do
			value = value .. string_char(_G.math.random(0, 255))
		end
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))
	end

	local value = 0
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 1
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -1
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 127
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 128
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -128
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 300
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -300
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 60000
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -60000
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 1e10
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -1e10
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 1e20
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -1e20
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 1e100
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -1e100
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 1e300
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -1e300
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 1e10000 -- inf
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -1e10000 -- -inf
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = 0.5
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = -0.5
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	for i = 1, 100 do
		local value = _G.math.random()
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))

		local value = -value
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))
	end

	for i = 1, 100 do
		local value = 100*_G.math.random()
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))

		local value = -value
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))
	end

	for i = 1, 100 do
		local value = 1000000*_G.math.random()
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))

		local value = -value
		local a = table_concat((serializeAndEncode(nil, value)))
		local b = decode(a)
		local c = unpack((deserialize(b)))
		assert(isEqual(c, value))
	end

	local value = true
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = false
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = nil
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = {}
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { "Blah" }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { "Alpha", "Bravo" }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { Blah = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { Alpha = true, Bravo = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { Alpha = true, "Bravo" }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { {} }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { {}, {} }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{}] = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{}] = true, [{}] = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{ "Alpha" }] = true, [{ "Bravo" }] = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{ Alpha = true }] = true, [{ Bravo = true }] = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{ "Alpha", "Bravo" }] = true, [{ "Charlie", "Delta" }] = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{ Alpha = true, Bravo = true }] = true, [{ Charlie = true, Delta = true }] = true }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { [{ Alpha = true, "Bravo" }] = true, { "Charlie", Delta = true } }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local value = { { { { { {} } } } } }
	local a = table_concat((serializeAndEncode(nil, value)))
	local b = decode(a)
	local c = unpack((deserialize(b)))
	assert(isEqual(c, value))

	local a = table_concat((serializeAndEncode(nil, nil, nil, nil)))
	local b = decode(a)
	local c, n = deserialize(b)
	assert(n == 3)

	local a = table_concat((serializeAndEncode(nil, "alpha", nil, "charlie")))
	local b = decode(a)
	local c, n = deserialize(b)
	assert(c[1] == "alpha")
	assert(c[2] == nil)
	assert(c[3] == "charlie")
	assert(n == 3)
end)

Rock:AddUnitTest(MAJOR_VERSION, function()
	local t = { name = MAJOR_VERSION .. "_UnitTest" }
	RockComm:Embed(t)

	local expectedToReceive
	local triggered = false
	function t:OnCommReceive(prefix, distribution, person, ...)
		for i = 1, select('#', ...) do
			assert(select(i, ...) == expectedToReceive[i])
		end
		triggered = true
	end

	t:SetCommPrefix("UnT")

	assert(not t:HasCommListener("UnT", "WHISPER"))
	t:AddCommListener("UnT", "WHISPER")
	assert(t:HasCommListener("UnT", "WHISPER"))

	expectedToReceive = { "Pants" }
	t:SendCommMessage("WHISPER", playerName, unpack(expectedToReceive))
	assert(triggered)
	triggered = false

	expectedToReceive = { 52 }
	t:SendCommMessage("WHISPER", playerName, unpack(expectedToReceive))
	assert(triggered)
	triggered = false

	expectedToReceive = { true, true, false, true, false }
	t:SendCommMessage("WHISPER", playerName, unpack(expectedToReceive))
	assert(triggered)
	triggered = false

	expectedToReceive = { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 }
	t:SendCommMessage("WHISPER", playerName, unpack(expectedToReceive))
	assert(triggered)
	triggered = false

	expectedToReceive = { "alpha", 1, true, "bravo", 2, false }
	t:SendCommMessage("WHISPER", playerName, unpack(expectedToReceive))
	assert(triggered)
	triggered = false

	RockComm:Unembed(t)
end)


Rock:AddUnitTest(MAJOR_VERSION, function()
	local t = { name = MAJOR_VERSION .. "_UnitTest" }
	RockComm:Embed(t)

	local triggered
	t.OnCommReceive = {
		CMD1 = function(self, prefix, distribution, person, arg)
			triggered = "CMD1"
			assert(arg == "Pants")
		end,
		CMD2 = function(self, prefix, distribution, person, arg)
			triggered = "CMD2"
			assert(arg == "Anti-pants")
		end,
		TEST = function(self, prefix, distribution, person, alpha, bravo, charlie, ...)
			triggered = "TEST"
			assert(charlie == "charlie")
			assert((...) == nil)
			assert(select('#', ...) == 1) -- preserve nils
		end,
	}

	t:SetCommPrefix("UnT")

	assert(not t:HasCommListener("UnT", "WHISPER"))
	t:AddCommListener("UnT", "WHISPER")
	assert(t:HasCommListener("UnT", "WHISPER"))

	t:SendCommMessage("WHISPER", playerName, "CMD1", "Pants")
	assert(triggered == "CMD1")
	triggered = false

	t:SendCommMessage("WHISPER", playerName, "CMD2", "Anti-pants")
	assert(triggered == "CMD2")
	triggered = false

	t:SendCommMessage("WHISPER", playerName, "TEST", nil, nil, "charlie", nil)
	assert(triggered == "TEST")
	triggered = false

	RockComm:Unembed(t)
end)

Rock:AddUnitTest(MAJOR_VERSION, function()
	-- addon querying
	local triggered = false
	local checkingAddon
	local function func(sender, addon, version)
		triggered = true
		assert(sender == playerName)
		assert(addon == checkingAddon)
		local v,r = Rock(addon):GetLibraryVersion()
		assert(version == v .. "-" .. r)
	end
	RockComm:AddAddonVersionReceptor(func)
	checkingAddon = MAJOR_VERSION
	RockComm:QueryAddonVersion(checkingAddon, "WHISPER", playerName)
	assert(triggered)
	triggered = false
	checkingAddon = "LibRock-1.0"
	RockComm:QueryAddonVersion(checkingAddon, "WHISPER", playerName)
	assert(triggered)
	triggered = false
	addonVersionReceptors[func] = nil
	checkingAddon = MAJOR_VERSION
	RockComm:QueryAddonVersion(checkingAddon, "WHISPER", playerName)
	assert(not triggered)
end)

Rock:AddUnitTest(MAJOR_VERSION, function()
	-- talent querying
	local triggered = false
	local checkingAddon
	local function func(sender, data)
		triggered = true
		assert(data.class == select(2, UnitClass("player")), ("%q == %q"):format(tostring(data.class), tostring(select(2, UnitClass("player")))))
		assert(data.level == UnitLevel("player"), ("%s == %s"):format(tostring(data.level), tostring(UnitLevel("player"))))
		assert(#data == GetNumTalentTabs(), ("%s == %s"):format(tostring(#data), tostring(GetNumTalentTabs())))
		for i,v in ipairs(data) do
			assert(#v == GetNumTalents(i))
			for j,u in ipairs(v) do
				assert(u == select(5, GetTalentInfo(i, j)))
			end
		end
	end
	RockComm:AddTalentReceptor(func)
	RockComm:QueryTalents("WHISPER", playerName)
	assert(triggered)
	triggered = false
	talentReceptors[func] = nil
	RockComm:QueryTalents("WHISPER", playerName)
	assert(not triggered)
end)

--
-- ChatThrottleLib by Mikk
--
-- Manages AddOn chat output to keep player from getting kicked off.
--
-- ChatThrottleLib.SendChatMessage/.SendAddonMessage functions that accept
-- a Priority ("BULK", "NORMAL", "ALERT") as well as prefix for SendChatMessage.
--
-- Priorities get an equal share of available bandwidth when fully loaded.
-- Communication channels are separated on extension+chattype+destination and
-- get round-robinned. (Destination only matters for whispers and channels,
-- obviously)
--
-- Will install hooks for SendChatMessage and SendAdd[Oo]nMessage to measure
-- bandwidth bypassing the library and use less bandwidth itself.
--
--
-- Fully embeddable library. Just copy this file into your addon directory,
-- add it to the .toc, and it's done.
--
-- Can run as a standalone addon also, but, really, just embed it! :-)
--

local CTL_VERSION = 16

if ChatThrottleLib and ChatThrottleLib.version >= CTL_VERSION then
	-- There's already a newer (or same) version loaded. Buh-bye.
	return
end

if not ChatThrottleLib then
	ChatThrottleLib = {}
	_G.ChatThrottleLib = ChatThrottleLib
end

ChatThrottleLib.MAX_CPS = 800			  -- 2000 seems to be safe if NOTHING ELSE is happening. let's call it 800.
ChatThrottleLib.MSG_OVERHEAD = 40		-- Guesstimate overhead for sending a message; source+dest+chattype+protocolstuff

ChatThrottleLib.BURST = 4000				-- WoW's server buffer seems to be about 32KB. 8KB should be safe, but seen disconnects on _some_ servers. Using 4KB now.

ChatThrottleLib.MIN_FPS = 20				-- Reduce output CPS to half (and don't burst) if FPS drops below this value

ChatThrottleLib.version = CTL_VERSION


-----------------------------------------------------------------------
-- Double-linked ring implementation

local Ring = {}
local RingMeta = { __index = Ring }

function Ring:New()
	local ret = {}
	setmetatable(ret, RingMeta)
	return ret
end

function Ring:Add(obj)	-- Append at the "far end" of the ring (aka just before the current position)
	if self.pos then
		obj.prev = self.pos.prev
		obj.prev.next = obj
		obj.next = self.pos
		obj.next.prev = obj
	else
		obj.next = obj
		obj.prev = obj
		self.pos = obj
	end
end

function Ring:Remove(obj)
	obj.next.prev = obj.prev
	obj.prev.next = obj.next
	if self.pos == obj then
		self.pos = obj.next
		if self.pos == obj then
			self.pos = nil
		end
	end
end



-----------------------------------------------------------------------
-- Recycling bin for pipes (kept in a linked list because that's
-- how they're worked with in the rotating rings; just reusing members)

ChatThrottleLib.PipeBin = { count = 0 }

function ChatThrottleLib.PipeBin:Put(pipe)
	for i = #pipe, 1, -1 do
		pipe[i] = nil
	end
	pipe.prev = nil
	pipe.next = self.list
	self.list = pipe
	self.count = self.count + 1
end

function ChatThrottleLib.PipeBin:Get()
	if self.list then
		local ret = self.list
		self.list = ret.next
		ret.next = nil
		self.count = self.count - 1
		return ret
	end
	return {}
end

function ChatThrottleLib.PipeBin:Tidy()
	if self.count < 25 then
		return
	end

	local n
	if self.count > 100 then
		n = self.count-90
	else
		n = 10
	end
	for i = 2, n do
		self.list = self.list.next
	end
	local delme = self.list
	self.list = self.list.next
	delme.next = nil
end




-----------------------------------------------------------------------
-- Recycling bin for messages

ChatThrottleLib.MsgBin = {}

function ChatThrottleLib.MsgBin:Put(msg)
	msg.text = nil
	self[#self + 1] = msg
end

function ChatThrottleLib.MsgBin:Get()
	return table_remove(self) or {}
end

function ChatThrottleLib.MsgBin:Tidy()
	if #self < 50 then
		return
	end
	if #self > 150 then	 -- "can't happen" but ...
		for n = #self, 120, -1 do
			self[n] = nil
		end
	else
		for n = #self, #self - 20, -1 do
			self[n] = nil
		end
	end
end


-----------------------------------------------------------------------
-- ChatThrottleLib:Init
-- Initialize queues, set up frame for OnUpdate, etc


function ChatThrottleLib:Init()

	-- Set up queues
	if not self.Prio then
		self.Prio = {}
		self.Prio["ALERT"] = { ByName = {}, Ring = Ring:New(), avail = 0 }
		self.Prio["NORMAL"] = { ByName = {}, Ring = Ring:New(), avail = 0 }
		self.Prio["BULK"] = { ByName = {}, Ring = Ring:New(), avail = 0 }
	end

	-- v4: total send counters per priority
	for _, Prio in pairs(self.Prio) do
		Prio.nTotalSent = Prio.nTotalSent or 0
	end

	if not self.avail then
		self.avail = 0 -- v5
	end
	if not self.nTotalSent then
		self.nTotalSent = 0 -- v5
	end


	-- Set up a frame to get OnUpdate events
	if not self.Frame then
		self.Frame = _G.CreateFrame("Frame")
		self.Frame:Hide()
	end
	self.Frame:SetScript("OnUpdate", self.OnUpdate)
	self.Frame:SetScript("OnEvent", self.OnEvent)	-- v11: Monitor P_E_W so we can throttle hard for a few seconds
	self.Frame:RegisterEvent("PLAYER_ENTERING_WORLD")
	self.OnUpdateDelay = 0
	self.LastAvailUpdate = GetTime()
	self.HardThrottlingBeginTime = GetTime()	-- v11: Throttle hard for a few seconds after startup

	-- Hook SendChatMessage and SendAddonMessage so we can measure unpiped traffic and avoid overloads (v7)
	if not self.ORIG_SendChatMessage then
		-- use secure hooks instead of insecure hooks (v16)
		self.securelyHooked = true
		--SendChatMessage
		self.ORIG_SendChatMessage = _G.SendChatMessage
		hooksecurefunc("SendChatMessage", function(...)
			return ChatThrottleLib.Hook_SendChatMessage(...)
		end)
		self.ORIG_SendAddonMessage = _G.SendAddonMessage
		--SendAddonMessage
		hooksecurefunc("SendAddonMessage", function(...)
			return ChatThrottleLib.Hook_SendAddonMessage(...)
		end)
	end
	self.nBypass = 0
end


-----------------------------------------------------------------------
-- ChatThrottleLib.Hook_SendChatMessage / .Hook_SendAddonMessage
function ChatThrottleLib.Hook_SendChatMessage(text, chattype, language, destination, ...)
	local self = ChatThrottleLib
	local size = tostring(text or ""):len() + tostring(chattype or ""):len() + tostring(destination or ""):len() + 40
	self.avail = self.avail - size
	self.nBypass = self.nBypass + size
	if not self.securelyHooked then
		self.ORIG_SendChatMessage(text, chattype, language, destination, ...)
	end
end
function ChatThrottleLib.Hook_SendAddonMessage(prefix, text, chattype, destination, ...)
	local self = ChatThrottleLib
	local size = tostring(text or ""):len() + tostring(chattype or ""):len() + tostring(prefix or ""):len() + tostring(destination or ""):len() + 40
	self.avail = self.avail - size
	self.nBypass = self.nBypass + size
	if not self.securelyHooked then
		self.ORIG_SendAddonMessage(prefix, text, chattype, destination, ...)
	end
end



-----------------------------------------------------------------------
-- ChatThrottleLib:UpdateAvail
-- Update self.avail with how much bandwidth is currently available

function ChatThrottleLib:UpdateAvail()
	local now = GetTime()
	local MAX_CPS = self.MAX_CPS;
	local newavail = MAX_CPS * (now - self.LastAvailUpdate)

	if now - self.HardThrottlingBeginTime < 5 then
		-- First 5 seconds after startup/zoning: VERY hard clamping to avoid irritating the server rate limiter, it seems very cranky then
		self.avail = math_min(self.avail + (newavail*0.1), MAX_CPS*0.5)
	elseif GetFramerate() < self.MIN_FPS then		-- GetFrameRate call takes ~0.002 secs
		newavail = newavail * 0.5
		self.avail = math_min(MAX_CPS, self.avail + newavail)
		self.bChoking = true		-- just for stats
	else
		self.avail = math_min(self.BURST, self.avail + newavail)
		self.bChoking = false
	end

	self.avail = math_max(self.avail, 0-(MAX_CPS*2))	-- Can go negative when someone is eating bandwidth past the lib. but we refuse to stay silent for more than 2 seconds; if they can do it, we can.
	self.LastAvailUpdate = now

	return self.avail
end


-----------------------------------------------------------------------
-- Despooling logic

function ChatThrottleLib:Despool(Prio)
	local ring = Prio.Ring
	while ring.pos and Prio.avail > ring.pos[1].nSize do
		local msg = table_remove(Prio.Ring.pos, 1)
		if not Prio.Ring.pos[1] then
			local pipe = Prio.Ring.pos
			Prio.Ring:Remove(pipe)
			Prio.ByName[pipe.name] = nil
			self.PipeBin:Put(pipe)
		else
			Prio.Ring.pos = Prio.Ring.pos.next
		end
		Prio.avail = Prio.avail - msg.nSize
		msg.f(unpack(msg, 1, msg.n))
		Prio.nTotalSent = Prio.nTotalSent + msg.nSize
		self.MsgBin:Put(msg)
	end
end


function ChatThrottleLib.OnEvent()
	-- v11: We know that the rate limiter is touchy after login. Assume that it's touch after zoning, too.
	local self = ChatThrottleLib
	if _G.event == "PLAYER_ENTERING_WORLD" then
		self.HardThrottlingBeginTime = GetTime()	-- Throttle hard for a few seconds after zoning
		self.avail = 0
	end
end


function ChatThrottleLib.OnUpdate()
	local self = ChatThrottleLib

	self.OnUpdateDelay = self.OnUpdateDelay + _G.arg1
	if self.OnUpdateDelay < 0.08 then
		return
	end
	self.OnUpdateDelay = 0

	self:UpdateAvail()

	if self.avail < 0  then
		return -- argh. some bastard is spewing stuff past the lib. just bail early to save cpu.
	end

	-- See how many of or priorities have queued messages
	local n = 0
	for prioname,Prio in pairs(self.Prio) do
		if Prio.Ring.pos or Prio.avail < 0 then
			n = n + 1
		end
	end

	-- Anything queued still?
	if n<1 then
		-- Nope. Move spillover bandwidth to global availability gauge and clear self.bQueueing
		for prioname, Prio in pairs(self.Prio) do
			self.avail = self.avail + Prio.avail
			Prio.avail = 0
		end
		self.bQueueing = false
		self.Frame:Hide()
		return
	end

	-- There's stuff queued. Hand out available bandwidth to priorities as needed and despool their queues
	local avail = self.avail/n
	self.avail = 0

	for prioname, Prio in pairs(self.Prio) do
		if Prio.Ring.pos or Prio.avail < 0 then
			Prio.avail = Prio.avail + avail
			if Prio.Ring.pos and Prio.avail > Prio.Ring.pos[1].nSize then
				self:Despool(Prio)
			end
		end
	end

	-- Expire recycled tables if needed
	self.MsgBin:Tidy()
	self.PipeBin:Tidy()
end




-----------------------------------------------------------------------
-- Spooling logic


function ChatThrottleLib:Enqueue(prioname, pipename, msg)
	local Prio = self.Prio[prioname]
	local pipe = Prio.ByName[pipename]
	if not pipe then
		self.Frame:Show()
		pipe = self.PipeBin:Get()
		pipe.name = pipename
		Prio.ByName[pipename] = pipe
		Prio.Ring:Add(pipe)
	end

	pipe[#pipe + 1] = msg

	self.bQueueing = true
end



function ChatThrottleLib:SendChatMessage(prio, prefix,   text, chattype, language, destination)
	if not self or not prio or not text or not self.Prio[prio] then
		error('Usage: ChatThrottleLib:SendChatMessage("{BULK||NORMAL||ALERT}", "prefix" or nil, "text"[, "chattype"[, "language"[, "destination"]]]', 2)
	end

	prefix = prefix or tostring(_G.this)		-- each frame gets its own queue if prefix is not given

	local nSize = text:len() + self.MSG_OVERHEAD

	-- Check if there's room in the global available bandwidth gauge to send directly
	if not self.bQueueing and nSize < self:UpdateAvail() then
		self.avail = self.avail - nSize
		self.ORIG_SendChatMessage(text, chattype, language, destination)
		self.Prio[prio].nTotalSent = self.Prio[prio].nTotalSent + nSize
		return
	end

	-- Message needs to be queued
	local msg = self.MsgBin:Get()
	msg.f = self.ORIG_SendChatMessage
	msg[1] = text
	msg[2] = chattype or "SAY"
	msg[3] = language
	msg[4] = destination
	msg.n = 4
	msg.nSize = nSize

	self:Enqueue(prio, ("%s/%s/%s"):format(prefix, chattype, destination or ""), msg)
end


function ChatThrottleLib:SendAddonMessage(prio, prefix, text, chattype, target)
	if not self or not prio or not prefix or not text or not chattype or not self.Prio[prio] then
		error('Usage: ChatThrottleLib:SendAddonMessage("{BULK||NORMAL||ALERT}", "prefix", "text", "chattype"[, "target"])', 0)
	end

	local nSize = prefix:len() + 1 + text:len() + self.MSG_OVERHEAD

	-- Check if there's room in the global available bandwidth gauge to send directly
	if not self.bQueueing and nSize < self:UpdateAvail() then
		self.avail = self.avail - nSize
		self.ORIG_SendAddonMessage(prefix, text, chattype, target)
		self.Prio[prio].nTotalSent = self.Prio[prio].nTotalSent + nSize
		return
	end

	-- Message needs to be queued
	local msg = self.MsgBin:Get()
	msg.f = self.ORIG_SendAddonMessage
	msg[1] = prefix
	msg[2] = text
	msg[3] = chattype
	msg[4] = target
	msg.n = (target~=nil) and 4 or 3;
	msg.nSize = nSize

	self:Enqueue(prio, ("%s/%s/%s"):format(prefix, chattype, target or ""), msg)
end




-----------------------------------------------------------------------
-- Get the ball rolling!

ChatThrottleLib:Init()

--[[ WoWBench debugging snippet
if(WOWB_VER) then
	local function SayTimer()
		print("SAY: "..GetTime().." "..arg1)
	end
	ChatThrottleLib.Frame:SetScript("OnEvent", SayTimer)
	ChatThrottleLib.Frame:RegisterEvent("CHAT_MSG_SAY")
end
]]

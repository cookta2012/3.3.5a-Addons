--[[
Name: LibRockConsole-1.0
Revision: $Rev: 238 $
Developed by: ckknight (ckknight@gmail.com)
Website: http://www.wowace.com/
Description: Library to allow for input/output capabilities from the command line.
Dependencies: LibRock-1.0
License: LGPL v2.1
]]

local MAJOR_VERSION = "LibRockConsole-1.0"
local MINOR_VERSION = tonumber(("$Revision: 238 $"):match("(%d+)")) + 90000

if not Rock then error(MAJOR_VERSION .. " requires LibRock-1.0") end

local RockConsole, oldLib = Rock:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not RockConsole then
	return
end

-- #AUTODOC_NAMESPACE RockConsole

local _G = _G
local Rock = _G.Rock
local tostring = _G.tostring
local loadstring = _G.loadstring
local geterrorhandler = _G.geterrorhandler
local error = _G.error
local pcall = _G.pcall
local select = _G.select
local pairs = _G.pairs
local ipairs = _G.ipairs
local type = _G.type
local unpack = _G.unpack
local rawget = _G.rawget
local getmetatable = _G.getmetatable
local next = _G.next
local GetTime = _G.GetTime
local table_concat = _G.table.concat
local string_format = _G.string.format
local table_sort = _G.table.sort
local math_random = _G.math.random
local string_char = _G.string.char

local newList, del = Rock:GetRecyclingFunctions(MAJOR_VERSION, "newList", "del")
local precondition, postcondition, argCheck = Rock:GetContractFunctions(MAJOR_VERSION, "precondition", "postcondition", "argCheck")

-- { ["NAME"] = objectWhichRegisteredIt }
RockConsole.slashCommands = oldLib and oldLib.slashCommands or {}
local slashCommands = RockConsole.slashCommands

local function better_tostring(tmp, value, literal)
	if type(value) == "table" then
		if type(rawget(value, 0)) == "userdata" and type(value.GetObjectType) == "function" then
			tmp[#tmp+1] = "<"
			tmp[#tmp+1] = value:GetObjectType()
			tmp[#tmp+1] = ":"
			tmp[#tmp+1] = value:GetName() or "(anon)"
			tmp[#tmp+1] = ">"
			return
		elseif type(rawget(value, 'GetLibraryVersion')) == "function" then
			local major, minor = value:GetLibraryVersion()
			tmp[#tmp+1] = major
			tmp[#tmp+1] = "r"
			tmp[#tmp+1] = minor
			return
		end
	end
	local v = tostring(value)
	if literal then
		v = v:gsub("|", "||")
	end
	tmp[#tmp+1] = v
	return
end

local function print(text, self, r, g, b, frame, delay)
	if not text or text:len() == 0 then
		text = " "
	end
	if self and self ~= RockConsole then
		local tmp = newList()
		tmp[#tmp+1] = "|cffffff78"
		better_tostring(tmp, self)
		if tmp[2]:match("^table: ") then
			for i = 2, #tmp do
				tmp[i] = nil
			end
			if self.name then
				better_tostring(tmp, self.name)
			end
		end
		tmp[#tmp+1] = ":|r "
		tmp[#tmp+1] = text
		text = table_concat(tmp)
		tmp = del(tmp)
	end
	local last_color
	for t in text:gmatch("[^\n]+") do
		(frame or _G.DEFAULT_CHAT_FRAME):AddMessage(last_color and "|cff" .. last_color .. t or t, r, g, b, nil, delay or 5)
		if not last_color or t:find("|r") or t:find("|c") then
			last_color = t:match(".*|c[fF][fF](%x%x%x%x%x%x)[^|]-$")
		end
	end
	return text
end

local function tostring_connectMultiple(connector, ...)
	local tmp = newList()
	for i = 1, select('#', ...) do
		if i > 1 then
			tmp[#tmp+1] = connector
		end
		better_tostring(tmp, (select(i, ...)))
	end
	local s = table_concat(tmp)
	tmp = del(tmp)
	return s
end

local function tostring_args(...)
	if select('#', ...) == 0 then
		return
	end
	local tmp = newList()
	better_tostring(tmp, (...))
	local s = table_concat(tmp)
	tmp = del(tmp)
	return s, tostring_args(select(2, ...))
end

local recurse = {}
local timeToEnd

local function ignoreCaseSort(alpha, bravo)
	return tostring(alpha):lower() < tostring(bravo):lower()
end

local function specialSort(alpha, bravo)
	if alpha == nil or bravo == nil then
		return false
	end
	local type_alpha, type_bravo = type(alpha), type(bravo)
	if type_alpha == "table" and type(rawget(alpha, 0)) == "userdata" then
		type_alpha = "frame"
	end
	if type_bravo == "table" and type(rawget(bravo, 0)) == "userdata" then
		type_bravo = "frame"
	end
	if type_alpha ~= type_bravo then
		return type_alpha < type_bravo
	end
	if type_alpha == "string" then
		return alpha:lower() < bravo:lower()
	elseif type_alpha == "number" then
		return alpha < bravo
	elseif type_alpha == "table" then
		if #alpha ~= #bravo then
			return #alpha < #bravo
		end
		local num = 0
		for k in pairs(alpha) do
			num = num + 1
		end
		for k in pairs(bravo) do
			num = num - 1
		end
		if num ~= 0 then
			return num < 0
		end
		
		local alpha_keys = newList()
		local bravo_keys = newList()
		for k in pairs(alpha) do
			alpha_keys[#alpha_keys+1] = k
		end
		for k in pairs(bravo) do
			bravo_keys[#bravo_keys+1] = k
		end
		table_sort(alpha_keys, specialSort)
		table_sort(bravo_keys, specialSort)
		
		for i, alpha_k in ipairs(alpha) do
			local bravo_k = bravo[i]
			if specialSort(alpha_k, bravo_k) then
				alpha_keys = del(alpha_keys)
				bravo_keys = del(bravo_keys)
				return true
			elseif specialSort(bravo_k, alpha_k) then
				alpha_keys = del(alpha_keys)
				bravo_keys = del(bravo_keys)
				return false
			end
		end
		
		for k, alpha_v in pairs(alpha) do
			local bravo_v = bravo[k]
			if specialSort(alpha_v, bravo_v) then
				alpha_keys = del(alpha_keys)
				bravo_keys = del(bravo_keys)
				return true
			elseif specialSort(bravo_v, alpha_v) then
				alpha_keys = del(alpha_keys)
				bravo_keys = del(bravo_keys)
				return false
			end
		end
		
		alpha_keys = del(alpha_keys)
		bravo_keys = del(bravo_keys)
		
		return false
	elseif type_alpha == "frame" then
		local alpha_name = alpha:GetName()
		local bravo_name = bravo:GetName()
		if not alpha_name then
			return true
		elseif not bravo_name then
			return false
		end
		return alpha_name:lower() < bravo_name:lower()
	elseif type_alpha == "boolean" then
		return not alpha
	else
		return false
	end
end

local getkeystring

local function escapeChar(c)
    return ("\\%03d"):format(c:byte())
end

local function isList(t)
	local n = #t
	for k,v in pairs(t) do
		if type(k) ~= "number" then
			return false
		elseif 1 > k or k > n then
			return false
		end
	end
	return true
end

local findGlobal = _G.setmetatable({}, {__index=function(self, object)
	for k,v in pairs(_G) do
		if v == object then
			k = tostring(k)
			self[v] = k
			return k
		end
	end
	self[object] = false
	return false
end})

local function literal_tostring_nonframe(tmp, object, depth)
	local type_object = type(object)
	if type_object == "string" then
		tmp[#tmp+1] = "|cff00ff00"
		tmp[#tmp+1] = ("%q"):format((object:gsub("|", "||"))):gsub("[%z\001-\009\011-\031\127-\255]", escapeChar)
		tmp[#tmp+1] = "|r"
	elseif type_object == "number" then
		tmp[#tmp+1] = "|cffff7fff"
		tmp[#tmp+1] = tostring(object)
		tmp[#tmp+1] = "|r"
	elseif type_object == "boolean" then
		tmp[#tmp+1] = "|cffff9100"
		tmp[#tmp+1] = tostring(object)
		tmp[#tmp+1] = "|r"
	elseif object == nil then
		tmp[#tmp+1] = "|cffff7f7f"
		tmp[#tmp+1] = tostring(object)
		tmp[#tmp+1] = "|r"
	elseif type_object == "table" then
		if object == _G then
			tmp[#tmp+1] = "|cffffea00_G|r"
			return
		end
		if type(rawget(object, 0)) == "userdata" and type(object.GetObjectType) == "function" then
			tmp[#tmp+1] = "|cffffea00"
			better_tostring(tmp, object, true)
			tmp[#tmp+1] = "|r"
			return
		end
		if next(object) == nil then
			local mt = getmetatable(object)
			if type(mt) == "table" and type(mt.__raw) == "table" then
				object = mt.__raw
			end
		end
		if recurse[object] or GetTime() > timeToEnd or depth >= 2 then
			tmp[#tmp+1] = "|cff9f9f9f<"
			if recurse[object] then
				tmp[#tmp+1] = "Recursion "
			elseif GetTime() > timeToEnd then
				tmp[#tmp+1] = "Timeout "
			end
			local g = findGlobal[object]
			if g then
				tmp[#tmp+1] = "_G["
				tmp[#tmp+1] = ("%q"):format(tostring(g))
				tmp[#tmp+1] = "]"
			else
				better_tostring(tmp, object, true)
			end
			tmp[#tmp+1] = ">|r"
			return
		end
		recurse[object] = true
		if next(object) == nil then
			tmp[#tmp+1] = "{}"
			return
		end
		if next(object, (next(object))) == nil then
			tmp[#tmp+1] = "{ "
			local k, v = next(object)
			if k == 1 then
				literal_tostring_nonframe(tmp, v, depth+1)
			else
				getkeystring(tmp, k, depth+1)
				tmp[#tmp+1] = " = "
				literal_tostring_nonframe(tmp, v, depth+1)
			end
			tmp[#tmp+1] = " }"
			return
		end
		
		local g = findGlobal[object]
		tmp[#tmp+1] = "{ |cff9f9f9f--[[ "
		if g then
			tmp[#tmp+1] = "_G["
			tmp[#tmp+1] = ("%q"):format(tostring(g))
			tmp[#tmp+1] = "]"
		else	
			better_tostring(tmp, object, true)
		end
		tmp[#tmp+1] = " ]]|r\n"
		
		if isList(object) then
			for i = 1, #object do
				for j = 1, depth+1 do
					tmp[#tmp+1] = "    "
				end
				literal_tostring_nonframe(tmp, object[i], depth+1)
				if i < #object then
					tmp[#tmp+1] = ","
				end
				tmp[#tmp+1] = "\n"
			end
		else
			local keys = newList()
			for k in pairs(object) do
				keys[#keys+1] = k
			end
			table_sort(keys, specialSort)
			for i, k in ipairs(keys) do
				local v = object[k]
				for j = 1, depth+1 do
					tmp[#tmp+1] = "    "
				end
				getkeystring(tmp, k, depth+1)
				tmp[#tmp+1] = " = "
				literal_tostring_nonframe(tmp, v, depth+1)
				if i < #keys then
					tmp[#tmp+1] = ","
				end
				tmp[#tmp+1] = "\n"
			end
			keys = del(keys)
		end
		for j = 1, depth do
			tmp[#tmp+1] = "    "
		end
		tmp[#tmp+1] = "} |cff9f9f9f--[[ "
		if g then
			tmp[#tmp+1] = "_G["
			tmp[#tmp+1] = ("%q"):format(tostring(g))
			tmp[#tmp+1] = "]"
		else	
			better_tostring(tmp, object, true)
		end
		tmp[#tmp+1] = " ]]|r"
	else
		tmp[#tmp+1] = "|cffffea00"
		better_tostring(tmp, object, true)
		tmp[#tmp+1] = "|r"
	end
end

local reserved = {
	["and"] = true,
	["break"] = true,
	["do"] = true,
	["else"] = true,
	["elseif"] = true,
	["end"] = true,
	["false"] = true,
	["for"] = true,
	["function"] = true,
	["if"] = true,
	["in"] = true,
	["local"] = true,
	["nil"] = true,
	["not"] = true,
	["or"] = true,
	["repeat"] = true,
	["return"] = true,
	["then"] = true,
	["true"] = true,
	["until"] = true,
	["while"] = true,
}

function getkeystring(tmp, object, depth)
	if type(object) == "string" then
		if object:find("^[%a_][%a%d_]*$") and not reserved[object] then
			tmp[#tmp+1] = "|cff7fd5ff"
			tmp[#tmp+1] = object
			tmp[#tmp+1] = "|r"
			return
		end
	end
	tmp[#tmp+1] = "["
	literal_tostring_nonframe(tmp, object, depth)
	tmp[#tmp+1] = "]"
end

local get_stringed_args
do
	local function g(tmp, ...)
		local n = select('#', ...)
		if n == 0 then
			literal_tostring_nonframe(tmp, nil, 1)
			return
		end
		for i = 1, n do
			if i > 1 then
				tmp[#tmp+1] = ", "
			end
			local v = select(i, ...)
			literal_tostring_nonframe(tmp, v, 1)
		end
	end

	local function f(tmp, success, ...)
		if not success then
			return false
		end
		g(tmp, ...)
		return true
	end

	function get_stringed_args(tmp, func, ...)
		return f(tmp, pcall(func, ...))
	end
end

local function literal_tostring_frame(tmp, frame)
	tmp[#tmp+1] = "|cffffea00<"
	tmp[#tmp+1] = frame:GetObjectType()
	tmp[#tmp+1] = ":"
	tmp[#tmp+1] = frame:GetName() or "(anon)"
	tmp[#tmp+1] = "\n"
	local fields = newList()
	local totalFields = newList()
	for k in pairs(frame) do
		if k ~= 0 then
			fields[k] = true
			totalFields[k] = true
		end
	end
	local frameMethods = newList()
	local __index = getmetatable(frame).__index
	for k in pairs(__index) do
		frameMethods[k] = true
		totalFields[k] = true
	end
	
	local sortedTotalFields = newList()
	for k in pairs(totalFields) do
		totalFields[k] = nil
		sortedTotalFields[#sortedTotalFields+1] = k
	end
	totalFields = del(totalFields)
	table_sort(sortedTotalFields, ignoreCaseSort)
	
	local first = true
	for i,k in ipairs(sortedTotalFields) do
		local v = frame[k]
		if k == "GetPoint" then
			for j = 1, frame:GetNumPoints() do
				if not first then
					tmp[#tmp+1] = ",\n"
				else
					first = false
				end
				tmp[#tmp+1] = "    "
				getkeystring(tmp, k, 1)
				tmp[#tmp+1] = "("
				literal_tostring_nonframe(tmp, j, 1)
				tmp[#tmp+1] = ") => "
				get_stringed_args(tmp, v, frame, j)
			end
		elseif type(v) == "function" and type(k) == "string" and (k:find("^Is") or k:find("^Get") or k:find("^Can")) and k ~= "IsEventRegistered" and k ~= "IsFrameType" and k ~= "IsObjectType" and k ~= "GetAttribute" then
			local tmp2 = newList()
			local q = get_stringed_args(tmp2, v, frame)
			if q then
				if not first then
					tmp[#tmp+1] = ",\n"
				else
					first = false
				end
				tmp[#tmp+1] = "    "
				getkeystring(tmp, k, 1)
				tmp[#tmp+1] = "() => "
				for _,v in ipairs(tmp2) do
					tmp[#tmp+1] = v
				end
			end
			tmp2 = del(tmp2)
		elseif type(v) ~= "function" or (type(v) == "function" and type(k) == "string" and fields[k]) then
			if not first then
				tmp[#tmp+1] = ",\n"
			else
				first = false
			end	
			tmp[#tmp+1] = "    "
			getkeystring(tmp, k, 1)
			tmp[#tmp+1] = " = "
			literal_tostring_nonframe(tmp, v, 1)
		end
	end
	fields = del(fields)
	sortedTotalFields = del(sortedTotalFields)
	
	tmp[#tmp+1] = "\n|cffffea00>|r"
end

local function literal_tostring(tmp, t, only)
	timeToEnd = GetTime() + 0.2
	if only and type(t) == "table" and type(rawget(t, 0)) == "userdata" and type(t.GetObjectType) == "function" then
		literal_tostring_frame(tmp, t)
	else
		literal_tostring_nonframe(tmp, t, 0)
	end
	for k,v in pairs(recurse) do
		recurse[k] = nil
	end
	for k,v in pairs(findGlobal) do
		findGlobal[k] = nil
	end
end

local function literal_tostring_connectMultiple(connector, ...)
	local tmp = newList()
	for i = 1, select('#', ...) do
		if i > 1 then
			tmp[#tmp+1] = connector
		end
		literal_tostring(tmp, (select(i, ...)))
	end
	local s = table_concat(tmp)
	tmp = del(tmp)
	return s
end

--[[---------------------------------------------------------------------------
Notes:
	* print a message to the specified message frame.
Arguments:
	number - [0, 1] The red value. Optional, default: nil
	number - [0, 1] The green value. Optional, default: nil
	number - [0, 1] The blue value. Optional, default: nil
	Frame - The MessageFrame to print to. Optional, default: self.printFrame or DEFAULT_CHAT_FRAME
	number - The amount of seconds to show. Optional, default: nil
	string or boolean - what to connect the multiple arguments with. If true, then it will print it literally. Optional, default: ", "
	value - value to print
	tuple - list of values to print
Example:
	MyAddon:CustomPrint(0, 1, 0, nil, nil, ", ", "Hello", "friend") -- prints "MyAddon: Hello, friend" in green.
-----------------------------------------------------------------------------]]
function RockConsole:CustomPrint(r, g, b, frame, delay, connector, ...)
	if connector == true then
		local text
		local n = select('#', ...)
		if n == 0 then
			text = "|cffffcfcf()|r"
		elseif n == 1 then
			local tmp = newList()
			literal_tostring(tmp, (...), true)
			text = table_concat(tmp)
			tmp = del(tmp)
		else
			text = literal_tostring_connectMultiple(", ", ...)
		end
		return print(text, self, r, g, b, frame or self.printFrame, delay)
	elseif tostring((...)):find("%%") and select('#', ...) >= 2 then
		local success, text = pcall(string_format, tostring_args(...))
		if success then
			return print(text, self, r, g, b, frame or self.printFrame, delay)
		end
	end
	local text = tostring_connectMultiple(tostring(connector or ", "), ...)
	return print(text, self, r, g, b, frame or self.printFrame, delay)
end
precondition(RockConsole, "CustomPrint", function(self, r, g, b, frame, delay, connector, ...)
	argCheck(r, 2, "number", "nil")
	if r then
		assert(r >= 0 and r <= 1)
	end
	argCheck(g, 3, "number", "nil")
	if g then
		assert(g >= 0 and g <= 1)
	end
	argCheck(b, 4, "number", "nil")
	if b then
		assert(b >= 0 and b <= 1)
	end
	argCheck(frame, 5, "table", "nil")
	argCheck(delay, 6, "number", "nil")
	argCheck(connector, 7, "string", "boolean", "nil")
end)

--[[---------------------------------------------------------------------------
Notes:
	* print a message to the specified message frame, separated by commas.
Arguments:
	tuple - list of values to print
Example:
	MyAddon:Print("Hello", "friend") -- print "MyAddon: Hello, friend"
	Rock("LibRockConsole-1.0"):Print("Hello", "friend") -- print "Hello, friend"
-----------------------------------------------------------------------------]]
function RockConsole:Print(...)
	local chatFrame = nil
	if type(self) == "table" and type(rawget(self, 0)) == "userdata" and self.GetFrameType and self:GetFrameType() == "ScrollingMessageFrame" then
		chatFrame = self
		self = RockConsole
	end
	return RockConsole.CustomPrint(self, nil, nil, nil, chatFrame, nil, ", ", ...)
end

--[[---------------------------------------------------------------------------
Notes:
	* print a message in literal format, separated by commas.
Arguments:
	tuple - list of values to print
Example:
	MyAddon:Print("Hello", "friend") -- print 'MyAddon: "Hello", "friend"'
	Rock("LibRockConsole-1.0"):Print("Hello", "friend") -- print '"Hello", "friend"'
-----------------------------------------------------------------------------]]
function RockConsole:PrintLiteral(...)
	local chatFrame = nil
	if type(self) == "table" and type(rawget(self, 0)) == "userdata" and self.GetFrameType and self:GetFrameType() == "ScrollingMessageFrame" then
		chatFrame = self
		self = RockConsole
	end
	return RockConsole.CustomPrint(self, nil, nil, nil, chatFrame, nil, true, ...)
end

--[[---------------------------------------------------------------------------
Notes:
	* add a slash command, that will be called when someone types in the specified slash commands into the command line.
	* any slash commands will also register the lowercase version of them automatically.
Arguments:
	string - name of the command, in CONSTANT_CASE. Optional, default: uppercase version of the first-specified slash command.
	function or string - function or method name to call.
	tuple or table - list of slash commands in the form "/word".
Example:
	MyAddon.OnSlashCommand = function(self, command, text)
		assert(command == "/MyAddon")
		self:Print("Received", text)
	end
	MyAddon:AddSlashCommand("OnSlashCommand", "/MyAddon") -- same as :AddSlashCommand("MYADDON", "OnSlashCommand", "/MyAddon") or :AddSlashCommand("MYADDON", "OnSlashCommand", { "/MyAddon" })
-----------------------------------------------------------------------------]]
function RockConsole:AddSlashCommand(name, callback, ...)
	if type(name) == "function" or (type(name) == "string" and not name:match("^[A-Z_]+$")) then
		local newName
		if type(callback) == "string" then
			newName = callback:gsub("%A", ""):upper()
		else
			local A = ("A"):byte()-1
			newName = string_char(math_random(26)+A, math_random(26)+A, math_random(26)+A, math_random(26)+A, math_random(26)+A, math_random(26)+A)
		end
		return RockConsole.AddSlashCommand(self, newName, name, callback, ...)
	end
	
	if type((...)) == "table" then
		return RockConsole.AddSlashCommand(self, name, callback, unpack((...)))
	end
	local n = select('#', ...)
	
	local firstSlashCommand = (...)
	
	local handler
	if type(callback) == "function" then
		for k, v in pairs(_G) do
			-- this is here in case someone hooks the function.
			if v == callback then
				local k = k
				function handler(text)
					_G[k](firstSlashCommand, text)
				end
				break
			end
		end
		if not handler then
			function handler(text)
				callback(firstSlashCommand, text)
			end
		end
	else -- string	
		function handler(text)
			if not self[callback] then
				local success, ret = pcall(error, ("Error calling method %q on object %q. Method does not exist."):format(callback, tostring(self)))
				geterrorhandler()(ret)
				return
			end
			self[callback](self, firstSlashCommand, text)
		end
	end
	
	if _G.SlashCmdList[name] then
		local i = 0
		while true do
			i = i + 1
			if _G["SLASH_"..name..i] then
				_G["SLASH_"..name..i] = nil
			else
				break
			end
		end
	end
	
	local i = 0
	for j = 1, n do
		local command = select(j, ...)
		if command then
			i = i + 1
			_G["SLASH_"..name..i] = command
			local command_lower = command:lower()
			if command_lower ~= command then
				i = i + 1
				_G["SLASH_"..name..i] = command_lower
			end
		end
	end	
	_G.hash_SlashCmdList[name] = nil
	_G.SlashCmdList[name] = handler
	
	if self ~= RockConsole and self.slashCommand == nil then
		self.slashCommand = firstSlashCommand
	end
	
	slashCommands[name] = self
end
precondition(RockConsole, "AddSlashCommand", function(self, name, callback, ...)
	if type(name) == "function" or (type(name) == "string" and not name:match("^[A-Z_]+$")) then
		-- since this returns right away
		return
	end
	if type(name) ~= "string" then
		argCheck(name, 2, "string", "function" --[[ to get message right ]])
	end
	argCheck(callback, 3, "string", "function")
	if type(callback) == "string" and type(self[callback]) ~= "function" then
		error(("Bad argument #3 to `AddSlashCommand'. %q is not a %q, got %q."):format(callback, "function", type(self[callback])), 3)
	end
	
	local n = select('#', ...)
	if n == 0 then
		argCheck((...), 4, "string", "table")
	elseif n == 1 and type((...)) == "table" then
		return RockConsole.AddSlashCommand(self, name, callback, unpack((...)))
	else
		for i = 1, n do
			local v = select(i, ...)
			if v or i == 1 then
				argCheck(v, i+3, "string")
				if not v:match("^/[A-Za-z][A-Za-z0-9_]*$") then
					error(("Bad argument #%d to `AddSlashCommand'. Must be in the form of %q, got %q."):format(i+3, "/word", v), 3)
				end
			end
		end
	end
end)
postcondition(RockConsole, "AddSlashCommand", function(ret, self, name, callback, ...)
	if type(name) == "string" and name:match("^[A-Z_]+$") then
		assert(self:HasSlashCommand(name))
	end
end)

--[[---------------------------------------------------------------------------
Notes:
	* remove a slash command by name
Arguments:
	string - name of the command, in CONSTANT_CASE.
Example:
	MyAddon.OnSlashCommand = function(self, command, text)
		assert(command == "/MyAddon")
		self:Print("Received", text)
	end
	MyAddon:AddSlashCommand("MYADDON", "OnSlashCommand", "/MyAddon")
	MyAddon:RemoveSlashCommand("MYADDON")
-----------------------------------------------------------------------------]]
function RockConsole:RemoveSlashCommand(name)
	if slashCommands[name] ~= self then
		return
	end
	
	slashCommands[name] = nil
	
	if _G.SlashCmdList[name] then
		local i = 0
		while true do
			i = i + 1
			local cmd = _G["SLASH_"..name..i]
			if cmd then
				_G["SLASH_"..name..i] = nil
				if cmd == self.slashCommand then
					self.slashCommand = nil
				end
			else
				break
			end
		end
		_G.SlashCmdList[name] = nil
		_G.hash_SlashCmdList[name] = nil
	end
end
precondition(RockConsole, 'RemoveSlashCommand', function(self, name)
	argCheck(name, 2, "string")
end)
postcondition(RockConsole, "RemoveSlashCommand", function(ret, self, name)
	assert(not self:HasSlashCommand(name))
end)

--[[---------------------------------------------------------------------------
Notes:
	* remove all slash commands for the object.
Example:
	MyAddon.OnSlashCommand = function(self, command, text)
		assert(command == "/MyAddon")
		self:Print("Received", text)
	end
	MyAddon:AddSlashCommand("MYADDON", "OnSlashCommand", "/MyAddon")
	MyAddon:RemoveAllSlashCommands()
	-- now /MyAddon does nothing.
-----------------------------------------------------------------------------]]
function RockConsole:RemoveAllSlashCommands()
	for name, object in pairs(slashCommands) do
		if object == self then
			RockConsole.RemoveSlashCommand(self, name)
		end
	end
end

--[[---------------------------------------------------------------------------
Arguments:
	string - name of the command, in CONSTANT_CASE.
Returns:
	boolean - whether the slash command is registered and to the current object
Example:
	MyAddon.OnSlashCommand = function(self, command, text)
		assert(command == "/MyAddon")
		self:Print("Received", text)
	end
	MyAddon:AddSlashCommand("MYADDON", "OnSlashCommand", "/MyAddon")
	assert(MyAddon:HasSlashCommand("MYADDON"))
-----------------------------------------------------------------------------]]
function RockConsole:HasSlashCommand(name)
	return slashCommands[name] == self
end
precondition(RockConsole, 'HasSlashCommand', function(self, name)
	argCheck(name, 2, "string")
end)

function RockConsole:OnUnembed(object)
	self.RemoveAllSlashCommands(object)
end

RockConsole:SetExportedMethods("Print", "PrintLiteral", "CustomPrint", "AddSlashCommand", "RemoveSlashCommand", "RemoveAllSlashCommands", "HasSlashCommand")

RockConsole:AddSlashCommand(function() _G.ReloadUI() end, "/reload", "/rl", "/reloadui")
RockConsole:AddSlashCommand(function() _G.ToggleHelpFrame() end, "/gm")
RockConsole:AddSlashCommand(function(cmd, text)
	text = text:trim():match("^(.-);*$")
	local f, err = loadstring(("Rock(%q):PrintLiteral(%s)"):format(MAJOR_VERSION, text))
	if not f then
		RockConsole:Print("|cffff0000Error:|r %s", err)
	else
		f()
	end
end, "/print", "/echo", "/dump")
RockConsole:AddSlashCommand(function(cmd, text)
	text = text:trim():match("^(.-);*$")
	local f, err = loadstring(("Rock(%q):Print(%s)"):format(MAJOR_VERSION, text))
	if not f then
		RockConsole:Print("|cffff0000Error:|r %s", err)
	else
		f()
	end
end, "/printc")

Rock:FinalizeLibrary(MAJOR_VERSION)

Rock:AddUnitTest(MAJOR_VERSION, function()
	-- slash commands
	local t = { name = "RockConsoleUnitTest" }
	
	RockConsole:Embed(t)
	
	local expectedText
	local triggered = false
	function t:OnSlashCommand(cmd, text)
		triggered = true
		assert(cmd == "/JCUnitTest")
		assert(expectedText == text)
	end
	
	assert(not t:HasSlashCommand("JCUNITTEST"))
	t:AddSlashCommand("OnSlashCommand", "/JCUnitTest")
	assert(t:HasSlashCommand("JCUNITTEST"))
	
	ChatFrameEditBox:SetText("/jcunittest")
	expectedText = ""
	ChatEdit_SendText(ChatFrameEditBox)
	assert(triggered)
	triggered = false
	
	ChatFrameEditBox:SetText("/jcunittest bah")
	expectedText = "bah"
	ChatEdit_SendText(ChatFrameEditBox)
	assert(triggered)
	triggered = false
	
	ChatFrameEditBox:SetText("/jcunittest  bah ")
	expectedText = "bah"
	ChatEdit_SendText(ChatFrameEditBox)
	assert(triggered)
	triggered = false
	
	t:RemoveSlashCommand("JCUNITTEST")
	assert(not t:HasSlashCommand("JCUNITTEST"))
	t:AddSlashCommand("OnSlashCommand", "/JCUnitTest")
	
	ChatFrameEditBox:SetText("/jcunittest")
	expectedText = ""
	ChatEdit_SendText(ChatFrameEditBox)
	assert(triggered)
	triggered = false
	
	t:RemoveAllSlashCommands()
	assert(not t:HasSlashCommand("JCUNITTEST"))
end)

Rock:AddUnitTest(MAJOR_VERSION, function()
	-- printing
	local t = { name = "RockConsoleUnitTest" }
	
	RockConsole:Embed(t)
	
	local ChatFrame1_AddMessage = rawget(ChatFrame1, 'AddMessage')
	local expectedText
	local triggered = false
	function ChatFrame1:AddMessage(text)
		triggered = true
		assert(text:match(expectedText))
	end
	
	expectedText = "Pants"
	t:Print("Pants")
	assert(triggered)
	triggered = false
	
	expectedText = "Hey, there"
	t:Print("Hey", "there")
	assert(triggered)
	triggered = false
	
	expectedText = "Hey, there, big boy"
	t:Print("Hey", "there", "big boy")
	assert(triggered)
	triggered = false
	
	expectedText = "{.*}"
	t:PrintLiteral({})
	assert(triggered)
	triggered = false
	
	expectedText = "{.*true.*}"
	t:PrintLiteral({ true })
	assert(triggered)
	triggered = false
	
	expectedText = "{.*%[.*true.*%].*=.*true.*}"
	t:PrintLiteral({ [true] = true })
	assert(triggered)
	triggered = false
	
	expectedText = '"blah"'
	t:PrintLiteral("blah")
	assert(triggered)
	triggered = false
	
	ChatFrame1.AddMessage = ChatFrame1_AddMessage
end)

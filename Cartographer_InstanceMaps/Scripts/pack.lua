-- This converts data from Blizzard's WMOs into a format usable by Cartographer-InstanceMaps
-- Copyright (C) 2006-2007  Cameron Kenneth Knight
-- 
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
-- 
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
-- 
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to the Free Software
-- Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.


-- You must have md5translate.trs in the current directory as well as all the root WMO files for the dungeons.

local Atlas = false -- whether to use Atlas' names instead of Cartographer's

local function packint(num, bits, unsigned)
	if not bits then
		bits = 32
	end
	local s = {}
	if not unsigned and num < 0 then
		num = num + 2^bits
	end
	for i = 1, bits/8 do
		local n = math.floor(num / 256^(i-1)) % 256
		s[#s+1] = string.char(n)
	end
	return table.concat(s)
end

local function unpackint(unsigned, bits, ...)
	if not bits then
		bits = 32
	end
	local num = 0
	for i = 1, bits/8 do
		num = num + select(i, ...) * 256^(i-1)
	end
	if not unsigned and num >= 2^(bits-1) then
		num = num - 2^(bits-1)
	end
	return num
end

local inf = 1/0
local function packfloat(num, double)
	local negative = false
	if num == 0 then
		if 1/num < 0 then
			return string.char(0, 0, 0, 128)
		end
		return string.char(0, 0, 0, 0)
	else
		negative = num < 0
	end
	if negative then
		num = -num
	end
	local mantissa, exponent = math.frexp(num)
	while mantissa < 1 do
		mantissa, exponent = mantissa*2, exponent - 1
	end
	mantissa = mantissa - 1
	local bits = { negative and 1 or 0 }
	exponent = exponent + (double and 1023 or 127)
	for i = 2, double and 12 or 9 do
		table.insert(bits, math.floor(exponent / 2^((double and 12 or 9)-i))%2)
	end
	for i = double and 13 or 10, double and 64 or 32 do
		mantissa = mantissa * 2
		local a = mantissa > 1
		if a then
			mantissa = mantissa - 1
			table.insert(bits, 1)
		else
			table.insert(bits, 0)
		end
	end
	local s = {}
	for i = 0, #bits-1, 8 do
		local n = 0
		for j = 1, 8 do
			n = n*2 + bits[i+j]
		end
		table.insert(s, 1, string.char(n))
	end
	return table.concat(s)
end

local function unpackfloat(double, ...)
	local bits = {}
	for j = 1, double and 8 or 4 do
		local a = select(double and 9-j or 5-j, ...)
		for i = 0, 7 do
			table.insert(bits, math.floor(a/2^(7-i))%2)
		end
	end
	local negative = bits[1] == 1 and -1 or 1
	local exponent = 0
	for i = 2, double and 12 or 9 do
		exponent = exponent*2 + bits[i]
	end
	exponent = exponent - (double and 1023 or 127)
	local mantissa = 1
	for i = double and 13 or 10, double and 64 or 32 do
		mantissa = mantissa + bits[i]*(0.5^(double and i-12 or i-9))
	end
	return negative * 2^exponent * mantissa
end

local function select2(start, finish, ...)
	if start > finish then
		return
	elseif start > 1 then
		return select2(1, finish-start+1, select(start, ...))
	else
		return (...), select2(1, finish-1, select(2, ...))
	end
end

local function unpackstruct(struct, ...)
	local t = {}
	local current = 1
	for i,v in ipairs(struct) do
		if not v.float and not v.double then
			local bits = v.bits
			local fin = current + (bits/8)
			t[v.name] = unpackint(v.unsigned, bits, select2(current, fin-1, ...))
			current = fin
		else
			local double = v.double
			local fin = current + (double and 8 or 4)
			t[v.name] = unpackfloat(double, select2(current, fin - 1, ...))
			current = fin
		end
	end
	return t
end

local function struct_sizeof(struct)
	local num = 0
	for i,v in ipairs(struct) do
		if v.float then
			num = num + 4
		elseif v.double then
			num = num + 8
		else
			num = num + v.bits/8
		end
	end
	return num
end

local function tobits(num)
	local t = {}
	for i = 0, 31 do
		table.insert(t, math.floor(num*0.5^i) % 2)
	end
	return table.concat(t)
end

local SMOHeader = {
	{name = 'nTextures', bits=32, unsigned = true },
	{name = 'nGroups', bits=32, unsigned = true},
	{name = 'nPortals', bits=32, unsigned = true},
	{name = 'nLights', bits=32, unsigned = true},
	{name = 'nDoodadNames', bits=32, unsigned = true},
	{name = 'nDoodadDefs', bits=32, unsigned = true},
	{name = 'nDoodadSets', bits=32, unsigned = true},
	{name = 'ambColor', bits=32, unsigned = true},
	{name = 'wmoID', bits=32, unsigned = true},
	{name = 'bbcorner1_1', float = true},
	{name = 'bbcorner1_2', float = true},
	{name = 'bbcorner1_3', float = true},
	{name = 'bbcorner2_1', float = true},
	{name = 'bbcorner2_2', float = true},
	{name = 'bbcorner2_3', float = true},
	{name = 'unk', bits=32, unsigned = true},
}

local MOGP = {
	{name = 'gName', bits=32, unsigned = true},
	{name = 'gNameDesc', bits=32, unsigned = true},
	{name = 'flags', bits=32, unsigned = true},
	{name = 'bbcorner1_1', float=true},
	{name = 'bbcorner1_2', float=true},
	{name = 'bbcorner1_3', float=true},
	{name = 'bbcorner2_1', float=true},
	{name = 'bbcorner2_2', float=true},
	{name = 'bbcorner2_3', float=true},
	{name = 'moprIndex', bits=16, unsigned=true},
	{name = 'nItems', bits=16, unsigned=true},
	{name = 'nBatchesA', bits=16, unsigned=true},
	{name = 'nBatchesB', bits=16, unsigned=true},
	{name = 'nBatchesC', bits=32, unsigned=true},
	{name = 'fog1', bits=8, unsigned=true},
	{name = 'fog2', bits=8, unsigned=true},
	{name = 'fog3', bits=8, unsigned=true},
	{name = 'fog4', bits=8, unsigned=true},
	{name = 'unk', bits=32, unsigned=true},
	{name = 'groupID', bits=32, unsigned=true},
	{name = 'unk2', bits=32, unsigned=true},
	{name = 'unk3', bits=32, unsigned=true},
}

local MOGI = {
	{name = 'flags', bits=32, unsigned = true},
	{name = 'bbcorner1_1', float=true},
	{name = 'bbcorner1_2', float=true},
	{name = 'bbcorner1_3', float=true},
	{name = 'bbcorner2_1', float=true},
	{name = 'bbcorner2_2', float=true},
	{name = 'bbcorner2_3', float=true},
	{name = 'nameOffset', bits=32}
}

local MLIQ = {
	{name = 'xverts', bits=32, unsigned = true},
	{name = 'yverts', bits=32, unsigned = true},
	{name = 'xtiles', bits=32, unsigned = true},
	{name = 'ytiles', bits=32, unsigned = true},
	{name = 'coord_1', float=true},
	{name = 'coord_2', float=true},
	{name = 'coord_3', float=true},
	{name = 'matID', bits=16, unsigned = true}
}

local maps = {
	{
		name = Atlas and "The Temple of Ahn'Qiraj" or "Ahn'Qiraj",
		data = "Ahn_Qiraj",
	},
	{
		name = "Auchenai Crypts",
		data = "Draenei_wing"
	},
	{
		name = "Blackfathom Deeps",
		data = "Blackfathom_instance"
	},
	{
		name = "Blackwing Lair",
		data = "Blackrock_upper_guild"
	},
	{
		name = "Blackrock Depths",
		data = "Blackrock_lower_instance"
	},
	{
		name = "Dire Maul",
		data = "KL_Diremaul_Instance"
	},
	{
		name = "Gnomeregan",
		data = "KZ_Gnomeragon_Instance"
	},
	{
		name = "Gruul's Lair",
		data = "Gronnraid"
	},
	{
		name = "Karazhan",
		data = "Kharazan_instance",
		ignore = {
			z = {
				[150.115646] = true, -- the gigantic brown circle
			}
		}
	},
	{
		name = "Magtheridon's Lair",
		data = "Hellfire_raid"
	},
	{
		name = "Mana-Tombs",
		data = "ethereal_wing"
	},
	{
		name = "Maraudon",
		data = "KL_Maraudon_instance01"
	},
	{
		name = "Molten Core",
		data = "Blackrock_lower_guild"
	},
	{
		name = "Naxxramas",
		data = "Stratholme_raid"
	},
	{
		name = "Onyxia's Lair",
		data = "KL_OnyxiasLair_B"
	},
	{
		name = "Ragefire Chasm",
		data = "LavaDungeon"
	},
	{
		name = "Razorfen Downs",
		data = "RazorfenDowns_instance"
	},
	{
		name = "Razorfen Kraul",
		data = "RazorfenKraul_instance"
	},
	{
		name = "Serpentshrine Cavern",
		data = "Coilfang_Raid",
	},
	{
		name = "Sethekk Halls",
		data = "demon_wing"
	},
	{
		name = "Shadowfang Keep",
		data = "LD_ShadowFangInterior",
	},
	{
		name = "Shadow Labyrinth",
		data = "shadow_council_wing"
	},
	{
		name = "Stratholme",
		data = "Stratholme",
	},
	{
		name = "The Arcatraz",
		data = "TK_Arcane"
	},
	{
		name = "The Blood Furnace",
		data = "hellfire_DemonWing"
	},
	{
		name = "The Temple of Atal'Hakkar",
		data = "AZ_SunkenTemple_Instance"
	},
	{
		name = "The Eye",
		data = "TK_Raid",
	},
	{
		name = "The Botanica",
		data = "TK_Atrium"
	},
	{
		name = "The Deadmines",
		data = "AZ_Deadmines_B",
		ignore = { tex = { ["a828e50e7a44e10bfc529e39a081c8fc"] = true } },
	},
	{
		name = "The Mechanar",
		data = "TK_Factory"
	},
	{
		name = "The Shattered Halls",
		data = "Hellfire_Military"
	},
	{
		name = "The Slave Pens",
		data = "Coilfang_Draenei"
	},
	{
		name = "The Steamvault",
		data = "Coilfang_Pumping"
	},
	{
		name = "The Stockade",
		data = "StormwindJail"
	},
	{
		name = "The Underbog",
		data = "Coilfang_Marsh"
	},
	{
		name = "Uldaman",
		data = "KZ_Uldaman_B"
	},
	{
		name = "Blackrock Spire",
		data = "Blackrock_upper_instance"
	},
	{
		name = "Wailing Caverns",
		data = "wailingcaverns_instance"
	},
	{
		name = Atlas and "Escape from Durnholde Keep" or "Old Hillsbrad Foothills",
		data = "HillsbradPast",
		style = "world",
	},
	{
		name = Atlas and "The Battle of Mount Hyjal" or "Hyjal Summit",
		data = "HyjalPast",
		style = "world",
	},
	{
		name = Atlas and "Opening the Dark Portal" or "The Black Morass",
		data = "CavernsOfTime",
		style = "world",
		minX = 17,
		maxX = 19,
		minY = 34,
		maxY = 36,
	},
	{
		name = "Zul'Aman",
		data = "ZulAman",
		style = "world",
		minX = 29,
		maxX = 30,
		minY = 31,
		maxY = 32,
		ignore = {
			tex = {
				["a8d90180ca6870d9410af4980e0bbea6"] = true,
				["0efef8c164782140806ba78bfb4b717f"] = true,
				["13f17aba28ebaaf4a4bebed62e986ef2"] = true,
				["c60547f69f08788c7b8bafdc8a296342"] = true,
				["6887e0b6d379704deeff5bb7ea7b4708"] = true,
				["bb238b0afd8544a1a1ab2243fd86bc0e"] = true,
			}
		},
	},
	{
		name = "Zul'Farrak",
		data = "TanarisInstance",
		style = "world",
		minX = 29,
		maxX = 30,
		minY = 28,
		maxY = 29,
	},
	{
		name = Atlas and "The Ruins of Ahn'Qiraj" or "Ruins of Ahn'Qiraj",
		data = "AhnQiraj",
		style = "world",
		minX = 27,
		maxX = 29,
		minY = 47,
		maxY = 50,
	},
	{
		name = "Cathedral",
		data = "Monestary_Cathedral",
	},
	{
		name = "Graveyard",
		data = "Monestary_Cemetery",
	},
	{
		name = "Library",
		data = "Monestary_Library",
	},
	{
		name = "Armory",
		data = "Monestary_War",
	},
	{
		name = "Zul'Gurub",
		data = "Zul'gurub",
		style = "world",
		minX = 34,
		maxX = 35,
		minY = 53,
		maxY = 55,
	},
	{
		name = "Hellfire Ramparts",
		data = "HellfireRampart", 
		style = "world", 
		minX = 28,
		maxX = 29,
		minY = 34,
		maxY = 34,
		ignore = {
			tex = {
				["9ca3c67c0a894f42b8b7d886aa6e4057"] = true,
				["39d16ec545d14c101ad2b53441d8855c"] = true,
				["a96bb9ceebc36ae410930d272792957a"] = true,
				["aa3b4788653e2d055e51e16f9056d4b0"] = true,
				["22e6e35648785e299ff46bef45cdebc6"] = true,
			}
		},
	},
	{
		name = "Scholomance",
		data = "Ruinedkeep_crypt_instance",
	},
	{
		name = "Black Temple",
		data = "Blacktemple",
	},
	{
		name = "Magisters' Terrace",
		data = "Sunwell_5Man",
	},
	{
		name = "Sunwell Plateau",
		data = "Sunwell",
	},
}
table.sort(maps, function(a,b)
	if not a.name then
		return false
	elseif not b.name then
		return true
	end
	return a.name:lower() < b.name:lower()
end)

local b0 = ('0'):byte()
local b9 = ('9'):byte()
local bA = ('A'):byte()
local bF = ('F'):byte()
local ba = ('a'):byte()
local bf = ('f'):byte()

local function compress(tex, x, y, z)
	local t = {}
	for i = 1, tex:len(), 2 do
		local a, b = tex:byte(i, i + 1)
		if a >= b0 and a <= b9 then
			a = a - b0
		elseif a >= bA and a <= bF then
			a = a - bA + 10
		elseif a >= ba and a <= bf then
			a = a - ba + 10
		else
			error(("Improper hex digit: %s"):format(tostring(a)))
		end
		if b >= b0 and b <= b9 then
			b = b - b0
		elseif b >= bA and b <= bF then
			b = b - bA + 10
		elseif b >= ba and b <= bf then
			b = b - ba + 10
		else
			error(("Improper hex digit: %s"):format(tostring(b)))
		end
		t[#t+1] = a * 16 + b
	end
	local val = packfloat(x)
	for i = 1, val:len() do
		t[#t+1] = val:byte(i)
	end
	local val = packfloat(y)
	for i = 1, val:len() do
		t[#t+1] = val:byte(i)
	end
	local val = packfloat(z)
	for i = 1, val:len() do
		t[#t+1] = val:byte(i)
	end
	local s = {}
	-- s[#s+1] = '"'
	for _,v in ipairs(t) do
		s[#s+1] = "\\"
		if v < 100 then
			s[#s+1] = "0"
		end
		if v < 10 then
			s[#s+1] = "0"
		end
		s[#s+1] = v
	end
	-- s[#s+1] = '"'
	return table.concat(s)
end

local f = io.open("md5translate.trs", "r")
if not f then
	error("Cannot find file: md5translate.trs")
end
local md5text = f:read("*all")
f:close()
for i,v in ipairs(maps) do
	local map = v.data
	if not v.style then
		local f = io.open((Atlas and "wmo/" or "") .. map .. ".wmo", "rb")
		if not f then
			error("Cannot find map file: " .. (Atlas and "wmo/" or "") .. map .. ".wmo")
		end
		v.text = f:read("*all")
		f:close()
	end
end

if Atlas then
	print("MapData = {")
else
	print("Cartographer_InstanceMaps_MapData = {")
end
for i,v in ipairs(maps) do
	local name = v.name
	local map = v.data
	local lines = {}
	if not v.style then
		local text = v.text
		local pos = text:find(("MOHD"):reverse())
		local header = unpackstruct(SMOHeader, text:byte(pos + 8, (pos + 8) + struct_sizeof(SMOHeader) - 1))

		local points = {}

		local pos = text:find(("MOGI"):reverse())
		for i = 0, header.nGroups-1 do
			local mogi = unpackstruct(MOGI, text:byte((pos + 8) + (struct_sizeof(MOGI)*i), (pos + 8) + (struct_sizeof(MOGI)*(i + 1)) - 1))
			points[i] = { mogi.bbcorner1_1, mogi.bbcorner1_2, mogi.bbcorner1_3 }
		end
		
		io.write(("\t[%q] = "):format(name))
		for i, x, y, tex in md5text:gmatch("\\" .. map .. "_(%d%d%d)_(%d%d)_(%d%d)%.blp\t(%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x)%.blp") do
			i = tonumber(i)
			x = tonumber(x)
			y = tonumber(y)
			if points[i] and tex ~= "c7182036289831c2dce4a7200377e6f4" then
				local x_, y_, z_ = points[i][1]*2+x*256, points[i][2]*2+y*256, points[i][3]*2
				local good = true
				if v.ignore then
					if v.ignore.z then
						for k in pairs(v.ignore.z) do
							if k <= z_ and z_ < k + 0.000001 then
								good = false
								break
							end
						end
					end
					if good and v.ignore.x then
						for k in pairs(v.ignore.x) do
							if k <= x_ and x_ < k + 0.000001 then
								good = false
								break
							end
						end
					end
					if good and v.ignore.y then
						for k in pairs(v.ignore.y) do
							if k <= y_ and y_ < k + 0.000001 then
								good = false
								break
							end
						end
					end
					if good and v.ignore.tex then
						if v.ignore.tex[tex] then
							good = false
						end
					end
				end
				if good then
					lines[#lines+1] = {tex, x_, y_, z_}
				end
			end
		end
		table.sort(lines, function(alpha, bravo)
			return alpha[4] < bravo[4]
		end)
	else -- if v.style == "world" then
		io.write(("\t[%q] = "):format(name))
		for i,j,tex in md5text:gmatch(map .. "\\map(%d%d)_(%d%d)%.blp\t(%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x%x)%.blp") do
			i, j = tonumber(i), tonumber(j)
			if (not v.minX or i >= v.minX) and (not v.maxX or i <= v.maxX) and (not v.minY or j >= v.minY) and (not v.maxY or j <= v.maxY) then
				local x_, y_, z_ = i*256, -j*256, 0
				local good = true
				if v.ignore then
					if v.ignore.z then
						for k in pairs(v.ignore.z) do
							if k <= z_ and z_ < k + 0.000001 then
								good = false
								break
							end
						end
					end
					if good and v.ignore.x then
						for k in pairs(v.ignore.x) do
							if k <= x_ and x_ < k + 0.000001 then
								good = false
								break
							end
						end
					end
					if good and v.ignore.y then
						for k in pairs(v.ignore.y) do
							if k <= y_ and y_ < k + 0.000001 then
								good = false
								break
							end
						end
					end
					if good and v.ignore.tex then
						if v.ignore.tex[tex] then
							good = false
						end
					end
				end
				if good then
					lines[#lines+1] = {tex, x_, y_}
				end
			end
		end
	end
	io.write("\"")
	for i,v in ipairs(lines) do
		local tex, x, y, z = unpack(v)
		local v
		io.write(compress(tex, x, y, z or 0))
--		io.write('\t\t-- tex:"')
--		io.write(tex)
--		io.write('"; x:')
--		io.write(("%f"):format(x))
--		io.write('; y:')
--		io.write(("%f"):format(y))
--		if z then
--			io.write('; z:')
--			io.write(("%f"):format(z))
--		end
--		io.write('\n')
	end
	io.write("\",\n")
end
print("}")

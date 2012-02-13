--[[
Name: LibRockModuleCore-1.0
Revision: $Rev: 234 $
Developed by: ckknight (ckknight@gmail.com)
Website: http://www.wowace.com/
Description: Library to provide a module system so that modules or plugins can use an addon as its core.
Dependencies: LibRock-1.0, LibRockEvent-1.0
License: LGPL v2.1
]]

local MAJOR_VERSION = "LibRockModuleCore-1.0"
local MINOR_VERSION = tonumber(("$Revision: 234 $"):match("(%d+)")) + 90000

if not Rock then error(MAJOR_VERSION .. " requires LibRock-1.0") end

local RockModuleCore, oldLib = Rock:NewLibrary(MAJOR_VERSION, MINOR_VERSION)
if not RockModuleCore then
	return
end

local _G = _G
local Rock = _G.Rock
local geterrorhandler = _G.geterrorhandler
local pcall = _G.pcall
local next = _G.next
local pairs = _G.pairs
local ipairs = _G.ipairs
local select = _G.select
local error = _G.error
local type = _G.type
local tostring = _G.tostring
local setmetatable = _G.setmetatable
local unpack = _G.unpack
local table_sort = _G.table.sort

RockModuleCore.coreToModules = setmetatable(oldLib and oldLib.coreToModules or {}, { __mode = 'k' })
local coreToModules = RockModuleCore.coreToModules
RockModuleCore.moduleToCore = setmetatable(oldLib and oldLib.moduleToCore or {}, { __mode = 'kv' })
local moduleToCore = RockModuleCore.moduleToCore
RockModuleCore.moduleMixins = setmetatable(oldLib and oldLib.moduleMixins or {}, { __mode = 'k' })
local moduleMixins = RockModuleCore.moduleMixins
RockModuleCore.defaultModuleState = oldLib and oldLib.defaultModuleState or {}
local defaultModuleState = RockModuleCore.defaultModuleState
RockModuleCore.disabledModules = oldLib and oldLib.disabledModules or {}
local disabledModules = RockModuleCore.disabledModules

local function mt__tostring(self)
	return tostring(self.name)
end

for core, modules in pairs(coreToModules) do
	local core_modulePrototype_mt = core.modulePrototype_mt
	if core_modulePrototype_mt then
		for k,v in pairs(core_modulePrototype_mt) do
			core_modulePrototype_mt[k] = nil
		end
		core_modulePrototype_mt.__index = core.modulePrototype
		core_modulePrototype_mt.__tostring = mt__tostring
	end
	local core_modulePrototype = core.modulePrototype
	if core_modulePrototype then
		core_modulePrototype.name = core.name and core.name .. "#prototype"
	end
end

local newList, del = Rock:GetRecyclingFunctions(MAJOR_VERSION, "newList", "del")

local precondition, postcondition, argCheck = Rock:GetContractFunctions(MAJOR_VERSION, "precondition", "postcondition", "argCheck")

-- in the form sortedModuleLists[core][enabledOnly][method or false] = { current = 0, core = theCore, [1] = "Module1", [n] = "ModuleN" }
local sortedModuleLists = {}

local LibRockEvent
function RockModuleCore:OnLibraryLoad(major, library)
	if major == "LibRockEvent-1.0" then
		LibRockEvent = library
		LibRockEvent:Embed(self)
		self:AddEventListener("LibRock-1.0", "AddonEnabled", "LibRock_AddonEnabled")
		self:AddEventListener("LibRock-1.0", "AddonDisabled", "LibRock_AddonDisabled")
	end
end

-- #NODOC
function RockModuleCore:LibRock_AddonEnabled(ns, event, addon, first, ...)
	local core = moduleToCore[addon]
	if not core then
		return
	end
	
	local core_OnModuleEnable = core.OnModuleEnable
	if core_OnModuleEnable then
		local success, ret = pcall(core_OnModuleEnable, core, addon, first, ...)
		if not success then
			geterrorhandler()(ret)
		end
	end
end

-- #NODOC
function RockModuleCore:LibRock_AddonDisabled(ns, event, addon, ...)
	local core = moduleToCore[addon]
	if not core then
		return
	end

	local core_OnModuleDisable = core.OnModuleDisable
	if core_OnModuleDisable then
		local success, ret = pcall(core_OnModuleDisable, core, addon, ...)
		if not success then
			geterrorhandler()(ret)
		end
	end
end

--[[----------------------------------------------------------------------------
Notes: 
	Create a new module, parented to self.
Arguments: 
	string - name of the module.
	tuple - list of mixins the module is to inherit from.
Example:
	local MyModule = core:NewModule('MyModule', "LibRockEvent-1.0", "LibRockTimer-1.0")
------------------------------------------------------------------------------]]
function RockModuleCore:NewModule(name, ...)
	if type(self.name) ~= "string" then
		error(("Error when calling `NewModule'. .name must be a %q, got %q"):format("string", type(self.name)), 2)
	end
	if type(name) ~= "string" then
		error(("Bad argument #2 to `NewModule'. Expected %q, got %q."):format("string", type(name)), 2)
	end
	if name:match("_") then
		error(("Bad argument #2 to `NewModule'. Cannot contain underscores, got %q."):format(name), 2)
	end

	local mixins = newList()
	for i = 1, select('#', ...) do
		local v = select(i, ...)
		if type(v) ~= "string" then
			error(("Bad argument #%d to `NewModule'. Expected %q, got %q."):format(i+2, "string", type(v)), 2)
		end
		if mixins[v] then
			error(("Bad argument #%d to `NewModule'. %q already provided."):format(i+2, v), 2)
		end
		mixins[v] = true
	end
	mixins = del(mixins)
	
	local fullName = self.name .. "_" .. name
	
	local mixins = newList()
	for i = 1, select('#', ...) do
		local v = select(i, ...)
		mixins[v] = true
		local library = Rock:GetLibrary(v, false, true)
		if not library then
			-- logistics issue
			error(("Bad argument #%d to `NewModule'. %q is an unknown library."):format(i+2, v), 2)
		end
		
		if not Rock:IsLibraryMixin(v) then
			local good = false
			if AceLibrary then
				local AceOO = AceLibrary:HasInstance("AceOO-2.0", false) and AceLibrary("AceOO-2.0")
				if AceOO.inherits(library, AceOO.Mixin) then
					good = true
				end
			end
			if not good then
				error(("Bad argument #%d to `NewModule'. %q is not a proper mixin."):format(i+2, v), 2)
			end
		end
	end
	local moduleMixins_self = moduleMixins[self]
	if moduleMixins_self then
		for i,v in ipairs(moduleMixins_self) do
			mixins[v] = true
		end
	end
	
	local mixinList = newList()
	for k in pairs(mixins) do
		mixinList[#mixinList+1] = k
	end
	mixins = del(mixins)
	
	local success, ret = pcall(Rock.NewAddon, self, fullName, unpack(mixinList))
	mixinList = del(mixinList)
	if not success then
		error(ret:gsub("NewAddon", "NewModule"), 2)
	end
	local module = ret
	setmetatable(module, self.modulePrototype_mt)
	module.moduleName = name
	
	moduleToCore[module] = self
	local coreToModules_self = coreToModules[self]
	if not coreToModules_self then
		coreToModules_self = newList()
		coreToModules[self] = coreToModules_self
	end
	coreToModules_self[name] = module
	
	local sortedModuleLists_self = sortedModuleLists[self]
	if sortedModuleLists_self then
		for enabledOnly, v in pairs(sortedModuleLists_self) do
			for method, u in pairs(v) do
				v[method] = del(u)
			end
			sortedModuleLists_self[enabledOnly] = del(v)
		end
		sortedModuleLists[self] = del(sortedModuleLists_self)
	end
	
	if type(self.OnModuleCreated) == "function" then
		local success, ret = pcall(self.OnModuleCreated, self, name, module)
		if not success then
			geterrorhandler()(ret)
		end
	end
	return module
end

--[[------------------------------------------------------------------------------------
Notes:
	Return the module "name" if it exists.
	If the module doesnot exist, an error is thrown.
Arguments:
	string - the name of the module.
Returns:
	The module requested, if it exists.
Example:
	local bank = core:GetModule("Bank")
------------------------------------------------------------------------------------]]
function RockModuleCore:GetModule(name)
	local coreToModules_self = coreToModules[self]
	local module = coreToModules_self and coreToModules_self[name]
	if not module then
		-- logistics issue
		error(("Cannot find module %q."):format(name), 2)
	end
	return module
end
precondition(RockModuleCore, 'GetModule', function(self, name)
	argCheck(name, 2, "string")
end)

--[[----------------------------------------------------------------------------------
Arguments:
	string or table - name of the module or reference to the module.
Returns:
	* boolean or table - Whether the module is available in the core, or if it is a reference, whether it is a module of the core. If this is called directly on LibRockModuleCore-1.0, it will return the core of the module.
Example:
	if core:HasModule("Bank") then
		-- do banking
	end
	-- for references
	if core:HasModule(module) then
		-- do something
	end
	-- alternatively
	if Rock("LibRockModuleCore-1.0"):HasModule(module) then
		-- checks all modules, no matter the parent
	end
	local core = Rock("LibRockModuleCore-1.0"):HasModule(module)
------------------------------------------------------------------------------------]]
function RockModuleCore:HasModule(module)
	if type(module) == "table" then
		local moduleToCore_module = moduleToCore[module]
		if self == RockModuleCore then
			return moduleToCore_module
		else
			return moduleToCore_module == self
		end
	end
	local coreToModules_self = coreToModules[self]
	if not coreToModules_self then
		return false
	end
	return not not coreToModules_self[module]
end
precondition(RockModuleCore, 'HasModule', function(self, name)
	argCheck(name, 2, "string", "table")
end)

local function ignoreCaseSort(alpha, bravo)
	return alpha:lower() < bravo:lower()
end

local IsModuleActive

local function getModuleList(core, enabledOnly, method)
	local sortedModuleLists_core = sortedModuleLists[core]
	if not sortedModuleLists_core then
		sortedModuleLists_core = newList()
		sortedModuleLists[core] = sortedModuleLists_core
	end
	local sortedModuleLists_core_enabledOnly = sortedModuleLists_core[enabledOnly]
	if not sortedModuleLists_core_enabledOnly then
		sortedModuleLists_core_enabledOnly = newList()
		sortedModuleLists_core[enabledOnly] = sortedModuleLists_core_enabledOnly
	end
	local t = sortedModuleLists_core_enabledOnly[method]
	if t then
		t.current = 0
		return t
	end
	
	t = newList()
	sortedModuleLists_core_enabledOnly[method] = t
	t.core = core
	t.current = 0
	local coreToModules_core = coreToModules[core]
	if not coreToModules_core then
		return t
	end
	for name, module in pairs(coreToModules_core) do
		if (not enabledOnly or IsModuleActive(core, name)) and (not method or type(module[method]) == "function") then
			t[#t+1] = name
		end
	end
	table_sort(t, ignoreCaseSort)
	
	return t
end

local function moduleIter(t)
	local current = t.current
	if not current then
		return
	end
	current = current + 1
	local name = t[current]
	if not name then
		return
	end
	t.current = current
	local core = t.core
	local coreToModules_core = coreToModules[core]
	if not coreToModules_core then
		return
	end
	local module = coreToModules_core[name]
	if not module then
		return
	end
	return name, module
end

--[[----------------------------------------------------------------------------------
Arguments:
	[optional] boolean - whether only enabled modules should be iterated through. Default: false
Returns:
	iterator - an iterator that traverses through and returns name, module
Example:
	for name, module in core:IterateModules(false) do
		-- do something
	end
------------------------------------------------------------------------------------]]
function RockModuleCore:IterateModules(enabledOnly)
	return moduleIter, getModuleList(self, enabledOnly or false, false)
end
precondition(RockModuleCore, 'IterateModules', function(self, enabledOnly)
	argCheck(enabledOnly, 2, "boolean", "nil")
end)

--[[----------------------------------------------------------------------------------
Arguments:
	boolean - whether only enabled modules should be iterated through.
	string - name of the method to check for.
Returns:
	iterator - an iterator that traverses through and returns name, module
Example:
	for name, module in core:IterateModulesWithMethod(false, "Kersplode") do
		-- do something
	end
------------------------------------------------------------------------------------]]
function RockModuleCore:IterateModulesWithMethod(enabledOnly, methodName)
	return moduleIter, getModuleList(self, enabledOnly or false, methodName)
end
precondition(RockModuleCore, 'IterateModulesWithMethod', function(self, enabledOnly, methodName)
	argCheck(enabledOnly, 2, "boolean", "nil")
	argCheck(methodName, 3, "string")
end)

--[[----------------------------------------------------------------------------------
Notes:
	Safely calls the given method on all modules if it exists on said modules. This will automatically subvert any errors that occur in the modules.
Arguments:
	boolean - whether only enabled modules should be iterated through.
	string - the name of the method.
	tuple - the list of arguments to call the method with.
Example:
	core:CallMethodOnAllModules(false, "OnSomething")
	core:CallMethodOnAllModules(true, "OnSomethingElse", 1, 2, 3, 4)
------------------------------------------------------------------------------------]]
function RockModuleCore:CallMethodOnAllModules(enabledOnly, methodName, ...)
	for name, module in moduleIter, getModuleList(self, enabledOnly or false, methodName) do
		local success, ret = pcall(module[methodName], module, ...)
		if not success then
			geterrorhandler()(ret)
		end
	end
end
precondition(RockModuleCore, 'CallMethodOnAllModules', function(self, enabledOnly, methodName, ...)
	argCheck(enabledOnly, 2, "boolean", "nil")
	argCheck(methodName, 3, "string")
end)

--[[----------------------------------------------------------------------------------
Notes:
	* Sets the default mixins for a given module.
	* This cannot be called after :NewModule() has been called.
	* This should really only be called if you use the mixins in your prototype.
Arguments:
	tuple - list of mixins
Example:
	core:SetModuleMixins("LibRockEvent-1.0", "LibRockTimer-1.0")
------------------------------------------------------------------------------------]]
function RockModuleCore:SetModuleMixins(...)
	local t = newList(...)
	for i,v in ipairs(t) do
		if not Rock:HasLibrary(v) then
			-- logistical issue
			error(("Bad argument #%d to `SetModuleMixins'. %q is an unknown library."):format(i+1, v), 2)
		end
		if not Rock:IsLibraryMixin(v) then
			-- logistical issue
			error(("Bad argument #%d to `SetModuleMixins'. %q is not a proper mixin."):format(i+1, v), 2)
		end
	end
	moduleMixins[self] = t
end
precondition(RockModuleCore, 'SetModuleMixins', function(self, ...)
	if moduleMixins[self] then
		error("Cannot call `SetModuleMixins' twice", 3)
	elseif coreToModules[self] and next(coreToModules[self]) then
		error("Cannot call `SetModuleMixins' after `NewModule' has been called.", 3)
	end
	local mixins = newList(mixins)
	for i = 1, select('#', ...) do
		local v = select(i, ...)
		if mixins[v] then
			error(("Bad argument #%d to `SetModuleMixins'. %q already given."):format(i+1, v), 2)
		end
		mixins[v] = true
		argCheck(v, i+1, "string")
	end
	mixins = del(mixins)
end)

--[[----------------------------------------------------------------------------------
Notes:
	Sets the default active state of a module. This should be called before the ADDON_LOADED of the module.
Arguments:
	string or table - name of the module or the reference to the module.
	boolean - new state. false means disabled by default, true means enabled by default (true is the default if this method is not called).
Example:
	MyAddon:SetModuleDefaultState("Bank", false)
------------------------------------------------------------------------------------]]
function RockModuleCore:SetModuleDefaultState(module, state)
	if type(module) == "table" then
		if self == RockModuleCore or not RockModuleCore.HasModule(self, module) then
			error(("Bad argument #2 to `SetModuleDefaultState'. %q is not a module of %q."):format(tostring(module), tostring(self)), 2)
		end
	end
	
	local defaultModuleState_self = defaultModuleState[self]
	if not defaultModuleState_self then
		defaultModuleState_self = newList()
		defaultModuleState[self] = defaultModuleState_self
	end
	defaultModuleState_self[module] = state
end
precondition(RockModuleCore, 'SetModuleDefaultState', function(self, module, state)
	argCheck(module, 2, "table", "string")
	argCheck(state, 3, "boolean")
end)

function RockModuleCore:OnEmbed(object)
	if not LibRockEvent then
		Rock:HasLibrary("LibRockEvent-1.0")
		if not LibRockEvent then
			error(("Cannot embed %s into object %s. %s must be loaded first."):format(MAJOR_VERSION, tostring(object), "LibRockEvent-1.0"))
		end
	end
	if not object.modulePrototype then
		local addonMT = Rock.addon_mt
		object.modulePrototype = setmetatable({ name = object.name and object.name .. "#prototype" }, addonMT)
		object.modulePrototype_mt = { __index = object.modulePrototype, __tostring = mt__tostring }
	end
end

function IsModuleActive(core, moduleName)
	local core_db = core.db
	local disabled = nil
	if core_db then
		local core_db_raw = core_db.raw
		if core_db_raw then
			local core_db_raw_disabledModules = core_db_raw.disabledModules
			if core_db_raw_disabledModules then
				local profile = type(core.GetProfile) == "function" and select(2, core:GetProfile()) or false
				local core_db_raw_disabledModules_profile = core_db_raw_disabledModules[profile]
				if core_db_raw_disabledModules_profile then
					disabled = core_db_raw_disabledModules_profile[moduleName]
				end
			end
		end
	else
		local disabledModules_core = disabledModules[core]
		if disabledModules_core then
			disabled = disabledModules_core[moduleName]
		end
	end
	if disabled == nil then
		local defaultModuleState_core = defaultModuleState[core]
		if defaultModuleState_core and defaultModuleState_core[moduleName] ~= nil then
			disabled = not defaultModuleState_core[moduleName]
		end
	end
	return not disabled
end

--[[-----------------------------------------------------------------------
Notes:
	Returns whether the module is in an active (enabled) state. If notLoaded is set, then "name" must be a string.
Arguments:
	string/table - name of the module or a reference to the module
	[optional] - boolean - if set, this will check modules that are not loaded as well. (default: false)
Returns:
	* boolean - Whether the module is in an active (enabled) state.
Example:
	assert(core:IsModuleActive("bank"))
------------------------------------------------------------------------]]
function RockModuleCore:IsModuleActive(module, notLoaded)
	if type(module) == "table" then
		if self == RockModuleCore or not RockModuleCore.HasModule(self, module) then
			error(("Bad argument #2 to `IsModuleActive'. %q is not a module of %q."):format(tostring(module), tostring(self)), 2)
		end
		module = module.moduleName
	elseif not notLoaded and not RockModuleCore.HasModule(self, module) then
		error(("Bad argument #2 to `IsModuleActive'. %q is not a known module."):format(module), 2)
	end
	
	if type(self.IsActive) == "function" and not self:IsActive() then
		return false
	end
	
	return IsModuleActive(self, module)
end
precondition(RockModuleCore, 'IsModuleActive', function(self, module, notLoaded)
	argCheck(module, 2, "table", "string")
	argCheck(notLoaded, 3, "boolean", "nil")
end)

--[[----------------------------------------------------------------------------------
Notes: 
	* Toggles the active state of a module.
	* If suspending, This will call :OnDisable() on the module if it is available. Also, it will iterate through the addon's mixins and call :OnEmbedDisable(module) if available. - this in turn will, through AceEvent and others, unregister events/hooks/etc. depending on the mixin. Also, it will call :OnModuleDisable(name, module) on the core if it is available.
	* If resuming, This will call :OnEnable(first) on the module if it is available. Also, it will iterate through the addon's mixins and call :OnEmbedEnable(module) if available. - this in turn will, through AceEvent and others, unregister events/hooks/etc. depending on the mixin. Also, it will call :OnModuleEnable(name, module) on the core if it is available.
	* If you call :ToggleModuleActive("name" or module, true) and it is already active, it silently returns, same if you pass false and it is inactive.

Arguments:
	string/table - name of the module or a reference to the module
	[optional] boolean - new state. (default not :IsModuleActive("name" or module))
Returns:
	* boolean - Whether the module is now in an active (enabled) state.
Example:
	self:ToggleModuleActive('bank')
------------------------------------------------------------------------------------]]
function RockModuleCore:ToggleModuleActive(module, state)
	if type(module) == "table" then
		if self == RockModuleCore or not RockModuleCore.HasModule(self, module) then
			error(("Bad argument #2 to `ToggleModuleActive'. %q is not a module of %q."):format(tostring(module), tostring(self)), 2)
		end
		if module.moduleName then
			module = module.moduleName
		else
			local good = false
			for name, mod in RockModuleCore.IterateModules(self) do
				if module == mod then
					module = name
					good = true
					break
				end
			end
			if not good then
				error(("Bad argument #2 to `ToggleModuleActive'. %q is not a module of %q."):format(tostring(module), tostring(self)), 2)
			end
		end
	elseif type(module) == "string" then
	 	if not RockModuleCore.HasModule(self, module) then
			error(("Bad argument #2 to `ToggleModuleActive'. %q is not a known module."):format(module), 2)
		end
	else
		error(("Bad argument #2 to `ToggleModuleActive'. Expected %q or %q, got %q."):format("table", "string", type(module)), 2)
	end
	
	local enabled = IsModuleActive(self, module)
	
	if state == nil then
		state = not enabled
	elseif state == enabled then
		return state
	end
	
	local defaultState
	local defaultModuleState_self = defaultModuleState[self]
	if defaultModuleState_self then
		defaultState = defaultModuleState_self[module]
	end
	if defaultState == nil then
		defaultState = true
	end
	
	local savedState
	if defaultState ~= state then
		savedState = not state
	end
	
	local self_db = self.db
	if self_db then
		local self_db_raw = self_db.raw
		if not self_db_raw then
			error("Cannot call `ToggleModuleActive' until the database has been properly registered and ADDON_LOADED has fired.", 2)
		end
		
		local self_db_raw_disabledModules = self_db_raw.disabledModules
		if not self_db_raw_disabledModules then
			self_db_raw_disabledModules = newList()
			self_db_raw.disabledModules = self_db_raw_disabledModules
		end
		
		local profile = type(self.GetProfile) == "function" and select(2, self:GetProfile()) or false
		
		local self_db_raw_disabledModules_profile = self_db_raw_disabledModules[profile]
		if not self_db_raw_disabledModules_profile then
			self_db_raw_disabledModules_profile = newList()
			self_db_raw_disabledModules[profile] = self_db_raw_disabledModules_profile
		end
		
		self_db_raw_disabledModules_profile[module] = savedState
		
		if not next(self_db_raw_disabledModules_profile) then
			self_db_raw_disabledModules[profile] = del(self_db_raw_disabledModules_profile)
			if not next(self_db_raw_disabledModules) then
				self_db_raw.disabledModules = del(self_db_raw_disabledModules)
			end
		end
	else
		local disabledModules_self = disabledModules[self]
		if not disabledModules_self then
			disabledModules_self = newList()
			disabledModules[self] = disabledModules_self
		end
		
		disabledModules_self[module] = savedState
		
		if not next(disabledModules_self) then
			disabledModules[self] = del(disabledModules_self)
		end
	end
	
	local sortedModuleLists_self = sortedModuleLists[self]
	if sortedModuleLists_self then
		local sortedModuleLists_self_true = sortedModuleLists_self[true]
		if sortedModuleLists_self_true then
			for method, u in pairs(sortedModuleLists_self_true) do
				sortedModuleLists_self_true[method] = del(u)
			end
			sortedModuleLists_self[true] = del(sortedModuleLists_self_true)
		end
		if next(sortedModuleLists_self) == nil then
			sortedModuleLists[self] = del(sortedModuleLists_self)
		end
	end
	
	
	if type(self.IsActive) == "function" and not self:IsActive() then
		return false
	end
	
	local coreToModules_self = coreToModules[self]
	if not coreToModules_self then
		return state
	end
	local module = coreToModules_self[module]
	if not module then
		return state
	end
	
	Rock:RecheckEnabledStates()
	
	return state
end
precondition(RockModuleCore, 'ToggleModuleActive', function(self, module, state)
	argCheck(module, 2, "table", "string")
	argCheck(state, 3, "boolean", "nil")
end)

RockModuleCore:SetExportedMethods("NewModule", "HasModule", "GetModule", "IterateModules", "CallMethodOnAllModules", "IterateModulesWithMethod", "SetModuleMixins", "SetModuleDefaultState", "IsModuleActive", "ToggleModuleActive")

Rock:FinalizeLibrary(MAJOR_VERSION)

Rock:AddUnitTest(MAJOR_VERSION, function()
	local t = {name = "RockModuleCoreUnitTest"}
	RockModuleCore:Embed(t)
	
	for name, module in t:IterateModules() do
		assert(false)
	end
	assert(not t:HasModule("Stuff"))
	local stuff = t:NewModule("Stuff")
	assert(t:HasModule("Stuff"))
	assert(t:GetModule("Stuff") == stuff)
	for name, module in t:IterateModules() do
		assert(name == "Stuff")
		assert(module == stuff)
	end
	local triggered = false
	function stuff:DoSomething()
		triggered = true
	end
	for name, module in t:IterateModulesWithMethod(false, "DoSomething") do
		assert(module == stuff)
	end
	for name, module in t:IterateModulesWithMethod(true, "DoSomething") do
		assert(module == stuff)
	end
	for name, module in t:IterateModulesWithMethod(false, "DoSomethingElse") do
		assert(false)
	end
	assert(t:IsModuleActive(stuff))
	t:ToggleModuleActive(stuff)
	assert(not t:IsModuleActive(stuff))
	for name, module in t:IterateModulesWithMethod(false, "DoSomething") do
		assert(module == stuff)
	end
	for name, module in t:IterateModulesWithMethod(true, "DoSomething") do
		assert(false)
	end
	assert(not t:IsModuleActive(stuff))
	t:ToggleModuleActive(stuff)
	assert(t:IsModuleActive(stuff))
	for name, module in t:IterateModulesWithMethod(false, "DoSomething") do
		assert(module == stuff)
	end
	for name, module in t:IterateModulesWithMethod(true, "DoSomething") do
		assert(module == stuff)
	end
	
	t:CallMethodOnAllModules(false, "DoSomething")
	assert(triggered)
	triggered = false
	t:CallMethodOnAllModules(true, "DoSomething")
	assert(triggered)
	triggered = false
	
	assert(t:IsModuleActive(stuff))
	t:ToggleModuleActive(stuff)
	assert(not t:IsModuleActive(stuff))
	
	t:CallMethodOnAllModules(false, "DoSomething")
	assert(triggered)
	triggered = false
	t:CallMethodOnAllModules(true, "DoSomething")
	assert(not triggered)
	
	assert(stuff.IsActive)
	assert(stuff.ToggleActive)
	assert(not stuff:IsActive())
	assert(not t:IsModuleActive(stuff))
	stuff:ToggleActive()
	assert(stuff:IsActive())
	assert(t:IsModuleActive(stuff))
	stuff:ToggleActive()
	assert(not stuff:IsActive())
	assert(not t:IsModuleActive(stuff))
	t:ToggleModuleActive(stuff)
	assert(stuff:IsActive())
	assert(t:IsModuleActive(stuff))
	t:ToggleModuleActive(stuff)
	assert(not stuff:IsActive())
	assert(not t:IsModuleActive(stuff))
	
	stuff:ToggleActive(false)
	assert(not stuff:IsActive())
	assert(not t:IsModuleActive(stuff))
	stuff:ToggleActive()
	assert(stuff:IsActive())
	assert(t:IsModuleActive(stuff))
	stuff:ToggleActive(true)
	assert(stuff:IsActive())
	assert(t:IsModuleActive(stuff))
end)

Rock:AddUnitTest(MAJOR_VERSION, function()
	local t = {name = "RockModuleCoreUnitTest2"}
	RockModuleCore:Embed(t)
	
	t:SetModuleMixins(MAJOR_VERSION)
	
	t:SetModuleDefaultState("Stuff", false)
	local stuff = t:NewModule("Stuff")
	assert(not stuff:IsActive())
	stuff:ToggleActive()
	assert(stuff:IsActive())
	stuff:ToggleActive()
	assert(not stuff:IsActive())
	assert(Rock:DoesObjectUseMixin(stuff, MAJOR_VERSION))
end)


Rock:AddUnitTest(MAJOR_VERSION, function()
	local t = {name = "RockModuleCoreUnitTest3"}
	RockModuleCore:Embed(t)
	
	local stuff = t:NewModule("Stuff", MAJOR_VERSION)
	assert(stuff:IsActive())
	stuff:ToggleActive()
	assert(not stuff:IsActive())
	stuff:ToggleActive()
	assert(stuff:IsActive())
	
	local ministuff = stuff:NewModule("Ministuff")
	assert(ministuff:IsActive())
	ministuff:ToggleActive()
	assert(not ministuff:IsActive())
	ministuff:ToggleActive()
	assert(ministuff:IsActive())
	
	stuff:ToggleActive()
	assert(not stuff:IsActive())
	assert(not ministuff:IsActive())
	stuff:ToggleActive()
	assert(stuff:IsActive())
	assert(ministuff:IsActive())
	ministuff:ToggleActive()
	assert(stuff:IsActive())
	assert(not ministuff:IsActive())
	stuff:ToggleActive()
	assert(not stuff:IsActive())
	assert(not ministuff:IsActive())
	stuff:ToggleActive()
	assert(stuff:IsActive())
	assert(not ministuff:IsActive())
	ministuff:ToggleActive()
	assert(stuff:IsActive())
	assert(ministuff:IsActive())
end)

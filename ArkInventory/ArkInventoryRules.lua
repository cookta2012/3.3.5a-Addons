local Rule = {
	Item = false,
	Execute = { }, -- rule functions
	Entry = { }, -- database functions
}

function ArkInventory.RuleItemAdd( rulenum, h )

	local r = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rulenum]
	if not r then
		return
	end
	
	local id = ArkInventory.ObjectIDInternal( h )
	
	r.formula = string.format( "%s or id( %s )", r.formula, id )
	r["enabled"] = ArkInventory.db.profile.option.rule[rulenum]
	
	ArkInventory.RuleEntryEdit( rulenum, r )
	
end

function ArkInventory.RuleAppliesToItem( rid, i )

	local ra = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rid]
	local rp = ArkInventory.db.profile.option.rule[rid]
	
	if not i or not rp or not ra or not ra.used or ra.damaged then
		return false, nil
	end
	
	local p, eor = loadstring( string.format( "return( %s )", ra.formula ) )

	if not p then
		return nil, eor
	end
	
	Rule.Item = i
	i.class = ArkInventory.ObjectStringDecode( i.h )
	
	setfenv( p, Rule.Environment )
	local ok, eor = pcall( p )
	
	if not ok then
		return nil, eor
	else
		return eor, nil
	end
	
end

function Rule.Execute.soulbound( )
	
	if Rule.Item.sb then
		return true
	end
	
	return false
	
end

--[[
function Rule.Execute.Empty_NOLONGERUSED( )
	
	if not Rule.Item.h or strtrim( Rule.Item.h ) == "" then
		return true
	end
	
	return false
	
end
]]--

function Rule.Execute.id( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "id"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) == "number" or type( arg ) == "string" then
			arg = string.format( "item:%s:", arg )
		else
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
		end
		
		local e = string.sub( ArkInventory.ObjectIDInternal( Rule.Item.h ) .. ":", 1, string.len( arg ) )
		
		if e == arg then
			return true
		end
		
	end
	
	return false
	
end

function Rule.Execute.type( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local e = string.lower( select( 6, GetItemInfo( Rule.Item.h ) ) or "" )
	
	local fn = "type"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local e = string.lower( select( 6, GetItemInfo( Rule.Item.h ) ) or "" )
	
	if e ~= "" then
		
		for ax = 1, ac do
			
			local arg = select( ax, ... )
			
			if not arg then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
			end
			
			if type( arg ) ~= "string" then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
			end
			
			if e == string.lower( strtrim( arg ) ) then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.subtype( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "subtype"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local e = string.lower( select( 7, GetItemInfo( Rule.Item.h ) ) or "" )
	
	if e ~= "" then
		
		for ax = 1, ac do
			
			local arg = select( ax, ... )
			
			if not arg then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
			end
			
			if type( arg ) ~= "string" then
				error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
			end
			
			if e == string.lower( strtrim( arg ) ) then
				return true
			end
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.equip( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local e = strtrim( select( 9, GetItemInfo( Rule.Item.h ) ) or "" )
	if string.len( e ) > 1 then
		e = _G[e]
	end
	e = string.lower( strtrim( e ) )
	
	if e ~= "" then
		
		local fn = "equip"
		
		local ac = select( '#', ... )
		
		if ac == 0 then
			
			-- no args so just check if item can be equipped
			if e == "" then
				return false
			else
				return true
			end
			
		else
			
			for ax = 1, ac do
				
				local arg = select( ax, ... )
				
				if not arg then
					error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
				end
				
				if type( arg ) ~= "string" then
					error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
				end
				
				if e == string.lower( strtrim( arg ) ) then
					return true
				end
				
			end
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.name( ... )
	
	if not Rule.Item.h then
		return false
	end
	
	local e = string.lower( select( 3, ArkInventory.ObjectInfo( Rule.Item.h ) ) or "" )
	
	local fn = "name"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if string.find( e, string.lower( strtrim( arg ) ) ) then
			return true
		end
		
	end
	
	return false
	
end

function Rule.Execute.quality( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	if not Rule.Item.q then
		return false
	end
	
	local fn = "quality"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if type( arg ) == "number" then
			
			if arg == Rule.Item.q then
				return true
			end
			
		elseif type( arg ) == "string" then
			
			if string.lower( strtrim( arg ) ) == string.lower( _G[string.format( "ITEM_QUALITY%d_DESC", Rule.Item.q )] ) then
				return true
			end
			
		else
			
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, string.format( "%s or %s", ArkInventory.Localise["STRING"], ArkInventory.Localise["NUMBER"] ) ), 0 )
			
		end
		
	end
	
	return false
	
end

function Rule.Execute.itemlevelstat( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "itemlevelstat"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if not arg2 then
		arg2 = arg1
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	local level = select( 4, GetItemInfo( Rule.Item.h ) ) or 0
	
	if level >= arg1 and level <= arg2 then
		return true
	end
	
	return false
	
end

function Rule.Execute.itemleveluse( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "itemleveluse"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if not arg2 then
		arg2 = arg1
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	local level = select( 5, GetItemInfo( Rule.Item.h ) ) or 0
	
	if level >= arg1 and level <= arg2 then
		return true
	end

	return false
	
end

function Rule.Execute.periodictable( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "periodictable"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if ArkInventory.Lib.PeriodicTable:ItemInSet( Rule.Item.h, strtrim( arg ) ) then
			return true
		end
		
	end
	
end

function Rule.Execute.tooltip( ... )
	
	if not Rule.Item or not Rule.Item.h or Rule.Item.bag_id == nil or Rule.Item.slot_id == nil or Rule.Item.class ~= "item" then
		return false
	end
	
	if Rule.Item.test_rule then
	
		ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Rule, Rule.Item.h )
	
	else
		
		-- tooltip is also used offline mode
		if ArkInventory.Global.Location[Rule.Item.loc_id].isOffline then
			ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Rule, Rule.Item.h )
		else
			local bliz_id = ArkInventory.BagID_Blizzard( Rule.Item.loc_id, Rule.Item.bag_id )
			ArkInventory.TooltipSetItem( ArkInventory.Global.Tooltip.Rule, bliz_id, Rule.Item.slot_id )
		end
		
	end
	
	local fn = "tooltip"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end

	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		if ArkInventory.TooltipContains( ArkInventory.Global.Tooltip.Rule, strtrim( arg ) ) then
			return true
		end
	
	end
	
	return false

end

function Rule.Execute.outfit( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	if select( 11, ArkInventory.ObjectInfo( Rule.Item.h ) ) == "" then
		return false
	end
	
	local fn = "outfit"
	
	local ac = select( '#', ... )
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
	end	
	
	if IsAddOnLoaded( "Outfitter" ) and Outfitter_IsInitialized( ) then
		return Rule.Execute.outfit_outfitter( ... )
	elseif IsAddOnLoaded( "ItemRack" ) then
		return Rule.Execute.outfit_itemrack( ... )
	--elseif IsAddOnLoaded( "ClosetGnome" ) then
		-- closetgnome uses the blizzard equipment manager for the back end
		--return Rule.Execute.outfit_closetgnome( t, Rule.Item.h )
	end
	
	return Rule.Execute.outfit_blizzard( ... )
	
end

function Rule.Execute.outfit_outfitter( ... )
	
	if not Rule.Item.h or not IsAddOnLoaded( "Outfitter" ) or not Outfitter_IsInitialized( ) then
		return false
	end
	
	local ItemInfo = Outfitter_GetItemInfoFromLink( Rule.Item.h )
	
	if not ItemInfo then
		return false
	end
	
	--if 1 == 1 then return false end
	
	local Outfits = Outfitter_GetOutfitsUsingItem( ItemInfo )
	
	if not Outfits or next( Outfits ) == nil then
		return false
	end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( Outfits ) do
			if o and o.Name and string.lower( strtrim( o.Name ) ) == string.lower( strtrim( arg ) ) then
				return true
			end
		end
		
	end
	
	return false

end

function Rule.Execute.outfit_closetgnome( ... )
	
	-- latest closet gone is using the blizzard quipment manager for the back end
	if not Rule.Item.h or not IsAddOnLoaded( "ClosetGnome" ) then
		return false
	end

	local Outfits = { }	
	
	if ClosetGnome.GetOutfitsUsingItem then
	
		Outfits = { ClosetGnome:GetOutfitsUsingItem( Rule.Item.h ) }

	else

		for n in pairs( ClosetGnome.db.char.set ) do
			for s, v in pairs( ClosetGnome.db.char.set[n] ) do
				if v == h then
					tinsert( Outfits, strtrim( n ) )
					break
				end
			end
		end
		
	end

	
	if not Outfits or next( Outfits ) == nil then return false end
	
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( Outfits ) do
			if o and string.lower( strtrim( o ) ) == string.lower( strtrim( arg ) ) then
				return true
			end
		end
	
	end
	
	return false
	
end

function Rule.Execute.outfit_itemrack( ... )

	-- item rack 2.1

	if not Rule.Item.h or not IsAddOnLoaded( "ItemRack" ) then return false end
	
	local id = string.match( Rule.Item.h or "", "item:(.+):%-?%d+" ) or 0
	
	local Outfits = { }
	
	for setname, set in pairs( ItemRackUser.Sets ) do
		--ArkInventory.Output( "setname=[", setname, "]" )
		for k, setitem in pairs( set.equip ) do
			--ArkInventory.Output( "pos=[", k, "], item=[", setitem, "], id=[", id, "]" )
			if not ( setitem == 0 or setitem == nil ) then
				if id == setitem and string.sub( setname, 1, 1 ) ~= "~" then
					tinsert( Outfits, strtrim( setname ) )
					--ArkInventory.Output( "added set [", setname, "] for item [", id, "]" )
					break
				end
			end
		end
	end
	
	if not Outfits or next( Outfits ) == nil then return false end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( Outfits ) do
			if o and string.lower( strtrim( o ) ) == string.lower( strtrim( arg ) ) then
				return true
			end
		end
	
	end
	
	return false

end

function Rule.Execute.outfit_blizzard( ... )

	-- blizzard equipment manager
	
	local equipsets = GetNumEquipmentSets( )
	if equipsets == 0 then
		return false
	end
	
	local Outfits = { }
	
	-- get a list of outfits the item is in
	for setnum = 1, equipsets do 
		
		local setname = GetEquipmentSetInfo( setnum )
		local set = GetEquipmentSetLocations( setname )
		
		for k, location in pairs( set ) do
			
			local wearing, bank, bags, slot, bag = EquipmentManager_UnpackLocation( location )
			if wearing or bank or bags then
				
				local h
				
				if not bags then 
					h = GetInventoryItemLink( "player", slot )  --being worn or in bank
				else
					h = GetContainerItemLink( bag, slot )  -- player bags or bank bags
				end
				
				if h == Rule.Item.h then
					tinsert( Outfits, string.trim( setname ) )
					--ArkInventory.OutputDebug( "found ", h, " in set [", setname, ":", k, "] [", bag, ".", slot, "]" )
					break
				end
				
			end
			
		end
		
	end
	
	-- not in any outfit
	if next( Outfits ) == nil then return false end
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		return true
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		for _, o in pairs( Outfits ) do
			if o and string.lower( strtrim( o ) ) == string.lower( strtrim( arg ) ) then
				return true
			end
		end
		
	end	
	
	return false

end

function Rule.Execute.vendorpriceunder( ... )

	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "vendorpriceunder"
	
	local arg1 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	return Rule.Execute.vendorprice( 1, t )
	
end

function Rule.Execute.vendorpriceover( ... )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local fn = "vendorpriceover"
	
	local arg1 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	return Rule.Execute.vendorprice( 0, t )
	
end

function Rule.Execute.vendorprice( opt, t )
	
	-- not called directly
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local price_per = select( 11, GetItemInfo( Rule.Item.h ) )
	
	if price_per == nil then
	
		--ArkInventory.Output( "item=[", Rule.Item.h, "], nil sell value" )
		return false
		
	elseif price_per > 0 then
	
		local count = Rule.Item.count or 1
		local price = price_per * count
	
		local v = tonumber( t )
		if type( v ) == "number" then
		
			if opt == 1 then
				
				--ArkInventory.Output( "[", count, "] x [", Rule.Item.h, "] = [", price, "], under=[", v, "]" )
				
				if price <= v then
					return true
				end
				
			else
			
				--ArkInventory.Output( "[", count, "] x [", Rule.Item.h, "] = [", price, "], over=[", v, "]" )
			
				if price >= v then
					return true
				end
				
			end
		
		end
	
	end
	
	return false
	
end

function Rule.Execute.characterlevelrange( ... )

	-- ( levels below, levels above )
	
	if not Rule.Item.h or not Rule.Item.class == "item" then
		return false
	end
	
	local fn = "characterlevelrange"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	local arg1, arg2 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if not arg2 then
		arg2 = arg1
	end
	
	if type( arg2 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 2, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	local clevel = UnitLevel( "player" )
	local ilevel = select( 5, GetItemInfo( Rule.Item.h ) ) or clevel
	
	arg1 = clevel - arg1
	arg2 = clevel + arg2
	
	if ilevel >= arg1 and ilevel <= arg2 then
		return true
	end
	
	return false
	
end

function Rule.Execute.bag( ... )
	
	-- note, this rule is now just which *internal* bag an item is in, ie its just a number from 1 to x
	
	local fn = "bag"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "number" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["NUMBER"] ), 0 )
		end
		
		if arg == Rule.Item.bag_id then
			return true
		end
		
	end
	
	return false
	
end

function Rule.Execute.location( ... )
	
	if not Rule.Item.loc_id then
		return false
	end
	
	local fn = "location"
	
	local ac = select( '#', ... )
	
	if ac == 0 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_NONE_SPECIFIED"], fn ), 0 )
	end
	
	for ax = 1, ac do
		
		local arg = select( ax, ... )
		
		if not arg then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, ax ), 0 )
		end
		
		if type( arg ) ~= "string" then
			error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, ax, ArkInventory.Localise["STRING"] ), 0 )
		end
		
		
		local k = string.lower( strtrim( arg ) )
		if k == "bag" or k == string.lower( ArkInventory.Localise["LOCATION_BAG"] ) then
			k = ArkInventory.Const.Location.Bag
		elseif k == "key" or k == "keyring" or k == string.lower( KEYRING ) then
			k = ArkInventory.Const.Location.Key
		elseif k == "bank" or k == string.lower( ArkInventory.Localise["LOCATION_BANK"] ) then
			k = ArkInventory.Const.Location.Bank
		elseif k == "guild bank" or k == "vault" or k == string.lower( GUILD_BANK ) then
			k = ArkInventory.Const.Location.Vault
		elseif k == "mail" or k == string.lower( MAIL_LABEL ) then
			k = ArkInventory.Const.Location.Mail
		elseif k == "wearing" or k == "gear" or k == string.lower( ArkInventory.Localise["LOCATION_WEARING"] ) then
			k = ArkInventory.Const.Location.Wearing
		elseif k == "pet" or k == string.lower( ArkInventory.Localise["LOCATION_PET"] ) then
			k = ArkInventory.Const.Location.Pet
		elseif k == "mount" or k == string.lower( ArkInventory.Localise["LOCATION_MOUNT"] ) then
			k = ArkInventory.Const.Location.Mount
		elseif k == "token" or k == "currency" or k == string.lower( ArkInventory.Localise["LOCATION_TOKEN"] ) then
			k = ArkInventory.Const.Location.Token
		else
			k = -1
		end
		
		if Rule.Item.loc_id == k then
			return true
		end
	end
	
	return false
	
end

function Rule.Execute.usable( )
	
	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	ArkInventory.TooltipSetHyperlink( ArkInventory.Global.Tooltip.Rule, Rule.Item.h )
	
	return ArkInventory.TooltipCanUse( ArkInventory.Global.Tooltip.Rule )
	
end

function Rule.Execute.count( ... )
	
	if not Rule.Item.h then
		return false
	end
	
	local fn = "count"
	
	local arg1 = ...
	
	if not arg1 then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_NIL"], fn, 1 ), 0 )
	end
	
	if type( arg1 ) ~= "number" then
		error( string.format( ArkInventory.Localise["RULE_FAILED_ARGUMENT_IS_INVALID"], fn, 1, ArkInventory.Localise["NUMBER"] ), 0 )
	end
	
	if Rule.Item.count >= arg1 then
		return true
	end
	
	return false
	
end

function Rule.Execute.stacks( )

	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	if select( 10, ArkInventory.ObjectInfo( Rule.Item.h ) ) > 1 then
		return true
	end
	
	return false
	
end

function Rule.Execute.trash( )

	if not Rule.Item.h or Rule.Item.class ~= "item" then
		return false
	end
	
	local id = select( 2, ArkInventory.ObjectStringDecode( Rule.Item.h ) )
	
	if IsAddOnLoaded( "Scrap" ) then
		if Scrap:IsJunk( id ) then
			return true
		end
	end
	
	if IsAddOnLoaded( "SellJunk" ) then
		local poor = ( Rule.Item.q == 0 )
		if ( ( poor ) and ( not SellJunk:isException( Rule.Item.h ) ) ) or ( ( not poor ) and ( SellJunk:isException( Rule.Item.h ) ) ) then
			return true
		end
	end
	
	if IsAddOnLoaded( "ReagentRestocker" ) then
		if ReagentRestocker:isToBeSold( id ) then
			return true
		end
	end
	
	
	if Rule.Item.q == 0 then
		return true
	end
	
	return false
	
end


Rule.Environment = {
	
	soulbound = Rule.Execute.soulbound,
	sb = Rule.Execute.soulbound,
	
	--empty = Rule.Execute.Empty,
	
	id = Rule.Execute.id,
	
	type = Rule.Execute.type,
	
	subtype = Rule.Execute.subtype,
	
	equip = Rule.Execute.equip,
	
	name = Rule.Execute.name,
	
	quality = Rule.Execute.quality,
	q = Rule.Execute.quality,
	
	periodictable = Rule.Execute.periodictable,
	pt = Rule.Execute.periodictable,
	
	tooltip = Rule.Execute.tooltip,
	tt = Rule.Execute.tooltip,
	
	outfit = Rule.Execute.outfit,
	
	ilvl = Rule.Execute.itemlevelstat,
	itemlevel = Rule.Execute.itemlevelstat,
	statlevel = Rule.Execute.itemlevelstat,
	
	ireq = Rule.Execute.itemleveluse,
	uselevel = Rule.Execute.itemleveluse,
	
	clr = Rule.Execute.characterlevelrange,
	
	vpu = Rule.Execute.vendorpriceunder,
	
	vpo = Rule.Execute.vendorpriceover,
	
	bag = Rule.Execute.bag,
	
	location = Rule.Execute.location,
	loc = Rule.Execute.location,
	
	usable = Rule.Execute.usable,
	use = Rule.Execute.usable,
	useable = Rule.Execute.usable,
	
	count = Rule.Execute.count,
	
	stacks = Rule.Execute.stacks,
	
	-- 3rd party addons requried for the following functions to work
	
	trash = Rule.Execute.trash,
	
}

function ArkInventory.Frame_Rules_Hide( )
	ARKINV_Rules:Hide( )
end
	
function ArkInventory.Frame_Rules_Show( )
	ARKINV_Rules:Show( )
end

function ArkInventory.Frame_Rules_Toggle( )

	if ARKINV_Rules:IsVisible( ) then
		ArkInventory.Frame_Rules_Hide( )
	else
		ArkInventory.Frame_Rules_Show( )
	end
	
end

function ArkInventory.Frame_Rules_Paint( )

	local frame = ARKINV_Rules

	-- title
	obj = _G[frame:GetName( ) .. "TitleWho"]
	if obj then
		t = string.format( "%s: %s %s", ArkInventory.Localise["CONFIG_RULES"], ArkInventory.Const.Program.Name, ArkInventory.Global.Version )
		obj:SetText( t )
	end
	
	-- font
	ArkInventory.MediaSetFontFrame( frame )
	
	-- scale
	frame:SetScale( ArkInventory.db.profile.option.ui.rules.scale or 1 )
	
	local style, file, size, offset, scale, colour
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		
		-- background
		local obj = _G[z:GetName( ) .. "Background"]
		if obj then
			style = ArkInventory.db.profile.option.ui.rules.background.style or ArkInventory.Const.Texture.BackgroundDefault
			if style == ArkInventory.Const.Texture.BackgroundDefault then
				colour = ArkInventory.db.profile.option.ui.rules.background.colour
				obj:SetTexture( colour.r, colour.g, colour.b, colour.a )
			else
				file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BACKGROUND, style )
				obj:SetTexture( file )
			end
		end
		
		-- border
		style = ArkInventory.db.profile.option.ui.rules.border.style or ArkInventory.Const.Texture.BorderDefault
		file = ArkInventory.Lib.SharedMedia:Fetch( ArkInventory.Lib.SharedMedia.MediaType.BORDER, style )
		size = ArkInventory.db.profile.option.ui.rules.border.size or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].size
		offset = ArkInventory.db.profile.option.ui.rules.border.offset or ArkInventory.Const.Texture.Border[ArkInventory.Const.Texture.BorderDefault].offset
		scale = ArkInventory.db.profile.option.ui.rules.border.scale or 1
		colour = ArkInventory.db.profile.option.ui.rules.border.colour or { }
		
		ArkInventory.Frame_Rules_Paint_Border( z, file, size, offset, scale, colour.r, colour.g, colour.b, 1 )
		
	end
	
end

function ArkInventory.Frame_Rules_Paint_Border( frame, ... )
	
	if frame:GetName( ) then
		local obj = _G[frame:GetName( ) .. "ArkBorder"]
		if obj then
			--ArkInventory.Output( obj:GetName( ) )
			if ArkInventory.db.profile.option.ui.rules.border.style ~= ArkInventory.Const.Texture.BorderNone then
				ArkInventory.Frame_Border_Paint( obj, false, ... )
				obj:Show( )
			else
				obj:Hide( )
			end
		end
	end
	
	for _, z in pairs( { frame:GetChildren( ) } ) do
		ArkInventory.Frame_Rules_Paint_Border( z, ... )
	end
	
end

function ArkInventory.UiSetEditBoxLabel( arg1 )
	_G[this:GetName( ) .. "Label"]:SetText( arg1 )
end

function ArkInventory.Frame_Rules_TabToNext( w_curr, w_prev, w_next )

	if not w_curr or not w_prev or not w_next then
		return
	end
	
	local f = this:GetName( )
	f = string.sub( f, 1, string.len( f ) - string.len( w_curr ) )
	
	if IsShiftKeyDown( ) then
		f = f .. w_prev
	else
		f = f .. w_next
	end

	local w = _G[f]
	if w then
		w:SetFocus( )
	end

end


function ArkInventory.Frame_Rules_Build_Sort( )

	local f = this:GetName( )
	
	local x
	
	--enabled
	x = _G[f .. "_T1"]
	x:ClearAllPoints( )
	x:SetWidth( 32 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "LEFT", 15, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_ENABLED"] )
	x:Show( )

	--damaged
	x = _G[f .. "_T2"]
	x:ClearAllPoints( )
	x:SetWidth( 32 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "LEFT", f .. "_T1", "RIGHT", 5, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_DAMAGED"] )
	x:Show( )
	
	-- id
	x = _G[f .. "_C1"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "_T2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_ID"] )
	x:Show( )

	-- order
	x = _G[f .. "_C2"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "_C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_ORDER"] )
	x:Show( )

	-- description
	x = _G[f .. "_C3"]
	x:ClearAllPoints( )
	x:SetPoint( "LEFT", f .. "_C2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -35, 0 )
	x:SetText( ArkInventory.Localise["RULE_LIST_DESCRIPTION"] )
	x:Show( )
	
end

function ArkInventory.Frame_Rules_Build_Row( )

	local f = this:GetName( )
	
	local x
	local sz = 18
	
	--enabled
	x = _G[f .. "T1"]
	x:ClearAllPoints( )
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "LEFT", 17, 0 )
	x:Show( )

	--damaged
	x = _G[f .. "T2"]
	x:ClearAllPoints( )
	x:SetWidth( sz )
	x:SetHeight( sz )
	x:SetPoint( "LEFT", f .. "T1", "RIGHT", 19, 0 )
	x:Show( )
	
	-- id
	x = _G[f .. "C1"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "T2", "RIGHT", 12, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "CENTER", 0, 0 )
	x:Show( )

	-- order
	x = _G[f .. "C2"]
	x:ClearAllPoints( )
	x:SetWidth( 50 )
	x:SetPoint( "LEFT", f .. "C1", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetTextColor( 1, 1, 1, 1 )
	x:SetJustifyH( "CENTER", 0, 0 )
	x:Show( )

	-- description
	x = _G[f .. "C3"]
	x:ClearAllPoints( )
	x:SetPoint( "LEFT", f .. "C2", "RIGHT", 5, 0 )
	x:SetPoint( "TOP", 0, 0 )
	x:SetPoint( "BOTTOM", 0, 0 )
	x:SetPoint( "RIGHT", -5, 0 )
	x:SetJustifyH( "LEFT", 0, 0 )
	x:Show( )

end

function ArkInventory.Frame_Rules_Build_Table( f )

	if not f or type( f ) ~= "string" then f = this:GetName( ) end

	local p = _G[f]
	if not p then
		ArkInventory.Output( RED_FONT_COLOR_CODE, "OOPS: Invalid value at ArkInventory.Frame_Rules_Build_Table( [", f, "] )" )
		return
	end
	
	local maxrows = tonumber( _G[f .. "MaxRows"]:GetText( ) )
	local rows = maxrows
	local height = 24
	
	if rows > maxrows then rows = maxrows end
	_G[f .. "NumRows"]:SetText( rows )
	
	if height == 0 then
		height = tonumber( _G[f .. "RowHeight"]:GetText( ) )
	end
	_G[f .. "RowHeight"]:SetText( height )

	-- stretch scrollbar to bottom row
	_G[f .. "Scroll"]:SetPoint( "BOTTOM", f .. "Row" .. rows, "BOTTOM", 0, 0 )

	-- set frame height to correct size
	_G[f]:SetHeight( height * rows + 20 )

end

function ArkInventory.Frame_Rules_Table_Row_OnClick( )

	local f = this:GetName( )
	
	-- ArkInventory.Print( "RuleTableClick( " .. f .. " )" )
	local parent = _G[f]:GetParent( ):GetName( )
	
	local cs = _G[parent .. "SelectedRow"]:GetText( )
	local ns = tostring( _G[f]:GetID( ) )

	if ns == "0" then
		ArkInventory.Output( "OOPS: widget [", f, "] has no ID allocated" )
		return false
	end
	
	
	if IsShiftKeyDown( ) then
	
		-- shift click - enable/disable the rule
		id = tonumber( _G[f .. "Id"]:GetText( ) )
		if id > 0 then
		
			if ArkInventory.db.profile.option.rule[id] then
			
				ArkInventory.db.profile.option.rule[id] = false
				ArkInventory.ItemCacheClear( )
				ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
			
			else
		
				d = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[id]
				d["enabled"] = true
				ArkInventory.RuleEntryEdit( id, d )
				
			end
			
		end
	
		ArkInventory.Frame_Rules_Table_Refresh( )
		
	else
	
		-- normal click - show/hide selected background
	
		if cs ~= "-1" then
			_G[parent .. "Row" .. cs .. "Selected"]:Hide( )
		end

		-- second click removes selection		
		if cs == ns then
			_G[parent .. "SelectedRow"]:SetText( "-1" )
			_G[parent .. "SelectedId"]:SetText( "-1" )
			return
		end
	
		_G[parent .. "SelectedRow"]:SetText( ns )
		_G[parent .. "SelectedId"]:SetText( _G[f .. "Id"]:GetText( ) )
	
		_G[f .. "Selected"]:Show( )
		
	end

end

function ArkInventory.Frame_Rules_Table_Reset( f )

	if not f or type( f ) ~= "string" then f = this:GetName( ) end
	-- hide and reset all rows
	
	local t = f .. "Table"
	
	local h = tonumber( _G[t .. "RowHeight"]:GetText( ) )
	local r = tonumber( _G[t .. "NumRows"]:GetText( ) )

	_G[t .. "SelectedRow"]:SetText( "-1" )
	for x = 1, r do
		_G[t .. "Row" .. x .. "Selected"]:Hide( )
		_G[t .. "Row" .. x .. "Id"]:SetText( "-1" )
		_G[t .. "Row" .. x]:Hide( )
		_G[t .. "Row" .. x]:SetHeight( h )
	end

end

function ArkInventory.Frame_Rules_Table_Refresh( f )

	if not f then
		f = this:GetParent( ):GetParent( ):GetParent( ):GetName( )
	end
	
--	if type( f ) == "table" then
--		f = f:GetParent( ):GetParent( ):GetParent( ):GetName( )
--	end
	
	-- ArkInventory.Print( "Frame_Rules_Table_Refresh( " .. ArkInventory.nilStringText( f ) .. " ), " .. this:GetName( ) )

	local p = _G[f]
	if not p then
		ArkInventory.Output( RED_FONT_COLOR_CODE, "OOPS: Invalid widget name at Frame_Rules_Table_Refresh( ", f, " )" )
		return
	end
	
	f = f .. "View"
	
	local ft = f .. "Table"
	local fs = f .. "Search"

	local height = tonumber( _G[ft .. "RowHeight"]:GetText( ) )
	local rows = tonumber( _G[ft .. "NumRows"]:GetText( ) )

	local line
	local lineplusoffset
	
	ArkInventory.Frame_Rules_Table_Reset( f )

	-- collect all valid items
	local filter = _G[fs .. "Filter"]:GetText( )
	--ArkInventory.Print( "filter = [" .. filter .. "]" )

	local t = { }
	local tc = 0
	
	local ignore
	
	for k, d in pairs( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data ) do

		-- ArkInventory.Print( "k = [" .. k .. "], order = [" .. d.order .. "], name = [" .. ArkInventory.nilStringEmpty( d.name ) .. "], formula = [" .. ArkInventory.nilStringEmpty( d.formula ) .. "]" )
	
		ignore = false
		
		if filter ~= "" then
			if not string.find( string.lower( d.name or "" ), string.lower( filter ) ) then
				ignore = true
			end
		end
		
		if not ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[k].used then
			ignore = true
		end
		
		if not ArkInventory.db.global.option.showdisabled and not ArkInventory.db.profile.option.rule[k] then
			ignore = true
		end
		
		if not ignore then
			table.insert( t, { ["sorted"]=format( "%04i %04i", d.order or 0, k ), ["id"]=k, ["enabled"]=ArkInventory.db.profile.option.rule[k] or false, ["order"]=d.order or 0, ["name"]=d.name or "", ["formula"]=d.formula or "", ["damaged"]=d.damaged or false } )
			tc = tc + 1
		end

	end


	FauxScrollFrame_Update( _G[ft .. "Scroll"], tc, rows, height )

	if tc == 0 then
		return
	end
	
	-- sort them by name
	table.sort( t, function( a, b ) return a.sorted < b.sorted end )

	local linename, c, r
	
	for line = 1, rows do

		linename = ft .. "Row" .. line
		
		lineplusoffset = line + FauxScrollFrame_GetOffset( _G[ft .. "Scroll"] )

		if lineplusoffset <= tc then

			c = ""
			r = t[lineplusoffset]
			
			_G[linename .. "Id"]:SetText( r.id )

			if r.enabled then
				_G[linename .. "T1"]:SetTexture( "Interface\\Icons\\Spell_ChargePositive" )
			else
				_G[linename .. "T1"]:SetTexture( "Interface\\Icons\\Spell_ChargeNegative" )
			end
			
			if r.damaged then
				_G[linename .. "T2"]:SetTexture( "Interface\\Icons\\Spell_Shadow_DeathCoil" )
			else
				_G[linename .. "T2"]:SetTexture( 0, 0, 0, 0 )
			end

			_G[linename .. "C1"]:SetText( r.id )

			c = string.format( r.order )
			_G[linename .. "C2"]:SetText( c )

			c = r.name
			if not c then c = "<not set>" end
			_G[linename .. "C3"]:SetText( c )

			_G[linename]:Show( )
			
			-- show selected if id is scrolled into view
			if _G[ft .. "SelectedId"]:GetText( ) == r.order then
				_G[ft .. "SelectedRow"]:SetText( line )
				_G[ft .. "Row" .. line .. "Selected"]:Show( )
			end
			
		else
		
			_G[linename .. "Id"]:SetText( "-1" )
			_G[linename]:Hide( )
			
		end
	end

	-- ~~~~ clean table t
	
end

function ArkInventory_Frame_Rules_Table_Refresh( )
	ArkInventory.Frame_Rules_Table_Refresh( )
end

function ArkInventory.RuleEntryFormat( data )

	if not data then
		return
	end
	
	local zOrder = 9999
	zOrder = abs( tonumber( data.order ) or zOrder )
	if zOrder > 9999 then
		zOrder = 9999
	end
	
	local zName = ""
	zName = strtrim( tostring( data.name or zName ) )

	local zFormula = "false"
	zFormula = strtrim( tostring( data.formula or zFormula ) )
	zFormula = string.gsub( zFormula, "[\r]", " " ) -- replace carriage return with space
	zFormula = string.gsub( zFormula, "[\n]", " " ) -- replace new line with space
	zFormula = string.gsub( zFormula, "%s+", " " ) -- replace multiple spaces with a single space
	
--	zFormula = string.gsub( zFormula, "%s+\"%s+", "\"" ) -- remove spaces around quotes
--	zFormula = string.gsub( zFormula, "%s+", " " ) -- replace multiple spaces with a single space
--	zFormula = string.gsub( zFormula, "([^%s])%(([^%s])", "%1%( %2" ) -- x(y to x( y
--	zFormula = string.gsub( zFormula, "([^%s])%)", "%1 %)" ) -- x) to x )
--	zFormula = string.gsub( zFormula, "%)([^%s])", "%) %1" ) -- )x to ) x
	
--	for k in pairs( Rule.Environment ) do
--		zFormula = string.gsub( zFormula, k .. "%s+%(", k .. "%(" ) -- remove spaces between function name and (
--	end
	
	
	data.used = true
	data.damaged = false
	data.order = zOrder
	data.name = zName
	data.formula = zFormula
	data.compiled = nil  -- purge old data
	
	
	if data.enabled then
		data.enabled = true
	else
		data.enabled = false
	end

	return data
	
end

function ArkInventory.RuleEntryUpdate( rid, data )

	local rid = tonumber( rid )
	ArkInventory.RuleEntryFormat( data )

	-- enable/disable the rule at the profile level
	if data.enabled then
		ArkInventory.db.profile.option.rule[rid] = true
	else
		ArkInventory.db.profile.option.rule[rid] = nil
	end
	data.enabled = nil
	
	-- save the rule data at the account level
	ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rid].used = true
	for k, v in pairs( data ) do
		ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rid][k] = v
	end
	
	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
end

function ArkInventory.RuleEntryIsValid( rid, data )
	
	--ArkInventory.Output( "validating rule ", rid )
	
	local ok = true
	local em = string.format( ArkInventory.Localise["RULE_FAILED"], rid )
	
	if not rid then
		return false, string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_KEY_NIL"] )
	end
	
	if not data then
		return false, ArkInventory.Localise["RULE_FAILED_DATA_NIL"]
	end
	
	ArkInventory.RuleEntryFormat( data )
	
	
	if not data.name or strtrim( data.name ) == "" then
		em = string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_DESCRIPTION_NIL"] )
		ok = false
	end
	
	if not data.formula or strtrim( data.formula ) == "" then
		
		em = string.format( "%s, %s", em, ArkInventory.Localise["RULE_FAILED_FORMULA_NIL"] )
		ok = false
		
	else
		
		--ArkInventory.RuleEntryCompile( data )
		
		Rule.Item = { test_rule=true, class="item", bag_id=0, slot_id=1, count=1, q=1, sb=true, h="item:6948:0:0:0:0:0:0:0" } -- hearthstone

		local p, pem = loadstring( string.format( "return( %s )", data.formula ) )
		
		if not p then
			
			--ArkInventory.Output( "loadstring failed" )
			
			ok = false
			em = string.format( "%s, loadstring failure: %s", em, pem )
			
		else
			
			--ArkInventory.Output( "loadstring ok" )
			
			setfenv( p, Rule.Environment )
			local pok, pem = pcall( p )
			
			if not pok then
				--ArkInventory.Output( "pcall failed" )
				ok = false
				em = string.format( "%s, %s: %s", em, ArkInventory.Localise["RULE_FAILED_FORMULA_BAD"], pem )
			else
				--ArkInventory.Output( "pcall ok" )
			end
			
		end
		
	end
	
	return ok, em
	
end

function ArkInventory.RuleEntryExists( rid )
	
	if not rid then
		error( "passed argument is nil" )
	end
	
	if ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[tonumber( rid )].used then
		return true
	else
		return false
	end

end

function ArkInventory.RuleEntryAdd( data )
	
	local t = ArkInventory.Const.Category.Type.Rule
	local v = ArkInventory.db.global.option.category[t]
	
	local n = ArkInventory.CategoryGetNext( v )
	
	if n == -1 then
		return false, "rules limit reached"
	end
	
	if n == -2 then
		return false, "your data was recently upgraded, a ui reload is required before you can add a rule"
	end
	
	
	local ok, msg = ArkInventory.RuleEntryIsValid( v.next, data )
	if not ok then
		--message( msg )
		return false, msg
	end
	
	ArkInventory.RuleEntryUpdate( v.next, data )
	
	return v.next
	
end

function ArkInventory.RuleEntryEdit( rid, data )

	local ok, ec = ArkInventory.RuleEntryIsValid( rid, data )
	if not ok then
		return false, ec
	end
	
	ArkInventory.RuleEntryUpdate( rid, data )
	
	return true
	
end

function ArkInventory.RuleEntryRemove( rid )

	if not rid then
		error( "FAILED: key is nil" )
	end
	
	local rid = tonumber( rid )
	table.wipe( ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rid] )
	ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[rid].used = false

	ArkInventory.ItemCacheClear( )
	ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
	
	return true
	
end


function ArkInventory.Frame_Rules_Button_Modify( t )

	local f = this:GetParent( ):GetParent( ):GetParent( ):GetName( )
	
	local fvt = f .. "ViewTable"

	local fm = f .. "Modify"
	local fmt = fm .. "Title"
	local fmd = fm .. "Data"

	_G[fm .. "Type"]:SetText( t )

	local k = _G[fvt .. "SelectedId"]:GetText( )
	if not k then k = "-1" end
	if t == "A" then k = "-1" end

	local v
	
	if k ~= "-1" then
		local d = ArkInventory.db.global.option.category[ArkInventory.Const.Category.Type.Rule].data[tonumber( k )]
		d["enabled"] = ArkInventory.db.profile.option.rule[tonumber( k )]
		_G[fmd .. "Id"]:SetText( k )
		_G[fmd .. "Enabled"]:SetChecked( d.enabled )
		_G[fmd .. "Order"]:SetText( ArkInventory.nilStringEmpty( d.order ) )
		_G[fmd .. "Description"]:SetText( ArkInventory.nilStringEmpty( d.name ) )
		_G[fmd .. "ScrollFormula"]:SetText( ArkInventory.nilStringEmpty( d.formula ) )
	else
		_G[fmd .. "Id"]:SetText( "<NEW>" )
		_G[fmd .. "Enabled"]:SetChecked( true )
		_G[fmd .. "Order"]:SetText( "100" )
		_G[fmd .. "Description"]:SetText( "" )
		_G[fmd .. "ScrollFormula"]:SetText( "false" )
	end

	_G[fmd .. "IdLabel"]:SetText( ArkInventory.Localise["RULE"] .. ":"  )
	_G[fmd .. "EnabledLabel"]:SetText( ArkInventory.Localise["RULE_ENABLED"] .. ":"  )
	_G[fmd .. "OrderLabel"]:SetText( ArkInventory.Localise["RULE_ORDER"] .. ":"  )
	_G[fmd .. "DescriptionLabel"]:SetText( ArkInventory.Localise["RULE_DESCRIPTION"] .. ":"  )
	_G[fmd .. "FormulaLabel"]:SetText( ArkInventory.Localise["RULE_FORMULA"] .. ":" )
	
	_G[fmd .. "Enabled"]:Show( )
	_G[fmd .. "Order"]:Show( )
	_G[fmd .. "Description"]:Show( )
	_G[fmd .. "ScrollFormula"]:Show( )

	_G[fmd .. "EnabledReadOnly"]:SetChecked( _G[fmd .. "Enabled"]:GetChecked( ) )
	_G[fmd .. "EnabledReadOnly"]:Hide( )
	_G[fmd .. "OrderReadOnly"]:SetText( _G[fmd .. "Order"]:GetText( ) )
	_G[fmd .. "OrderReadOnly"]:Hide( )
	_G[fmd .. "DescriptionReadOnly"]:SetText( _G[fmd .. "Description"]:GetText( ) )
	_G[fmd .. "DescriptionReadOnly"]:Hide( )
	_G[fmd .. "FormulaReadOnly"]:SetText( _G[fmd .. "ScrollFormula"]:GetText( ) )
	_G[fmd .. "FormulaReadOnly"]:Hide( )

	if t == "R" then

		if k == "-1" then return end

		_G[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["REMOVE"] ) )

		_G[fmd .. "Enabled"]:Hide( )
		_G[fmd .. "EnabledReadOnly"]:Disable( )
		_G[fmd .. "EnabledReadOnly"]:Show( )

		_G[fmd .. "Order"]:Hide( )
		_G[fmd .. "OrderReadOnly"]:Show( )

		_G[fmd .. "Description"]:Hide( )
		_G[fmd .. "DescriptionReadOnly"]:Show( )

		_G[fmd .. "ScrollFormula"]:Hide( )
		_G[fmd .. "FormulaReadOnly"]:Show( )

	elseif t == "E" then

		if k == "-1" then return end

		_G[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["EDIT"] ) )

	elseif t == "A" then

		_G[fmt .. "Text"]:SetText( string.upper( ArkInventory.Localise["ADD"] ) )

	else
		ArkInventory.Output( RED_FONT_COLOR_CODE, "OOPS: Uncoded argument ArkInventory.Frame_Rules_Button_Modify( ", t, " )" )
		return
	end

	_G[f .. "View"]:Hide( )
	_G[fm]:Show( )

end

function ArkInventory.Frame_Rules_Button_Modify_Ok( )

	local f = this:GetParent( ):GetParent( ):GetParent( ):GetParent( ):GetName( )
	local fm = this:GetParent( ):GetParent( ):GetName( )
	local fmd = fm .. "Data"
	
	local d = { }
	d["enabled"] = _G[fmd .. "Enabled"]:GetChecked( )
	d["order"] = _G[fmd .. "Order"]:GetText( )
	d["name"] = _G[fmd .. "Description"]:GetText( )
	d["formula"] = _G[fmd .. "ScrollFormula"]:GetText( )

	local k = _G[fmd .. "Id"]:GetText( )

	f = this:GetParent( ):GetParent( ):GetParent( ):GetName( )
	fm = this:GetParent( ):GetParent( ):GetName( )
	
	local t = _G[fm .. "Type"]:GetText( )

	if t =="A" then
		local ok, ec = ArkInventory.RuleEntryAdd( d )
		if not ok then
			ArkInventory.OutputError( ec )
			return
		end
		_G[f .. "ViewTableSelectedId"]:SetText( "-1" )
	elseif t == "E" then
		local ok, ec = ArkInventory.RuleEntryEdit( k, d )
		if not ok then
			ArkInventory.OutputError( ec )
			return
		end
	elseif t == "R" then
		local ok, ec = ArkInventory.RuleEntryRemove( k )
		if not ok then
			ArkInventory.OutputError( ec )
			return
		end
		_G[f .. "ViewTableSelectedId"]:SetText( "-1" )
	else
		ArkInventory.OutputError( "OOPS: Uncoded value [", t, "] at ArkInventory.Frame_Rules_Button_Modify_Ok" )
		return
	end

	_G[fm]:Hide( )
	_G[f .. "View"]:Show( )

end

function ArkInventory.Frame_Rules_Button_Modify_Cancel( )

	f = this:GetParent( ):GetParent( ):GetParent( ):GetName( )
	
	_G[f .. "Modify"]:Hide( )
	_G[f .. "View"]:Show( )

end


function ArkInventory.Frame_Rules_Button_View_Add( )
	return ArkInventory.Frame_Rules_Button_Modify( "A" )
end

function ArkInventory.Frame_Rules_Button_View_Edit( )
	return ArkInventory.Frame_Rules_Button_Modify( "E" )
end

function ArkInventory.Frame_Rules_Button_View_Remove( )
	return ArkInventory.Frame_Rules_Button_Modify( "R" )
end




--[[

function Rule.Execute.SlotNumber_NOLONGERUSED( t )

	if not t or not n then return "false" end

	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do
		if n == tonumber( w ) then
			return "true"
		end
	end
	
	return "false"
	
end

function Rule.Execute.BagType_NOLONGERUSED( t )
	
	if not t or not b then return "false" end

	bt = ArkInventory.BagGetType( b )
	
	for w in t:gmatch( ArkInventory.Localise["RULE_PATTERN_SEP"] ) do

		for k, v in pairs( ArkInventory.Const.Slot.Data ) do
			if v["type"] and string.lower( v.type ) == string.lower( strtrim( w ) ) then
				if bt == k then
					return "true"
				end
			end
		end
		
	end
	
	return "false"
	
end

]]--


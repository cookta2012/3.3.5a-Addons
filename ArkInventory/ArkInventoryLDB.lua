ArkInventory.LDB = {
	Bags = ArkInventory.Lib.DataBroker:NewDataObject( ArkInventory.Const.Program.Name .. "_" .. ArkInventory.Const.Slot.Data[ArkInventory.Const.Location.Bag].name, {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Bag].Texture,
		text = ArkInventory.Const.Slot.Data[ArkInventory.Const.Location.Bag].name,
	} ),
	Money = ArkInventory.Lib.DataBroker:NewDataObject( ArkInventory.Const.Program.Name .. "_" .. MONEY, {
		type = "data source",
		icon = [[Interface\Icons\INV_Misc_Coin_02]],
		text = "Money",
	} ),
	Ammo = ArkInventory.Lib.DataBroker:NewDataObject( ArkInventory.Const.Program.Name .. "_Ammo", {
		type = "data source",
		icon = [[Interface\Icons\INV_Misc_Ammo_Bullet_02]],
		text = "Ammo",
	} ),
	Currency = ArkInventory.Lib.DataBroker:NewDataObject( ArkInventory.Const.Program.Name .. "_Currency", {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Token].Texture,
		text = "",
	} ),
	Pets = ArkInventory.Lib.DataBroker:NewDataObject( ArkInventory.Const.Program.Name .. "_Pet", {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Texture,
		text = "",
	} ),
	Mounts = ArkInventory.Lib.DataBroker:NewDataObject( ArkInventory.Const.Program.Name .. "_Mount", {
		type = "data source",
		icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Texture,
		text = "",
	} ),
}

function ArkInventory.LDB.Bags.OnClick( frame, button )
	if button == "RightButton" then
		ArkInventory.MenuLDBBagsOpen( frame )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Bag )
	end
end

function ArkInventory.LDB.Bags:Update( )
	local loc_id = ArkInventory.Const.Location.Bag
	--ArkInventory.LDB.Bags.icon = ArkInventory.Global.Location[loc_id].Texture
	self.text = ArkInventory.Frame_Status_Update_Empty( loc_id, ArkInventory.Global.Me, true )
end



function ArkInventory.LDB.Money:Update( )
	ArkInventory.LDB.Money.text = ArkInventory.MoneyText( GetMoney( ) )
end

function ArkInventory.LDB.Money:OnTooltipShow( )
	ArkInventory.MoneyFrame_Tooltip( self )
end



function ArkInventory.LDB.Ammo.OnClick( frame, button )
	if button == "RightButton" then
		ArkInventory.MenuLDBAmmoOpen( frame )
	end
end

function ArkInventory.LDB.Ammo:Update( )
	
	local inv_id, texture = GetInventorySlotInfo( "RangedSlot" )
	local hw = GetInventoryItemLink( "player", inv_id )
	
	if not hw then
		
		-- no ranged weapon equipped
		self.icon = texture
		self.text = ""
		
	else
		
		local d1, d2 = GetInventoryItemDurability( inv_id )
		if d1 == d2 then
			d1 = ""
		elseif d1 == 0 then
			d1 = RED_FONT_COLOR_CODE .. ArkInventory.Localise["LDB_AMMO_WEAPON_BROKEN"] .. FONT_COLOR_CODE_CLOSE
		else
			if ArkInventory.db.char.option.ldb.ammo.durability then
				d1 = string.format( "%i%%", ( d1 / d2 ) * 100 )
			else
				d1 = ""
			end
		end
		
		local needsammo = false
		
		inv_id = GetInventorySlotInfo( "AmmoSlot" )
		
		local check = { 264, 5011, 266 }
		for _, v in pairs( check ) do
			local wt = GetSpellInfo( v )
			if IsEquippedItemType( wt ) then --if select( 8, ArkInventory.ObjectInfo( hw ) ) == wt then
				needsammo = true
				break
			end
		end
		
		if not needsammo then
			
			self.icon = GetItemIcon( hw )
			self.text = d1
			
		else
			
			local na = RED_FONT_COLOR_CODE .. SPELL_FAILED_NO_AMMO .. FONT_COLOR_CODE_CLOSE
			
			local ha = GetInventoryItemLink( "player", inv_id )
			
			if not ha then
				
				-- use weapon icon
				self.icon = GetItemIcon( hw )
				
				-- show durability
				if d1 == "" then
					self.text = na
				else
					self.text = string.format( "%s (%s)", na, d1 )
				end
				
			else
				
				-- use ammo icon
				self.icon = GetItemIcon( ha )
				
				-- get ammo count
				local c = GetItemCount( ha )
				if c == 0 then c = na end
				
				-- show count and durability
				if d1 == "" then
					self.text = string.format( "%s", c )
				else
					self.text = string.format( "%s (%s)", c, d1 )
				end
				
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Ammo:OnTooltipShow( )

	local inv_id = GetInventorySlotInfo( "RangedSlot" )
	local h = GetInventoryItemLink( "player", inv_id )
	
	if not h then
		self:AddLine( ArkInventory.Localise["LDB_AMMO_WEAPON_NONE"] )
	else
		self:AddLine( h )
	end

end



function ArkInventory.LDB.Currency:Update( )
	
	self.icon = ArkInventory.Global.Location[ArkInventory.Const.Location.Token].Texture
	self.text = ""
	
	-- expand all token headers
	local numTokenTypes = GetCurrencyListSize( )
	
	if numTokenTypes == 0 then return end
	
	for j = numTokenTypes, 1, -1 do
		local _, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	local numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
	
		local name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon, item = GetCurrencyListInfo( j )
	
		if not isHeader and name == ArkInventory.db.char.option.ldb.currency.track then
			if currencyType == 1 then
				icon = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
			elseif currencyType == 2 then
				local factionGroup = UnitFactionGroup( "player" )
				if factionGroup then
					icon = [[Interface\PVPFrame\PVP-Currency-]] .. factionGroup
				end
			end
			self.icon = icon
			self.text = count
			return
		end
		
	end
	
end

function ArkInventory.LDB.Currency.OnClick( frame, button )
	if button == "RightButton" then
		ArkInventory.MenuLDBCurrencyOpen( frame )
	else
		ArkInventory.Frame_Main_Toggle( ArkInventory.Const.Location.Token )
	end
end

function ArkInventory.LDB.Currency:OnTooltipShow( )
	
	self:AddLine( CURRENCY )
	
	-- expand all token headers
	local numTokenTypes = GetCurrencyListSize( )
	
	if numTokenTypes == 0 then return end
	
	for j = numTokenTypes, 1, -1 do
		local _, isHeader, isExpanded = GetCurrencyListInfo( j )
		if isHeader and not isExpanded then
			ExpandCurrencyList( j, 1 )
		end
	end
	
	local numTokenTypes = GetCurrencyListSize( )
	
	for j = 1, numTokenTypes do
	
		local name, isHeader, isExpanded, isUnused, isWatched, count, currencyType, icon, item = GetCurrencyListInfo( j )
	
		if isHeader then
			self:AddLine( " " )
			self:AddLine( name )
		else
			if name == ArkInventory.db.char.option.ldb.currency.track then
				self:AddDoubleLine( name, count, 0, 1, 0, 0, 1, 0 )
			else
				self:AddDoubleLine( name, count, 1, 1, 1, 1, 1, 1 )
			end
		end
		
	end
	
end



function ArkInventory.LDB.Pets:Update( )
	
	self.icon = [[Interface\Icons\INV_Misc_Dice_01]]
	
	local type_id = "CRITTER"
	
	local track = ArkInventory.db.char.option.ldb.pets.track
	
	if track then
		for k = 1, GetNumCompanions( type_id ) do
			local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
			if creatureSpellID == track then
				self.icon = texture
				return
			end
		end
		
	end
	
end

function ArkInventory.LDB.Pets:OnTooltipShow( )
	
	local type_id = "CRITTER"
	
	local n = GetNumCompanions( type_id )
	if n == 0 then
		self:AddLine( string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Name, ArkInventory.Localise["LDB_COMPANION_NONE"] ) )
		return
	end
	
	local track = ArkInventory.db.char.option.ldb.pets.track
	
	if track then
		for k = 1, n do
			local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
			if creatureSpellID == track then
				self:AddLine( string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Name, creatureName ) )
				return
			end
		end
	else
		self:AddLine( string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Pet].Name, ArkInventory.Localise["RANDOM"] ) )
	end

end

function ArkInventory.LDB.Pets.OnClick( frame, button )

	if button == "RightButton" then
		
		ArkInventory.MenuLDBPetsOpen( frame )
		
	else
		
		local type_id = "CRITTER"
		local n = GetNumCompanions( type_id )
		
		if n == 0 then return end
		
		local track = ArkInventory.db.char.option.ldb.pets.track
		
		if not track then
			
			local ct = { } -- companion table
			for k = 1, n do
				local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
				local cd = ArkInventory.Const.CompanionData[creatureSpellID]
				if not active and cd and not cd.r then
					table.insert( ct, k )
				end
			end
			
			if #ct == 0 then return end
			
			CallCompanion( type_id, ct[random( 1, #ct )] )
			return
			
		else
			
			for k = 1, n do
				local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
				if creatureSpellID == track then
					CallCompanion( type_id, k )
					return
				end
			end
			
			ArkInventory.OutputError( "you seem to have misplaced your selected pet, resetting to random" )
			ArkInventory.db.char.option.ldb.pets.track = nil
			
		end
		
	end
	
end



function ArkInventory.LDB.Mounts:Update( )
	
	self.icon = [[Interface\Icons\INV_Misc_Dice_02]]
	
	local type_id = "MOUNT"
	
	local track = ArkInventory.db.char.option.ldb.mounts.ground.track
	if ArkInventory.LDB.Mounts.Flyable( ) then
		track = ArkInventory.db.char.option.ldb.mounts.flying.track
	end
	
	if track then
		for k = 1, GetNumCompanions( type_id ) do
			local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
			if creatureSpellID == track then
				self.icon = texture
				return
			end
		end
		
	end
	
end

function ArkInventory.LDB.Mounts:OnTooltipShow( )
	
	local type_id = "MOUNT"
	
	local n = GetNumCompanions( type_id )
	if n == 0 then
		self:AddLine( string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name, ArkInventory.Localise["LDB_COMPANION_NONE"] ) )
		return
	end
	
	local track = ArkInventory.db.char.option.ldb.mounts.ground.track
	if ArkInventory.LDB.Mounts.Flyable( ) then
		track = ArkInventory.db.char.option.ldb.mounts.flying.track
	end
	
	if track then
		for k = 1, n do
			local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
			if creatureSpellID == track then
				self:AddLine( string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name, creatureName ) )
				return
			end
		end
	else
		self:AddLine( string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name, ArkInventory.Localise["RANDOM"] ) )
	end
	
end

function ArkInventory.LDB.Mounts.OnClick( frame, button )
	
	if button == "RightButton" then
		
		ArkInventory.MenuLDBMountsOpen( frame )
		
	else
		
		if IsMounted( ) then
			
			if IsFlying( ) then
				if not ArkInventory.db.char.option.ldb.mounts.flying.dismount then
					ArkInventory.OutputWarning( ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_WARNING"] )
				else
					Dismount( )
				end
			else
				Dismount( )
			end
			
			return
			
		end
		
		
		local type_id = "MOUNT"
		local n = GetNumCompanions( type_id )
		if n == 0 then return end
		
		if ArkInventory.LDB.Mounts.Flyable( ) then
			
			-- find a flying mount
			
			local track = ArkInventory.db.char.option.ldb.mounts.flying.track
			
			if not track then
				
				-- random flying mount (default)
				
				local ct = { } -- companion table
				for k = 1, n do
					
					local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
					local cd = ArkInventory.Const.CompanionData[creatureSpellID]
					if not active and cd and not cd.r and ( cd.f and cd.f ~= 1 ) then
						if cd.s and ( cd.s == 0 or cd.s >= ArkInventory.db.char.option.ldb.mounts.flying.min ) then
							table.insert( ct, k )
						end
					end
					
				end
				
				if #ct == 0 then  -- no valid flying mounts, check for valid ground mounts
					
					for k = 1, n do
						local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
						local cd = ArkInventory.Const.CompanionData[creatureSpellID]
						if not active and cd and not cd.r and ( cd.f and cd.f ~= 2 ) then
							if cd.s and ( cd.s == 0 or cd.s >= ArkInventory.db.char.option.ldb.mounts.ground.min ) then
								table.insert( ct, k )
							end
						end
					end
					
				end
				
				if #ct == 0 then return end
				
				CallCompanion( type_id, ct[random( 1, #ct )] )
				return
				
			else
				
				-- specific flying mount
				for k = 1, n do
					local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
					if creatureSpellID == track then
						CallCompanion( type_id, k )
						return
					end
				end
				
				ArkInventory.OutputError( ArkInventory.Localise["LDB_COMPANION_MISSING"] )
				ArkInventory.db.char.option.ldb.mounts.flying.track = nil
				
			end
			
		else
			
			-- ground mount
			
			local track = ArkInventory.db.char.option.ldb.mounts.ground.track
			
			if not track then
				
				-- random ground mount (default)
			
				local ct = { } -- companion table
				local cd
				for k = 1, n do
					local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
					local cd = ArkInventory.Const.CompanionData[creatureSpellID]
					if not active and cd and not cd.r and ( cd.f and cd.f ~= 2 ) then
						if cd.s and ( cd.s == 0 or cd.s >= ArkInventory.db.char.option.ldb.mounts.ground.min ) then
							table.insert( ct, k )
						end
					end
				end
				
				if #ct == 0 then return end
				
				CallCompanion( type_id, ct[random( 1, #ct )] )
				return
				
			else
				
				-- specific ground mount
				for k = 1, n do
					creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
					if creatureSpellID == track then
						CallCompanion( type_id, k )
						return
					end
				end
				
				ArkInventory.OutputError( ArkInventory.Localise["LDB_COMPANION_MISSING"] )
				ArkInventory.db.char.option.ldb.mounts.ground.track = nil
				
			end
			
		end
		
	end
	
end

function ArkInventory.LDB.Mounts.Flyable( )

	local flyable = IsFlyableArea( )
	
	if flyable and GetRealZoneText( ) == "Wintergrasp" and not GetWintergraspWaitTime( ) then
		flyable = false
	end
	
	return flyable
	
end

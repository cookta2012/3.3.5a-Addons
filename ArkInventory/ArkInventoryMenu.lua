function ArkInventory.MenuMainOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local loc_id
		if frame.ARK_Data then
			loc_id = frame.ARK_Data.loc_id
		end
		
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
		local anchorpoints = {
			[ArkInventory.Const.Anchor.TopRight] = ArkInventory.Localise["TOPRIGHT"],
			[ArkInventory.Const.Anchor.BottomRight] = ArkInventory.Localise["BOTTOMRIGHT"],
			[ArkInventory.Const.Anchor.BottomLeft] = ArkInventory.Localise["BOTTOMLEFT"],
			[ArkInventory.Const.Anchor.TopLeft] = ArkInventory.Localise["TOPLEFT"],
		}

		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Const.Program.Name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)

					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CONFIG"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Config_Show( )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_ACTION"],
						"hasArrow", true,
						"value", "ACTIONS"
					)
					
				end
				
				
				if level == 2 and value then
				
					if value == "ACTIONS" then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MENU_ACTION"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["RELOAD"],
							"tooltipTitle", ArkInventory.Localise["RELOAD"],
							"tooltipText", ArkInventory.Localise["MENU_ACTION_RELOAD_TEXT"],
							--"icon", ArkInventory.Const.Texture.Action.Refresh,
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.ItemCacheClear( )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
						
					end
					
					
				end
				
				
				ArkInventory.Lib.DewDrop:AddLine( )
				ArkInventory.Lib.DewDrop:AddLine(
					"text", ArkInventory.Localise["CLOSE_MENU"],
					"closeWhenClicked", true
				)
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuBarOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then

		ArkInventory.Lib.DewDrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bar_id = frame.ARK_Data.bar_id
		local bar_name = ArkInventory.LocationOptionGet( loc_id, { "bar", "data", bar_id, "label" } ) or ""
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		
		local sid_def = ArkInventory.LocationOptionGet( loc_id, { "sort", "default" } ) or 9999
		local sid = ArkInventory.LocationOptionGet( loc_id, { "bar", "data", bar_id, "sortorder" } ) or sid_def
		
		if not ArkInventory.db.global.option.sort.data[sid].used then
			--ArkInventory.OutputWarning( "bar ", bar_id, " in location ", loc_id, " is using an invalid sort method.  resetting it to default" )
			ArkInventory.LocationOptionSet( loc_id, { "bar", "data", bar_id, "sortorder" }, nil )
			sid = sid_def
		end
		
		--ArkInventory.Output( "sid=[", sid, "] default=[", sid_def, "]" )
		
		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		local category = {
			["type"] = { "SYSTEM", "CONSUMABLE", "TRADE_GOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", "RULE", },
		}
		
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.format( ArkInventory.Localise["MENU_BAR_TITLE"], bar_id ),
						"isTitle", true,
						"textHeight", 12
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.format( "%s: %s%s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, bar_name, FONT_COLOR_CODE_CLOSE ),
						"tooltipTitle", ArkInventory.Localise["NAME"],
						"tooltipText", ArkInventory.Localise["CONFIG_SETTINGS_BARS_NAME_TEXT"],
						"hasArrow", true,
						"hasEditBox", true,
						"editBoxText", bar_name,
						"editBoxFunc", function( v )
							bar_name = string.trim( v )
							ArkInventory.LocationOptionSet( loc_id, { "bar", "data", bar_id, "label" }, bar_name )
							ArkInventory.Frame_Bar_Paint_All( )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["SORT_METHOD"] .. ":",
						"isTitle", true
					)
					
					if sid ~= sid_def then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["CURRENT"], GREEN_FONT_COLOR_CODE, ArkInventory.db.global.option.sort.data[sid].name, FONT_COLOR_CODE_CLOSE ),
							"hasArrow", true,
							"value", "SORT_METHOD"
						)
						
						--ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.db.global.option.sort.data[sid_def].name, FONT_COLOR_CODE_CLOSE ),
							"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEFAULT_RESET"],
							"tooltipText", ArkInventory.Localise["MENU_BAR_SORTKEY_DEFAULT_RESET_TEXT"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.LocationOptionSet( loc_id, { "bar", "data", bar_id, "sortorder" }, nil )
								ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Resort )
							end
						)
						
					else
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s: %s%s%s", ArkInventory.Localise["DEFAULT"], LIGHTYELLOW_FONT_COLOR_CODE, ArkInventory.db.global.option.sort.data[sid_def].name, FONT_COLOR_CODE_CLOSE ),
							"hasArrow", true,
							"value", "SORT_METHOD"
						)
						
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAR_CATEGORY_CURRENT"] .. ":",
						"isTitle", true
					)
					
					local has_entries = false
					for _, v in ipairs( category.type ) do
						if ArkInventory.CategoryBarHasEntries( loc_id, bar_id, v ) then
							has_entries = true
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["CATEGORY_" .. v],
								"hasArrow", true,
								"value", "CATEGORY_CURRENT_" .. v
							)
						end
					end
					
					if not has_entries then
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["NONE"],
							"disabled", true
						)
					end

					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAR_CATEGORY_ASSIGN"] .. ":",
						"isTitle", true
					)
					for _, v in ipairs( category.type ) do
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CATEGORY_" .. v],
							"hasArrow", true,
							"value", "CATEGORY_ASSIGN_" .. v
						)
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAR_OPTIONS"] .. ": ",
						"isTitle", true
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLEAR"],
						"tooltipTitle", ArkInventory.Localise["CLEAR"],
						"tooltipText", ArkInventory.Localise["MENU_BAR_CLEAR_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Clear( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["INSERT"],
						"tooltipTitle", ArkInventory.Localise["INSERT"],
						"tooltipText", ArkInventory.Localise["MENU_BAR_INSERT_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Insert( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["REMOVE"],
						"tooltipTitle", ArkInventory.Localise["REMOVE"],
						"tooltipText", ArkInventory.Localise["MENU_BAR_REMOVE_TEXT"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Bar_Remove( loc_id, bar_id )
							ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MOVE"],
						"tooltipTitle", ArkInventory.Localise["MOVE"],
						"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_MOVE_START_TEXT"], bar_id ),
						"disabled", ArkInventory.Global.Options.BarMoveLocation == loc_id and ArkInventory.Global.Options.BarMoveSource == bar_id,
						--"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Global.Options.BarMoveLocation = loc_id
							ArkInventory.Global.Options.BarMoveSource = bar_id
							--ArkInventory.Frame_Bar_Paint_All( )
						end
					)
					
					if ArkInventory.Global.Options.BarMoveLocation == loc_id and ArkInventory.Global.Options.BarMoveSource ~= bar_id then
						ArkInventory.Lib.DewDrop:AddLine(
							"text", string.format( "%s > %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipTitle", string.format( "%s > %s", ArkInventory.Localise["MOVE"], ArkInventory.Localise["COMPLETE"] ),
							"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_MOVE_COMPLETE_TEXT"], ArkInventory.Global.Options.BarMoveSource ),
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.Global.Options.BarMoveDestination = bar_id
								ArkInventory.Frame_Bar_Move( loc_id, ArkInventory.Global.Options.BarMoveSource, ArkInventory.Global.Options.BarMoveDestination )
								ArkInventory.Global.Options.BarMoveLocation = nil
								ArkInventory.Global.Options.BarMoveSource = nil
								ArkInventory.Global.Options.BarMoveDestination = nil
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
					
					if value == "SORT_METHOD" then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["SORT_METHOD"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						for k, v in pairs( ArkInventory.db.global.option.sort.data ) do
							
							if v.used and k ~= sid_def then
							ArkInventory.Lib.DewDrop:AddLine(
								"text", v.name,
								"tooltipTitle", ArkInventory.Localise["SORT_METHOD"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_SORTKEY_TEXT"], v.name ),
								"isRadio", true,
								"checked", k == sid,
								"disabled", k == sid or k == sid_def,
								"closeWhenClicked", true,
								"func", function( )
									if k == sid_def then
										ArkInventory.LocationOptionSet( loc_id, { "bar", "data", bar_id, "sortorder" }, nil )
									else
										ArkInventory.LocationOptionSet( loc_id, { "bar", "data", bar_id, "sortorder" }, k )
									end
									ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Resort )
								end
							)
							end
							
						end
						
					end
					
					
					if strsub( value, 1, 17 ) == "CATEGORY_CURRENT_" then

						local cat_type = strmatch( value, "^CATEGORY_CURRENT_(.+)" )
				
						if cat_type ~= nil then
					
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["CATEGORY_" .. cat_type],
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.DewDrop:AddLine( )
							local has_entries = false
							for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do

								local t = cat.type_code
								local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
								
								if abs( cat_bar ) == bar_id and not def_bar then
							
									if t == "RULE" then
										local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
										if not ArkInventory.db.profile.option.rule[cat_code] then
											t = "DO_NOT_USE" -- don't display disabled rules
										end
									end
						
									if cat_type == t then
		
										local tag_colour = GREEN_FONT_COLOR_CODE
										if cat_bar < 0 then
											tag_colour = RED_FONT_COLOR_CODE
										end
		
										has_entries = true
										ArkInventory.Lib.DewDrop:AddLine(
											"text", tag_colour .. cat.name,
											"tooltipTitle", cat.fullname,
											"hasArrow", true,
											"value", "CATEGORY_CURRENT_OPTION_" .. cat.id
										)
										
									end
						
								end
	
							end
							
							if not has_entries then
								ArkInventory.Lib.DewDrop:AddLine(
									"text", ArkInventory.Localise["NONE"],
									"disabled", true
								)
							end
							
						end

					end

					
					if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
						local cat_type = strmatch( value, "^CATEGORY_ASSIGN_(.+)" )
				
						if cat_type ~= nil then
					
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["CATEGORY_" .. cat_type],
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.DewDrop:AddLine( )
							for _, cat in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do

								local t = cat.type_code
								local cat_bar, def_bar = ArkInventory.CategoryLocationGet( loc_id, cat.id )
							
								if abs( cat_bar ) == bar_id and not def_bar then
									t = "DO_NOT_USE" -- change the category so it doesn't display
								end

								if t == "RULE" then
									local _, cat_code = ArkInventory.CategoryCodeSplit( cat.id )
									if not ArkInventory.db.profile.option.rule[cat_code] then
										t = "DO_NOT_USE" -- don't display disabled rules
									end
								end
								
								if cat_type == t then
	
									local n = cat.name
	
									if not def_bar then
										-- category is assigned to a bar - show the user where
										n = LIGHTYELLOW_FONT_COLOR_CODE .. cat.name .. GREEN_FONT_COLOR_CODE .. "  [" .. ArkInventory.CategoryLocationGet( loc_id, cat.id ) .. "]" .. FONT_COLOR_CODE_CLOSE
									end
	
									ArkInventory.Lib.DewDrop:AddLine(
										"text", n,
										"tooltipTitle", ArkInventory.Localise["MENU_BAR_CATEGORY"],
										"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_TEXT"], cat.fullname ),
										"func", function( )
											ArkInventory.CategoryLocationSet( loc_id, cat.id, bar_id )
											ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
										end
									)
								end
	
							end
							
						end
						
					end

					
				end

				
				if level == 3 and value then
				
					if strsub( value, 1, 24 ) == "CATEGORY_CURRENT_OPTION_" then
					
						local cat_id = strmatch( value, "^CATEGORY_CURRENT_OPTION_(.+)" )
				
						if cat_id ~= nil then
					
							local cat = ArkInventory.Global.Category[cat_id]
						
							ArkInventory.Lib.DewDrop:AddLine(
								"text", cat.fullname,
								"isTitle", true,
								"textHeight", 12
							)

							ArkInventory.Lib.DewDrop:AddLine( )
							
							local cv = ArkInventory.CategoryLocationGet( loc_id, cat_id )
							local ch = false
							
							if cv < 0 then
								ch = true
								cv = abs( cv )
							end
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", string.format( ArkInventory.Localise["MENU_ITEM_MOVE"], LIGHTYELLOW_FONT_COLOR_CODE .. cat.fullname .. FONT_COLOR_CODE_CLOSE ),
								"hasArrow", true,
								"hasSlider", true,
								"sliderValue", cv,
								"sliderMin", 1,
								"sliderMax", ArkInventory.Global.Location[loc_id].Layout.bar_count + 1,
								"sliderStep", 1,
								"sliderFunc", function( nv )
									if cv ~= nv then
										if ch then
											nv = 0 - nv
										end
										ArkInventory.CategoryLocationSet( loc_id, cat_id, nv )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								end
							)

							ArkInventory.Lib.DewDrop:AddLine( )
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["REMOVE"],
								"tooltipTitle", ArkInventory.Localise["REMOVE"],
								"tooltipText", string.format( ArkInventory.Localise["MENU_BAR_CATEGORY_REMOVE_TEXT"], cat.fullname, bar_id ),
								"func", function( )
									ArkInventory.CategoryLocationSet( loc_id, cat_id, nil )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)

							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["HIDE"],
								"tooltipTitle", ArkInventory.Localise["HIDE"],
								"tooltipText", ArkInventory.Localise["MENU_BAR_CATEGORY_HIDDEN_TEXT"],
								"checked", ArkInventory.CategoryHiddenCheck( loc_id, cat_id ),
								"func", function( )
									ArkInventory.CategoryHiddenToggle( loc_id, cat_id )
									ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
								end
							)
					
						end
						
					end

				end
				
			end
		)

	end
	
end

function ArkInventory.MenuItemOpen( frame )

	if ArkInventory.Global.Mode.Edit == false then
		return
	end

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local bliz_id = ArkInventory.BagID_Blizzard( loc_id, bag_id )
		local slot_id = frame.ARK_Data.slot_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local i = ArkInventory.Frame_Item_GetDB( frame )
		
		local isEmpty = false
		if not i or i.h == nil then
			isEmpty = true
		end
	
	
		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		local ic = select( 4, GetItemQualityColor( i.q ) )
		local cat0, cat1, cat2 = ArkInventory.ItemCategoryGet( i )
		local bar_id = abs( ArkInventory.CategoryLocationGet( loc_id, cat0 ) )
		
		local categories = { "SYSTEM", "CONSUMABLE", "TRADE_GOODS", "SKILL", "CLASS", "EMPTY", "CUSTOM", }
		
		cat0 = ArkInventory.Global.Category[cat0] or cat0
		if type( cat0 ) ~= "table" then
			cat0 = { id = cat0, fullname = string.format( ArkInventory.Localise["CONFIG_CATEGORY_DELETED"], cat0 ) }
		end
		
		if cat1 then
			cat1 = ArkInventory.Global.Category[cat1] or cat1
			if type( cat1 ) ~= "table" then
				cat1 = { id = cat1, fullname = string.format( ArkInventory.Localise["CONFIG_CATEGORY_DELETED"], cat1 ) }
			end
		end
		
		cat2 = ArkInventory.Global.Category[cat2] or cat2
		if type( cat2 ) ~= "table" then
			cat2 = { id = cat2, fullname = string.format( ArkInventory.Localise["CONFIG_CATEGORY_DELETED"], cat2 ) }
		end
		
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_ITEM_TITLE"] .. ":",
						"isTitle", true,
						"textHeight", 12
					)
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_ITEM_ITEM"] .. ": " .. ic .. ( select( 3, ArkInventory.ObjectInfo( i.h ) ) or "" )
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					if cat1 then
					
						-- item has a category, that means it's been specifically assigned away from the default
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CURRENT"] .. ": " .. GREEN_FONT_COLOR_CODE .. cat1.fullname .. FONT_COLOR_CODE_CLOSE,
							"notClickable", true
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["DEFAULT"] .. ": " .. LIGHTYELLOW_FONT_COLOR_CODE .. cat2.fullname .. FONT_COLOR_CODE_CLOSE,
							"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEFAULT_RESET"],
							"tooltipText", ArkInventory.Localise["MENU_ITEM_DEFAULT_RESET_TEXT"],
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.ItemCategorySet( i, nil )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						)
					
					else
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["DEFAULT"] .. ": " .. LIGHTYELLOW_FONT_COLOR_CODE .. cat2.fullname .. FONT_COLOR_CODE_CLOSE,
							"notClickable", true
						)
					
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_ITEM_ASSIGN_CHOICES"] .. ":",
						"isTitle", true
					)
					for _, v in ipairs( categories ) do
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CATEGORY_" .. v],
							"disabled", isEmpty,
							"hasArrow", true,
							"tooltipTitle", ArkInventory.Localise["MENU_ITEM_ASSIGN_THIS"],
							"tooltipText", ArkInventory.Localise["MENU_ITEM_ASSIGN_THIS_TEXT"],
							"value", "CATEGORY_ASSIGN_" .. v
						)
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.format( ArkInventory.Localise["MENU_ITEM_MOVE"], LIGHTYELLOW_FONT_COLOR_CODE .. cat0.fullname .. FONT_COLOR_CODE_CLOSE ),
						"hasArrow", true,
						"hasSlider", true,
						"sliderValue", ArkInventory.CategoryLocationGet( loc_id, cat0.id ),
						"sliderMin", 1,
						"sliderMax", ArkInventory.Global.Location[loc_id].Layout.bar_count + 1,
						"sliderStep", 1,
						"sliderFunc", function( v )
							if ArkInventory.CategoryLocationGet( loc_id, cat0.id ) ~= v then
								ArkInventory.CategoryLocationSet( loc_id, cat0.id, v )
								ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
							end
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_ITEM_DEBUG"],
						"hasArrow", true,
						"value", "DEBUG_INFO"
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
				
					if value == "DEBUG_INFO" then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MENU_ITEM_DEBUG"],
							"isTitle", true,
							"textHeight", 12
						)
						
						local class, id = ArkInventory.ObjectStringDecode( i.h )
						local bagtype = ArkInventory.Const.Slot.Data[ArkInventory.BagType( bliz_id )].type
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["LOCATION"], LIGHTYELLOW_FONT_COLOR_CODE, loc_id, ArkInventory.Global.Location[loc_id].Name ) )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_BAG"], LIGHTYELLOW_FONT_COLOR_CODE, bag_id, bliz_id ) )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_SLOT"], LIGHTYELLOW_FONT_COLOR_CODE, slot_id, bagtype ) )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s", "sort key", ArkInventory.ItemSortKeyGenerate( i, bar_id ) ) )
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_CLASS"], LIGHTYELLOW_FONT_COLOR_CODE, class ) )
						
						if i.h then
							
							local class, ilnk, inam, itxt, irar, ilvl, imin, ityp, isub, icount, iloc = ArkInventory.ObjectInfo( i.h )
							
							iloc = _G[iloc]
							if not iloc then
								iloc = ""
							end

							ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["NAME"], LIGHTYELLOW_FONT_COLOR_CODE, inam ) )
							
							if class == "item" then
							
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s (%s)", ArkInventory.Localise["MENU_ITEM_DEBUG_QUALITY"], LIGHTYELLOW_FONT_COLOR_CODE, irar, _G["ITEM_QUALITY" .. irar .. "_DESC"] ) )
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_ITEM"], LIGHTYELLOW_FONT_COLOR_CODE, ilvl ) )
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_LVL_USE"], LIGHTYELLOW_FONT_COLOR_CODE, imin ) )
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, ityp ) )
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_SUBTYPE"], LIGHTYELLOW_FONT_COLOR_CODE, isub ) )
								
								if iloc ~= "" then
									ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_EQUIP"], LIGHTYELLOW_FONT_COLOR_CODE, iloc ) )
								end
								
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_STACK"], LIGHTYELLOW_FONT_COLOR_CODE, icount ) )
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, itxt ) )
								
								local ifam = GetItemFamily( i.h )
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_FAMILY"], LIGHTYELLOW_FONT_COLOR_CODE, ifam ) )
							
							elseif class == "spell" then
							
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_TYPE"], LIGHTYELLOW_FONT_COLOR_CODE, string.lower( i.type ) ) )
								
								ArkInventory.Lib.DewDrop:AddLine( )
								
								ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["TEXTURE"], LIGHTYELLOW_FONT_COLOR_CODE, itxt ) )
								
							end
							
						end
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_SHORT"], LIGHTYELLOW_FONT_COLOR_CODE, id ) )
						
						local cid = ArkInventory.ObjectIDCacheCategory( i )
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_CACHE"], LIGHTYELLOW_FONT_COLOR_CODE, cid ) )
						
						ArkInventory.Lib.DewDrop:AddLine( "text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_CATEGORY"], LIGHTYELLOW_FONT_COLOR_CODE, cat0.id ) )
						
						if i.h then
							
							if class == "item" then
								local rid = ArkInventory.ObjectIDInternal( i.h )
								rid = strmatch( rid, "^.-%:(.+)" )
								ArkInventory.Lib.DewDrop:AddLine(
									"text", string.format( "%s: %s%s", ArkInventory.Localise["MENU_ITEM_DEBUG_AI_ID_RULE"], LIGHTYELLOW_FONT_COLOR_CODE, rid ),
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", rid
								)
							end
							
							ArkInventory.Lib.DewDrop:AddLine( )
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["MENU_ITEM_DEBUG_PT"],
								"hasArrow", true,
								"tooltipTitle", ArkInventory.Localise["MENU_ITEM_DEBUG_PT"],
								"tooltipText", ArkInventory.Localise["MENU_ITEM_DEBUG_PT_TEXT"],
								"value", "DEBUG_INFO_PT"
							)
							
						end
						
					end
					
					if strsub( value, 1, 16 ) == "CATEGORY_ASSIGN_" then
					
						local k = strmatch( value, "CATEGORY_ASSIGN_(.+)" )
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["CATEGORY_" .. k],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
					
						for _, v in ArkInventory.spairs( ArkInventory.Global.Category, function(a,b) return ArkInventory.Global.Category[a].fullname < ArkInventory.Global.Category[b].fullname end ) do
					
							local t = v.type_code
							if v.id == cat0.id then
								t = "DO_NOT_USE"
							end
							
							--ArkInventory.Output( "id=" .. cat.id .. ", type=[" .. cat.type .. "], value=[" .. value .. "]" )
							if k == t then
								--~~~~
								ArkInventory.Lib.DewDrop:AddLine(
									"text", v.name,
									"tooltipTitle", "Assign to Category",
									"tooltipText", "assign this item to " .. v.fullname, --~~~~ check this
									"closeWhenClicked", true,
									"func", function( )
										ArkInventory.ItemCategorySet( i, v.id )
										ArkInventory.Frame_Main_Generate( nil, ArkInventory.Const.Window.Draw.Recalculate )
									end
								)
							
							end
							
						end
						
						if k == "CUSTOM" then
						
							ArkInventory.Lib.DewDrop:AddLine( )
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["MENU_ITEM_CUSTOM_NEW"],
								"hasArrow", true,
								"hasEditBox", true,
								"editBoxText", "",
								"closeWhenClicked", true,
								"editBoxFunc", function( v )
									ArkInventory.CategoryCustomAdd( v )
								end
							)
							
						end
						
					end
					
				end
				
				
				if level == 3 and value then
					
					if value == "DEBUG_INFO_PT" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MENU_ITEM_DEBUG_PT_TITLE"] .. ":",
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						--local pt_set = ArkInventory.Lib.PeriodicTable:ItemSearch( i.h )
						local pt_set = ArkInventory.PTItemSearch( i.h )
						
						if not pt_set then
						
							ArkInventory.Lib.DewDrop:AddLine( "text", LIGHTYELLOW_FONT_COLOR_CODE .. ArkInventory.Localise["MENU_ITEM_DEBUG_PT_NONE"] )
						
						else
						
							for k, v in pairs( pt_set ) do
								ArkInventory.Lib.DewDrop:AddLine(
									"text", v,
									"hasArrow", true,
									"hasEditBox", true,
									"editBoxText", v
								)
							end
							
						end
						
					end
				
				end
				
			end
			
		)
		
	end
	
end


function ArkInventory.MenuBagOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local player_id = cp.info.player_id
		
		local bag = cp.location[loc_id].bag[bag_id]
		
		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "BOTTOMRIGHT" -- TOPRIGHT
			rp = "TOPLEFT" -- BOTTOMLEFT
		else
			p = "BOTTOMLEFT" -- TOPLEFT
			rp = "TOPRIGHT" -- BOTTOMRIGHT
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then

					ArkInventory.Lib.DewDrop:AddLine(
						--"text", string.upper( string.format( ArkInventory.Localise["MENU_BAG_TITLE"], bag_id ) ),
						"text", ArkInventory.Localise["MENU_BAG_TITLE"],
						"isTitle", true,
						"icon", bag.texture,
						"textHeight", 12
					)
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAG_SHOW"],
						"tooltipTitle", ArkInventory.Localise["MENU_BAG_SHOW"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_SHOW_TEXT"],
						"checked", ArkInventory.db.realm.player.data[player_id].display[loc_id].bag[bag_id],
						"func", function( )
							ArkInventory.db.realm.player.data[player_id].display[loc_id].bag[bag_id] = not ArkInventory.db.realm.player.data[player_id].display[loc_id].bag[bag_id]
							ArkInventory.Lib.DewDrop:Close( )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAG_ISOLATE"],
						"tooltipTitle", ArkInventory.Localise["MENU_BAG_ISOLATE"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_ISOLATE_TEXT"],
						"func", function( )
							for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
								if x == bag_id then
									ArkInventory.db.realm.player.data[player_id].display[loc_id].bag[x] = true
								else
									ArkInventory.db.realm.player.data[player_id].display[loc_id].bag[x] = false
								end
							end
							ArkInventory.Lib.DewDrop:Close( )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)

					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_BAG_SHOWALL"],
						"tooltipTitle", ArkInventory.Localise["MENU_BAG_SHOWALL"],
						"tooltipText", ArkInventory.Localise["MENU_BAG_SHOWALL_TEXT"],
						"func", function( )
							for x in pairs( ArkInventory.Global.Location[loc_id].Bags ) do
								ArkInventory.db.realm.player.data[player_id].display[loc_id].bag[x] = true
							end
							ArkInventory.Lib.DewDrop:Close( )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
				end

			end
		)
		
	end
	
end

function ArkInventory.MenuVaultTabOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
		
	else

		local loc_id = frame.ARK_Data.loc_id
		local bag_id = frame.ARK_Data.bag_id
		local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
		local bag = cp.location[loc_id].bag[bag_id]
		local button = _G[ArkInventory.Const.Frame.Main.Name .. loc_id .. ArkInventory.Const.Frame.Changer.Name .. "WindowBag" .. bag_id]

		
		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "TOPLEFT"
		else
			p = "TOPLEFT"
			rp = "TOPRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				if level == 1 then
				
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.format( "%s: %s", GUILD_BANK, string.format( GUILDBANK_TAB_NUMBER, bag_id ) ),
						"isTitle", true,
						"icon", bag.texture,
						"textHeight", 12
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", bag.name,
						"isTitle", true,
						"textHeight", 12
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					if not ArkInventory.Global.Location[loc_id].isOffline then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "request tab data",
							"closeWhenClicked", true,
							"func", function( )
								ArkInventory.ScanVault( )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
					end
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", "mode: " .. GUILD_BANK,
						"closeWhenClicked", true,
						"disabled", GuildBankFrame.mode == "bank",
						"func", function( )
							ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "bank" )
							ArkInventory.Frame_Main_Generate( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
						end
					)
					
					if not ArkInventory.Global.Location[loc_id].isOffline then
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "mode: " .. GUILD_BANK_LOG,
							"closeWhenClicked", true,
							"disabled", GuildBankFrame.mode == "log",
							"func", function( )
								ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
								ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "log" )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "mode: " .. GUILD_BANK_MONEY_LOG,
							"closeWhenClicked", true,
							"disabled", GuildBankFrame.mode == "moneylog",
							"func", function( )
								ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
								ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "moneylog" )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", "mode: " .. GUILD_BANK_TAB_INFO,
							"closeWhenClicked", true,
							"disabled", GuildBankFrame.mode == "tabinfo",
							"func", function( )
								ArkInventory.Frame_Main_DrawStatus( loc_id, ArkInventory.Const.Window.Draw.Recalculate )
								ArkInventory.Frame_Changer_Vault_Tab_OnClick( button, "LeftButton", "tabinfo" )
							end
						)
						
						if IsGuildLeader( ) then
						
							ArkInventory.Lib.DewDrop:AddLine( )
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", "change name or icon",
								"closeWhenClicked", true,
								"func", function( )
									SetCurrentGuildBankTab( bag_id )
									GuildBankPopupFrame:Show( )
									GuildBankPopupFrame_Update( bag_id )
								end
							)
							
						end
						
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
			
			end
			
		)
		
	end
	
end


function ArkInventory.MenuSwitchLocation( frame, level, value, offset )

	ArkInventory.Lib.DewDrop:AddLine(
		"text", ArkInventory.Localise["MENU_LOCATION_SWITCH"],
		"isTitle", true,
		"textHeight", 12
	)
	
	if level == offset + 1 then
	
		for set_id, loc in ipairs( ArkInventory.Global.Location ) do
			if ArkInventory.Global.Location[set_id].canView then
				ArkInventory.Lib.DewDrop:AddLine(
					"text", loc.Name,
					"tooltipTitle", loc.Name,
					"tooltipText", string.format( ArkInventory.Localise["MENU_LOCATION_SWITCH_TEXT"], loc.Name ),
					"icon", loc.Texture,
					"closeWhenClicked", true,
					"func", function( )
						ArkInventory.Frame_Main_Toggle( set_id )
					end
				)
			end
		end
		
	end
	
end

function ArkInventory.MenuSwitchLocationOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
			
				ArkInventory.MenuSwitchLocation( frame, level, value, 0 )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
		)

	end
	
end

function ArkInventory.MenuSwitchCharacter( frame, level, value, offset )
	
	local loc_id = frame.ARK_Data.loc_id
	local cp = ArkInventory.LocationPlayerInfoGet( loc_id )
	
	if level == offset + 1 then
	
		ArkInventory.Lib.DewDrop:AddLine(
			"text", ArkInventory.Localise["MENU_CHARACTER_SWITCH"],
			"isTitle", true,
			"textHeight", 12
		)
		
		local fc = 0
		
			local count = 0
		
			for n, tp in ArkInventory.spairs( ArkInventory.db.realm.player.data, function(a,b) return a < b end ) do
			
				local show = false
				
				if loc_id ~= ArkInventory.Const.Location.Vault then
					
					if string.sub( n, 1, 1 ) ~= ArkInventory.Const.GuildTag then
						show = true
					end
					
				else
				
					tp = ArkInventory.PlayerInfoGet( tp.info.guild_id )
					
					if string.sub( n, 1, 1 ) == ArkInventory.Const.GuildTag then
						show = true
					end
				
				end
				
				if not tp or tp.location[loc_id].slot_count == 0 then
					show = false
				end
				
				if show then
					
					count = count + 1
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.DisplayName4( tp.info ),
						--"tooltipTitle", "",
						--"tooltipText", "",
						"hasArrow", true,
						"isRadio", true,
						"checked", cp.info.player_id == tp.info.player_id,
						--"notClickable", cp.info.player_id == tp.info.player_id,
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Main_Show( loc_id, tp.info.player_id )
						end,
						"value", ( "SWITCH_CHARACTER_SWITCH_" .. tp.info.player_id )
					)
					
				end
				
			end
			
			
			if count == 0 then
			
				ArkInventory.Lib.DewDrop:AddLine(
					"text", "no data availale",
					"disabled", true
				)
				
			end
			
		end
	
	if level == offset + 2 and value then

		local player_id = strmatch( value, "^SWITCH_CHARACTER_SWITCH_(.+)" )
		local tp = ArkInventory.PlayerInfoGet( player_id )
		
		ArkInventory.Lib.DewDrop:AddLine(
			"text", ArkInventory.DisplayName4( tp.info ),
			"isTitle", true,
			"textHeight", 12
		)
		
		ArkInventory.Lib.DewDrop:AddLine( )
		
		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
			"tooltipTitle", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Global.Location[loc_id].Name ),
			"tooltipText", RED_FONT_COLOR_CODE .. string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_TEXT"], ArkInventory.Global.Location[loc_id].Name, ArkInventory.DisplayName1( tp.info ) ),
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Frame_Main_Hide( loc_id )
				ArkInventory.EraseSavedData( tp.info.player_id, loc_id )
			end
		)
		
		ArkInventory.Lib.DewDrop:AddLine(
			"text", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["LOCATION_ALL"] ),
			"tooltipTitle", string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE"], ArkInventory.Localise["LOCATION_ALL"] ),
			"tooltipText", RED_FONT_COLOR_CODE .. string.format( ArkInventory.Localise["MENU_CHARACTER_SWITCH_ERASE_TEXT"], ArkInventory.Localise["LOCATION_ALL"], ArkInventory.DisplayName1( tp.info ) ),
			"closeWhenClicked", true,
			"func", function( )
				ArkInventory.Frame_Main_Hide( )
				ArkInventory.EraseSavedData( tp.info.player_id )
			end
		)
	
	end

end

function ArkInventory.MenuSwitchCharacterOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetLeft( ) + ( this:GetRight( ) - this:GetLeft( ) ) / 2
		if ( x >= ( GetScreenWidth( ) / 2 ) ) then
			p = "TOPRIGHT"
			rp = "BOTTOMLEFT"
		else
			p = "TOPLEFT"
			rp = "BOTTOMRIGHT"
		end
		
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				ArkInventory.MenuSwitchCharacter( frame, level, value, 0 )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuLDBBagsOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetBottom( ) + ( this:GetTop( ) - this:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Const.Program.Name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CONFIG"],
						"closeWhenClicked", true,
						"func", function( )
							ArkInventory.Frame_Config_Show( )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_ACTION"],
						"hasArrow", true,
						"value", "ACTIONS"
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["MENU_LOCATION_SWITCH"],
						"hasArrow", true,
						"value", "LOCATION"
					)
						
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["FONT"],
						"hasArrow", true,
						"value", "FONT"
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["LDB"],
						"hasArrow", true,
						"value", "LDB"
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
				
				if level == 2 and value then
				
					if value == "LOCATION" then
						ArkInventory.MenuSwitchLocation( frame, level, value, 1 )
					end
					
					if value == "FONT" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["FONT"],
							"isTitle", true,
							"textHeight", 12
						)
						
						for _, fontName in pairs( ArkInventory.Lib.SharedMedia:List( "font" ) ) do
							ArkInventory.Lib.DewDrop:AddLine(
								"text", fontName,
								"tooltipTitle", ArkInventory.Localise["FONT"],
								"tooltipText", string.format( ArkInventory.Localise["CONFIG_SYSTEM_FONT_TEXT"], fontName ),
								"checked", fontName == ArkInventory.db.profile.option.font.name,
								"func", function( )
									ArkInventory.MediaSetFontAll( fontName )
								end
							)
						end
						
					end
					
					if value == "ACTIONS" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["MENU_ACTION"],
							"isTitle", true,
							"textHeight", 12
						)
						
						for k, v in pairs( ArkInventory.Const.Actions ) do
							if v.LDB then
								ArkInventory.Lib.DewDrop:AddLine(
									"text", v.Name,
									"closeWhenClicked", true,
									"icon", v.Texture,
									"func", v.Scripts.OnClick
								)
							end
						end
						
					end
					
					if value == "LDB" then
					
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LDB"],
							"isTitle", true,
							"textHeight", 12
						)
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
							"tooltipTitle", ArkInventory.Localise["LDB_BAGS_COLOUR_USE"],
							"tooltipText", ArkInventory.Localise["LDB_BAGS_COLOUR_USE_TEXT"],
							"checked", ArkInventory.db.char.option.ldb.bags.colour,
							"func", function( )
								ArkInventory.db.char.option.ldb.bags.colour = not ArkInventory.db.char.option.ldb.bags.colour
								ArkInventory.LDB.Bags:Update( )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LDB_BAGS_STYLE"],
							"tooltipTitle", ArkInventory.Localise["LDB_BAGS_STYLE"],
							"tooltipText", ArkInventory.Localise["LDB_BAGS_STYLE_TEXT"],
							"checked", ArkInventory.db.char.option.ldb.bags.full,
							"func", function( )
								ArkInventory.db.char.option.ldb.bags.full = not ArkInventory.db.char.option.ldb.bags.full
								ArkInventory.LDB.Bags:Update( )
							end
						)
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
							"tooltipTitle", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE"],
							"tooltipText", ArkInventory.Localise["LDB_BAGS_INCLUDE_TYPE_TEXT"],
							"checked", ArkInventory.db.char.option.ldb.bags.includetype,
							"func", function( )
								ArkInventory.db.char.option.ldb.bags.includetype = not ArkInventory.db.char.option.ldb.bags.includetype
								ArkInventory.LDB.Bags:Update( )
							end
						)
						
					end
					
					
				end
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuLDBAmmoOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetBottom( ) + ( this:GetTop( ) - this:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.LDB.Ammo.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["LDB_AMMO_INCLUDE_DURABILITY"],
						"tooltipTitle", ArkInventory.Localise["LDB_AMMO_INCLUDE_DURABILITY"],
						--"tooltipText", "tooltipText",
						"checked", ArkInventory.db.char.option.ldb.ammo.durability,
						"func", function( )
							ArkInventory.db.char.option.ldb.ammo.durability = not ArkInventory.db.char.option.ldb.ammo.durability
							ArkInventory.LDB.Ammo:Update( )
						end
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
			
		)
	
	end
	
end

function ArkInventory.MenuLDBCurrencyOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetBottom( ) + ( this:GetTop( ) - this:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.LDB.Currency.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					-- expand all token headers
					local numTokenTypes = GetCurrencyListSize( )
	
					if numTokenTypes > 0 then
						
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
								
								ArkInventory.Lib.DewDrop:AddLine( )
								ArkInventory.Lib.DewDrop:AddLine(
									"text", name,
									"isTitle", true
								)
								
							else
								
								if currencyType == 1 then
									icon = [[Interface\PVPFrame\PVP-ArenaPoints-Icon]]
								elseif currencyType == 2 then
									local factionGroup = UnitFactionGroup( "player" )
									if factionGroup then
										icon = [[Interface\PVPFrame\PVP-Currency-]] .. factionGroup
									end
								end
			
								local checked = ArkInventory.db.char.option.ldb.currency.track == name
								local tooltipText = ArkInventory.Localise["LDB_CURRENCY_SELECT"]
								
								if checked then
									name = "|cff00ff00" .. name
									tooltipText = ArkInventory.Localise["LDB_CURRENCY_DESELECT"]
								end
								
								ArkInventory.Lib.DewDrop:AddLine(
									"icon", icon,
									"text", name,
									"tooltipTitle", name,
									"tooltipText", tooltipText,
									"checked", checked,
									"func", function( )
										if checked then
											ArkInventory.db.char.option.ldb.currency.track = nil
										else
											ArkInventory.db.char.option.ldb.currency.track = name
										end
										ArkInventory.LDB.Currency:Update( )
									end
								)
								
							end
							
						end
						
					end
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
			
		)
	
	end
	
end


function ArkInventory.MenuLDBPetsOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetBottom( ) + ( this:GetTop( ) - this:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.LDB.Pets.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					local type_id = "CRITTER"
					local n = GetNumCompanions( type_id )
					
					local track = ArkInventory.db.char.option.ldb.pets.track
					
					local cc = 0
					
					for k = 1, n do
						
						local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
						local cd = ArkInventory.Const.CompanionData[creatureSpellID]
						
						local ok = false
						if not ok and cd and not cd.r then
							ok = true
						end
						
						if ok then
							
							cc = cc + 1
							
							local tooltipText = ArkInventory.Localise["LDB_PETS_SELECT"]
							
							if track == creatureSpellID then
								creatureName = "|cff00ff00" .. creatureName
								tooltipText = ArkInventory.Localise["LDB_PETS_DESELECT"]
							end
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", creatureName,
								"tooltipTitle", creatureName,
								"tooltipText", tooltipText,
								"checked", track == creatureSpellID,
								"func", function( )
									
									if ArkInventory.db.char.option.ldb.pets.track == creatureSpellID then
										ArkInventory.db.char.option.ldb.pets.track = nil
									else
										ArkInventory.db.char.option.ldb.pets.track = creatureSpellID
									end
									
									ArkInventory.LDB.Pets:Update( )
									
								end
							)
						
						end
						
					end
					
					if cc > 1 then
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						local creatureName = ArkInventory.Localise["RANDOM"]
						local tooltipText = ArkInventory.Localise["LDB_PETS_SELECT"]
						
						if not track then
							creatureName = "|cff00ff00" .. creatureName
							tooltipText = nil
						end
							
						ArkInventory.Lib.DewDrop:AddLine(
							"text", creatureName,
							"tooltipTitle", creatureName,
							"tooltipText", tooltipText,
							"checked", not track,
							"notClickable", not track,
							"func", function( )
								ArkInventory.db.char.option.ldb.pets.track = nil
								ArkInventory.LDB.Pets:Update( )
							end
						)
						
						--[[
						if not ArkInventory.db.char.option.ldb.pets.track then
							
							ArkInventory.Lib.DewDrop:AddLine( )
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", "restrict",
								"tooltipTitle", "restrict",
								"tooltipText", "restricts random choices to pets that do not require reagents to summon",
								"checked", ArkInventory.db.char.option.ldb.pets.restrict,
								"func", function( )
									ArkInventory.db.char.option.ldb.pets.restrict = not ArkInventory.db.char.option.ldb.pets.restrict
								end
							)
							
						end
						]]--
						
					end
					
					if cc == 0 then
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LDB_COMPANION_NONE"],
							"disabled", true
						)
					end

					ArkInventory.Lib.DewDrop:AddLine( )
						
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
				
			end
			
		)
		
	end
	
end

function ArkInventory.MenuLDBMountsOpen( frame )

	if not frame then
		frame = this
	end

	if ArkInventory.Lib.DewDrop:IsOpen( this ) then
	
		ArkInventory.Lib.DewDrop:Close( )
	
	else

		local x, p, rp
		x = this:GetBottom( ) + ( this:GetTop( ) - this:GetBottom( ) ) / 2
		if ( x >= ( GetScreenHeight( ) / 2 ) ) then
			p = "TOPLEFT"
			rp = "BOTTOMLEFT"
		else
			p = "BOTTOMLEFT"
			rp = "TOPLEFT"
		end
	
		ArkInventory.Lib.DewDrop:Open( this,
			"point", p,
			"relativePoint", rp,
			"children", function( level, value )
				
				if level == 1 then
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.LDB.Mounts.name,
						"isTitle", true,
						"textHeight", 14
					)
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Global.Version,
						"notClickable", true
					)
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["LDB_MOUNTS_GROUND"],
						"hasArrow", true,
						"value", "GROUND"
					)
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["LDB_MOUNTS_FLYING"],
						"hasArrow", true,
						"value", "FLYING"
					)

					ArkInventory.Lib.DewDrop:AddLine( )
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", ArkInventory.Localise["CLOSE_MENU"],
						"closeWhenClicked", true
					)
					
				end
					
				if level == 2 then
					
					local header = ArkInventory.Localise["LDB_MOUNTS_GROUND"]
					local track = ArkInventory.db.char.option.ldb.mounts.ground.track
					if value == "FLYING" then
						header = ArkInventory.Localise["LDB_MOUNTS_FLYING"]
						track = ArkInventory.db.char.option.ldb.mounts.flying.track
					end
					
					ArkInventory.Lib.DewDrop:AddLine(
						"text", string.format( "%s: %s", ArkInventory.Global.Location[ArkInventory.Const.Location.Mount].Name, header ),
						"isTitle", true,
						"textHeight", 14
					)
					
					local type_id = "MOUNT"
					local n = GetNumCompanions( type_id )
					
					ArkInventory.Lib.DewDrop:AddLine( )
					
					local cc = 0
					
					for k = 1, n do
						
						local creatureID, creatureName, creatureSpellID, texture, active = GetCompanionInfo( type_id, k )
						local cd = ArkInventory.Const.CompanionData[creatureSpellID]
						
						local ok = false
						if not ok and value == "FLYING" and cd and not cd.r and ( cd.f and cd.f ~= 1 ) then
							ok = true
						end
						if not ok and value == "GROUND" and cd and not cd.r and ( cd.f and cd.f ~= 2 ) then
							ok = true
						end
						
						if ok then
							
							cc = cc + 1
							
							local tooltipText = ArkInventory.Localise["LDB_MOUNTS_SELECT"]
							
							creatureName = string.format( "%s [%s%%] ", creatureName, cd.s )
							
							if track == creatureSpellID then
								creatureName = "|cff00ff00" .. creatureName
								tooltipText = ArkInventory.Localise["LDB_MOUNTS_DESELECT"]
							end
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", creatureName,
								"tooltipTitle", creatureName,
								"tooltipText", tooltipText,
								"checked", track == creatureSpellID,
								"func", function( )
									
									if value == "FLYING" then
										if ArkInventory.db.char.option.ldb.mounts.flying.track == creatureSpellID then
											ArkInventory.db.char.option.ldb.mounts.flying.track = nil
										else
											ArkInventory.db.char.option.ldb.mounts.flying.track = creatureSpellID
										end
									else
										if ArkInventory.db.char.option.ldb.mounts.ground.track == creatureSpellID then
											ArkInventory.db.char.option.ldb.mounts.ground.track = nil
										else
											ArkInventory.db.char.option.ldb.mounts.ground.track = creatureSpellID
										end
									end
									
									ArkInventory.LDB.Mounts:Update( )
								
								end
							)
							
						end
						
					end
					
					if cc > 1 then
						
						ArkInventory.Lib.DewDrop:AddLine( )
						
						local creatureName = ArkInventory.Localise["RANDOM"]
						local tooltipText = ArkInventory.Localise["LDB_MOUNTS_SELECT"]
						
						if not track then
							creatureName = "|cff00ff00" .. creatureName
							tooltipText = nil
						end
						
						ArkInventory.Lib.DewDrop:AddLine(
							"text", creatureName,
							"tooltipTitle", creatureName,
							"tooltipText", tooltipText,
							"checked", not track,
							"notClickable", not track,
							"func", function( )
								
								if value == "FLYING" then
									ArkInventory.db.char.option.ldb.mounts.flying.track = nil
								else
									ArkInventory.db.char.option.ldb.mounts.ground.track = nil
								end
								
								ArkInventory.LDB.Mounts:Update( )
								
							end
						)
						
						if value == "FLYING" and not ArkInventory.db.char.option.ldb.mounts.flying.track then
							
							ArkInventory.Lib.DewDrop:AddLine( )
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
								"tooltipTitle", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT"],
								"tooltipText", ArkInventory.Localise["LDB_MOUNTS_FLYING_DISMOUNT_TEXT"],
								"checked", ArkInventory.db.char.option.ldb.mounts.flying.dismount,
								"func", function( )
									ArkInventory.db.char.option.ldb.mounts.flying.dismount = not ArkInventory.db.char.option.ldb.mounts.flying.dismount
								end
							)
						
						end
						
						if not track then
							
							ArkInventory.Lib.DewDrop:AddLine( )
							
							local slider_min = 60
							local slider_max = 100
							local slider_value = ArkInventory.db.char.option.ldb.mounts.ground.min
							if value == "FLYING" then
								slider_min = 100
								slider_max = 310
								slider_value = ArkInventory.db.char.option.ldb.mounts.flying.min
							end
							
							ArkInventory.Lib.DewDrop:AddLine(
								"text", ArkInventory.Localise["LDB_MOUNTS_SPEED"],
								"tooltipTitle", ArkInventory.Localise["LDB_MOUNTS_SPEED"],
								"tooltipText", ArkInventory.Localise["LDB_MOUNTS_SPEED_TEXT"],
								"hasArrow", true,
								"hasSlider", true,
								"sliderValue", slider_value,
								"sliderMin", slider_min,
								"sliderMax", slider_max,
								"sliderStep", 10,
								"sliderFunc", function( v )
									
									if value == "FLYING" then
										ArkInventory.db.char.option.ldb.mounts.flying.min = v
									else
										ArkInventory.db.char.option.ldb.mounts.ground.min = v
									end
									
								end	
							)
						
						end
						
					end
					
					if cc == 0 then
						ArkInventory.Lib.DewDrop:AddLine(
							"text", ArkInventory.Localise["LDB_COMPANION_NONE"],
							"disabled", true
						)
					end
					
				end
				
			end
			
		)
	
	end
	
end

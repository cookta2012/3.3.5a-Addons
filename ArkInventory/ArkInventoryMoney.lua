	
ArkInventory.Const.MoneyTypeInfo = { }

ArkInventory.Const.MoneyTypeInfo["PLAYER"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "PLAYER_MONEY", "PLAYER_TRADE_MONEY", "SEND_MAIL_MONEY_CHANGED", "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetMoney( ) - GetCursorMoney( ) - GetPlayerTradeMoney( )
	end,

	PickupFunc = function( amount )
		PickupPlayerMoney( amount )
	end,

	DropFunc = function( )
		DropCursorMoney( )
	end,

	collapse = 1,
	canPickup = 1,
	showSmallerCoins = "Backpack"

}

ArkInventory.Const.MoneyTypeInfo["STATIC"] = {

	UpdateFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { }

		return moneyFrame.staticMoney
		
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANK"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end

		moneyFrame.events = { "GUILDBANK_UPDATE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end
		
	end,

	UpdateFunc = function( )
		return GetGuildBankMoney( ) - GetCursorMoney( )
	end,

	PickupFunc = function( amount )
		PickupGuildBankMoney( amount )
	end,

	DropFunc = function( )
		DropCursorMoney( )
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["GUILDBANKWITHDRAW"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "GUILDBANK_UPDATE_WITHDRAWMONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		GuildBankFrame_UpdateWithdrawMoney( )
		return nil
	end,

	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["GUILD_REPAIR"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )

		if not moneyFrame then
			moneyFrame = this
		end

		return moneyFrame.staticMoney
		
	end,

	collapse = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["AUCTION"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end

		return moneyFrame.staticMoney
		
	end,
	
	showSmallerCoins = "Backpack",
	fixedWidth = 1,
	collapse = 1,
	truncateSmallCoins = nil,
	
}

ArkInventory.Const.MoneyTypeInfo["PLAYER_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "PLAYER_TRADE_MONEY" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetPlayerTradeMoney( )
	end,

	PickupFunc = function( amount )
		PickupTradeMoney( amount )
	end,

	DropFunc = function( )
		AddTradeMoney( )
	end,

	collapse = 1,
	canPickup = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["TARGET_TRADE"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "TRADE_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetTargetTradeMoney( )
	end,

	collapse = 1,
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL"] = {

	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "SEND_MAIL_MONEY_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetSendMailMoney( )
	end,

	PickupFunc = function( amount )
		PickupSendMailMoney( amount )
	end,

	DropFunc = function( )
		AddSendMailMoney( )
	end,

	collapse = nil,
	canPickup = 1,
	showSmallerCoins = "Backpack",
	
}

ArkInventory.Const.MoneyTypeInfo["SEND_MAIL_COD"] = {
	
	OnloadFunc = function( moneyFrame )
	
		if not moneyFrame then
			moneyFrame = this
		end
		
		moneyFrame.events = { "SEND_MAIL_COD_CHANGED" }
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:RegisterEvent( v )
		end

	end,

	UpdateFunc = function( )
		return GetSendMailCOD( )
	end,

	PickupFunc = function( amount )
		PickupSendMailCOD( amount )
	end,

	DropFunc = function( )
		AddSendMailCOD( )
	end,

	collapse = 1,
	canPickup = 1,
	
}

function ArkInventory.MoneyFrame_OnEvent( moneyFrame, event, ... )

	if not moneyFrame then
		moneyFrame = this
	end

	if not moneyFrame.info or not moneyFrame:IsVisible( ) then
		return
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_OnEnter( frame )
	
	--ArkInventory.Output( "onenter: ", frame:GetName( ) )
	
	if not frame or not frame:IsVisible( ) then
		return
	end
	
	local x, a, b
	
	x = frame:GetBottom( ) + ( frame:GetTop( ) - frame:GetBottom( ) ) / 2
	if ( x >= ( GetScreenHeight( ) / 2 ) ) then
		a = "BOTTOM"
	else
		a = "TOP"
	end

	x = frame:GetLeft( ) + ( frame:GetRight( ) - frame:GetLeft( ) ) / 2
	if ( x >= ( GetScreenWidth( ) / 2 ) ) then
		b = "RIGHT"
	else
		b = "LEFT"
	end

	GameTooltip:SetOwner( frame, "ANCHOR_" .. a )
	GameTooltip:ClearLines( )
	
	ArkInventory.MoneyFrame_Tooltip( GameTooltip )
	
	GameTooltip:Show( )
	
end

function ArkInventory.SmallMoneyFrame_OnLoad( moneyFrame, moneyType )

	if not moneyFrame then
		moneyFrame = this
	end

	if not moneyType then
		moneyType = "PLAYER"
	end
	
	moneyFrame.small = 1
	
	ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
end

function ArkInventory.MoneyFrame_SetType( moneyFrame, moneyType )
	
	if not moneyFrame then
		moneyFrame = this
	end
	
	local info = ArkInventory.Const.MoneyTypeInfo[moneyType]
	if not info then
		ArkInventory.Output( "invalid moneyType [", moneyType, "] assigned to frame [", moneyFrame:GetName( ), "], deafulting to PLAYER" )
		info = ArkInventory.Const.MoneyTypeInfo["PLAYER"]
	end
	
	if moneyFrame.events then
		-- this money frame has already been used for something else so deregister the old events
		for _, v in pairs( moneyFrame.events ) do
			moneyFrame:UnregisterEvent( v )
		end
		
		moneyFrame.events = nil
		
	end

	moneyFrame.info = info
	moneyFrame.moneyType = moneyType
	
	-- register the events required
	if info.OnloadFunc then
		info.OnloadFunc( moneyFrame )
	end
	
	local frameName = moneyFrame:GetName( )
	if info.canPickup then
		_G[frameName .. "GoldButton"]:EnableMouse( true )
		_G[frameName .. "SilverButton"]:EnableMouse( true )
		_G[frameName .. "CopperButton"]:EnableMouse( true )
	else
		_G[frameName .. "GoldButton"]:EnableMouse( false )
		_G[frameName .. "SilverButton"]:EnableMouse( false )
		_G[frameName .. "CopperButton"]:EnableMouse( false )
	end

	ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )
	
end

function ArkInventory.MoneyFrame_UpdateMoney( moneyFrame )

	if not moneyFrame then
		moneyFrame = this
	end
	
	if not moneyFrame:IsVisible( ) then
		return
	end
	
	if moneyFrame.info then
	
		local moneyAmount = moneyFrame.info.UpdateFunc( moneyFrame )
		
		if moneyAmount then
			MoneyFrame_Update( moneyFrame:GetName( ), moneyAmount )
		end
		
		if moneyFrame.hasPickup == 1 then
			UpdateCoinPickupFrame( moneyAmount )
		end
		
	else
	
		ArkInventory.Output( "Error moneyType not set for moneyFrame [", moneyFrame:GetName( ), "]" )

	end
	
end

function ArkInventory.MoneyText( money )
	
	local money = money or 0
	local c = money
	
	local g = math.floor( money / COPPER_PER_GOLD )
	c = math.floor( money - g * COPPER_PER_GOLD )
	local s = math.floor( c / COPPER_PER_SILVER )
	c = math.floor( c - s * COPPER_PER_SILVER )
	
	local t = ""
	
	if g > 0 then
		t = string.format( "|cffffd100%d%s|r ", g, GOLD_AMOUNT_SYMBOL )
	end

--	if s > 0 or ( g > 0 and c > 0 ) then
		if g > 0 then
			t = string.format( "%s|cffe6e6e6%02d%s|r ", t, s, SILVER_AMOUNT_SYMBOL )
		else
			t = string.format( "%s|cffe6e6e6%d%s|r ", t, s, SILVER_AMOUNT_SYMBOL )
		end
--	end
	
--	if c > 0 then
		if s > 0 or g > 0 then
			t = string.format( "%s|cffc8602c%02d%s|r", t, c, COPPER_AMOUNT_SYMBOL )
		else
			t = string.format( "%s|cffc8602c%d%s|r", t, c, COPPER_AMOUNT_SYMBOL )
		end
--	end
	
	return strtrim( t )

end

function ArkInventory.MoneyFrame_Tooltip( tooltip )
	
	if not tooltip then return end
	
	local total = 0
	local paint = ArkInventory.db.global.option.tooltip.colour.class
	
	local player = UnitName( "player" )
	local f = UnitFactionGroup( "player" )
	
	tooltip:AddDoubleLine( "Character", "Amount" )
	for pn, pd in ArkInventory.spairs( ArkInventory.db.realm.player.data ) do
		
		if pd.info.name and pd.info.faction and string.sub( pn, 1, 1 ) ~= ArkInventory.Const.GuildTag then
			
			if ( not ArkInventory.db.global.option.tooltip.faction ) or ( ArkInventory.db.global.option.tooltip.faction and f == pd.info.faction ) then
				
				if ( not ArkInventory.db.global.option.tooltip.me ) or ( ArkInventory.db.global.option.tooltip.me and pn == player ) then
					
					total = total + ( pd.info.money or 0 )
					
					local name = pd.info.name
					if paint then
						name = ArkInventory.DisplayName3( pd.info )
					end
					
					if pd.info.faction ~= f then
						name = string.format( "%s |cff7f7f7f[%s]|r", name, pd.info.faction )
					end
					
					ArkInventory.TooltipSetMoneyText( tooltip, pd.info.money or 0, name )
				
				end
				
			end
			
		end
		
	end
	
	tooltip:AddDoubleLine( " ", " " )
	ArkInventory.TooltipSetMoneyText( tooltip, total, "Total" )
	
	total = 0
	
	
	
	if not ArkInventory.db.global.option.tooltip.me and ArkInventory.db.global.option.tooltip.add.vault then
		
		for n in pairs( ArkInventory.db.realm.player.data ) do
			if string.sub( n, 1, 1 ) == ArkInventory.Const.GuildTag then
				total = 1
			end
		end
		
		if total > 0 then
			
			tooltip:AddDoubleLine( " ", " " )
			tooltip:AddDoubleLine( " ", " " )
			
			tooltip:AddDoubleLine( ArkInventory.Global.Location[ArkInventory.Const.Location.Vault].Name, "Amount" )
			
			for pn, pd in ArkInventory.spairs( ArkInventory.db.realm.player.data ) do
				
				if pd.info.name and pd.info.faction then
					
					if ( not ArkInventory.db.global.option.tooltip.faction ) or ( ArkInventory.db.global.option.tooltip.faction and f == pd.info.faction ) then
						
						if ( not ArkInventory.db.global.option.tooltip.me ) or ( ArkInventory.db.global.option.tooltip.me and pn == player ) then
							
							if string.sub( pn, 1, 1 ) == ArkInventory.Const.GuildTag then
								
								local name = pd.info.name
								if paint then
									name = ArkInventory.DisplayName3( pd.info )
								end
								
								ArkInventory.TooltipSetMoneyText( tooltip, pd.info.money or 0, name )
								
							end
							
						end
						
					end
					
				end
				
			end
			
		end
		
	end
	
end

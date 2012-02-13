--[[
    Project: AtlasMajorCities
    Author: modefanz.eu ~ Modefanz Coding Team
    Discripton: Capital City NPC Browser for Atlas.
    Release Date: May.2009
    Release Version: 1.5
    Internal: AMC.15
]]--

LibStub("tekKonfig-AboutPanel").new(nil, "AtlasMajorCities")

local function lineMatches(line, search_text)
      local foundMatch = false;
      if (string.len(search_text) == 0) then
	      foundMatch = true;
      else
	      if ( string.gmatch ) then 
		if ( string.gmatch(string.lower(line), search_text)() ) then
		   foundMatch = true;
		end
	      else 
		if ( string.gfind(string.lower(line), search_text)() ) then
		   foundMatch = true;
		end
	      end
      end
      return foundMatch;
end

function AtlasMajorCitiesSearch(data, text)
        local new = {};         -- create a new table
        local i;
        local v;
        local n;

        local search_text = string.lower(text);
        local match;

        if ( data.Areas == nil ) then
             if ( search_text == "" ) then
                  new = data;
             else
                  search_text = search_text:gsub("([%^%$%(%)%%%.%[%]%+%-%?])", "%%%1");
                  search_text = search_text:gsub("%*", ".*");

                  i, v = next(data, nil);      -- i is an index of data, v = data[i]
                  n = i;
                  while i do
                        if ( type(i) == "number" ) then
                           if ( string.gmatch ) then
                                match = string.gmatch(string.lower(data[i]), search_text)();
                           else
                                match = string.gfind(string.lower(data[i]), search_text)();
                           end

                           if ( match ) then
                                new[n] = { data[i] };
                                n = n + 1;
                           end
                        end
                        i, v = next(data, i);         -- get next index
                  end
             end
        else
	     n = 1;
	     local areaKey;
	     local areaData;
	     local addSeparator = false;
	     local shownAreaTitle = false;

	     for areaKey,areaData in pairs(data.Areas) do
		   local color = areaData.Color;
		   local areaName = areaData.Name;
		   local labelsKey;
		   local labelsData;
	   	   addSeparator = false;
	           shownAreaTitle = false;

		   for labelsKey,labelsData in pairs(areaData) do
			   local labelKey;
		           local labelData;

			   if ( type(labelsData) == "table" and labelsData.Label ~= nil ) then
			      local labelName = labelsData.Label;
			      local foundMatch = false;
			      for labelKey,labelData in ipairs(labelsData) do
			          if (lineMatches(labelData, search_text)) then
				      foundMatch = true;
				      break;
			          end
			      end

			      if ( foundMatch ) then
				  for labelKey,labelData in ipairs(labelsData) do
					 if (not shownAreaTitle) then
					    new[n] = { color..areaName };
					    n = n + 1;
					    shownAreaTitle = true;
					    if (lineMatches(labelData, search_text)) then
					        new[n] = { " "..color..labelName..") "..labelData };
					    else
					        new[n] = { " ".."|c88888888"..labelName..") "..labelData };
					    end
					 else
					    if ( labelKey > 1 ) then
						if (lineMatches(labelData, search_text)) then
						    new[n] = { " ".."|c00000000"..labelName..") "..color..labelData };
						else
						    new[n] = { " ".."|c00000000"..labelName..") ".."|c88888888"..labelData };
						end
					    else
						if (lineMatches(labelData, search_text)) then
						    new[n] = { " "..color..labelName..") "..labelData };
						else
						    new[n] = { " ".."|c88888888"..labelName..") "..labelData };
						end
					    end
					 end
					 n = n + 1;
					 addSeparator = true;
				  end
			      end
			end
		  end
		  if (addSeparator) then
		           new[n] = { " " };
		           n = n + 1;
		  end
	     end
	end

	return new;
end


	local BLUE = "|cff6666ff";
	local GREY = "|cff999999";
	local GREN = "|cff66cc33";
	local YELL = "|cffcccc00";
	local _RED = "|cffcc6666";
	local ORNG = "|cffcc9933";
	local PURP = "|cff9900ff";
	local WHITE = "|cffffffff";
	local CYAN = "|cff008888";
	local INVIS = "|c00000000";
	local LTBLU = "|cff7777aa";
	local PINK = "|cffff3366";

	local myCategory = AMCLocale["Major Cities"];

	local myData = {
	  Search = AtlasMajorCitiesSearch;

	  DL = {
	    ZoneName = { AMCLocale["Dalaran"] };
	    Location = { AMCLocale["Crystalsong"] };

	    Areas = {
	      {
		Name = AMCLocale["Krasus Landing"];
		Color = WHITE;
		{
		  Label = "1";
		  AMCLocale["Aludane Whitecloud"];
		},
		{
		  Label = "2";
		  AMCLocale["Hira Snowdawn"];
		},
		{
		  Label = "3";
		  AMCLocale["Officer Van Rossem"];
		},
		{
		  Label = "4";
		  AMCLocale["Sky-Reaver Klum"];
		}
		      },
	      {
		Name = AMCLocale["Runeweaver Square"];
		Color = ORNG;
		{
		  Label = "S";
		  AMCLocale["Entrance to the Sewers"];

		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["Magical Menagerie"];
		  AMCLocale["Mei Francis"];
		  AMCLocale["Breanni"];
		  AMCLocale["Tassia Whisperglen"];
		},
		{
		  Label = "2";
		  AMCLocale["Teleport to Violet Stand"];
		  AMCLocale["Archmage Celindra"];
		  AMCLocale["Warcaster Fanoraithe"];
		  AMCLocale["Jessa Weaver"];
		},
		{
		  Label = "3";
		  AMCLocale["The Hunter's Reach"];
		  AMCLocale["Dagna Flintlock"];
		  AMCLocale["Jarold Puller"];
		  AMCLocale["Aemara"];
		},
		{
		  Label = "4";
		  AMCLocale["Aerith Primrose"];
		},
		{
		  Label = "5";
		  AMCLocale["The Arsenal Absolute"];
		  AMCLocale["Bartram Haller"];
		  AMCLocale["Kerta the Bold"];
		  AMCLocale["Valaden Silverblade"];
		  AMCLocale["Walther Whiteford"];
		},
		{
		  Label = "6";
		  AMCLocale["Dalaran Visitor Center"];
		  AMCLocale["Andrew Matthews"];
		  AMCLocale["Elizabeth Ross"];
		  AMCLocale["Archivist Betha"];
		},
		{
		  Label = "7";
		  AMCLocale["Curiosities & Moore"];
		  AMCLocale["Debbi Moore"];
		  AMCLocale["Brammold Deepmine"];
		  AMCLocale["Orton Bennet"];
		  AMCLocale["Ninsianna"];
		},
		{
		  Label = "8";
		  AMCLocale["Applebough"];
		  AMCLocale["Windle Sparkshine"];
		},
		{
		  Label = "9";
		  AMCLocale["Sisters Sorcerous"];
		  AMCLocale["Hagatha Moorehead"];
		  AMCLocale["Endora Moorehead"];
		},
		{
		  Label = "10";
		  AMCLocale["The Threads of Fate"];
		  AMCLocale["Paldesse"];
		  AMCLocale["Karandonna"];
		  AMCLocale["Sheddle Glossgleam"];
		  AMCLocale["Chameli Banaphash"];
		  AMCLocale["Norvin Alderman"];
		},
		{
		  Label = "11";
		  AMCLocale["The Wonderworks"];
		  AMCLocale["Jepetto Joybuzz"];
		  AMCLocale["Clockwork Assistant"];
		},
		{
		  Label = "12";
		  AMCLocale["The Legerdemain Lounge"];
		  AMCLocale["Amisi Azuregaze"];
		  AMCLocale["Arille Azuregaze"];
		  AMCLocale["Sandra Bartan"];
		  AMCLocale["Afsaneh Asrar"];
		  AMCLocale["Stove"];
		},
		{
		  Label = "13";
		  AMCLocale["Bshop"];
		  AMCLocale["Kizi Copperclip"];
		},
		{
		  Label = "14";
		  AMCLocale["One More Glass"];
		  AMCLocale["Fialla Sweetberry"];
		  AMCLocale["Christi Stockton"];
		  AMCLocale["Lucian Trias"];
		},
		{
		  Label = "15";
		  AMCLocale["Aimee"];
		}
		      },
	      {
		Name = AMCLocale["The Eventide"];
		Color = PURP;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		},
		{
		  Label = "1";
		  AMCLocale["Marcia Chase"];
		  AMCLocale["Marcia Chase &"];
		},
		{
		  Label = "2";
		  AMCLocale["Glorious Goods"];
		  AMCLocale["Jack Findle"];
		  AMCLocale["Susana Averoy"];
		},
		{
		  Label = "3";
		  AMCLocale["Langrom's Leather & Links"];
		  AMCLocale["Bragund Brightlink"];
		  AMCLocale["Valerie Langrom"];
		},
		{
		  Label = "4";
		  AMCLocale["The Militant Mystic"];
		  AMCLocale["Abra Cadabra"];
		  AMCLocale["Shen Kang Cheng"];
		}
		      },
	      {
		Name = AMCLocale["The Violet Hold"];
		Color = YELL;
		{
		  Label = "1";
		  AMCLocale["Archmage Timear"];
		},
		{
		  Label = "2";
		  AMCLocale["Archmage Lan'dalock"];
		},
		{
		  Label = "3";
		  AMCLocale["Torgo the Younger"];
		},
		{
		  Label = "4";
		  AMCLocale["The Violet Hold Instance"];
		}
		      },
	      {
		Name = AMCLocale["The Silver Enclave a"];
		Color = BLUE;
		{
		  Label = "I";
		  AMCLocale["A Hero's Welcome"];
		  AMCLocale["Isirami Fairwind"];
		  AMCLocale["Stefen Cotter"];
		  AMCLocale["Katherine Lee"];
		  AMCLocale["Derek Odds"];
		  AMCLocale["Inzi Charmlight"];
		  AMCLocale["Marcella Bloom"];
		  AMCLocale["Caliel Brightwillow"];
		  AMCLocale["Stove"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["The Beer Garden"];
		  AMCLocale["Laire Brewgold"];
		  AMCLocale["Coira Longrifle"];
		},
		{
		  Label = "2";
		  AMCLocale["The Silver Enclave"];
		  AMCLocale["PorStor"];
		  AMCLocale["PorIron"];
		  AMCLocale["PorDarn"];
		  AMCLocale["PorExod"];
		  AMCLocale["PorShat"];
		},
		{
		  Label = "3";
		  AMCLocale["The Silver Enclave"];
		  AMCLocale["Arcanist Braedin"];
		  AMCLocale["Alliance Brigadier"];
		  AMCLocale["Portal to Battlefields"];
		},
		{
		  Label = "4";
		  AMCLocale["The Silver Enclave"];
		  AMCLocale["Upstair"];
		  AMCLocale["Arcanist Ivrenne"];
		  AMCLocale["Arcanist Ivrenne &"];
		  AMCLocale["Arcanist Adurin"];
		  AMCLocale["Arcanist Firael"];
		  AMCLocale["Arcanist Firael &"];
		}
		      },
	      {
		Name = AMCLocale["The Violet Citadel"];
		Color = GREN;
		{
		  Label = "1";
		  AMCLocale["Rhonin"];
		  AMCLocale["Vereesa Windrunner"];
		  AMCLocale["Vereesa Windrunner &"];
		},
		{
		  Label = "2";
		  AMCLocale["Archmage Alvareaux"];
		},
		{
		  Label = "3";
		  AMCLocale["Zidormi"];
		  AMCLocale["Portal Cavern Time"];
		},
		{
		  Label = "4";
		  AMCLocale["Portal Purple Parlor"];
		},
		{
		  Label = "5";
		  AMCLocale["The Purple Parlor"];
		  AMCLocale["Archmage John Nicholas"];
		  AMCLocale["Alfred Copperworth"];
		}
		      },
	      {
		Name = AMCLocale["The Magus Commerce"];
		Color = GREY;
		{
		  Label = "B";
		  AMCLocale["Bank"];
		},
		{
		  Label = "1";
		  AMCLocale["Simply Enchanting"];
		  AMCLocale["Enchanter Nalthanis"];
		  AMCLocale["Enchanter Nalthanis &"];
		  AMCLocale["Ildine Sorrowspear"];
		  AMCLocale["Vanessa Sellers"];
		},
		{
		  Label = "2";
		  AMCLocale["First to Your Aid"];
		  AMCLocale["Olisarra the Kind"];
		  AMCLocale["Angelique Butler"];
		},
		{
		  Label = "3";
		  AMCLocale["Talismanic Textiles"];
		  AMCLocale["Charles Worth"];
		  AMCLocale["Dominique Stefano"];
		  AMCLocale["Ainderu Summerleaf"];
		  AMCLocale["Ainderu Summerleaf &"];
		  AMCLocale["Lalla Brightweave"];
		  AMCLocale["Linna Bruder"];
		},
		{
		  Label = "4";
		  AMCLocale["Legendary Leathers"];
		  AMCLocale["Braeg Stoutbeard"];
		  AMCLocale["Diane Cannings"];
		  AMCLocale["Diane Cannings &"];
		  AMCLocale["Derik Marks"];
		  AMCLocale["Ranid Glowergold"];
		  AMCLocale["Ranid Glowergold &"];
		  AMCLocale["Manfred Staller"];
		  AMCLocale["Manfred Staller &"];
		  AMCLocale["Andellion"];
		  AMCLocale["Namha Moonwater"];
		  AMCLocale["Namha Moonwater &"];
		},
		{
		  Label = "5";
		  AMCLocale["Like Clockwork"];
		  AMCLocale["Justin Oshenko"];
		  AMCLocale["Justin Oshenko &"];
		  AMCLocale["Bryan Landers"];
		  AMCLocale["Didi the Wrench"];
		  AMCLocale["Findle Whistlesteam"];
		},
		{
		  Label = "6";
		  AMCLocale["All That Glitters Prospecting Co"];
		  AMCLocale["Jedidiah Handers"];
		  AMCLocale["Dorian Fines"];
		},
		{
		  Label = "7";
		  AMCLocale["The Forge of Fate"];
		},
		{
		  Label = "8";
		  AMCLocale["Tanks For Everything"];
		  AMCLocale["Alard Schmied"];
		  AMCLocale["Alard Schmied &"];
		  AMCLocale["Palja Amboss"];
		  AMCLocale["Imindril Spearsong"];
		  AMCLocale["Orland Schaeffer"];
		  AMCLocale["Dubin Clay"];
		  AMCLocale["Griselda Hunderland"];
		  AMCLocale["Anthony Durain"];
		},
		{
		  Label = "9";
		  AMCLocale["The Magus Commerce"];
		  AMCLocale["Dorothy Egan"];
		  AMCLocale["Edward Egan"];
		},
		{
		  Label = "10";
		  AMCLocale["The Scribes Sacellum"];
		  AMCLocale["Proffessor Pallin"];
		  AMCLocale["Proffessor Pallin &"];
		  AMCLocale["Larana Drome"];
		  AMCLocale["Jessica Sellers"];
		  AMCLocale["Theresa Wolf"];
		}
		      },
	      {
		Name = AMCLocale["Sunreaver's Sanctuary"];
		Color = _RED;
		{
		  Label = "I";
		  AMCLocale["The Filthy Animal"];
		  AMCLocale["Uda the Beast"];
		  AMCLocale["Kyunghee"];
		  AMCLocale["Mato"];
		  AMCLocale["Hamaka"];
		  AMCLocale["Umbiwa"];
		  AMCLocale["Mimbihi"];
		  AMCLocale["Awilo Lon'gomba"];
		  AMCLocale["Awilo Lon'gomba &"];
		  AMCLocale["Misensi"];
		  AMCLocale["Abohba"];
		  AMCLocale["Stove"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["PorOrgr"];
		  AMCLocale["PorUnde"];
		  AMCLocale["PorSilv"];
		  AMCLocale["PorThBl"];
		  AMCLocale["PorShat"];
		},
		{
		  Label = "2";
		  AMCLocale["Horde Warbringer"];
		  AMCLocale["High Arcanist Savor"];
		},
		{
		  Label = "3";
		  AMCLocale["Magister Surdiel"];
		  AMCLocale["Eye of the Storm Portal"];
		  AMCLocale["Arathi Basin Portal"];
		},
		{
		  Label = "4";
		  AMCLocale["Strand of the Ancients Portal"];
		  AMCLocale["Alterac Valley Portal"];
		  AMCLocale["Warsong Gulch Portal"];
		},
		{
		  Label = "5";
		  AMCLocale["Magister Sarien"];
		  AMCLocale["Magister Sarien &"];
		  AMCLocale["Magister Brasael"];
		  AMCLocale["Magistrix Lambriesse"];
		  AMCLocale["Magistrix Lambriesse &"];
		},
	      },
	    },
	  },

	  DLS = {
	    ZoneName = { AMCLocale["Dal Sewers"] };
	    Location = { AMCLocale["Crystalsong"] };

	    Areas = {
	      {
		Name = AMCLocale["D Sew"];
		Color = WHITE;
		{
		  Label = "E";
		  AMCLocale["Entrance"];
		},
		{
		  Label = "I";
		  AMCLocale["Cantrips & Crows"];
		  AMCLocale["Ajay Green"];
		  AMCLocale["Narisa Redgold"];
		  AMCLocale["Stove"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		  AMCLocale["Binzik Goldbook"];
		},
		{
		  Label = "1";
		  AMCLocale["The Black Market"];
		  AMCLocale["Hexil Garrot"];
		  AMCLocale["Pazik The Pick"];
		  AMCLocale["Scout Nisstina"];
		  AMCLocale["Alchemist Cinesra"];
		  AMCLocale["Darahir"];
		},
		{
		  Label = "2";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Blazik Fireclaw"];
		  AMCLocale["Nargle Lashcord"];
		  AMCLocale["Xazi Smolderpipe"];
		  AMCLocale["Zom Bocom"];
		  AMCLocale["Shifty Vickers"];
		},
		{
		  Label = "3";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Baroness Llana"];
		  AMCLocale["Schembari Shearbolt"];
		  AMCLocale["Schembari Shearbolt &"];
		},
		{
		  Label = "4";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Rickard Rustbolt"];
		},
		{
		  Label = "5";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Sarah Brady"];
		  AMCLocale["Minzi Minx"];
		},
		{
		  Label = "6";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Nixi Fireclaw"];
		},
		{
		  Label = "7";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Kanika Goldwell"];
		  AMCLocale["Ramik Slamwrench"];
		},
		{
		  Label = "8";
		  AMCLocale["Circle of Wills"];
		  AMCLocale["Danik Blackshaft"];
		},
		{
		  Label = "9";
		  AMCLocale["Angelo Pescatore"];
		},
		{
		  Label = "10";
		  AMCLocale["Rin Duoctane"];
		},
		{
		  Label = "11";
		  AMCLocale["Sewer Pipe"];
		  AMCLocale["Add On"];
		},
		{
		  Label = "12";
		  AMCLocale["Washed-up Mage"];
		},
	      },
	    },
	  },

	  DN = {
	    ZoneName = { AMCLocale["Darnassus"] };
	    Location = { AMCLocale["Teldrassil"] };

	    Areas = {
	      {
		Name = AMCLocale["Warrior's Terrace"];
		Color = WHITE;
		{
		  Label = "D";
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		},
		{
		  Label = "1";
		  AMCLocale["Mydrannul"];
		  AMCLocale["Shylenai"];
		  AMCLocale["Fyrenna"];
		  AMCLocale["Ancient of War"];
		  AMCLocale["Practice Dummy"];
		},
		{
		  Label = "2";
		  AMCLocale["Sildanair"];
		  AMCLocale["Thyn'tel"];
		},
		{
		  Label = "3";
		  AMCLocale["Elanaria"];
		  AMCLocale["Alliance Brigadier"];
		  AMCLocale["Arias'ta"];
		  AMCLocale["Darnath"];
		  AMCLocale["Brogun"];
		  AMCLocale["Enlae"];
		  AMCLocale["Aethalas"];
		  AMCLocale["Fima"];
		  AMCLocale["Keras"];
		  AMCLocale["Nivara"];
		  AMCLocale["Nivara &"];
		},
		{
		  Label = "4";
		  AMCLocale["Ariyell"];
		  AMCLocale["Mathiel"];
		  AMCLocale["Forge"];
		  AMCLocale["Cylania"];
		  AMCLocale["Ilyenia"];
		  PINK..""..AMCLocale["Bows"];
		  PINK..""..AMCLocale["Fist Weapons"];
		  PINK..""..AMCLocale["Staves"];
		  PINK..""..AMCLocale["Thrown"];
		  PINK..""..AMCLocale["Daggers"];
		}
		      },
	      {
		Name = AMCLocale["Tradesmen's Terrace"];
		Color = PURP;
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "1";
		  AMCLocale["General Goods & Bags"];
		  AMCLocale["Ellandrieth"];
		  AMCLocale["Yldan"];
		},
		{
		  Label = "2";
		  AMCLocale["Weapons"];
		  AMCLocale["Glorandiir"];
		  AMCLocale["Merelyssa"];
		  AMCLocale["Mythidan"];
		  AMCLocale["Kieran"];
		},
		{
		  Label = "3";
		  AMCLocale["Fletcher & Thrown Weapons"];
		  AMCLocale["Landria"];
		  AMCLocale["Turian"];
		},
		{
		  Label = "4";
		  AMCLocale["CAHW"];
		  AMCLocale["Vinasia"];
		  AMCLocale["Ealyshia D"];
		  AMCLocale["Ealyshia D &"];
		},
		{
		  Label = "5";
		  AMCLocale["Leather Armor"];
		  AMCLocale["Cyridan"];
		},
		{
		  Label = "6";
		  AMCLocale["Mail Armor & Shields"];
		  AMCLocale["Melea"];
		  AMCLocale["Caynrus"];
		},
		{
		  Label = "7";
		  AMCLocale["Jareth"];
		},
		{
		  Label = "8";
		  AMCLocale["Treshala"];
		},
		{
		  Label = "9";
		  AMCLocale["Sentinel's Bunkhouse"];
		},
		{
		  Label = "10";
		  AMCLocale["Staff & Robe"];
		  AMCLocale["Andrus"];
		  AMCLocale["Anadyia"];
		},
		{
		  Label = "11";
		  AMCLocale["Jaeana"];
		  AMCLocale["Jaeana&"];
		}
		      },
	      {
		Name = AMCLocale["Craftsmen's Terrace"];
		Color = YELL;
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["Saelienne"];
		},
		{
		  Label = "1";
		  AMCLocale["Guild"];
		  AMCLocale["Lysheana"];
		  AMCLocale["Shalumon"];
		  AMCLocale["Ellaercia"];
		},
		{
		  Label = "2";
		  AMCLocale["Tailoring &"];
		  AMCLocale["Me'lynn"];
		  AMCLocale["Elynna"];
		  AMCLocale["Raedon D"];
		  AMCLocale["Raedon D &"];
		  AMCLocale["Telonis"];
		  AMCLocale["Saenorion"];
		  AMCLocale["Eladriel"];
		  AMCLocale["Lotherias"];
		},
		{
		  Label = "3";
		  AMCLocale["General"];
		  AMCLocale["Mythrin'dir"];
		},
		{
		  Label = "4";
		  AMCLocale["Enchanting"];
		  AMCLocale["Taladan"];
		  AMCLocale["Vaean"];
		  AMCLocale["Feyden D"];
		  AMCLocale["Illianna M"];
		},
		{
		  Label = "5";
		  AMCLocale["Alchemy"];
		  AMCLocale["Ainethil"];
		  AMCLocale["Ulthir"];
		  AMCLocale["Argent Guard Manados"];
		  AMCLocale["D Selgorm"];
		  AMCLocale["D Shaedlass"];
		},
		{
		  Label = "6";
		  AMCLocale["Cooking"];
		  AMCLocale["Alegorn"];
		  AMCLocale["Fyldan"];
		  AMCLocale["Stove"];
		},
		{
		  Label = "7";
		  AMCLocale["First Aid"];
		  AMCLocale["Dannelor"];
		}
		      },
	      {
		Name = AMCLocale["Cenarion Enclave"];
		Color = BLUE;
		{
		  Label = "T";
		  AMCLocale["Tunnel R Trainer"];
		},
		{
		  Label = "1";
		  AMCLocale["Food & Drink"];
		  AMCLocale["Dendrythis"];
		},
		{
		  Label = "2";
		  AMCLocale["Rellian G"];
		},
		{
		  Label = "3";
		  AMCLocale["Mounts"];
		  AMCLocale["Jartsam"];
		  AMCLocale["Lelanai"];
		},
		{
		  Label = "4";
		  AMCLocale["Hunter"];
		  AMCLocale["Alassin"];
		  AMCLocale["Jocaste"];
		  AMCLocale["Corand"];
		  AMCLocale["Jeen'ra N"];
		  AMCLocale["Dorion"];
		  AMCLocale["Silvaria"];
		},
		{
		  Label = "5";
		  AMCLocale["Druid"];
		  AMCLocale["Denatharion"];
		  AMCLocale["Fylerian N"];
		  AMCLocale["Cyroen"];
		  AMCLocale["Mathrengyl B"];
		  AMCLocale["Fandral S"];
		},
		{
		  Label = "6";
		  AMCLocale["Poisons"];
		  AMCLocale["Kyrai"];
		  AMCLocale["Faelyssa"];
		},
		{
		  Label = "7";
		  AMCLocale["Rogue"];
		  AMCLocale["Syurna"];
		  AMCLocale["Anishar"];
		  AMCLocale["Erion S"];
		}
		      },
	      {
		Name = AMCLocale["The Temple Gardens"];
		Color = GREN;
		{
		  Label = "B";
		  AMCLocale["Bank"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "P";
		  AMCLocale["Portal to Rut'theran"];
		},
		{
		  Label = "1";
		  AMCLocale["O Lunalight"];
		},
		{
		  Label = "2";
		  AMCLocale["Sister Aquinne"];
		},
		{
		  Label = "3";
		  AMCLocale["Fishing"];
		  AMCLocale["Astaia"];
		  AMCLocale["Voloren"];
		  AMCLocale["Talaelar"];
		},
		{
		  Label = "4";
		  AMCLocale["Herbalism"];
		  AMCLocale["Firodren M"];
		  AMCLocale["Chardryn"];
		},
		{
		  Label = "5";
		  AMCLocale["Greywhisker"];
		  AMCLocale["Greywhisker &"];
		},
		{
		  Label = "6";
		  AMCLocale["Alaindia"];
		  AMCLocale["Alaindia&"];
		  AMCLocale["Alaindia&1"];
		}
		      },
	      {
		Name = AMCLocale["Temple Moon"];
		Color = CYAN;
		{
		  Label = "1";
		  AMCLocale["Main Floor"];
		  AMCLocale["Jandria"];
		  AMCLocale["Lariia"];
		  AMCLocale["Elissa D"];
		  AMCLocale["Dalia S"];
		},
		{
		  Label = "2";
		  AMCLocale["Balconey"];
		  AMCLocale["P A'moora"];
		},
		{
		  Label = "3";
		  AMCLocale["Balconey"];
		  AMCLocale["AstariiS"];
		  AMCLocale["PAlathea"];
		  AMCLocale["TyrandeW"];
		  AMCLocale["Valustraa"];
		},
		{
		  Label = "4";
		  AMCLocale["Balconey"];
		  AMCLocale["Gracina S"];
		},
	      },
	    },
	  },

	  EX = {
	    ZoneName = { AMCLocale["Exodar"] };
	    Location = { AMCLocale["Azuremyst Isle"] };

	    Areas = {
	      {
		Name = AMCLocale["Outside"];
		Color = YELL;
		{
		  Label = "E";
		  AMCLocale["Entrance Ex"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];

		},
		{
		  Label = "2";
		  AMCLocale["Stephanos"];
		},
		{
		  Label = "3";
		  AMCLocale["Torallius"];
		  AMCLocale["Aalun"];
		}
			},

	      {
		Name = AMCLocale["Seat of the Naaru"];
		Color = GREN;
		{
		  Label = "O";
		  AMCLocale["Ancients Emmissary"];
		},
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["Arthaid"];
		  AMCLocale["Caregiver B"];
		  AMCLocale["Miglik B"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		  AMCLocale["O Khaluun"];
		},
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["Mumman"];
		  AMCLocale["Phea"];
		  AMCLocale["CookP"];
		},
		{
		  Label = "2";
		  AMCLocale["Onnis"];
		  AMCLocale["Cuzi"];
		},
		{
		  Label = "3";
		  AMCLocale["Bran'daan"];
		},
		{
		  Label = "4";
		  AMCLocale["Nurguni"];
		},
		{
		  Label = "5";
		  AMCLocale["O'ros"];
		}
			},

	      {
		Name = AMCLocale["Traders Tier"];
		Color = _RED;
		{
		  Label = "1";
		  AMCLocale["Tailoring"];
		  AMCLocale["Refik"];
		  AMCLocale["Neii"];
		  AMCLocale["Dugiru"];
		},
		{
		  Label = "2";
		  AMCLocale["Leatherworking and Skinning"];
		  AMCLocale["Remere"];
		  AMCLocale["Akham"];
		  AMCLocale["Haferet"];
		},
		{
		  Label = "3";
		  AMCLocale["Plate Armor & Shields"];
		  AMCLocale["Gotaan"];
		  AMCLocale["Treall"];
		},
		{
		  Label = "4";
		  AMCLocale["Bladed Weapons"];
		  AMCLocale["Ven"];
		},
		{
		  Label = "5";
		  AMCLocale["Blunt Weapons"];
		  AMCLocale["Ellomin"];
		},
		{
		  Label = "6";
		  AMCLocale["Leather & Cloth Armor"];
		  AMCLocale["Mahri"];
		  AMCLocale["Gornii"];
		},
		{
		  Label = "7";
		  AMCLocale["Mail Armor"];
		  AMCLocale["Yil"];
		},
		{
		  Label = "8";
		  AMCLocale["Mining and Smithing"];
		  AMCLocale["Muaat"];
		  AMCLocale["Merran"];
		  AMCLocale["Miall"];
		  AMCLocale["Arras"];
		  AMCLocale["Forge"];
		},
		{
		  Label = "9";
		  AMCLocale["Engineering"];
		  AMCLocale["Ockil"];
		  AMCLocale["Feera"];
		},
		{
		  Label = "10";
		  AMCLocale["Hunters' Sanctum"];
		  AMCLocale["Deremiis"];
		  AMCLocale["Vord"];
		  AMCLocale["Killac"];
		  AMCLocale["Ganaar"];
		  AMCLocale["Avelii"];
		  AMCLocale["Muhaa"];
		},
		{
		  Label = "11";
		  AMCLocale["Ring of Arms"];
		  AMCLocale["Fingin"];
		  AMCLocale["Ahonan"];
		  AMCLocale["Kazi"];
		  AMCLocale["Behomat"];
		  AMCLocale["Handiir"];
		  PINK..""..AMCLocale["Daggers"];
		  PINK..""..AMCLocale["Crossbow"];
		  PINK..""..AMCLocale["One-Handed Sword"];
		  PINK..""..AMCLocale["Two-Handed Sword"];
		  PINK..""..AMCLocale["One-Handed Maces"];
		  PINK..""..AMCLocale["Two-Handed Maces"];
		},
		{
		  Label = "12";
		  AMCLocale["Guild Master and Tabards"];
		  AMCLocale["Funaam"];
		  AMCLocale["Issca"];
		}
			},

	      {
		Name = AMCLocale["The Vault of Lights"];
		Color = PURP;
		{
		  Label = "O";
		  AMCLocale["Ancients Emmissary"];
		},
		{
		  Label = "1";
		  AMCLocale["Hall of the Mystics"];
		  AMCLocale["Bati"];
		  AMCLocale["Harnan"];
		  AMCLocale["Edirah"];
		  AMCLocale["Lunaraa"];
		  AMCLocale["Oss"];
		  AMCLocale["Musal"];
		},
		{
		  Label = "2";
		  AMCLocale["Vindicators' Sanctum"];
		  AMCLocale["Kavaan"];
		  AMCLocale["Jol"];
		  AMCLocale["Baatun"];
		},
		{
		  Label = "3";
		  AMCLocale["Alchemy and Herbalism"];
		  AMCLocale["Lucc"];
		  AMCLocale["Altaa"];
		  AMCLocale["Cemmorhan"];
		},
		{
		  Label = "4";
		  AMCLocale["Tolo"];
		  AMCLocale["Alliance Brigadier"];
		},
		{
		  Label = "5";
		  AMCLocale["Mahul"];
		  AMCLocale["Mitia"];
		},
		{
		  Label = "6";
		  AMCLocale["Jihi"];
		  AMCLocale["Buhurda"];
		},
		{
		  Label = "7";
		  AMCLocale["Prophet Velen"];
		},
		{
		  Label = "8";
		  AMCLocale["Anchorites' Sanctum"];
		  AMCLocale["Izmir"];
		  AMCLocale["Fallat"];
		  AMCLocale["Caedmos"];
		}
			},

	      {
		Name = AMCLocale["The Crystal Hall"];
		Color = WHITE;
		{
		  Label = "D";
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		},
		{
		  Label = "1";
		  AMCLocale["Enchanting"];
		  AMCLocale["Nahogg"];
		  AMCLocale["Egomis"];
		  AMCLocale["Thoth"];
		  AMCLocale["Sessoh"];
		},
		{
		  Label = "2";
		  AMCLocale["Sixx"];
		},
		{
		  Label = "3";
		  AMCLocale["Gurrag"];
		},
		{
		  Label = "4";
		  AMCLocale["F Nobundo"];
		  AMCLocale["F Dunaer"];
		  AMCLocale["Valon"];
		},
		{
		  Label = "5";
		  AMCLocale["Sulaa"];
		},
		{
		  Label = "6";
		  AMCLocale["Fishing"];
		  AMCLocale["Erett"];
		  AMCLocale["Dekin"];
		},
		{
		  Label = "7";
		  AMCLocale["Hobahken"];
		},
		{
		  Label = "8";
		  AMCLocale["Reagents"];
		  AMCLocale["Bildine"];
		},
		{
		  Label = "9";
		  AMCLocale["First Aid"];
		  AMCLocale["Nus"];
		},
		{
		  Label = "10";
		  AMCLocale["Jewelcrafting"];
		  AMCLocale["Farii"];
		  AMCLocale["Arred"];
		  AMCLocale["Padaar"];
		},
		{
		  Label = "11";
		  AMCLocale["Seer Skaltesh"];
		},
	      },
	    },
	  },
	  
	  IF = {
	    ZoneName = { AMCLocale["Ironforge"] };
	    Location = { AMCLocale["Dun Morogh"] };

	    Areas = {
	      {
		Name = AMCLocale["The Common"];
		Color = WHITE;
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		  AMCLocale["Dinita S"];
		  AMCLocale["Lieutenant Rot"];
		  AMCLocale["Lieutenant Rot &"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];

		},
		{
		  Label = "1";
		  AMCLocale["Barim"];
		  AMCLocale["Barim J"];
		},
		{
		  Label = "2";
		  AMCLocale["Stonefire Tavern"];
		  AMCLocale["Innkeeper Firebrew"];
		  AMCLocale["Gwenna F"];
		  AMCLocale["Larkin T"];
		  AMCLocale["Brew Vendor"];
		  AMCLocale["Sheldonore"];
		},
		{
		  Label = "3";
		  AMCLocale["Bshop"];
		  AMCLocale["Pella B"];
		},
		{
		  Label = "4";
		  AMCLocale["Ironforge Armory"];
		  AMCLocale["Mangorn F"];
		  AMCLocale["Raena F"];
		  AMCLocale["Bromiir O"];
		},
		{
		  Label = "5";
		  AMCLocale["Steelfury's Weapon Emporium"];
		  AMCLocale["Dolman S"];
		  AMCLocale["Grenil S"];
		},
		{
		  Label = "6";
		  AMCLocale["Fizzlespinner"];
		  AMCLocale["Fillius F"];
		  AMCLocale["Bryllia I"];
		},
		{
		  Label = "7";
		  AMCLocale["Marblesten"];
		  AMCLocale["Marblesten&"];
		},
		{
		  Label = "8";
		  AMCLocale["Ironforge V C"];
		  AMCLocale["Jondor S"];
		  AMCLocale["Lyesa S"];
		},
		{
		  Label = "9";
		  AMCLocale["Myra T"];
		  AMCLocale["Myra T &"];
		}
			},

	      {
		Name = AMCLocale["Mystic Ward"];
		Color = GREN;
		{
		  Label = "O";
		  AMCLocale["Ancients Emmissary"];
		},
		{
		  Label = "1";
		  AMCLocale["Fighting Wizard"];
		  AMCLocale["Bingus"];
		  AMCLocale["Harick B"];
		},
		{
		  Label = "2";
		  AMCLocale["Hall of Mysteries"];
		  AMCLocale["Toldren D"];
		  AMCLocale["Braenna F"];
		  AMCLocale["High Priest Rohan"];
		  AMCLocale["Bink"];
		  AMCLocale["Dink"];
		  AMCLocale["Juli S"];
		  AMCLocale["Milstaff S"];
		  AMCLocale["Brandur I"];
		  AMCLocale["Beldruk D"];
		  AMCLocale["Theodrus F"];
		  AMCLocale["Muiredon B"];
		  AMCLocale["Valgar H"];
		  AMCLocale["Nittlebur S"];
		  AMCLocale["Tiza B"];
		},
		{
		  Label = "3";
		  AMCLocale["Mage Tymor"];
		},
		{
		  Label = "4";
		  AMCLocale["Talvash Kissel"];
		},
		{
		  Label = "5";
		  AMCLocale["Maeva's"];
		  AMCLocale["Maeva"];
		  AMCLocale["Ingrys S"];
		},
		{
		  Label = "6";
		  AMCLocale["Longberry's"];
		  AMCLocale["Ginny L"];
		},
		{
		  Label = "7";
		  AMCLocale["Bimble L"];
		  AMCLocale["Bimble L&"];
		}
			},

	      {
		Name = AMCLocale["Forlorn Cavern"];
		Color = BLUE;
		{
		  Label = "1";
		  AMCLocale["Stoneblades"];
		  AMCLocale["Hjoldir S"];
		  AMCLocale["Binny"];
		  AMCLocale["Prynne"];
		},
		{
		  Label = "2";
		  AMCLocale["Traveling Fisherman"];
		  AMCLocale["Grimnur S"];
		  AMCLocale["Tansy P"];
		},
		{
		  Label = "3";
		  AMCLocale["Lago B"];
		},
		{
		  Label = "4";
		  AMCLocale["Thistleheart"];
		  AMCLocale["Briarthorn"];
		  AMCLocale["Alexander C"];
		  AMCLocale["Gerrig B"];
		},
		{
		  Label = "5";
		  AMCLocale["Tynnus V"];
		  AMCLocale["Fenthwick"];
		  AMCLocale["Ormyr F"];
		  AMCLocale["Hulfdan B"];
		  AMCLocale["Durtham G"];
		},
		{
		  Label = "6";
		  AMCLocale["Ransin D"];
		  AMCLocale["Murky"];
		}
			},

	      {
		Name = AMCLocale["Hall of Explorers"];
		Color = PURP;
		{
		  Label = "1";
		  AMCLocale["Roetten S"];
		  AMCLocale["Magellas"];
		},
		{
		  Label = "2";
		  AMCLocale["The Library"];
		  AMCLocale["Thorius"];
		},
		{
		  Label = "3";
		  AMCLocale["The Library"];
		  AMCLocale["Lyon M"];
		},
		{
		  Label = "4";
		  AMCLocale["The Library"];
		  AMCLocale["Laris G"];
		},
		{
		  Label = "5";
		  AMCLocale["The Library"];
		  AMCLocale["Krom S"];
		  AMCLocale["Prospector S"];
		  AMCLocale["Mae P"];
		  AMCLocale["Advisor B"];
		  AMCLocale["Historian K"];
		}
			},

	      {
		Name = AMCLocale["Tinker Town"];
		Color = CYAN;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["Bubulo"];
		},
		{
		  Label = "2";
		  AMCLocale["Boom!"];
		  AMCLocale["Lomac"];
		  AMCLocale["Fizzlebang"];
		},
		{
		  Label = "3";
		  AMCLocale["Berryfizz's"];
		  AMCLocale["Tally B"];
		  AMCLocale["Soolie B"];
		},
		{
		  Label = "4";
		  AMCLocale["Overspark"];
		  AMCLocale["Overspark&"];
		  AMCLocale["Gnoarn"];
		},
		{
		  Label = "5";
		  AMCLocale["Mekkatorque"];
		},
		{
		  Label = "6";
		  AMCLocale["Castpipe"];
		  AMCLocale["Porterhouse"];
		  AMCLocale["Porterhouse&"];
		  AMCLocale["Klockmort"];
		},
		{
		  Label = "7";
		  AMCLocale["Springspindle's"];
		  AMCLocale["Fizzlegear"];
		  AMCLocale["Cogspinner"];
		},
		{
		  Label = "8";
		  AMCLocale["Deeprun Tram"];
		  AMCLocale["Monty"];
		  AMCLocale["Haggle"];
		}
			},

	      {
		Name = AMCLocale["The Military Ward"];
		Color = ORNG;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "D";
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		},
		{
		  Label = "1";
		  AMCLocale["Goldfury's"];
		  AMCLocale["BrettaG"];
		  AMCLocale["SkolminG"];
		},
		{
		  Label = "2";
		  AMCLocale["Bruuk's Corner"];
		  AMCLocale["BruukB"];
		  AMCLocale["TisaM"];
		},
		{
		  Label = "3";
		  AMCLocale["SognarC"];
		  AMCLocale["SognarC&"];
		},
		{
		  Label = "4";
		  AMCLocale["Hall of Arms"];
		  AMCLocale["UlbrekF"];
		  AMCLocale["RegnusT"];
		  AMCLocale["OlminB"];
		  AMCLocale["BeliaT"];
		  AMCLocale["DemnulF"];
		  AMCLocale["DaeraB"];
		  AMCLocale["KelvS"];
		  AMCLocale["MaxX"];
		  AMCLocale["DonalO"];
		  AMCLocale["Lylandris"];
		  AMCLocale["MargaB"];
		  AMCLocale["MargaB&"];
		  AMCLocale["Alliance Brigadier"];
		  AMCLocale["GlordrumS"];
		  AMCLocale["Kandaar"];
		  AMCLocale["MurenS"];
		  AMCLocale["KelstrumS"];
		  AMCLocale["BilbanT"];
		  AMCLocale["GilbartaG"];
		  AMCLocale["PLongbeard"];
		  AMCLocale["XiggsF"];
		},
		{
		  Label = "5";
		  AMCLocale["Timberline Arms"];
		  AMCLocale["BuliwyfS"];
		  AMCLocale["Fist Weapons"];
		  AMCLocale["Guns"];
		  AMCLocale["One-Handed Axes"];
		  AMCLocale["Two-Handed Axes"];
		  AMCLocale["Two-Handed Maces"];
		  AMCLocale["BixiW"];
		  PINK..""..AMCLocale["Crossbow"];
		  PINK..""..AMCLocale["Daggers"];
		  PINK..""..AMCLocale["Thrown"];
		  AMCLocale["KelomirI"];
		  AMCLocale["ThalgusT"];
		  AMCLocale["HegnarS"];
		  AMCLocale["BrenwynW"];
		},
		{
		  Label = "6";
		  AMCLocale["Craghelm's"];
		  AMCLocale["LissyphusF"];
		  AMCLocale["DolkinC"];
		  AMCLocale["OlthranC"];
		},
		{
		  Label = "7";
		  AMCLocale["SaraB"];
		}
			},

	      {
		Name = AMCLocale["The Great Forge"];
		Color = YELL;
		{
		  Label = "1";
		  AMCLocale["Ironforge Physician"];
		  AMCLocale["ReynaS"];
		  AMCLocale["GwinaS"];
		  AMCLocale["NissaF"];
		},
		{
		  Label = "2";
		  AMCLocale["GrythT"];
		},
		{
		  Label = "3";
		  AMCLocale["Thistlefuzz Arcanery"];
		  AMCLocale["EJademoon"];
		  AMCLocale["GimbleT"];
		  AMCLocale["TilliT"];
		  AMCLocale["EliseB"];
		  AMCLocale["ThargenH"];
		},
		{
		  Label = "4";
		  AMCLocale["Bronze Kettle"];
		  AMCLocale["DarylR"];
		  AMCLocale["EmrulR"];
		  AMCLocale["Stove"];
		  AMCLocale["DBcook"];
		  AMCLocale["DBcook&"];
		},
		{
		  Label = "5";
		  AMCLocale["FJavad"];
		},
		{
		  Label = "6";
		  AMCLocale["DMMG"];
		  AMCLocale["GeoframB"];
		  AMCLocale["GolnirB"];
		},
		{
		  Label = "7";
		  AMCLocale["Burbik's"];
		  AMCLocale["BurbikG"];
		},
		{
		  Label = "8";
		  AMCLocale["Stonebrow's"];
		  AMCLocale["JormundS"];
		  AMCLocale["PorannaS"];
		  AMCLocale["OEric"];
		  AMCLocale["MistinaS"];
		  AMCLocale["MistinaS&"];
		},
		{
		  Label = "9";
		  AMCLocale["Finespindle's"];
		  AMCLocale["FimbleF"];
		  AMCLocale["BombusF"];
		  AMCLocale["BalthusS"];
		},
		{
		  Label = "10";
		  AMCLocale["OIronbeard"];
		},
		{
		  Label = "11";
		  AMCLocale["Sraaz"];
		  AMCLocale["Sraaz&"];
		},
		{
		  Label = "12";
		  AMCLocale["High Seat"];
		  AMCLocale["KingMagni"];
		  AMCLocale["SBarinR"];
		  AMCLocale["RHArchesonus"];
		  AMCLocale["Deliana"];
		},
		{
		  Label = "13";
		  AMCLocale["Great Forge"];
		  AMCLocale["GrumnusS"];
		  AMCLocale["IronusC"];
		  AMCLocale["ThurgrumD"];
		  AMCLocale["BengusD"];
		  AMCLocale["MyolorS"];
		  AMCLocale["BrombarH"];
		  AMCLocale["TormusD"];
		},
	      },
	    },
	  },
	  
	  OG = {
	    ZoneName = { AMCLocale["Orgrimmar"] };
	    Location = { AMCLocale["Durotar"] };

	    Areas = {
	      {
		Name = AMCLocale["Valley Strength"];
		Color = WHITE;
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		  AMCLocale["FARokhs"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["Gryshka"];
		  AMCLocale["Morag"];
		  AMCLocale["Kozish"];
		  AMCLocale["Sarok"];
		  AMCLocale["Doyo'da"];
		  AMCLocale["Zaro"];
		  AMCLocale["Goma"];
		  AMCLocale["Gamon"];
		},
		{
		  Label = "1";
		  AMCLocale["SLSA"];
		  AMCLocale["Sana"];
		  AMCLocale["Morgum"];
		  AMCLocale["Ollanus"];
		},
		{
		  Label = "2";
		  AMCLocale["BImports"];
		  AMCLocale["Kaja"];
		},
		{
		  Label = "3";
		  AMCLocale["SReagents"];
		  AMCLocale["Horthus"];
		},
		{
		  Label = "4";
		  AMCLocale["Horde Embassy"];
		  AMCLocale["Urtrun"];
		  AMCLocale["Garyl"];
		},
		{
		  Label = "5";
		  AMCLocale["GenStore"];
		  AMCLocale["Trak'gen"];
		  AMCLocale["Shimra"];
		},
		{
		  Label = "6";
		  AMCLocale["ShattAxe"];
		  AMCLocale["Urtharo"];
		},
		{
		  Label = "7";
		  AMCLocale["Chophouse"];
		  AMCLocale["Olvia"];
		  AMCLocale["OrcCook"];
		  AMCLocale["OrcCook&"];
		},
		{
		  Label = "8";
		  AMCLocale["SlopeVS"];
		},
		{
		  Label = "9";
		  AMCLocale["Zankaja"];
		  AMCLocale["MBlaze"];
		},
		{
		  Label = "10";
		  AMCLocale["Skytower"];
		  AMCLocale["Doras"];
		  AMCLocale["CEhoof"];
		},
		{
		  Label = "11";
		  AMCLocale["HallLegends"];
		  AMCLocale["SGZarg"];
		  AMCLocale["DorisV"];
		  AMCLocale["BraveSton"];
		  AMCLocale["BraveSton&"];
		  AMCLocale["Zar'shi"];
		  AMCLocale["LadyPal"];
		  AMCLocale["SergThunder"];
		  AMCLocale["SergThunder&"];
		  AMCLocale["Bork"];
		  AMCLocale["Hola'mahi"];
		  AMCLocale["Earthbind"];
		  AMCLocale["Willington"];
		  AMCLocale["Teena"];
		  AMCLocale["CArial"];
		  AMCLocale["D'Anastasis"];
		  AMCLocale["Hini'wana"];
		  AMCLocale["Bek'rah"];
		  AMCLocale["Korf"];
		},
		{
		  Label = "12";
		  AMCLocale["SkyStaves"];
		  AMCLocale["Ukra'nor"];
		},
		{
		  Label = "13";
		  AMCLocale["Keldran"];
		},
		{
		  Label = "14";
		  AMCLocale["Xan'tish"];
		  AMCLocale["Xan'tish&"];
		},
		{
		  Label = "15";
		  AMCLocale["Krixx"];
		  AMCLocale["Krixx&"];
		  AMCLocale["Krixx&1"];
		  AMCLocale["Krixx&2"];
		}
			},

	      {
		Name = AMCLocale["ValleySpirits"];
		Color = PURP;
		{
		  Label = "1";
		  AMCLocale["DarkbriarL"];
		  AMCLocale["Uthel'nay"];
		  AMCLocale["Enyo"];
		  AMCLocale["Deino"];
		  AMCLocale["Pephredo"];
		  AMCLocale["Thuul"];
		  AMCLocale["Vehena"];
		  AMCLocale["Ray'ma"];
		  AMCLocale["Brew Vendor"];
		},
		{
		  Label = "2";
		  AMCLocale["SpiLodge"];
		  AMCLocale["Ur'kyro"];
		  AMCLocale["X'yera"];
		  AMCLocale["Zayus"];
		},
		{
		  Label = "3";
		  AMCLocale["SurvivalF"];
		  AMCLocale["Arnok"];
		}
			},

	      {
		Name = AMCLocale["Drag"];
		Color = YELL;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["Borstan's"];
		  AMCLocale["Borstan"];
		  AMCLocale["Zamja"];
		  AMCLocale["Xen'to"];
		},
		{
		  Label = "2";
		  AMCLocale["Jo'mah"];
		  AMCLocale["Xantili"];
		  AMCLocale["Zilzibin"];
		  AMCLocale["Sarlek"];
		  AMCLocale["Tamaro"];
		},
		{
		  Label = "3";
		  AMCLocale["Arboretum"];
		  AMCLocale["Jandi"];
		  AMCLocale["Zeal'aya"];
		},
		{
		  Label = "4";
		  AMCLocale["Runeworks"];
		  AMCLocale["Jhag"];
		  AMCLocale["Kithas"];
		  AMCLocale["Slope1"];
		},
		{
		  Label = "5";
		  AMCLocale["Yelmak's"];
		  AMCLocale["Yelmak"];
		  AMCLocale["Kor'geld"];
		  AMCLocale["Jes'rimon"];
		},
		{
		  Label = "6";
		  AMCLocale["Salvage"];
		  AMCLocale["Dran"];
		  AMCLocale["Malton"];
		},
		{
		  Label = "7";
		  AMCLocale["KLeatherworks"];
		  AMCLocale["Karolek"];
		  AMCLocale["Tamar"];
		  AMCLocale["Thuwd"];
		  AMCLocale["Handor"];
		},
		{
		  Label = "8";
		  AMCLocale["ClothG"];
		  AMCLocale["Magar"];
		  AMCLocale["Borya"];
		  AMCLocale["Tor'phan"];
		  AMCLocale["Rashona"];
		  AMCLocale["Rashona&"];
		},
		{
		  Label = "9";
		  AMCLocale["Gotri's"];
		  AMCLocale["Dran"];
		},
		{
		  Label = "10";
		  AMCLocale["Krixx2"];
		  AMCLocale["Felika"];
		  AMCLocale["Felika&"];
		  AMCLocale["Felika&1"];
		}
			},

	      {
		Name = AMCLocale["ValleyHonor"];
		Color = BLUE;
		{
		  Label = "F";
		  AMCLocale["Forge"];
		},
		{
		  Label = "D";
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		},
		{
		  Label = "1";
		  AMCLocale["Kiro's"];
		  AMCLocale["Kiro"];
		},
		{
		  Label = "2";
		  AMCLocale["OBowyer"];
		  AMCLocale["Jin'sora"];
		},
		{
		  Label = "3";
		  AMCLocale["HallBrave"];
		  AMCLocale["Zel'mak"];
		  AMCLocale["Sorek"];
		  AMCLocale["Grezz"];
		  AMCLocale["Andrissa"];
		  AMCLocale["Andrissa&"];
		  AMCLocale["Deze"];
		  AMCLocale["Zeggon"];
		  AMCLocale["Brakgul"];
		  AMCLocale["Brakgul&"];
		  AMCLocale["Ufuda"];
		  AMCLocale["Ufuda&"];
		  AMCLocale["Kartra"];
		  AMCLocale["Muja"];
		  AMCLocale["HordeWar"];
		  AMCLocale["BelgR"];
		},
		{
		  Label = "4";
		  AMCLocale["Lumak's"];
		  AMCLocale["Lumak"];
		  AMCLocale["Shankys"];
		  AMCLocale["Zas'tysh"];
		  AMCLocale["Murky"];
		},
		{
		  Label = "5";
		  AMCLocale["RedMining"];
		  AMCLocale["Makaru"];
		  AMCLocale["Gorina"];
		},
		{
		  Label = "6";
		  AMCLocale["Orphanage"];
		},
		{
		  Label = "7";
		  AMCLocale["Nogg's"];
		  AMCLocale["Nogg"];
		  AMCLocale["Roxxik"];
		  AMCLocale["Sovik"];
		  AMCLocale["Rilli"];
		},
		{
		  Label = "8";
		  AMCLocale["Shayis"];
		  AMCLocale["Okothos"];
		  AMCLocale["Borgosh"];
		  AMCLocale["OxMO"];
		  AMCLocale["Aturk"];
		  AMCLocale["OrokkO"];
		},
		{
		  Label = "9";
		  AMCLocale["BurnAnvil"];
		  AMCLocale["Saru"];
		  AMCLocale["Sumi"];
		  AMCLocale["Tumi"];
		},
		{
		  Label = "10";
		  AMCLocale["ArmsLegend"];
		  AMCLocale["Kelgruk"];
		  AMCLocale["Zendo'"];
		  AMCLocale["Shoma"];
		  AMCLocale["Galthuk"];
		  AMCLocale["Sayoc"];
		  PINK..""..AMCLocale["Bows"];
		  PINK..""..AMCLocale["Daggers"];
		  PINK..""..AMCLocale["Fist Weapons"];
		  PINK..""..AMCLocale["Thrown"];
		  PINK..""..AMCLocale["One-Handed Axes"];
		  PINK..""..AMCLocale["Two-Handed Axes"];
		  AMCLocale["Hanashi"];
		  PINK..""..AMCLocale["Bows"];
		  PINK..""..AMCLocale["Staves"];
		  PINK..""..AMCLocale["Thrown"];
		  PINK..""..AMCLocale["One-Handed Axes"];
		  PINK..""..AMCLocale["Two-Handed Axes"];
		  AMCLocale["Koru"];
		},
		{
		  Label = "11";
		  AMCLocale["RingValor"];
		  AMCLocale["Molog"];
		  AMCLocale["Greela"];
		  AMCLocale["Greela&"];
		},
		{
		  Label = "12";
		  AMCLocale["Ogunaro"];
		  AMCLocale["Kildar"];
		  AMCLocale["Xon'cha"];
		},
		{
		  Label = "13";
		  AMCLocale["HuntHall"];
		  AMCLocale["Sian'dur"];
		  AMCLocale["Xor'juul"];
		  AMCLocale["Ormak"];
		},
		{
		  Label = "14";
		  AMCLocale["Krixx2"];
		}
			},

	      {
		Name = AMCLocale["CleftShad"];
		Color = GREN;
		{
		  Label = "1";
		  AMCLocale["DarkEncl"];
		  AMCLocale["Mirket"];
		  AMCLocale["Zevrost"];
		  AMCLocale["Grol'dar"];
		  AMCLocale["Gan'rul"];
		},
		{
		  Label = "2";
		  AMCLocale["ShadReag"];
		  AMCLocale["Hagrus"];
		  AMCLocale["Cazul"];
		},
		{
		  Label = "3";
		  AMCLocale["ISW"];
		  AMCLocale["Muragus"];
		  AMCLocale["Katis"];
		},
		{
		  Label = "4";
		  AMCLocale["Neeru"];
		},
		{
		  Label = "5";
		  AMCLocale["RCI"];
		},
		{
		  Label = "6";
		  AMCLocale["DEFM"];
		  AMCLocale["Kor'jus"];
		},
		{
		  Label = "7";
		  AMCLocale["Bshop"];
		  AMCLocale["Berbri"];
		},
		{
		  Label = "8";
		  AMCLocale["SlowBlade"];
		  AMCLocale["Kareth"];
		},
		{
		  Label = "9";
		  AMCLocale["ShadowBroth"];
		  AMCLocale["Gest"];
		  AMCLocale["Ormok"];
		  AMCLocale["Shenthul"];
		  AMCLocale["Zando'zan"];
		  AMCLocale["Therzok"];
		},
		{
		  Label = "10";
		  AMCLocale["Rekkul's"];
		  AMCLocale["Rekkul"];
		  AMCLocale["Kor'ghan"];
		},
		{
		  Label = "11";
		  AMCLocale["Drok"];
		  AMCLocale["Drok&"];
		}
			},

	      {
		Name = AMCLocale["ValleyWisdom"];
		Color = CYAN;
		{
		  Label = "1";
		  AMCLocale["STVIF"];
		  AMCLocale["Shan'ti"];
		},
		{
		  Label = "2";
		  AMCLocale["ORedblade"];
		},
		{
		  Label = "3";
		  AMCLocale["GromHold"];
		  AMCLocale["Sian'tsu"];
		  AMCLocale["Kardris"];
		  AMCLocale["Sagorne"];
		  AMCLocale["Zor"];
		  AMCLocale["Searn"];
		  AMCLocale["Eitrigg"];
		  AMCLocale["Vol'jin"];
		  AMCLocale["Mokvar"];
		  AMCLocale["Pyreanor"];
		  AMCLocale["Dawnsinger"];
		  AMCLocale["Thrall"];
		},
		{
		  Label = "4";
		  AMCLocale["Asoran's"];
		  AMCLocale["Asoran"];
		  AMCLocale["Magenius"];
		},
		{
		  Label = "5";
		  AMCLocale["Vu'Shalay"];
		},
	      },
	    },
	  },
	  
	  SR = {
	    ZoneName = { AMCLocale["Shattrath"] };
	    Location = { AMCLocale["Terokkar Forest"] };

	    Areas = {
	      {
		Name = AMCLocale["TerLight"];
		Color = WHITE;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "E";
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "AB";
		  AMCLocale["ABank"];
		  AMCLocale["Endarin"];
		  AMCLocale["ISaalyn"];
		  AMCLocale["HaldorC"];
		},
		{
		  Label = "SB";
		  AMCLocale["SBank"];
		  AMCLocale["Enuril"];
		  AMCLocale["IVeredis"];
		  AMCLocale["Xorith"];
		},
		{
		  Label = "1";
		  AMCLocale["A'dal"];
		  AMCLocale["Khadgar"];
		  AMCLocale["Almonen"];
		  AMCLocale["Tiras'alan"];
		},
		{
		  Label = "2";
		  AMCLocale["PorThBl"];
		  AMCLocale["PorOrgr"];
		  AMCLocale["PorUnde"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "3";
		  AMCLocale["Ontuvo"];
		  AMCLocale["Ontuvo&"];
		  AMCLocale["Almaador"];
		  AMCLocale["Nasuun"];
		  AMCLocale["PorQuel"];
		  AMCLocale["Mehlisah"];
		  AMCLocale["Anwehu"];
		  AMCLocale["Anwehu&"];
		  AMCLocale["G'eras"];
		  AMCLocale["G'eras&"];
		},
		{
		  Label = "4";
		  AMCLocale["PorDarn"];
		  AMCLocale["PorStor"];
		  AMCLocale["PorIron"];
		  AMCLocale["LeagArat"];
		},
		{
		  Label = "5";
		  AMCLocale["Iorioa"];
		  AMCLocale["PorExod"];
		  AMCLocale["PorSilv"];
		  AMCLocale["V'eru"];
		},
		{
		  Label = "6";
		  AMCLocale["WarVet"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "7";
		  AMCLocale["Mordin"];
		  AMCLocale["Torvos"];
		},
		{
		  Label = "8";
		  AMCLocale["Nutral"];
		  AMCLocale["Yuula"];
		},
		{
		  Label = "9";
		  AMCLocale["Haronem"];
		  AMCLocale["Wafflefry"];
		},
		{
		  Label = "10";
		  AMCLocale["LiftScry"];
		},
		{
		  Label = "11";
		  AMCLocale["LiftAR"];
		},
		{
		  Label = "12";
		  AMCLocale["WarVet"];
		},
		{
		  Label = "13";
		  AMCLocale["Ezekiel"];
		  AMCLocale["Ezekiel&"];
		}
			},

	      {
		Name = AMCLocale["LowCity"];
		Color = YELL;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["DLarry"];
		  AMCLocale["EMalone"];
		  AMCLocale["Creepjack"];
		},
		{
		  Label = "2";
		  AMCLocale["AldBank"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "3";
		  AMCLocale["Araac"];
		},
		{
		  Label = "4";
		  AMCLocale["Karokka"];
		  AMCLocale["Skreah"];
		  AMCLocale["Lorokeem"];
		  AMCLocale["Vekax"];
		},
		{
		  Label = "5";
		  AMCLocale["Lissaf"];
		},
		{
		  Label = "6";
		  AMCLocale["RampL"];
		  AMCLocale["Rilak"];
		  AMCLocale["Adyria"];
		  AMCLocale["LeagArat"];
		  AMCLocale["DGrashna"];
		},
		{
		  Label = "7";
		  AMCLocale["Oloraak"];
		},
		{
		  Label = "8";
		  AMCLocale["ShattInf"];
		  AMCLocale["Sha'nir"];
		  AMCLocale["Seth"];
		  AMCLocale["Zahila"];
		  AMCLocale["Rokk"];
		  AMCLocale["Barth"];
		},
		{
		  Label = "9";
		  AMCLocale["ExitTF"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "10";
		  AMCLocale["RampL"];
		  AMCLocale["ABG"];
		  AMCLocale["ABG&"];
		  AMCLocale["Vinvo"];
		  AMCLocale["Vinvo&"];
		  AMCLocale["Haelga"];
		  AMCLocale["Lylandor"];
		  AMCLocale["Iravar"];
		  AMCLocale["AEternum"];
		  AMCLocale["LeagArat"];
		},
		{
		  Label = "11";
		  AMCLocale["WorldEndT"];
		  AMCLocale["Lathrai"];
		  AMCLocale["Shaarubo"];
		  AMCLocale["Lonika"];
		  AMCLocale["Kylene"];
		  AMCLocale["Pilton"];
		  AMCLocale["Zhareem"];
		  AMCLocale["Mah'duun"];
		  AMCLocale["Zephyr"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		  AMCLocale["Raliq"];
		  AMCLocale["salabim"];
		},
		{
		  Label = "12";
		  AMCLocale["ExitTF"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		  AMCLocale["WarVet"];
		},
		{
		  Label = "13";
		  AMCLocale["Kradu"];
		  AMCLocale["Zula"];
		  AMCLocale["Forge"];
		},
		{
		  Label = "14";
		  AMCLocale["Orph"];
		  AMCLocale["Bartlett"];
		},
		{
		  Label = "15";
		  AMCLocale["HWB"];
		  AMCLocale["Jojindi"];
		  AMCLocale["Montok"];
		  AMCLocale["Maka"];
		  AMCLocale["Keldor"];
		  AMCLocale["Yula"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "16";
		  AMCLocale["ExitTF"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "17";
		  AMCLocale["Seymour"];
		  AMCLocale["Ernie"];
		  AMCLocale["Cro"];
		  AMCLocale["Darmari"];
		  AMCLocale["Andrion"];
		  AMCLocale["Gidge"];
		  AMCLocale["Nasmara"];
		  AMCLocale["Eiin"];
		  AMCLocale["Griftah"];
		  AMCLocale["Viggz"];
		  AMCLocale["Fantai"];
		  AMCLocale["Aaron"];
		  AMCLocale["MRuby"];
		  AMCLocale["Eral"];
		  AMCLocale["Moser"];
		  AMCLocale["Nakodu"];
		  AMCLocale["JackT"];
		  AMCLocale["Saltit"];
		  AMCLocale["GSmith"];
		  AMCLocale["BTurner"];
		  AMCLocale["Grok"];
		  AMCLocale["Oven"];
		  AMCLocale["Tobias"];
		  AMCLocale["Gordie"];
		},
		{
		  Label = "18";
		  AMCLocale["LowerSB"];
		  AMCLocale["LeagArat"];
		  AMCLocale["Defil"];
		},
		{
		  Label = "19";
		  AMCLocale["Browning"];
		  AMCLocale["Browning&"];
		}
			},

	      {
		Name = AMCLocale["Scryer's Tier"];
		Color = _RED;
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["Haelthol"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "F";
		  AMCLocale["Forge"];

		},
		{
		  Label = "1";
		  AMCLocale["Ilthuril"];
		  AMCLocale["Endernor"];
		  AMCLocale["Lisrythe"];
		  AMCLocale["Mahir"];
		  AMCLocale["Dathris"];
		},
		{
		  Label = "2";
		  AMCLocale["Kirembri"];
		  AMCLocale["Kirembri&"];
		  AMCLocale["Hanlir"];
		  AMCLocale["Lanloer"];
		  AMCLocale["Andiala"];
		},
		{
		  Label = "3";
		  AMCLocale["Nalama"];
		  AMCLocale["Urumir"];

		},
		{
		  Label = "4";
		  AMCLocale["Falris"];
		  AMCLocale["Fyalenn"];
		  AMCLocale["Fyalenn&"];

		},
		{
		  Label = "5";
		  AMCLocale["SeerLib"];
		  AMCLocale["Arodis"];
		  AMCLocale["Veynna"];
		  AMCLocale["Volali"];
		  AMCLocale["Bardolan"];
		  AMCLocale["Bardolan&"];
		  AMCLocale["Voren"];
		  AMCLocale["Traini"];
		  AMCLocale["Traini&"];

		},
		{
		  Label = "6";
		  AMCLocale["Mi'irku"];
		  AMCLocale["Mi'irku&"];
		  AMCLocale["Olodam"];

		},
		{
		  Label = "7";
		  AMCLocale["Alamaro"];
		  AMCLocale["Amshesha"];
		  AMCLocale["Yurial"];

		},
		{
		  Label = "8";
		  AMCLocale["Quelama"];
		  AMCLocale["Selanam"];

		},
		{
		  Label = "9";
		  AMCLocale["Aelthin"];
		  AMCLocale["Alaenra"];

		},
		{
		  Label = "10";
		  AMCLocale["Delvinar"];
		  AMCLocale["Daenril"];
		  AMCLocale["Miralisse"];
		  AMCLocale["Irduil"];
		  AMCLocale["Barien"];
		  AMCLocale["Sinbei"];

		},
		{
		  Label = "11";
		  AMCLocale["LiftAR"];
		}
			},

	      {
		Name = AMCLocale["ARise"];
		Color = BLUE;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["Minalei"];
		  AMCLocale["Garul"];
		  AMCLocale["Oruhe"];
		},
		{
		  Label = "1";
		  AMCLocale["Nemiha"];
		  AMCLocale["Fono"];
		  AMCLocale["Zurii"];
		  AMCLocale["Lidio"];
		},
		{
		  Label = "2";
		  AMCLocale["Adyen"];
		  AMCLocale["Erothem"];
		},
		{
		  Label = "3";
		  AMCLocale["Caylee"];
		},
		{
		  Label = "4";
		  AMCLocale["Hamanar"];
		  AMCLocale["Inessera"];
		  AMCLocale["Ahemen"];
		},
		{
		  Label = "5";
		  AMCLocale["Dremm"];
		  AMCLocale["Aoa"];
		  AMCLocale["Korim"];
		  AMCLocale["Bova"];
		  AMCLocale["Kanhu"];
		  AMCLocale["Jijia"];
		  AMCLocale["Onodo"];
		  AMCLocale["Mihila"];
		},
		{
		  Label = "6";
		  AMCLocale["UnenLight"];
		  AMCLocale["Ishanah"];
		  AMCLocale["Kelara"];
		  AMCLocale["Asuur"];
		},
		{
		  Label = "7";
		  AMCLocale["ENagrand"];
		},
	      },
	    },
	  },
	  
	  SM = {
	    ZoneName = { AMCLocale["Silvermoon"] };
	    Location = { AMCLocale["Eversong Woods"] };

	    Areas = {
	      {
		Name = AMCLocale["Bazaar"];
		Color = WHITE;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		},
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "I";
		  AMCLocale["Wayfar"];
		  AMCLocale["Jovia"];
		  AMCLocale["Sylann"];
		  AMCLocale["Quelis"];
		  AMCLocale["Stove"];
		},
		{
		  Label = "1";
		  AMCLocale["SFinery"];
		  AMCLocale["Zyandrel"];
		  AMCLocale["Andra"];
		  AMCLocale["Rathin"];
		},
		{
		  Label = "2";
		  AMCLocale["Bithrus"];
		},
		{
		  Label = "3";
		  AMCLocale["Keelen's"];
		  AMCLocale["SorimL"];
		  AMCLocale["Keelen"];
		  AMCLocale["Deynna"];
		},
		{
		  Label = "4";
		  AMCLocale["Welethelon"];
		  AMCLocale["Noraelath"];
		},
		{
		  Label = "5";
		  AMCLocale["BladesbR"];
		  AMCLocale["Rahein"];
		  AMCLocale["Feledis"];
		},
		{
		  Label = "6";
		  AMCLocale["GeGoods"];
		  AMCLocale["Sathren"];
		  AMCLocale["Zalle"];
		},
		{
		  Label = "7";
		  AMCLocale["SSPMP"];
		  AMCLocale["Winthren"];
		  AMCLocale["Tynna"];
		  AMCLocale["Keeli"];
		},
		{
		  Label = "8";
		  AMCLocale["Parnis"];
		}
			},

	      {
		Name = AMCLocale["WElders"];
		Color = PURP;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "E";
		  AMCLocale["Defil"];
		},
		{
		  Label = "1";
		  AMCLocale["Harene"];
		},
		{
		  Label = "2";
		  AMCLocale["Valaani's"];
		  AMCLocale["Velanni"];
		  AMCLocale["Zathanna"];
		},
		{
		  Label = "3";
		  AMCLocale["Wayfar"];
		},
		{
		  Label = "4";
		  AMCLocale["CGate"];
		},
		{
		  Label = "5";
		  AMCLocale["SilRegistry"];
		  AMCLocale["Tandrine"];
		  AMCLocale["Kredis"];
		},
		{
		  Label = "6";
		  AMCLocale["Lynalis"];
		  AMCLocale["Zaralda"];
		  AMCLocale["Tyn"];
		},
		{
		  Label = "7";
		  AMCLocale["Drathen"];
		  AMCLocale["Olirea"];
		  AMCLocale["Alestus"];
		}
			},

	      {
		Name = AMCLocale["RoyEx"];
		Color = GREN;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		},
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "I";
		  AMCLocale["SCI"];
		  AMCLocale["Velandra"];
		  AMCLocale["Suntouched"];
		  AMCLocale["BKAdept"];
		  AMCLocale["Stillb"];
		  AMCLocale["Stove"];

		},
		{
		  Label = "1";
		  AMCLocale["Kalinda"];
		  AMCLocale["Gelanthis"];
		  AMCLocale["Amin"];
		}
			},

	      {
		Name = AMCLocale["FarSquare"];
		Color = _RED;
		{
		  Label = "E";
		  AMCLocale["Defil"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "D";
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		},
		{
		  Label = "1";
		  AMCLocale["Celana"];
		  AMCLocale["Matha"];
		},
		{
		  Label = "2";
		  AMCLocale["Osselan"];
		  AMCLocale["Ithelis"];
		  AMCLocale["CBachi"];
		  AMCLocale["Bvalor"];
		  AMCLocale["Ileda"];
		  PINK..""..AMCLocale["Bows"];
		  PINK..""..AMCLocale["Daggers"];
		  PINK..""..AMCLocale["Polearms"];
		  PINK..""..AMCLocale["Thrown"];
		  PINK..""..AMCLocale["One-Handed Sword"];
		  PINK..""..AMCLocale["Two-Handed Sword"];
		  AMCLocale["Astalor"];
		  AMCLocale["Solanar"];
		},
		{
		  Label = "3";
		  AMCLocale["Bipp"];
		  AMCLocale["Karen"];
		  AMCLocale["Gurak"];
		  AMCLocale["Duyash"];
		  AMCLocale["Krukk"];
		  AMCLocale["Mabrian"];
		  AMCLocale["Mabrian&"];
		  AMCLocale["HordeWar"];
		},
		{
		  Label = "4";
		  AMCLocale["SLowerSec"];
		},
		{
		  Label = "5";
		  AMCLocale["Shalenn"];
		  AMCLocale["Tana"];
		  AMCLocale["Oninath"];
		  AMCLocale["Zandine"];
		  AMCLocale["Halthenis"];
		},
		{
		  Label = "6";
		  AMCLocale["Zelan"];
		  AMCLocale["Belil"];
		  AMCLocale["Bemarrin"];
		  AMCLocale["Eriden"];
		  AMCLocale["Forge"];
		},
		{
		  Label = "7";
		  AMCLocale["Danwe"];
		  AMCLocale["Yatheon"];
		}
			},

	      {
		Name = AMCLocale["MurRow"];
		Color = LTBLU;
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["Nerisen"];
		  AMCLocale["Elara"];
		  AMCLocale["Zelanis"];
		  AMCLocale["Darlia"];
		},
		{
		  Label = "2";
		  AMCLocale["Talionia"];
		  AMCLocale["Alamma"];
		  AMCLocale["Zanien"];
		}
			},

	      {
		Name = AMCLocale["CourtSun"];
		Color = ORNG;
		{
		  Label = "E";
		  AMCLocale["Defil"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "1";
		  AMCLocale["Camberon"];
		  AMCLocale["Nathera"];
		  AMCLocale["Melaris"];
		},
		{
		  Label = "2";
		  AMCLocale["Sedana"];
		  AMCLocale["Lyna"];
		  AMCLocale["Zanatasia"];
		  AMCLocale["Lelorian"];
		}
			},

	      {
		Name = AMCLocale["SunSpire"];
		Color = BLUE;
		{
		  Label = "1";
		  AMCLocale["OrbTrans"];
		},
		{
		  Label = "2";
		  AMCLocale["Lor'themar"];
		  AMCLocale["Brightwing"];
		  AMCLocale["Rommath"];
		},
		{
		  Label = "3";
		  AMCLocale["Lotheolan"];
		  AMCLocale["Belestra"];
		  AMCLocale["Aldrae"];
		},
		{
		  Label = "4";
		  AMCLocale["Zaedana"];
		  AMCLocale["Quithas"];
		  AMCLocale["Inethven"];
		  AMCLocale["Narinth"];
		},
	      },
	    },
	  },
	 
	  SW = {
	    ZoneName = { AMCLocale["Stormwind"] };
	    Location = { AMCLocale["Elwynn Forest"] };

	    Areas = {
	      {
		Name = AMCLocale["ValHer"];
		Color = LTBLU;
		{
		  Label = "1";
		  AMCLocale["Jorgen"];
		},
		{
		  Label = "2";
		  AMCLocale["Umbrua"];
		},
		{
		  Label = "3";
		  AMCLocale["GMarcus"];
		},
		{
		  Label = "4";
		  AMCLocale["FMAfras"];
		},
		{
		  Label = "5";
		  AMCLocale["MMattin"];
		},
		{
		  Label = "6";
		  AMCLocale["Goodman"];
		}
			},

	      {
		Name = AMCLocale["TDistri"];
		Color = WHITE;
		{
		  Label = "B";
		  AMCLocale["SBank"];
		  AMCLocale["Mailbox"];
		  AMCLocale["Mahloof"];
		},
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "1";
		  AMCLocale["SWVC"];
		  AMCLocale["AdwinL"];
		  AMCLocale["RebecL"];
		},
		{
		  Label = "2";
		  AMCLocale["Trias'C"];
		  AMCLocale["ElainT"];
		  AMCLocale["BenT"];
		  AMCLocale["ETrias"];
		},
		{
		  Label = "3";
		  AMCLocale["Pestle's"];
		  AMCLocale["RenatG"];
		  AMCLocale["KyraB"];
		  AMCLocale["KeldrB"];
		  AMCLocale["MPestl"];
		},
		{
		  Label = "4";
		  AMCLocale["EveryM"];
		  AMCLocale["StefanT"];
		  AMCLocale["EdnaM"];
		  AMCLocale["TMull"];
		},
		{
		  Label = "5";
		  AMCLocale["Weller's"];
		  AMCLocale["MardaW"];
		  AMCLocale["GunthW"];
		  AMCLocale["WooPing"];
		  PINK..""..AMCLocale["Crossbow"];
		  PINK..""..AMCLocale["Daggers"];
		  PINK..""..AMCLocale["Polearms"];
		  PINK..""..AMCLocale["Staves"];
		  PINK..""..AMCLocale["One-Handed Sword"];
		  PINK..""..AMCLocale["Two-Handed Sword"];
		},
		{
		  Label = "6";
		  AMCLocale["LionArm"];
		  AMCLocale["CarlaG"];
		  AMCLocale["LaraM"];
		  AMCLocale["AldrM"];
		  AMCLocale["HarlB"];
		},
		{
		  Label = "7";
		  AMCLocale["TGRI"];
		  AMCLocale["InnAl"];
		},
		{
		  Label = "8";
		  AMCLocale["EmpQuiv"];
		  AMCLocale["FredeS"];
		  AMCLocale["LinaS"];
		},
		{
		  Label = "9";
		  AMCLocale["Bshop"];
		  AMCLocale["JSharp"];
		},
		{
		  Label = "10";
		  AMCLocale["DungL"];
		},
		{
		  Label = "11";
		  AMCLocale["FragFlow"];
		  AMCLocale["BGump"];
		  AMCLocale["FGump"];
		},
		{
		  Label = "12";
		  AMCLocale["CanalTail"];
		  AMCLocale["LisbS"];
		  AMCLocale["RemaS"];
		},
		{
		  Label = "13";
		  AMCLocale["ArnoL"];
		  AMCLocale["CatheL"];
		},
		{
		  Label = "14";
		  AMCLocale["GallWine"];
		  AMCLocale["JuliG"];
		  AMCLocale["RobertP"];
		  AMCLocale["SuzetG"];
		}
			},

	      {
		Name = AMCLocale["MageQuart"];
		Color = ORNG;
		{
		  Label = "1";
		  AMCLocale["Stock"];
		  AMCLocale["WThelw"];
		  AMCLocale["Stocks"];
		},
		{
		  Label = "2";
		  AMCLocale["CStanf"];
		  AMCLocale["McCorm"];
		},
		{
		  Label = "3";
		  AMCLocale["Mazen"];
		  AMCLocale["Mazen&"];
		  AMCLocale["AdairG"];
		  AMCLocale["ADellis"];
		},
		{
		  Label = "4";
		  AMCLocale["LucanC"];
		  AMCLocale["JessaraC"];
		},
		{
		  Label = "5";
		  AMCLocale["SWStaves"];
		  AMCLocale["ArdwynC"];
		  AMCLocale["AllanH"];
		},
		{
		  Label = "6";
		  AMCLocale["Duncan'sT"];
		  AMCLocale["DuncanC"];
		  AMCLocale["AlexanB"];
		  AMCLocale["GeorgB"];
		  AMCLocale["Clavicus"];
		  AMCLocale["Clavicus&"];
		},
		{
		  Label = "7";
		  AMCLocale["AlcNee"];
		  AMCLocale["Tannysa"];
		  AMCLocale["Lilyss"];
		  AMCLocale["MariaL"];
		  AMCLocale["Eldra"];
		},
		{
		  Label = "8";
		  AMCLocale["CollinM"];
		},
		{
		  Label = "9";
		  AMCLocale["BlueRec"];
		  AMCLocale["Joachim"];
		  AMCLocale["ConnerR"];
		  AMCLocale["SLohan"];
		  AMCLocale["AStern"];
		  AMCLocale["Mailbox"];
		  AMCLocale["CFire"];
		},
		{
		  Label = "10";
		  AMCLocale["AMalin"];
		},
		{
		  Label = "11";
		  AMCLocale["WizSan"];
		  AMCLocale["HAndromath"];
		  AMCLocale["JCannon"];
		  AMCLocale["Elsharin"];
		  AMCLocale["MDumas"];
		  AMCLocale["LPurdue"];
		},
		{
		  Label = "12";
		  AMCLocale["LarsonClo"];
		  AMCLocale["WLarson"];
		  AMCLocale["ELarson"];
		},
		{
		  Label = "13";
		  AMCLocale["EssenComp"];
		  AMCLocale["OVaughn"];
		},
		{
		  Label = "14";
		  AMCLocale["AncientCu"];
		  AMCLocale["Yserian"];
		},
		{
		  Label = "15";
		  AMCLocale["SlaughtLa"];
		  AMCLocale["Jarel"];
		  AMCLocale["Jalane"];
		  AMCLocale["Zardeth"];
		  AMCLocale["Sandahl"];
		  AMCLocale["Gakin"];
		  AMCLocale["Cloyce"];
		  AMCLocale["Deline"];
		  AMCLocale["Spackle"];
		},
		{
		  Label = "16";
		  AMCLocale["Pyrot"];
		  AMCLocale["Singh"];
		}
			},

	      {
		Name = AMCLocale["SWPark"];
		Color = CYAN;
		{
		  Label = "1";
		  AMCLocale["Folsom"];
		},
		{
		  Label = "2";
		  AMCLocale["Sylista"];
		},
		{
		  Label = "3";
		  AMCLocale["SWInn"];
		},
		{
		  Label = "4";
		  AMCLocale["Shylamir"];
		},
		{
		  Label = "5";
		  AMCLocale["Tavern"];
		  AMCLocale["Mailbox"];
		  AMCLocale["CFire"];
		},
		{
		  Label = "6";
		  AMCLocale["ArgosN"];
		  AMCLocale["Sheldras"];
		  AMCLocale["Theridian"];
		  AMCLocale["Maldryn"];
		  AMCLocale["NaraM"];
		},
		{
		  Label = "7";
		  AMCLocale["WAP"];
		  AMCLocale["Shailiea"];
		  AMCLocale["KimberG"];
		  AMCLocale["KellyG"];
		}
			},

	      {
		Name = AMCLocale["SWHarbor"];
		Color = _RED;
		{
		  Label = "1";
		  AMCLocale["Thargold"];
		},
		{
		  Label = "2";
		  AMCLocale["Nayura"];
		  AMCLocale["SAuberd"];
		},
		{
		  Label = "3";
		  AMCLocale["Assurance"];
		  AMCLocale["PCarver"];
		  AMCLocale["GCPK"];
		  AMCLocale["CurtisP"];
		},
		{
		  Label = "4";
		  AMCLocale["LeeshaT"];
		  AMCLocale["SVali"];
		},
		{
		  Label = "5";
		  AMCLocale["StevenA"];
		},
		{
		  Label = "6";
		  AMCLocale["SWlight"];
		}
			},

	      {
		Name = AMCLocale["CathSqua"];
		Color = PURP;
		{
		  Label = "1";
		  AMCLocale["MorrisL"];
		},
		{
		  Label = "2";
		  AMCLocale["FThread"];
		},
		{
		  Label = "3";
		  AMCLocale["JMaces"];
		  AMCLocale["GArdus"];
		},
		{
		  Label = "4";
		  AMCLocale["RPlates"];
		  AMCLocale["AgustM"];
		  AMCLocale["TheresM"];
		},
		{
		  Label = "5";
		  AMCLocale["BKrist"];
		},
		{
		  Label = "6";
		  AMCLocale["Orphanage"];
		  AMCLocale["OMNight"];
		  AMCLocale["Shel"];
		},
		{
		  Label = "7";
		  AMCLocale["CathLig"];
		  AMCLocale["BSarno"];
		  AMCLocale["Rall"];
		  AMCLocale["BFarth"];
		  AMCLocale["ABBened"];
		  AMCLocale["Gazin"];
		  AMCLocale["HPLaur"];
		  AMCLocale["JoshPT"];
		  AMCLocale["Benj"];
		},
		{
		  Label = "8";
		  AMCLocale["CathLig"];
		  AMCLocale["Grayson"];
		  AMCLocale["KathPT"];
		  AMCLocale["ArthPT"];
		},
		{
		  Label = "9";
		  AMCLocale["CathLig"];
		  AMCLocale["SFull"];
		  AMCLocale["BCass"];
		},
		{
		  Label = "10";
		  AMCLocale["CathLigD"];
		  AMCLocale["BAnton"];
		},
		{
		  Label = "11";
		  AMCLocale["CityHall"];
		  AMCLocale["BarosA"];
		  AMCLocale["RFBathr"];
		},
		{
		  Label = "12";
		  AMCLocale["ArgentD"];
		},
		{
		  Label = "13";
		  AMCLocale["OEmma"];
		  AMCLocale["OEmma&"];
		}
			},

	      {
		Name = AMCLocale["DwarvDist"];
		Color = YELL;
		{
		  Label = "1";
		  AMCLocale["CTAlley"];
		},
		{
		  Label = "2";
		  AMCLocale["GelmanS"];
		  AMCLocale["BrookS"];
		},
		{
		  Label = "3";
		  AMCLocale["BorgusS"];
		  AMCLocale["KathA"];
		  AMCLocale["Grimand"];
		},
		{
		  Label = "4";
		  AMCLocale["ThulmF"];
		},
		{
		  Label = "5";
		  AMCLocale["Shoni"];
		},
		{
		  Label = "6";
		  AMCLocale["LilliS"];
		  AMCLocale["BilliC"];
		},
		{
		  Label = "7";
		  AMCLocale["Deeprun Tram"];
		  AMCLocale["EyeStorm"];
		},
		{
		  Label = "8";
		  AMCLocale["TherumD"];
		  AMCLocale["KaitaD"];
		  AMCLocale["Hank"];
		  AMCLocale["Furen"];
		  AMCLocale["BeniB"];
		},
		{
		  Label = "9";
		  AMCLocale["Jenova"];
		  AMCLocale["Einris"];
		  AMCLocale["Ulfir"];
		  AMCLocale["Thorfin"];
		},
		{
		  Label = "10";
		  AMCLocale["Morgg"];
		},
		{
		  Label = "11";
		  AMCLocale["Tavern"];
		  AMCLocale["Brohann"];
		  AMCLocale["Wilder"];
		}
			},

	      {
		Name = AMCLocale["SWKeep"];
		Color = BLUE;
		{
		  Label = "1";
		  AMCLocale["PetCham"];
		  AMCLocale["CRRidge"];
		  AMCLocale["LBWishock"];
		  AMCLocale["Caledra"];
		},
		{
		  Label = "2";
		  AMCLocale["Varian"];
		  AMCLocale["Anduin"];
		  AMCLocale["ETaluun"];
		},
		{
		  Label = "3";
		  AMCLocale["Delavey"];
		},
		{
		  Label = "4";
		  AMCLocale["WarRoom"];
		  AMCLocale["Jes-Ter"];
		  AMCLocale["MithI"];
		  AMCLocale["Alliance Brigadier"];
		  AMCLocale["EyeStorm"];
		  AMCLocale["Beka"];
		  AMCLocale["ThelmS"];
		  AMCLocale["Elfarran"];
		  AMCLocale["Jovil"];
		  AMCLocale["Hotes"];
		  AMCLocale["Bethany"];
		},
		{
		  Label = "5";
		  AMCLocale["MSamuel"];
		},
		{
		  Label = "6";
		  AMCLocale["Tyrion"];
		  AMCLocale["Alicia"];
		},
		{
		  Label = "7";
		  AMCLocale["RoyLib"];
		  AMCLocale["Milton"];
		  AMCLocale["Donyal"];
		  AMCLocale["GregorL"];
		},
		{
		  Label = "8";
		  AMCLocale["RoyGal"];
		}
			},

	      {
		Name = AMCLocale["OldTown"];
		Color = GREN;
		{
		  Label = "1";
		  AMCLocale["HHW"];
		  AMCLocale["GKoen"];
		},
		{
		  Label = "2";
		  AMCLocale["Pig&W"];
		  AMCLocale["Mailbox"];
		  AMCLocale["ReeseL"];
		  AMCLocale["SRyback"];
		  AMCLocale["ETate"];
		  AMCLocale["KKabon"];
		  AMCLocale["Bartleby"];
		  AMCLocale["DLangs"];
		  AMCLocale["Aedis"];
		  AMCLocale["Faral"];
		  AMCLocale["HarryB"];
		  AMCLocale["EllyLang"];
		},
		{
		  Label = "3";
		  AMCLocale["FDV"];
		  AMCLocale["Lenney"];
		  AMCLocale["Beasley"];
		  AMCLocale["Dashel"];
		  AMCLocale["MilesS"];
		  AMCLocale["Wright"];
		},
		{
		  Label = "4";
		  AMCLocale["HonestB"];
		  AMCLocale["Heinrich"];
		},
		{
		  Label = "5";
		  AMCLocale["Immuni"];
		  AMCLocale["OStrang"];
		  AMCLocale["WStrang"];
		},
		{
		  Label = "6";
		  AMCLocale["Osborne"];
		},
		{
		  Label = "7";
		  AMCLocale["CHall"];
		  AMCLocale["O'Neal"];
		  AMCLocale["Jacksp"];
		  AMCLocale["Biggin"];
		  AMCLocale["Biggin&"];
		  AMCLocale["Karter"];
		  AMCLocale["Tristia"];
		  AMCLocale["Skyshad"];
		  AMCLocale["Ennarth"];
		  AMCLocale["Gaiman"];
		  AMCLocale["Vaccar"];
		  AMCLocale["Dirgeh"];
		  AMCLocale["Dirgeh&"];
		  AMCLocale["Moonst"];
		  AMCLocale["Moonst&"];
		  AMCLocale["Clate"];
		},
		{
		  Label = "8";
		  AMCLocale["ComCent"];
		  AMCLocale["G Dummy"];
		  AMCLocale["Wood"];
		  AMCLocale["IlsaC"];
		  AMCLocale["WuShen"];
		  AMCLocale["AnderG"];
		},
		{
		  Label = "9";
		  AMCLocale["SI:7"];
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		  AMCLocale["Mathias"];
		  AMCLocale["Renzik"];
		  AMCLocale["Sloan"];
		  AMCLocale["Fel"];
		  AMCLocale["Romano"];
		  AMCLocale["Mixil"];
		},
		{
		  Label = "10";
		  AMCLocale["ProHide"];
		  AMCLocale["STanner"];
		  AMCLocale["JTanner"];
		  AMCLocale["Granger"];
		  AMCLocale["AlyssaG"];
		  AMCLocale["SeomanG"];
		  AMCLocale["Noah"];
		},
		{
		  Label = "11";
		  AMCLocale["ThanBoo"];
		  AMCLocale["Mayda"];
		},
		{
		  Label = "12";
		  AMCLocale["SilverSh"];
		  AMCLocale["BCross"];
		},
		{
		  Label = "13";
		  AMCLocale["JennL"];
		  AMCLocale["Nikova"];
		  AMCLocale["Nikova&"];
		  AMCLocale["Nikova&1"];
		},
	      },
	    },
	  },
	 
	  TB = {
	    ZoneName = { AMCLocale["Thunder Bluff"] };
	    Location = { AMCLocale["Mulgore"] };

	    Areas = {
	      {
		Name = AMCLocale["LLevel"];
		Color = WHITE;
		{
		  Label = "AH";
		  AMCLocale["AH"];
		},
		{
		  Label = "M";
		  AMCLocale["Mailbox"];
		},
		{
		  Label = "B";
		  AMCLocale["Bank"];
		},
		{
		  Label = "L";
		  AMCLocale["ElevM"];
		},
		{
		  Label = "E";
		  AMCLocale["EyeStorm"];
		},
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["Pala"];
		  AMCLocale["Bulrug"];
		  AMCLocale["AtHR"];
		},
		{
		  Label = "1";
		  AMCLocale["TBCI"];
		  AMCLocale["Thrumn"];
		  AMCLocale["Krumn"];
		  AMCLocale["Scorch"];
		},
		{
		  Label = "2";
		  AMCLocale["Kuruk's"];
		  AMCLocale["Kuruk"];
		  AMCLocale["Pakwa"];
		},
		{
		  Label = "3";
		  AMCLocale["TGASu"];
		  AMCLocale["ShadiM"];
		},
		{
		  Label = "4";
		  AMCLocale["Jyn"];
		  AMCLocale["Ansek"];
		  AMCLocale["Guns"];
		  AMCLocale["Staves"];
		  AMCLocale["One-Handed Maces"];
		  AMCLocale["Two-Handed Maces"];
		},
		{
		  Label = "5";
		  AMCLocale["Hewa's"];
		  AMCLocale["Hewa"];
		  AMCLocale["Elki"];
		  AMCLocale["Ahanu"];
		},
		{
		  Label = "6";
		  AMCLocale["Tal"];
		  AMCLocale["ALLMLUL"];
		  AMCLocale["ALLMLUL&"];
		},
		{
		  Label = "7";
		  AMCLocale["derstr"];
		  AMCLocale["derstr&"];
		},
		{
		  Label = "8";
		  AMCLocale["BandG"];
		  AMCLocale["Fry"];
		},
		{
		  Label = "9";
		  AMCLocale["Karn's"];
		  AMCLocale["Karn"];
		  AMCLocale["Taur"];
		  AMCLocale["Orm"];
		  AMCLocale["Forge"];
		},
		{
		  Label = "10";
		  AMCLocale["Truths"];
		  AMCLocale["AtSR"];
		},
		{
		  Label = "11";
		  AMCLocale["Geology"];
		  AMCLocale["Brek"];
		  AMCLocale["KurmS"];
		},
		{
		  Label = "12";
		  AMCLocale["Eyahn"];
		  AMCLocale["Auld"];
		},
		{
		  Label = "13";
		  AMCLocale["Chepi"];
		  AMCLocale["Chepi&"];
		  AMCLocale["Windst"];
		  AMCLocale["Windst&"];
		}
			},

	      {
		Name = AMCLocale["MLevel"];
		Color = PURP;
		{
		  Label = "L";
		  AMCLocale["ElevM"];
		},
		{
		  Label = "E";
		  AMCLocale["EyeStorm"];
		},
		{
		  Label = "1";
		  AMCLocale["Thund"];
		  AMCLocale["Kuna"];
		},
		{
		  Label = "2";
		  AMCLocale["FaV"];
		  AMCLocale["Nan"];
		},
		{
		  Label = "3";
		  AMCLocale["Holis"];
		  AMCLocale["Komin"];
		  AMCLocale["Nida"];
		},
		{
		  Label = "4";
		  AMCLocale["AtER"];
		},
		{
		  Label = "5";
		  AMCLocale["CloudB"];
		  AMCLocale["Tand"];
		},
		{
		  Label = "6";
		  AMCLocale["Bena's"];
		  AMCLocale["Bena"];
		  AMCLocale["Mani"];
		},
		{
		  Label = "7";
		  AMCLocale["TBEnchanters"];
		  AMCLocale["Teg"];
		  AMCLocale["Nata"];
		},
		{
		  Label = "8";
		  AMCLocale["AtSR"];
		},
		{
		  Label = "9";
		  AMCLocale["TBArmorers"];
		  AMCLocale["Mooranta"];
		  AMCLocale["Veren"];
		  AMCLocale["Tepa"];
		  AMCLocale["Mahu"];
		  AMCLocale["Tagain"];
		  AMCLocale["Fela"];
		  AMCLocale["Grod"];
		  AMCLocale["Una"];
		  AMCLocale["Rumstag"];
		  AMCLocale["Rumstag&"];
		}
			},

	      {
		Name = AMCLocale["ULevel"];
		Color = YELL;
		{
		  Label = "1";
		  AMCLocale["Rainsticks"];
		  AMCLocale["Sunn"];
		},
		{
		  Label = "2";
		  AMCLocale["KS&R"];
		  AMCLocale["Kaga"];
		},
		{
		  Label = "3";
		  AMCLocale["WinterT"];
		  AMCLocale["Tah"];
		},
		{
		  Label = "4";
		  AMCLocale["MTB&T"];
		  AMCLocale["Kah"];
		  AMCLocale["Sewa"];
		},
		{
		  Label = "5";
		  AMCLocale["AtER"];
		},
		{
		  Label = "6";
		  AMCLocale["CairneB"];
		},
		{
		  Label = "7";
		  AMCLocale["Halpa"];
		},
		{
		  Label = "8";
		  AMCLocale["AtHR"];
		},
		{
		  Label = "9";
		  AMCLocale["TBFirea"];
		  AMCLocale["Hogor"];
		},
		{
		  Label = "10";
		  AMCLocale["Raget"];
		  AMCLocale["Delgo"];
		  AMCLocale["Etu"];
		  AMCLocale["Ohanko"];
		  AMCLocale["Kard"];
		},
		{
		  Label = "11";
		  AMCLocale["Sura"];
		},
		{
		  Label = "12";
		  AMCLocale["Aska's"];
		  AMCLocale["Aska"];
		  AMCLocale["Naal"];
		},
		{
		  Label = "13";
		  AMCLocale["Zangen"];
		}
			},

	      {
		Name = AMCLocale["HuntR"];
		Color = BLUE;
		{
		  Label = "D";
		  AMCLocale["E Dummy"];
		  AMCLocale["M Dummy"];
		  AMCLocale["G Dummy"];
		  AMCLocale["H Dummy"];
		},
		{
		  Label = "1";
		  AMCLocale["HHall"];
		  AMCLocale["Urek"];
		  AMCLocale["Kary"];
		  AMCLocale["Holt"];
		  AMCLocale["Sark"];
		  AMCLocale["Torm"];
		  AMCLocale["Ker"];
		},
		{
		  Label = "2";
		  AMCLocale["Saern"];
		  AMCLocale["Melor"];
		},
		{
		  Label = "3";
		  AMCLocale["Althal"];
		  AMCLocale["Martin"];
		  AMCLocale["Fizim"];
		},
		{
		  Label = "4";
		  AMCLocale["Kergul"];
		  AMCLocale["Taim"];
		  AMCLocale["Ufuda"];
		  AMCLocale["Ufuda&"];
		},
		{
		  Label = "5";
		  AMCLocale["Mosarn"];
		},
		{
		  Label = "6";
		  AMCLocale["Hesuwa"];
		}
			},

	      {
		Name = AMCLocale["ERise"];
		Color = GREN;
		{
		  Label = "1";
		  AMCLocale["HElders"];
		  AMCLocale["Kym"];
		  AMCLocale["Turak"];
		  AMCLocale["Sheal"];
		  AMCLocale["Nara"];
		  AMCLocale["ADHamuul"];
		},
		{
		  Label = "2";
		  AMCLocale["Bashana"];
		},
		{
		  Label = "3";
		  AMCLocale["Rahuro"];
		  AMCLocale["Magatha"];
		  AMCLocale["Cor"];
		  AMCLocale["Gorm"];
		},
		{
		  Label = "4";
		  AMCLocale["ERDrums"];
		  AMCLocale["Sheza"];
		},
		{
		  Label = "5";
		  AMCLocale["Ghede"];
		}
			},

	      {
		Name = AMCLocale["SRise"];
		Color = ORNG;
		{
		  Label = "1";
		  AMCLocale["HallofS"];
		  AMCLocale["Beram"];
		  AMCLocale["Siln"];
		  AMCLocale["Tigor"];
		  AMCLocale["Xanis"];
		},
		{
		  Label = "2";
		  AMCLocale["SHealing"];
		  AMCLocale["Pand"];
		},
		{
		  Label = "3";
		  AMCLocale["Pawe"];
		},
		{
		  Label = "4";
		  AMCLocale["PVision"];
		  AMCLocale["Clarice"];
		  AMCLocale["Poshken"];
		  AMCLocale["Mertle"];
		  AMCLocale["Malakai"];
		  AMCLocale["Zamah"];
		  AMCLocale["Cranst"];
		  AMCLocale["Shymm"];
		  AMCLocale["Welsh"];
		  AMCLocale["Ursyn"];
		  AMCLocale["FCobb"];
		  AMCLocale["Xane"];
		},
	      },
	    },
	  },
	 
	  UC = {
	    ZoneName = { AMCLocale["Undercity"] };
	    Location = { AMCLocale["Tirisfal Glades"] };

	    Areas = {
	      {
		Name = AMCLocale["TraQuart"];
		Color = WHITE;
		{
		  Label = "B";
		  AMCLocale["Bank"];

		},
		{
		  Label = "A";
		  AMCLocale["Aucti"];
		  AMCLocale["Aucti&"];

		},
		{
		  Label = "I";
		  AMCLocale["Inn"];
		  AMCLocale["INorman"];
		  AMCLocale["AMaulray"];
		  AMCLocale["Mailbox"];

		},
		{
		  Label = "1";
		  AMCLocale["GenGoods"];
		  AMCLocale["ERusk"];
		},
		{
		  Label = "2";
		  AMCLocale["GenGoods"];
		  AMCLocale["FDoan"];
		  AMCLocale["GCallow"];
		},
		{
		  Label = "3";
		  AMCLocale["BHandler"];
		  AMCLocale["MGarrett"];
		  AMCLocale["PGarrett"];
		},
		{
		  Label = "4";
		  AMCLocale["OGothena"];
		},
		{
		  Label = "5";
		  AMCLocale["UWeapons"];
		  AMCLocale["GWendham"];
		  AMCLocale["LWarren"];
		},
		{
		  Label = "6";
		  AMCLocale["UHArmor"];
		  AMCLocale["TWeldon"];
		  AMCLocale["WElling"];
		},
		{
		  Label = "7";
		  AMCLocale["ULArmor"];
		  AMCLocale["LNewcomb"];
		  AMCLocale["DBartlett"];
		},
		{
		  Label = "8";
		  AMCLocale["MReagents"];
		  AMCLocale["Mordan"];
		},
		{
		  Label = "9";
		  AMCLocale["Bshop"];
		  AMCLocale["NaznikS"];
		  AMCLocale["ECairn"];
		},
		{
		  Label = "10";
		  AMCLocale["TawnyG"];
		  AMCLocale["TawnyG&"];
		  AMCLocale["TawnyG&1"];
		},
		{
		  Label = "11";
		  AMCLocale["GuildCT"];
		  AMCLocale["ROBauhaus"];
		  AMCLocale["EReming"];
		  AMCLocale["CDrakul"];
		  AMCLocale["MPleas"];
		},
		{
		  Label = "12";
		  AMCLocale["UCook"];
		  AMCLocale["EBurch"];
		  AMCLocale["RBurch"];
		  AMCLocale["RAndrean"];
		},
		{
		  Label = "13";
		  AMCLocale["JPayson"];
		},
		{
		  Label = "14";
		  AMCLocale["Balth"];
		  AMCLocale["Balth&"];
		  AMCLocale["Balth&1"];
		}
			},

	      {
		Name = AMCLocale["Apothe"];
		Color = PURP;
		{
		  Label = "1";
		  AMCLocale["dugur"];
		},
		{
		  Label = "2";
		  AMCLocale["UHerba"];
		  AMCLocale["MAllie"];
		  AMCLocale["KAllie"];
		},
		{
		  Label = "3";
		  AMCLocale["ALuca"];
		},
		{
		  Label = "4";
		  AMCLocale["UEnchant"];
		  AMCLocale["LCrowe"];
		  AMCLocale["TWebb"];
		},
		{
		  Label = "5";
		  AMCLocale["Parq"];
		},
		{
		  Label = "6";
		  AMCLocale["AGant"];
		},
		{
		  Label = "7";
		  AMCLocale["Alchemist"];
		  AMCLocale["Algernon"];
		  AMCLocale["DMarsh"];
		},
		{
		  Label = "8";
		  AMCLocale["DMFelben"];
		  AMCLocale["MAFaranell"];
		  AMCLocale["MAFaranell&"];
		  AMCLocale["DHHalsey"];
		  AMCLocale["Zinge"];
		  AMCLocale["Fuely"];
		  AMCLocale["Cuely"];
		  AMCLocale["TheodG"];
		  AMCLocale["AKeev"];
		}
			},

	      {
		Name = AMCLocale["WarQuart"];
		Color = BLUE;
		{
		  Label = "1";
		  AMCLocale["GerardA"];
		  AMCLocale["LeonaT"];
		  AMCLocale["JoannW"];
		},
		{
		  Label = "2";
		  AMCLocale["UBowM"];
		  AMCLocale["AbigS"];
		},
		{
		  Label = "3";
		  AMCLocale["UMining"];
		  AMCLocale["BromK"];
		  AMCLocale["SarahK"];
		},
		{
		  Label = "4";
		  AMCLocale["UWeapM"];
		  AMCLocale["Abald"];
		  PINK..""..AMCLocale["Crossbow"];
		  PINK..""..AMCLocale["Daggers"];
		  PINK..""..AMCLocale["Polearms"];
		  PINK..""..AMCLocale["One-Handed Sword"];
		  PINK..""..AMCLocale["Two-Handed Sword"];
		  AMCLocale["GeoffH"];
		  AMCLocale["BeniF"];
		  AMCLocale["FranE"];
		},
		{
		  Label = "5";
		  AMCLocale["UBlacks"];
		  AMCLocale["JVBrunt"];
		  AMCLocale["SVBrunt"];
		  AMCLocale["MTrem"];
		  AMCLocale["Forge"];
		},
		{
		  Label = "6";
		  AMCLocale["UGunsm"];
		  AMCLocale["NAtwood"];
		},
		{
		  Label = "7";
		  AMCLocale["HAtwood"];
		},
		{
		  Label = "8";
		  AMCLocale["SHouser"];
		  AMCLocale["SRutger"];
		},
		{
		  Label = "9";
		  AMCLocale["FLanke"];
		  AMCLocale["FLaza"];
		  AMCLocale["UAelth"];
		  AMCLocale["BFowl"];
		  AMCLocale["ACurt"];
		  AMCLocale["ChristW"];
		}
			},

	      {
		Name = AMCLocale["MagQuart"];
		Color = GREN;
		{
		  Label = "1";
		  AMCLocale["UStaff"];
		  AMCLocale["SUpton"];
		  AMCLocale["ZaneB"];
		},
		{
		  Label = "2";
		  AMCLocale["UTailor"];
		  AMCLocale["RalsF"];
		  AMCLocale["SVCroy"];
		  AMCLocale["Josef"];
		  AMCLocale["Millie"];
		  AMCLocale["LuciC"];
		},
		{
		  Label = "3";
		  AMCLocale["OranS"];
		  AMCLocale["SamaS"];
		  AMCLocale["AndrB"];
		},
		{
		  Label = "4";
		  AMCLocale["UCarto"];
		  AMCLocale["JorahA"];
		},
		{
		  Label = "5";
		  AMCLocale["UBook"];
		  AMCLocale["SalazB"];
		},
		{
		  Label = "6";
		  AMCLocale["UReag"];
		  AMCLocale["HannA"];
		},
		{
		  Label = "7";
		  AMCLocale["URelic"];
		  AMCLocale["SilasZ"];
		},
		{
		  Label = "8";
		  AMCLocale["JList"];
		},
		{
		  Label = "9";
		  AMCLocale["CHalg"];
		},
		{
		  Label = "10";
		  AMCLocale["UpLevel"];
		  AMCLocale["LMort"];
		  AMCLocale["BIces"];
		},
		{
		  Label = "11";
		  AMCLocale["UpLevel"];
		  AMCLocale["RKerw"];
		},
		{
		  Label = "12";
		  AMCLocale["UpLevel"];
		  AMCLocale["AHart"];
		},
		{
		  Label = "13";
		  AMCLocale["LoLevel"];
		  AMCLocale["LPick"];
		  AMCLocale["KaalS"];
		  AMCLocale["KaelyH"];
		  AMCLocale["PiercS"];
		  AMCLocale["MartS"];
		  AMCLocale["GodrF"];
		},
		{
		  Label = "14";
		  AMCLocale["ArmaC"];
		  AMCLocale["LizbC"];
		}
			},

	      {
		Name = AMCLocale["RogQuart"];
		Color = ORNG;
		{
		  Label = "1";
		  AMCLocale["UDag"];
		  AMCLocale["CSeat"];
		  AMCLocale["NStee"];
		},
		{
		  Label = "2";
		  AMCLocale["UPois"];
		  AMCLocale["EGrav"];
		},
		{
		  Label = "3";
		  AMCLocale["MEdra"];
		},
		{
		  Label = "4";
		  AMCLocale["ULeat"];
		  AMCLocale["ArthM"];
		  AMCLocale["JoseM"];
		  AMCLocale["GillM"];
		  AMCLocale["KillH"];
		},
		{
		  Label = "5";
		  AMCLocale["UBag"];
		  AMCLocale["JonaC"];
		},
		{
		  Label = "6";
		  AMCLocale["UEngin"];
		  AMCLocale["FrankL"];
		  AMCLocale["ElizVT"];
		  AMCLocale["GrahVT"];
		  AMCLocale["LucF"];
		  AMCLocale["Forge"];
		},
		{
		  Label = "7";
		  AMCLocale["EsteG"];
		},
		{
		  Label = "8";
		  AMCLocale["CaroW"];
		  AMCLocale["MileD"];
		  AMCLocale["GregC"];
		  AMCLocale["MennC"];
		},
		{
		  Label = "9";
		  AMCLocale["WaltS"];
		}
			},

	      {
		Name = AMCLocale["RoyalQua"];
		Color = _RED;
		{
		  Label = "1";
		  AMCLocale["LadWindr"];
		  AMCLocale["Sharl"];
		  AMCLocale["Varima"];
		  AMCLocale["ASunsor"];
		  AMCLocale["CyssaD"];
		},
		{
		  Label = "2";
		  AMCLocale["GrizHalf"];
		},
		{
		  Label = "3";
		  AMCLocale["HordeWar"];
		  AMCLocale["RexPix"];
		},
		{
		  Label = "4";
		  AMCLocale["SirMalo"];
		},
		{
		  Label = "5";
		  AMCLocale["Lyrlia"];
		},
		{
		  Label = "6";
		  AMCLocale["KurdB"];
		  AMCLocale["SForth"];
		  AMCLocale["SForth&"];
		},
	      },
	    },
	  },
	 }

	Atlas_RegisterPlugin("AtlasMajorCities", myCategory, myData);


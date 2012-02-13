--[[
	MapNotes: Adds a note system to the WorldMap and other AddOns that use the Plugins facility provided

	See the README file for more information.
]]

MAPNOTES_VERSION = "5.16.30200";
MAPNOTES_EDITION = "Fan's Update";

MN_DEFAULT_SCALE = 0.75;
MN_DEFAULT_ISCALE = 16;
MN_DEFAULT_ASCALE = 1;

-- Commands
MAPNOTES_ENABLE_COMMANDS = { "/mapnote", "/mapnotes", "/mn" };				
MAPNOTES_ONENOTE_COMMANDS = { "/onenote", "/allowonenote", "/aon", "/mn1" };		
MAPNOTES_MININOTE_COMMANDS = { "/nextmininote", "/nmn", "/mnmn" };			
MAPNOTES_MININOTEONLY_COMMANDS = { "/nextmininoteonly", "/nmno", "/mnmn1" };		
MAPNOTES_MININOTEOFF_COMMANDS = { "/mininoteoff", "/mno", "/mnmn0" };			
MAPNOTES_MNTLOC_COMMANDS = { "/mntloc" }
MAPNOTES_QUICKNOTE_COMMANDS = { "/quicknote", "/qnote", "/mnq" };			
MAPNOTES_QUICKTLOC_COMMANDS = { "/quicktloc", "/qtloc", "/mnqtloc" };
MAPNOTES_SEARCH_COMMANDS = { "/mnsearch", "/mns" };
MAPNOTES_HLIGHT_COMMANDS = { "/mnhighlight", "/mnhl" };
MAPNOTES_MINICOORDS_COMMANDS = { "/mnminic" };
MAPNOTES_MAPCOORDS_COMMANDS = { "/mnmapc" };
MAPNOTES_NTARGET_COMMANDS = { "/mnt" };
MAPNOTES_MTARGET_COMMANDS = { "/mnm" };
MAPNOTES_WFC_COMMANDS = { "/tloc", "/thottbottloc" };
-- Import Commands
MAPNOTES_IMPORT_METAMAP = { "/MapNotes_Import_MetaMap" };				--Telic_4
MAPNOTES_IMPORT_ALPHAMAP = { "/MapNotes_Import_AlphaMap" };				--Telic_4
MAPNOTES_IMPORT_ALPHAMAPBG = { "/MapNotes_Import_AlphaMapBG" };			--Telic_4
MAPNOTES_IMPORT_CTMAPMOD = { "/MapNotes_Import_CTMapMod" };				--Telic_4

MAPNOTES_DFLT_ICONSIZE = 18;
MAPNOTES_BORDER = 46;

MapNotes_Mininote_UpdateRate = 0.01;	-- Update rate required when a 'child' of Minimap, is less than 0.03 !!!
										-- so moved the parent of the OnUpdate Function to the UI - buttons still
										-- children of Minimap obviously
										-- 5.60 - To provide for sufficient performance for Rotating Minimap support
										-- this has been put back to a Minimap level OnUpdate, and a value of similar
										-- magnitude to the original
MapNotes_WorldMap_UpdateRate = 0.1;
MapNotes_MinDiff = 7;
MAPNOTES_MAXLINES = 100;

MN_COORD_FS = {
	[0] = "%d, %d",
	[1] = "%.1f, %.1f",
	[2] = "%.2f, %.2f",
};
MN_COORD_F  = 1;

MAPNOTES_BASEKEYS = {
	["WM LochModan"] = {
		["miniData"] = {
			["scale"] = 0.07839152145224,
			["xOffset"] = 0.51118749188138,
			["yOffset"] = 0.50940913489577,
		},
	},
	["WM BurningSteppes"] = {
		["miniData"] = {
			["scale"] = 0.08321525646393001,
			["xOffset"] = 0.04621224670174,
			["yOffset"] = 0.61780780524905,
		},
	},
	["WM Moonglade"] = {
		["miniData"] = {
			["scale"] = 0.06292695969921,
			["xOffset"] = 0.50130287793373,
			["yOffset"] = 0.17560823085517,
		},
	},
	["WM Barrens"] = {
		["miniData"] = {
			["scale"] = 0.27539211944292,
			["xOffset"] = 0.3924934733345,
			["yOffset"] = 0.45601063260257,
		},
	},
	["WM Winterspring"] = {
		["miniData"] = {
			["scale"] = 0.19293573573141,
			["xOffset"] = 0.47237382938446,
			["yOffset"] = 0.17390990272233,
		},
	},
	["WM Ogrimmar"] = {
		["miniData"] = {
			["scale"] = 0.03811449638057,
			["xOffset"] = 0.56378554142668,
			["yOffset"] = 0.42905218646258,
		},
	},
	["WM Westfall"] = {
		["miniData"] = {
			["scale"] = 0.09943208435841,
			["xOffset"] = 0.36884571674582,
			["yOffset"] = 0.71874918595783,
		},
	},
	["WM Badlands"] = {
		["miniData"] = {
			["scale"] = 0.07066771883566,
			["xOffset"] = 0.51361415033147,
			["yOffset"] = 0.56915717993261,
		},
	},
	["WM Darkshore"] = {
		["miniData"] = {
			["scale"] = 0.17799008894522,
			["xOffset"] = 0.38383175154516,
			["yOffset"] = 0.18206216123156,
		},
	},
	["WM Undercity"] = {
		["miniData"] = {
			["scale"] = 0.02727719546939,
			["xOffset"] = 0.4297399924566,
			["yOffset"] = 0.23815358517831,
		},
	},
	["WM Dalaran1"] = {
		["miniData"] = {
			["scale"] = 0.02727719546939,
			["xOffset"] = 0.4297399924566,
			["yOffset"] = 0.23815358517831,
		},
	},
	["WM Dalaran2"] = {
		["miniData"] = {
			["scale"] = 0.02727719546939,
			["xOffset"] = 0.4297399924566,
			["yOffset"] = 0.23815358517831,
		},
	},
	["WM Desolace"] = {
		["miniData"] = {
			["scale"] = 0.12219839120669,
			["xOffset"] = 0.34873187115693,
			["yOffset"] = 0.50331046935371,
		},
	},
	["WM Tanaris"] = {
		["miniData"] = {
			["scale"] = 0.18750104661175,
			["xOffset"] = 0.46971301480866,
			["yOffset"] = 0.76120931364891,
		},
	},
	["WM Durotar"] = {
		["miniData"] = {
			["scale"] = 0.1436829497008,
			["xOffset"] = 0.5170978270910001,
			["yOffset"] = 0.44802818134926,
		},
	},
	["WM Silithus"] = {
		["miniData"] = {
			["scale"] = 0.18885969712845,
			["xOffset"] = 0.33763582469211,
			["yOffset"] = 0.7581522495192899,
		},
	},
	["WM SwampOfSorrows"] = {
		["miniData"] = {
			["scale"] = 0.06516347991404001,
			["xOffset"] = 0.5176979527207,
			["yOffset"] = 0.7281597470161501,
		},
	},
	["WM StonetalonMountains"] = {
		["miniData"] = {
			["scale"] = 0.13272833611061,
			["xOffset"] = 0.37556627748617,
			["yOffset"] = 0.40285135292988,
		},
	},
	["WM Darnassis"] = {
		["miniData"] = {
			["scale"] = 0.02876626176374,
			["xOffset"] = 0.38392150175204,
			["yOffset"] = 0.10441296545475,
		},
	},
	["WM Alterac"] = {
		["miniData"] = {
			["scale"] = 0.07954563533736,
			["xOffset"] = 0.43229874660542,
			["yOffset"] = 0.25425926375262,
		},
	},
	["WM SearingGorge"] = {
		["miniData"] = {
			["scale"] = 0.06338794005822999,
			["xOffset"] = 0.46372051266487,
			["yOffset"] = 0.5781237938250901,
		},
	},
	["WM AlteracValley"] = {
		["miniData"] = {
			["scale"] = 0.13,
			["xOffset"] = 0.41757282062541,
			["yOffset"] = 0.33126468682991,
		},
	},
	["WM Hilsbrad"] = {
		["miniData"] = {
			["scale"] = 0.09090931690055,
			["xOffset"] = 0.4242436124746,
			["yOffset"] = 0.30113436864162,
		},
	},
	["WM Wetlands"] = {
		["miniData"] = {
			["scale"] = 0.11745423014662,
			["xOffset"] = 0.46561438951659,
			["yOffset"] = 0.40971063365152,
		},
	},
	["WM Duskwood"] = {
		["miniData"] = {
			["scale"] = 0.07670475476181,
			["xOffset"] = 0.43087243362495,
			["yOffset"] = 0.73224350550454,
		},
	},
	["WM ThousandNeedles"] = {
		["miniData"] = {
			["scale"] = 0.1195658287792,
			["xOffset"] = 0.47554411191734,
			["yOffset"] = 0.6834235638965001,
		},
	},
	["WM WesternPlaguelands"] = {
		["miniData"] = {
			["scale"] = 0.12215946583965,
			["xOffset"] = 0.44270955019641,
			["yOffset"] = 0.17471356786018,
		},
	},
	["WM Ashenvale"] = {
		["miniData"] = {
			["scale"] = 0.15670371525706,
			["xOffset"] = 0.41757282062541,
			["yOffset"] = 0.33126468682991,
		},
	},
	["WM Teldrassil"] = {
		["miniData"] = {
			["scale"] = 0.13836131003639,
			["xOffset"] = 0.36011098024729,
			["yOffset"] = 0.0394832297921,
		},
	},
	["WM Tirisfal"] = {
		["miniData"] = {
			["scale"] = 0.12837403412087,
			["xOffset"] = 0.36837217317549,
			["yOffset"] = 0.15464954319582,
		},
	},
	["WM Mulgore"] = {
		["miniData"] = {
			["scale"] = 0.13960673216274,
			["xOffset"] = 0.40811854919226,
			["yOffset"] = 0.53286226907346,
		},
	},
	["WM Ironforge"] = {
		["miniData"] = {
			["scale"] = 0.02248317426784,
			["xOffset"] = 0.47481923366335,
			["yOffset"] = 0.51289242617182,
		},
	},
	["WM Felwood"] = {
		["miniData"] = {
			["scale"] = 0.15625084006464,
			["xOffset"] = 0.41995800144849,
			["yOffset"] = 0.23097545880609,
		},
	},
	["WM Silverpine"] = {
		["miniData"] = {
			["scale"] = 0.11931848806212,
			["xOffset"] = 0.3565350229009,
			["yOffset"] = 0.24715695496522,
		},
	},
	["WM Aszhara"] = {
		["miniData"] = {
			["scale"] = 0.13779501505279,
			["xOffset"] = 0.5528203691804901,
			["yOffset"] = 0.30400571307545,
		},
	},
	["WM Hinterlands"] = {
		["miniData"] = {
			["scale"] = 0.10937523495111,
			["xOffset"] = 0.49929119700867,
			["yOffset"] = 0.25567971676068,
		},
	},
	["WM ArathiBasin"] = {
		["miniData"] = {
			["scale"] = 0.045,
			["xOffset"] = 0.41757282062541,
			["yOffset"] = 0.33126468682991,
		},
	},
	["WM UngoroCrater"] = {
		["miniData"] = {
			["scale"] = 0.10054401185671,
			["xOffset"] = 0.4492759445152,
			["yOffset"] = 0.7649457362940501,
		},
	},
	["WM Stormwind"] = {
		["miniData"] = {
			["scale"] = 0.03819701270887,
			["xOffset"] = 0.41531450060561,
			["yOffset"] = 0.67097280492581,
		},
	},
	["WM Elwynn"] = {
		["miniData"] = {
			["scale"] = 0.09860350595046,
			["xOffset"] = 0.41092682316676,
			["yOffset"] = 0.65651531970162,
		},
	},
	["WM Redridge"] = {
		["miniData"] = {
			["scale"] = 0.06170112311456,
			["xOffset"] = 0.49917278340928,
			["yOffset"] = 0.68359285304999,
		},
	},
	["WM EasternPlaguelands"] = {
		["miniData"] = {
			["scale"] = 0.10996723642661,
			["xOffset"] = 0.51663255550387,
			["yOffset"] = 0.15624753972085,
		},
	},
	["WM DunMorogh"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		},
	},
	["WM DeadwindPass"] = {
		["miniData"] = {
			["scale"] = 0.07102298961531001,
			["xOffset"] = 0.47822105868635,
			["yOffset"] = 0.7386355504851601,
		},
	},
	["WM Feralas"] = {
		["miniData"] = {
			["scale"] = 0.18885970960818,
			["xOffset"] = 0.31589651244686,
			["yOffset"] = 0.61820581746798,
		},
	},
	["WM BlastedLands"] = {
		["miniData"] = {
			["scale"] = 0.09517074521836,
			["xOffset"] = 0.48982154167011,
			["yOffset"] = 0.7684651998651,
		},
	},
	["WM WarsongGulch"] = {
		["miniData"] = {
			["scale"] = 0.035,
			["xOffset"] = 0.41757282062541,
			["yOffset"] = 0.33126468682991,
		},
	},
	["WM Arathi"] = {
		["miniData"] = {
			["scale"] = 0.10227310921644,
			["xOffset"] = 0.47916793249546,
			["yOffset"] = 0.32386170078419,
		},
	},
	["WM NetherstormArena"] = {
		["miniData"] = {
			["scale"] = 0.10227310921644,
			["xOffset"] = 0.47916793249546,
			["yOffset"] = 0.32386170078419,
		},
	},
	["WM StrandoftheAncients"] = {
		["miniData"] = {
			["scale"] = 0.10227310921644,
			["xOffset"] = 0.47916793249546,
			["yOffset"] = 0.32386170078419,
		},
	},
	["WM ScarletEnclave"] = {
		["miniData"] = {
			["scale"] = 0.10227310921644,
			["xOffset"] = 0.47916793249546,
			["yOffset"] = 0.32386170078419,
		},
	},
	["WM Dustwallow"] = {
		["miniData"] = {
			["scale"] = 0.14266384095509,
			["xOffset"] = 0.49026338351379,
			["yOffset"] = 0.60461876174686,
		},
	},
	["WM Stranglethorn"] = {
		["miniData"] = {
			["scale"] = 0.18128603034401,
			["xOffset"] = 0.39145470225916,
			["yOffset"] = 0.79412224886668,
		},
	},
	["WM ThunderBluff"] = {
		["miniData"] = {
			["scale"] = 0.02836291430658,
			["xOffset"] = 0.44972878210917,
			["yOffset"] = 0.55638479002362,
		}
	},
	["WM ShattrathCity"] = {
		["miniData"] = {
			["scale"] = 0.03811449638057,
			["xOffset"] = 0.56378554142668,
			["yOffset"] = 0.42905218646258,
		}
	},
	["WM EversongWoods"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM Zangarmarsh"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM Nagrand"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM Netherstorm"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM BloodmystIsle"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM Hellfire"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM TheExodar"] = {
		["miniData"] = {
			["scale"] = 0.03811449638057,
			["xOffset"] = 0.56378554142668,
			["yOffset"] = 0.42905218646258,
		}
	},
	["WM ShadowmoonValley"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM TerokkarForest"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM Ghostlands"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM BladesEdgeMountains"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM AzuremystIsle"] = {
		["miniData"] = {
			["scale"] = 0.13991525534426,
			["xOffset"] = 0.40335096278072,
			["yOffset"] = 0.48339696712179,
		}
	},
	["WM SilvermoonCity"] = {
		["miniData"] = {
			["scale"] = 0.03811449638057,
			["xOffset"] = 0.56378554142668,
			["yOffset"] = 0.42905218646258,
		}
	},
};

MapNotes_CityConst = {
	[0] = {
		["cityScale"] = 1.565,
	},
	[1] = {
		["cityScale"] = 1.687,
	},
	[2] = {
		["cityScale"] = 1.882,
	},
	[3] = {
		["cityScale"] = 2.210,
	},
	[4] = {
		["cityScale"] = 2.575,
	},
	[5] = {
		["cityScale"] = 2.651,
	}
};

MapNotes_MiniConst = {
	[1] = {
		[0] = {
			["xScale"] = 11016.6,
			["yScale"] = 7399.9,
		},
		[1] = {
			["xScale"] = 12897.3,
			["yScale"] = 8638.1,
		},
		[2] = {
			["xScale"] = 15478.8,
			["yScale"] = 10368.0,
		},
		[3] = {
			["xScale"] = 19321.8,
			["yScale"] = 12992.7,
		},
		[4] = {
			["xScale"] = 25650.4,
			["yScale"] = 17253.2,
		},
		[5] = {
			["xScale"] = 38787.7,
			["yScale"] = 26032.1,
		}
	},
	[2] = {
		[0] = {
			["xScale"] = 10448.3,
			["yScale"] = 7072.7,
		},
		[1] = {
			["xScale"] = 12160.5,
			["yScale"] = 8197.8,
		},
		[2] = {
			["xScale"] = 14703.1,
			["yScale"] = 9825.0,
		},
		[3] = {
			["xScale"] = 18568.7,
			["yScale"] = 12472.2,
		},
		[4] = {
			["xScale"] = 24390.3,
			["yScale"] = 15628.5,
		},
		[5] = {
			["xScale"] = 37012.2,
			["yScale"] = 25130.6,
		}
	},
	[3] = {
		[0] = {
			["xScale"] = 10448.3,
			["yScale"] = 7072.7,
		},
		[1] = {
			["xScale"] = 12160.5,
			["yScale"] = 8197.8,
		},
		[2] = {
			["xScale"] = 14703.1,
			["yScale"] = 9825.0,
		},
		[3] = {
			["xScale"] = 18568.7,
			["yScale"] = 12472.2,
		},
		[4] = {
			["xScale"] = 24390.3,
			["yScale"] = 15628.5,
		},
		[5] = {
			["xScale"] = 37012.2,
			["yScale"] = 25130.6,
		}
	},
	[4] = {
		[0] = {
			["xScale"] = 10448.3,
			["yScale"] = 7072.7,
		},
		[1] = {
			["xScale"] = 12160.5,
			["yScale"] = 8197.8,
		},
		[2] = {
			["xScale"] = 14703.1,
			["yScale"] = 9825.0,
		},
		[3] = {
			["xScale"] = 18568.7,
			["yScale"] = 12472.2,
		},
		[4] = {
			["xScale"] = 24390.3,
			["yScale"] = 15628.5,
		},
		[5] = {
			["xScale"] = 37012.2,
			["yScale"] = 25130.6,
		}
	},
};

MAPNOTES_DEFAULT_MINIDATA = {
			["scale"] = 0.15,
			["xOffset"] = 0.4,
			["yOffset"] = 0.4,
			["cont"] = 2,
};

MN_MINIMAP_STYLES = {
	 [1] =  "SQUARE",
	 [2] =  "CORNER-TOPRIGHT",
	 [3] =  "CORNER-BOTTOMRIGHT",
	 [4] =  "CORNER-BOTTOMLEFT",
	 [5] =  "CORNER-TOPLEFT",
	 [6] =  "SIDE-RIGHT",
	 [7] =  "SIDE-BOTTOM",
	 [8] =  "SIDE-LEFT",
	 [9] =  "SIDE-TOP",   
	[10] =  "TRICORNER-TOPRIGHT",
	[11] =  "TRICORNER-BOTTOMRIGHT",
	[12] =  "TRICORNER-BOTTOMLEFT",
	[13] =  "TRICORNER-TOPLEFT",
	[14] =  "CIRCULAR",
};

MN_AUTO_MINIMAPS = {
	["SQUARE"]					= { true, true, true, true },

	["CORNER-TOPRIGHT"]			= { false, true, true, true },
	["CORNER-BOTTOMRIGHT"]		= { true, false, true, true },
	["CORNER-BOTTOMLEFT"]		= { true, true, true, false },
	["CORNER-TOPLEFT"]			= { true, true, false, true },

	["SIDE-RIGHT"]				= { false, false, true, true },
	["SIDE-BOTTOM"]				= { true, false, true, false },
	["SIDE-LEFT"]				= { true, true, false, false },
	["SIDE-TOP"]				= { false, true, false, true },

	["TRICORNER-TOPRIGHT"]		= { true, false, false, false },
	["TRICORNER-BOTTOMRIGHT"]	= { false, true, false, false },
	["TRICORNER-BOTTOMLEFT"]	= { false, false, false, true },
	["TRICORNER-TOPLEFT"]		= { false, false, true, false },
	
	["CIRUCULAR"]				= { false, false, false, false },
};

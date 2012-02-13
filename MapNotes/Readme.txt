******************************************
MapNotes (Fan's Update) README v5.16.30200
******************************************

Maintainer: Telic <telic@hotmail.co.uk>
Original code: Sir.Bender <Meog on WoW Forums>
Contributors:
ciphersimian
... and MANY others whose names didn't appear in the code anywhere


***********
Description
***********

Adds a note system to the WorldMap helping you keep track of interesting locations.
MapNotes(Fan's Update) also provides a Plugin interface for other AddOns to take advantage of the note making ability. AlphaMap(Fans Update) uses this interface to allow Note creation on AlphaMap Maps of Instances, BattleGrounds, and World Boss Maps. This version of MapNotes comes with in-built support for creation of notes on Atlas maps, also using this Plugin interface.
For these purpose MapNotes offers the following main functions:
1. Marking notes on the WorldMap
2. Showing one of these notes on the MiniMap (see MiniNote)
3. Allows any other AddOn to use MapNotes note creation ability to mark notes on frames within their own AddOn :
- Marking notes on AlphaMap (Fan's Update) Instance maps
- Marking notes on Atlas maps

"/tloc" can be used to toggle this AddOns minimap coordinates instead of Thottbott's minimap coordinates.
NOTE : PLEASE still use  "/mn -tloc xx,yy"  to place a Thottbott marker on the map. "/tloc" ONLY toggles Minimap Coordinates.

Should be compatible with Cartographer, although you may no longer be able to create notes on the map with the in-built functionality provided by that AddOn - only with the functionality provided by MapNotes (Fan's Update).

********
Features
********

[Slash Commands]	- NOTE : See separate file "LegacySlashCommands.txt" for old style commands
================

/mapnote    OR    /mapnotes    OR    /mn
Use without any other parameters to see which version of MapNotes is installed, and access the list of available Slash Commands.

Otherwise can be used to insert a Map Note by a slash command (which you can create in the Send Menu), for example, to put a note at the Entrance of Stormwind City on the map Elwynn Forest:

 "/mapnote k<WM Elwynn> x<0.320701> y<0.491480> t<Stormwind> i1<Entrance> i2<> cr<ciphersimian> i<0> tf<0> i1f<0> i2f<0>"

NOTE: The above would all be on one line Description of the identifiers:

k<#> - Key based on the map name from GetMapInfo() prefixed by "WM " (English name on all clients - never localised) Varies for other AddOns using the Plugin functionality
x<#> - X coordinate, based on the GetPlayerMapPosition() function
y<#> - Y coordinate, based on the GetPlayerMapPosition() function
t<text> - Title for the MapNote
i1<text> - first line of text displayed under the Title in the MapNote (Info 1)
i2<text> - second line of text displayed under the Title in the MapNote (Info 2)
cr<text> - Creator of the MapNote
i<#> - icon to use for the MapNote, AddOns/MapNotes/POIIcons/Icon#.tga
tf<#> - color of the Title, AddOns/MapNotes/POIIcons/Color#.tga
i1f<#> - color of the Info 1 line (colors as above)
i1f<#> - color of the Info 2 line (colors as above)
mn<1> - (optional) If included, then a value of 1 will set the note as a mininote also. Any other value and the note will NOT be set as a mininote.



/mn -allow	OR	/mn -a
Allows you to receive the next note, even if you have disabled receiving in the options.  If invoked with no parameters, it will toggle the current state.


/mn -automini
Shows the next note created (using any method) as a MiniNote and also puts it on the WorldMap.  If invoked with no parameters, it will toggle the current state.


/mn -allmini
Toggle all MapNotes off/on as Mininotes
(Keybinding also available)


/mn -nextmini
Shows the next note created (using any method) as a MiniNote and also puts it on the WorldMap.  If invoked with no parameters, it will toggle the current state.


/mn -minionly
Like the previous command, but doesn't put the note on the WorldMap.


/mn -minioff
Turns the MiniNote off.


/mn -tloc tbX,tbY
Sets a "Thottbot location" on the map. Use it with no arguments to toggle it off.
See the Section on Formatting of X,Y Coordinates


/mn -q [icon] [name]
Adds a note at your current location, icon and name are optional (icon any number from 0 to 9, AddOns/MapNotes/POIIcons/Icon#.tga)
If no [name] is passed, then the Note will be named based on the MiniMap Text, and the second/third lines will be populated with more zone information and/or the default QuickNote text.


/mn -qtloc xx,yy [icon] [name]
See the Section on Formatting of X,Y Coordinates
Adds a note on the map you are currently on at the given thottbot location, icon and name are optional (icon any number from 0 to 9, AddOns/MapNotes/POIIcons/Icon#.tga)


NEW SLASH COMMANDS IN MapNotes(Fan's Update)

/mn -s [search text]
If you want to search for a note, to see if one exists, or where it is, then you can use this command, and MapNotes will print out a report in the chat window, displaying the names of all maps which have a note containing that text


/mn -hl [note name]
If you have lots of notes and want to clearly identify a single one on a map, or if you want a certain note to remain highlighted, then use this command and they will be displayed with a green circle around them.
If there are several notes with that name or containing that text, then they will ALL be highlighted.
The note name does not have to be case sensitive, and doesn't have to be an exact match - all notes containing the [note name] text will be highlighted.
If the EXACT NAME is specified (not case-sensitive), the note will also be marked as a MiniNote on the Minimap


/mn -mapc
Toggle the display of Player and Cursor Coordinates on the World Map
Control-Left-Click and drag the coordinates to move them to a different position on the World Map if you are not happy with the default.


/mn -minic
Toggle the display of Player coordinates below the Minimap.


/mn -t [icon] [name]
Creates a quicknote at the Player's current location if the Player has no target.
If the Player does have a target, then it will create a note for that target at the Player's current location, icon and name are optional (icon any number from 0 to 9, AddOns/MapNotes/POIIcons/Icon#.tga)


/mn -m
Creates a note for the Player's target at the Player's current location.
OR Merges the details for the Player's current target in to a Map Note that has already been created at the Player's current location.
MUST have targetted a Player/NPC/Mob for this to work.


/mn -scale [0.5 - 1.5]
The size of MapNotes Menus and Frames are now fixed no matter what the scale of the World Map or other AddOn Map being used.
This command can be used to change the default size of MapNotes Menus and Frames if the user finds it too small or large.
The default value is 0.7
Therefore  "/mn -scale 1.0"  will make the Menus and Frames appear larger than they do by default.


/mn -undelete
Will undelete the last deleted MapNote.



IMPORTANT NOTE ON THE IMPORT FUNCTIONS BELOW
All of the functions below are mainly designed for people who have just installed MapNotes (Fan's Update).  If you have been using this version of MapNotes for some time already, and have your own notes, then these functions may overwrite your existing notes. YOU HAVE BEEN WARNED.


/MapNotes_Import_MetaMap
If you want to move from MetaMapNotes to MapNotes, then log in to the game with both AddOns enabled,  use the above command, after which you will receive notification in the chat window on how many notes have been imported; Then log out, and disable MetaMap. Don't try to use MapNotes at the same time as MetaMap for any other purposes, as the results may be unpredictable


/MapNotes_Import_AlphaMap
If you have AlphaMap installed, and want to convert the in-built Instance and World Boss notes in to MapNotes notes, then use the above command, and you will see a message in the chat window informing you of how many notes have been imported in to MapNotes.
This does NOT import Battleground notes by default, as AlphaMap's in built Battleground functionality works best without MapNotes overlaying the BG Objectives.
NOTE: You don't have to import notes from AlphaMap, to make MapNotes on AlphaMap Instance/Battleground/WorldBoss maps. You can create any notes you like manually.


/MapNotes_Import_AlphaMapBG
As mentioned above, the basic "/MapNotes_Import_AlphaMap" command does not import Battleground notes by default. If you do want to import AlphaMap Battlegournd map notes, then use this command to do so.


/MapNotes_Import_CTMapMod
If you want to move from using CTMapMod to MapNotes (Fan's Update), then log in to the game with both AddOns enabled, use the above command, after which you will receive notification in the chat window on how many notes have been imported; Then log out, and disable CTMapMod.




[Key Bindings]
==============

QuickNote/TargetNote
--------------------
Creates a quicknote at the Player's current location if the Player has no target.
If the Player does have a target, then it will create a note for that target at the Player's current location.
-OR CLICK MINIMAP COORDINATES-
If you are NOT targetting anything, then  ALT-Left-Click  on the Minimap Coordinates to create a QuickNote.
If you are targetting something, then  ALT-Left-Click  to create a Target note with details about the current target at the PLAYER'S current location - you will be warned if you are too near to an existing note to create a new note.
(Slash Command "/mn -t" also available)

TargetNote/MergeNote
--------------------
Creates a note for the Player's target at the Player's current location.
OR Merges the details for the Player's current target in to a Map Note that has already been created at the Player's current location.
MUST have targetted a Player/NPC/Mob for this to work.
-OR CLICK MINIMAP COORDINATES-
If you are targetting something, then you may also  ALT-Right-Click  on the Minimap Coordinates if you wish to create a note for your Target at the PLAYER'S current location. However, if a MapNote already exists at Player's location, then the details will be merged with the existing note.
(Slash Command "/mn -m" also available)




[Fast Note Creation/Editing/Deleting]
=====================================

- <Control>+<Alt>+Right-click on a MAP/FRAME to create a Quicknote at that point

- <Control>+<Alt>+Right-click on a NOTE to quickly go to the note Editing Frame

- <Control>+<Alt>+Left-clicking to drag NOTES to new positions

- <Alt>+Right-click on a NOTE to toggle it as a Minimap note

- <Alt>+<Shift>+DOUBLE Right-click on a note to quickly delete it.

- <Control>+<Shift>+Right-click will create a temporary blue Group note on a map
If created on a World map, then it will also be displayed in the Minimap for you to track
If in a Raid group, then the note will be shared with other Raid members who have MapNotes installed
Otherwise, if in a Party, then the note will be shared with the Party members who have MapNotes installed
Otherwise, its just your own quick temporary marker ;)




Differently Shaped Minimaps
===========================

As it works with SimpleMinimap automatically, and wouldn't change much in other circumstances, there is no GUI control of this option. However, it is possible to manually specify the Minimap style you want via the provided key binding to specify the style you want.
OR via the following slash command :

/mn -mstyle [#]

Where # is a number specifying the style of map you want to force MapNotes to use.
Use the keybinding to cycle through the available styles to choose from, or just use "/mn -mstyle" on its own.

 0 "Automatic" -- adjusts its shape automatically based on SimpleMinimap skins

 1 "Full Square",

 2 "Rounded Top Right Corner",
 3 "Rounded Bottom Right Corner",
 4 "Rounded Bottom Left Corner",
 5 "Rounded Top Left Corner",

 6 "Rounded Right Side Corners",
 7 "Rounded Bottom Corners",
 8 "Rounded Left Side Corners",
 9 "Rounded Top Corners",

10 "Squared Top Right Corner",
11 "Squared Bottom Right Corner",
12 "Squared Bottom Left Corner",
13 "Squared Top Left Corner",

14 "Circular";






LIGHTHEADED SUPPORT
===================

To create a MapNote from Lightheaded coordinates, must do one of the following :

1.) <ALT>-Click on the Lightheaded coordinates to create a temporary Thottbott Map and Mininote as per original functionality

2.) <CTRL>-Click on the Lightheaded coordinates to create a permanent MapNote (Also active as Mininote)

3.) <CTRL>-<SHIFT>-Click on the Lightheaded coordinates to create a permanent MapNote NOT active as a Mininote





[Traditional Methods]
=====================

(The AlphaMap and Atlas Plugins use the same basic functionality as below)

1.)
<Control>+Right-clicking on a MAP/FRAME opens the MapNotes menu.
In this menu you will find different buttons:
	Create Note	- This will open the Edit Menu and create a note at the position you clicked
	Options		- This opens the Options Menu (covered in more detail below)
	Cancel		- Closes the menu
	NOTE: A left click on an existing MapNote will also open this menu, but "Create Note" won't be available.


2.)
Move the mouse over a NOTE to see the tooltip with the information you entered.


3.)
Right-clicking on a NOTE opens the other MapNotes menu. Here you will find the following buttons:
	Edit Note		- This button opens the Edit Menu to change the note you clicked on.
	Set As MiniNote	- Sets the note as the current MiniNote.
	Send Note		- Opens the Send Menu.
	Delete Note		- Deletes the note without further questioning.
	Cancel			- Closes the Menu


4.)
<Alt>+Left-clicking on two NOTES will draw a line between them


5.)
<Control>+<Shift>+Right-click will create a temporary blue Group note on a map
If created on a World map, then it will also be displayed in the Minimap for you to track. (No minimap icon will be displayed if created on non-world map such as Atlas or AlphaMap Instance maps)
If in a Raid group, then the note will be shared with other Raid members who have MapNotes installed
Otherwise, if in a Party, then the note will be shared with other Party members who have MapNotes installed

NOTE 1 :
<Shift>+Right-clicking on the the World Map frame will share only with your local party, even when in a Raid
(As a result of the way that Plugins work, this functionality is only available on the Blizzard World Map. i.e. Plugins such as AlphaMap require that the <Control> key be pressed in order to carry out MapNotes functionality)

NOTE 2 :
Plugins that display World Map notes, such as AlphaMap may FORCE you to use <Control>+<Shift>+Right-click, as the <Control> key must be pressed to create any kind of Plugin note via the mouse.

NOTE 3 :
<Shift>+Right-clicking on a tloc note will also remove that note, although tloc notes can still only be created via slash commands




[Group Notes]
=============
<Control>+<Shift>+Right-click will create a temporary blue Group note on a map
If created on a World map, then it will also be displayed in the Minimap for you to track
If in a Raid group, then the note will be shared with other Raid members who have MapNotes installed
Otherwise, if in a Party, then the note will be shared with the Party members who have MapNotes installed

NOTE 1 :
<Shift>+Right-clicking on the the World Map frame will share only with your local party, even when in a Raid
(As a result of the way that Plugins work, this functionality is only available on the Blizzard World Map. i.e. Plugins such as AlphaMap require that the <Control> key be pressed in order to carry out MapNotes functionality)

NOTE 2 :
Plugins that display World Map notes, such as AlphaMap may FORCE you to use <Control>+<Shift>+Right-click, as the <Control> key must be pressed to create any kind of Plugin note via the mouse.

NOTE 3 :
<Shift>+Right-clicking on a tloc note will also remove that note, although tloc notes can still only be created via slash commands




[Edit Menu]
===========

With this menu you can create new notes and edit existing notes.

1. Select the icon style you want to use for your note.

2. Title: Enter it in the editbox and select a color in which it will be displayed in the tooltip.
NOTE: The title field is mandatory, you cannot create a note without a title - to prevent this the "Save" button is disabled when the title field is empty.

3. Infoline 1 and 2: Here you can insert additional information for your note and color it in one of the colors below the editbox.

4. Creator: Enter the name of the player or AddOn that created the note



[Formatting of X,Y Coordinates]
===============================

The following formatting options apply to the  "/mn -tloc xx,yy"  and  "/mn -qtloc xx,yy"  commands.

X and Y are in "Thottbot coordinates" which can be represented as follows:
 local tbX,tbY = GetPlayerMapPosition()
 local tbX = math.floor(x*100)
 local tbY = math.floor(y*100)

So basic formatting is "x,y"
e.g.  "5,90"   OR   "55,49"    OR    "75,74"

MapNotes (Fan's Update) is quite forgiving about how coordinates are passed however, and you can use a space instead of a comma, or one or more spaces without a comma
e.g. "5, 90"   OR   "5 , 90"   OR    "5   ,90"

MapNotes (Fan's Update) also allows for x and y coordinates containing decimal points.
e.g. "26.2443, 39.988"     OR    "26, 39.0"    OR    "25.0 0.9"

Since v3.30.20003, any non-numeric characters can be used as a separator
e.g. "29-50"    OR    "29x50.5"

Can now use the decimal point as a separator between the x and y coordinates
e.g. "5.90"
NOTE: if using the decimal point as a separator between the x and y coordinates, then it is advisable to NOT use x and y coordinates that also contain decimal points - if you must use decimal points in the coordinates AND as a separator, then you should use a decimal point in BOTH the x and y coordinates
For Example :
"/mn -tloc 10.50.90.0"     will be correctly located at  '10.5, 90.0'
BUT if passed
"/mn -tloc 10.50.90"    then there's no way for MapNotes to know if you mean   10.5, 90   or   10, 50.9




[MiniNotes]
==============

You can display multiple MapNotes on the Minimap as Mininotes allowing you
to Track them.
There are 2 basic types :
1.) Mininotes based on Permanent MapNotes - can have as many as you like
2.) Temporary Mininote based on either the Thottbott marker or the Group Note
	- can only have one temporary type Mininote. Either Thott or Groupd Note

    When you create a Group Note (by Shift-Right Clicking on the World Map to
share a specific Map Location with your Party),  OR  when you create a Thottbott
Marker on the map (by using the '/mn -tloc xx,yy'  or  '/mntloc xx,yy' command),
then a special Mininote will be shown - either a blue dot for the Group Note, or
a red dot for the Thottbott Marker. You can only show ONE Party Mininote OR ONE
Thottbott Mininote at any time.

    However, in MapNotes (Fan's Update), you can now make as many normal MapNotes as
you like display as a Mininotes on the Minimap. So you can now track multiple
MapNotes.

Mininotes can be turned on via the Note Right-click menu, or by <Alt>+Right-clicking
on a MapNote to toggle its mininote status

Mininotes can be turned off using any of the following methods :
1.) <Control><Alt><Click> on the Mininote on the Minimap to turn it off
2.) <Alt>+Right-clicking on a MapNote to toggle its mininote status
3.) Right Click on the MapNote on the Map, and choose the option to "Turn Mininote Off"
4.) Use the '/mn -minioff' or '/mininoteoff' slash command to remove a Party/Thottbott note

    MiniNotes are turned off if the underlying MapNote is deleted.

    If you want a MiniNote without a MapNote use the '/mn -minionly' slash
command before creating the note.

	If you want new notes to be turned on as Mininotes automatically use "/mn -automini"
	
	All MapNotes can be toggled on/off with a key binding or "/mn -allmini" command


[Send Notes To Other Players]
=============================

After clicking "Send Note" in the MapNotes Menu the Send Menu will show up.

1. Enter the name of the player you want to send a note to
NOTE: Targeting the player before opening the WorldMap will auto insert the name.

2. Send To Player
Choose this option to send the note to the player entered above.
NOTE: These notes can also be received by Carto+ users.

3. Send To Party
This will send the note to the entire party. Only Players in your Party that have MapNotes (Fan's Update) installed will receive the note. You will not Spam anybody with strange MapNote coordinates if they do not have this AddOn installed.

4. Change Mode
This toggles between Send To Player/Send To Party and Get Slash Command
Get Slash Command - Inserts a slash command in the editbox which can be highlighted and then copied to the clipboard.  After this you can post it on a forum or in chat and other MapNotes users can insert this note by copying the slash command to the chatline.


******************************
MapNotes ZoneShift Conversions
******************************

The MapNotes keying system has been completely re-written in this Version, and no longer uses the Continent/Zone combined key.
Instead, it is based on Map data that doesn't change between different language clients.
Hopefully this should future proof your database against any changes to zone lists caused by future WoW patches, or changing clients, or moving your database from one Client version to another. It should also allow two people who are using different Clients on the same Server to send notes to each other, without any client zone-shift, or version zone-shift errors.
If you are upgrading from an older version of MapNotes, to this version, your notes will be updated automatically.
However, if your database already had zone shift errors, then those errors will still exist after upgrading your database to this version.

Because of these changes, people upgrading from old versions will lose there old style data and will not be able to revert to their old version unless they have saved a copy of their MapNotes.lua database file.


*******
Options
*******

If the checkbox in front of an icon style is checked the notes with this style will be displayed, otherwise they will be hidden.

01.) Show notes created by your character
Enable to show notes with the creator field set to your character name

02.) Show notes received from other characters
Enable to show notes with the creator field set to anything other than your character name

03.) Highlight last created note in red

04.) Highlight note selected for MiniNote in blue

05.) Accept incoming notes from other players
Enable to allow other players to send MapNotes to you via whisper, etc.
NOTE: You can override this option for the next note only with the slash command /allowonenote (/aon).

06.) Decline notes if they would leave less than 5 notes free
This option is obsolete as there is now effectively no limit to the number of notes

07.) Map Coordinates
Enable to display your player AND cursor coordinates on the World Map.
Control-Click on the coordinates to move them to a different position on the World Map Frame, if you are not happy with the default.

08.) Minimap Coordinates
Enable to display your player coordinates below the Minimap.
If you are NOT targetting anything, then  ALT-Left-Click  on these coordinates to create a QuickNote.
If you are targetting something, then  ALT-Left-Click  to create a Target note with details about the current target at the PLAYER'S current location - you will be warned if you are too near to an existing note to create a new note.
If you are targetting something, then you may also  ALT-Right-Click  if you wish to create a note for your Target at the PLAYER'S current location. However, if a MapNote already exists at Player's location, then the details will be merged with the existing note.
(Key Bindings have also been created for these two functions)

09.) Options now also include the ability to auto-note Blizzard POIs as MapNotes LandMarks.
When the Landmarking Option is turned on, then Guard Directions to NPCs will be stored as MapNotes.

10.) It is also now possible to change the scale/alpha of MapNotes.



*******************
Legacy Contributors
*******************

Legorol <legorol@cosmosui.org>
Oystein <opium@geheb.com>
StarDust
Vjeux
Jorol
Marsman
Sinaloit
dodgizzla
Foogray
Khisanth



**********
Change Log
**********

=======================================
Changes in v5.16.30200 from v5.16.30100
=======================================

- toc update for WoW Patch 3.2





=======================================
Changes in v5.16.30100 from v5.15.30000
=======================================

- fix to Rotating Minimap support in 3.1
(NOTE: This version is backward compatible with 3.0.9 - but must Load Out of Date AddOns)

- fix to note creation by CONTROL+ALT+Right Clicking on the Minimap



=======================================
Changes in v5.15.30100 from v5.15.30000
=======================================

- toc update for WoW Patch 3.1



=======================================
Changes in v5.15.30000 from v5.14.30000
=======================================

- fix to TomTom/Carto waypoint arrow support

- fix to nil error message in combination with some other AddOns
(Carto 3 being the main suspect...?)



=======================================
Changes in v5.14.30000 from v5.13.30000
=======================================

- fix to stop new notes being turned on as Mininotes by accident



=======================================
Changes in v5.13.30000 from v5.12.30000
=======================================

- fix to slash command handler
"Sorry about that now." - Dougal looks sheepish

- update to TomTom and Cartographer pointer support



=======================================
Changes in v5.12.30000 from v5.11.30000
=======================================

- fix to some legacy slash commands which were not toc 30000 compliant

- datafix script for users who fell foul of the legacy slash command bug

/script MN_IntegrityCheck()

- option to set MapNotes as Cartographer Waypoint arrow from note right click menu (Beta functionality)

- option to set MapNotes as TomTom arrow from note right click menu (Beta functionality)



=======================================
Changes in v5.11.30000 from v5.10.30000
=======================================

- introduced a way to import Cartographer notes
Log in with both Cartographer2 & MapNotes;
Execute the following slash command script;

/script MapNotes_ImportCarto()

NOTE: sorry, but this may only work on an English client



=======================================
Changes in v5.10.30000 from v5.02.30000
=======================================

- added option to the basic menu's Special options to toggle the display of MapNotes notes
IF YOU CAN'T SEE YOUR OLD NOTES DO THE FOLLOWING :
Ctrl-Right click on the World Map
Mouse over the "Special" button
The "Show Notes" option should be checked in order to see notes.
If it isn't then click on it to toggle note display On.


- now includes a companion "MapNotesBrowser" AddOn
Open up the Note Browser frame by Control-Right-Clicking on a note frame like the World Map.
Then select the new menu item "MapNotes Browser"

A scroll list of notes within the current zone sorted alphabetically.
Filter listed notes via the provided text box.
Mouse over notes to highlight them on the map.
Right click to open the standard MapNotes right click menu to edit, delete, track notes via the Minimap.
Left click to bookmark a particular note, highlighting it on the map, and setting it as a Mininote.

When you have bookmarked a note, a red arrow in the top left of the frame will appear.
Mouse over the bookmark to see the note tooltip.
Left click the bookmark, and if made on a World Map, then the map will change to show the map with that note.
Right click to clear the bookmark.

Also allows you to carry out global searches for notes containing certain text, via the 'All Maps' button.
If you carry out an 'All Maps' global text search, then left clicking on World Map notes in different zones will open up that particular map.
This map changing feature only works with world map type notes, and not for custom-map AddOn notes.

(Disable from the AddOn screen before logging in if not required)


- added note location details to note tooltips

- fix to 1916 error when opening note edit frame by Ctrl-Alt-Right clicking

- fix to some note creation messages





=======================================
Changes in v5.02.30000 from v5.01.30000
=======================================

- fix to prevent the taint of unit drop down Focus & ClearFocus buttons

- fix to make sure new notes are set as Mininotes if holding down the CONTROL key when Creating from right click menu


- manual fix available for re-positioning of Stormwind City notes
ONLY EXECUTE THE FOLLOWING SLASH COMMAND IF YOU NEED -ALL- OF YOUR STORMWIND CITY NOTES ADJUSTING
Your Stormwind City note positions will be scaled and shifted to account for the new city map

/script Stormwindy()

You should receive a message in the chat frame informing you of the number of notes that have been adjusted.
This fix will place old notes closer to where they should be on the new map, but I can't guarantee they will be EXACTLY where you want them.
Remember that it is easy to fine tune your MapNotes icon positions via the following MapNotes feature :
Hold down CONTROL & ALT and left-click drag your notes to move them, and leave them exactly where you need them.


- note icons now displayed in tooltip
(Of some use when mousing over closely packed notes (with different icons))

- some code clean up of globals, and consolidation of Tooltip display in to a single function

- some compatibility changes for new MapNotes Browser frame companion AddOn



=======================================
Changes in v5.01.30000 from v5.00.30000
=======================================

- fix to stop Minimap coordinates reappearing the next time you log in, when disabled

- fix to some slash command issues



=======================================
Changes in v5.00.30000 from v4.16.20400
=======================================

- updated for WoW v3 and WotLK

MAJOR UPDATE - compatible with older versions of MapNotes

- updated look and feel with new Menus, Frame styles, and map Icons and note highlighting
(Note : if you wish to revert to the old MapNotes icons,
then please use the included "MapNotesIconsLib" AddOn to change back
to your old, legacy icons.)

- Right click menus can be raised by :
a.) CTRL-Right clicking on the World Map, or plugin frames like AlphaMap
b.) Right clicking on the Minimap Coordinates
c.) Right clicking on the MapNotes themselves
d.) CTRL-Right clicking on Minimap notes

- new menu options such as Cut, Copy, Paste, Mass Delete
Mass delete by text or Creator across ALL maps by Right clicking on Minimap Coordinates
Mass delete by text or Creator in one specific map by CTRL-Right clicking on the map

- support for 0, 1 or 2 decimal point formatting of coordinates controlled via a slider
on the Options frame

- MapNotesIconLib now packaged with MapNotes for a greater selection of note icons
(Please see the Readme.txt file in that AddOn's folder for more details)



=======================================
Changes in v4.16.20400 from v4.15.20300
=======================================

- support for differently shaped minimaps
Automatically works with SimpleMinimap

As it works with SimpleMinimap automatically, and wouldn't change much in other circumstances, there is no GUI control of this option. However, it is possible to manually specify the Minimap style you want via the following methods :

1.) use the following slash command to cycle through the available styles
"/mn -mstyle [#]"
Pass an optional number to specify a particular style.
Pass a zero to revert to a circular Minimap style.
See the Readme.txt file for a list of styles.

2.) use the provided key-binding to cycle through the available styles



=======================================
Changes in v4.15.20400 from v4.15.20300
=======================================

- toc update



=======================================
Changes in v4.15.20300 from v4.14.20200
=======================================

- fixed a bug when creating QuickNotes

- added some self repair capabilities for databases with errors from previous bugs



=======================================
Changes in v4.14.20300 from v4.12.20200
=======================================

- Chinese localisation courtesy of Onlyfly

- small change to Thottbott interface for other AddOns to create Notes
i.e. making MapNotes from MobMap icons on AlphaMap

1.) <ALT>-Click on the AlphaMap MobMap icon to create a temporary Thottbott Map and Mininote

2.) <CTRL>-Click on the AlphaMap MobMap icon to create a permanent MapNote (Also active as Mininote)

3.) <CTRL>-<SHIFT>-Click on the AlphaMap MobMap icon to create a permanent MapNote NOT active as a Mininote



=======================================
Changes in v4.12.20300 from v4.11.20200
=======================================

- now hides the WorldMap Magnifying glass when selecting MapNotes Quick Options

- compatibility changes for new AddOn companion "MapNotesIconLib" to allow a much larger choice of Icons

- a couple of small tweaks that people shouldn't even notice ;)



=======================================
Changes in v4.11.20300 from v4.10.20200
=======================================

- CHANGE TO LIGHTHEADED SUPPORT
To create a MapNote from Lightheaded coordinates, must now do one of the following :

1.) <ALT>-Click on the Lightheaded coordinates to create a temporary Thottbott Map and Mininote as per original functionality

2.) <CTRL>-Click on the Lightheaded coordinates to create a permanent MapNote (Also active as Mininote)

3.) <CTRL>-<SHIFT>-Click on the Lightheaded coordinates to create a permanent MapNote NOT active as a Mininote


- Adjusted the position of the WorldMap MapNotes Menu to stop it overlapping with the Blizzard Minimap Options



=======================================
Changes in v4.10.20300 from v4.00.20200
=======================================

- NEW FUNCTIONALITY
Can now choose your own Text colours by Right clicking the colour selection squares on the Note Edit Frame
<Alt>-Right click the selection square to reset it to its original value


- NEW FUNCTIONALITY
Can now Create Notes on the Minimap - <Control><Alt> Right click just like the World Map
Can now Edit Note Details from the Minimap - <Control><Alt> Right click just like clicking on Notes on the World Map
Can now Completely Delete Notes from Minimap - <Alt><Shift> Double Right click just like on the World Map
Turn Off Mininotes by <Alt> Right clicking them ..... just like on the World Map ;)


- fixed a problem displaying Party notes on Plugins

- fixed a small problem when clicking through Mininotes to ping the Minimap

- update to Mininote data

- made the MapNote highlighting a little more discrete

- fixed the option to disable MapNote highlighting which couldn't be turned off before

- fixed a future proofing feature of the Undelete command

- Creator line in the Tootlip is omitted if not stored



=======================================
Changes in v4.00.20200 from v3.44.20200
=======================================

- Rotating Minimap support

- Lightheaded Coordinate click support

- Changed the highlighting of MapNotes turned on as Mininotes (and the Last Note highlighting)

- New slash command "/mn -automini" to toggle new notes on as Mininotes by default

- New slash command "/mn -allmini" & key binding to toggle All notes on/off as Mininotes

- Various changes including :
Compatibility changes for future Icon Plugins
Compatibility changes and Import function provided for Note database Plugins
Removed unnecessary legacy code & data

v4 Credits
__________
Frigidman for Beta Testing
Hristo for Beta Testing
tattooedpierre for testing feedback
Cladhaire for Lightheaded support



========================================
Changes in v3.44.20200 from v3.44.20100
========================================

- simply a toc update



========================================
Changes in v3.44.20100 from v3.43.20100
========================================

Again, BIG thanks to Morac for testing and indeed fixing some of the issues detailed below :

- Raid/Party notes can now be set on Plugin frames/maps e.g. Atlas or AlphaMap Instance maps
<Control>-<Shift>-Right clicking on a Plugin map will set a Group note on that map that will be shared with other group members - obviously they will require both MapNotes and the other AddOn to actually see the note, but it is still safe to set Raid/Party notes when other members do not have the required AddOns.
(i.e. Group notes will be shared with Raid members if you are in a Raid, or Party members if you are in a Party)
NOTE : Group notes made on Instance maps will NOT be set as Mininotes on the Minimap

- Fixed a problem with the Localised names of Plugin maps (especially Atlas)

- Fixed a problem with note creation messages on Plugin maps

- Simply moved the Atlas-specific Plugin code to its own AddOn and folder where it can be maintained separately to MapNotes itself. (Or enabled/disabled separately, and replaced by newer/alternative Plugin code for Atlas)



========================================
Changes in v3.43.20100 from v3.42.20100
========================================

- <Alt>-<Shift>-DOUBLE-Right click on a note to quickly delete it. You will receive no confirmation request !

- New slash command allows you to UN-Delete the last deleted note : 
/mn -undelete

- When <Control>-<Alt>-Right clicking on a note to quickly edit it, have now tried to make sure that the notes name is highlighted so that you can quickly overwrite it with a new name, without having to manually delete the existing name

- Fixed a small bug that would turn on the last created note as a Mininote, when deleting an existing note being used as a Mininote

- Fixed a small bug that "covered" Party/tloc notes, and stopped the <Shift>-Right-click removal of a Party note

- Can now <Shift>-Right-click on a tloc note to quickly remove it

- Made sure that <Alt>-Right-clicking of Party/tloc notes toggles their Mininote status as per the functionality of normal notes

- Trying to toggle Mininote status of Plugin notes will have no affect
(i.e. Should still be able to toggle mininote status of AlphaMap's World Map notes, but not its Instance notes)

Again, many thanks to Morac for helping with testing, and discovering small bugs :D
Changes commented with 			-- 29/07/2007



========================================
Changes in v3.42.20100 from v3.41.20100
========================================

- Fixes a couple of bugs in v3.41.20100.
BIG thanks to Morac for their help :D



========================================
Changes in v3.41.20100 from v3.40.20100
========================================

- Fixed a bug when trying to access the Special Actions menu for Plugin Party/tloc notes

- New features for speeding up Note Creation/Editing : 
1.)  <Control>+<Alt>+Right-click on a MAP/FRAME to create a Quicknote in that position
2.)  <Control>+<Alt>+Right-click on a NOTE to go directly to the note editing frame
3.)  <Alt>+Right-click on a NOTE to quickly toggle its MiniNote status for tracking in the MiniMap
NOTE: to move existing notes, only the Left Mouse button can be used.
i.e. <Control>+<Alt>+Left-click on a NOTE to drag it to a new position.



=======================================
Changes in v3.40.20003 from v3.36.20003
=======================================

- Enhanced the Plugin functionality to allow other AddOns to create and edit WorldMap notes in their own frames.
e.g. AlphaMap (Fan's Update) v3.90.20003 and later can now make/edit WorldMap notes within AlphaMap without opening the Blizzard map.
Via new Plugin option  "wmflag"
Other AddOn frames displaying world map icons will also show Party/tloc notes, and Highlighted notes.

- Added Slider controls to the Options Frame to control :
1.) Frame Size
2.) MapNote Icon Size
3.) MapNote Icon Alpha Setting

- fix to a couple of non-critical errors reported in FrameXML.log



=======================================
Changes in v3.36.20003 from v3.35.20003
=======================================

- fixed a problem with Alt-Clicking on the Minimap Coordinates to create a QuickNote, which sometimes required double clicking

- small changes to make it easier for other people to write 'Plugin' style AddOns with their own MapNote Icon and Colour choices

- small change for MetaMap compatibility



=======================================
Changes in v3.35.20003 from v3.30.20003
=======================================

- QuickNotes will now note your current location as detailed in the Minimap Text, possibly with more general zone location information in the second line of the note, and the default QuickNote text in the second or third lines of the note. I just felt this was more useful, as often when making quicknotes, I just wanted to note my current location's name.
You can still pass [icon] [name] parameters.

- Enhanced the Note Highlighting functionality.
If you have lots of notes, it can be quite useful to highlight the one you are looking for rather than inspecting the tooltip for each one in turn. This was the reason for originally introducing the  "/mn -hl <Note Name>"  command.
When you specify the exact name of a note, then the MapNote will be highlighted with a green circle on the Map, and will be displayed as a MiniNote you can track in the Minimap. MapNotes would highlight ALL notes with that name if more than one exists.
I have made this command more useful by allowing the user to enter part of a Notes name and not making it case sensitive, as often you won't be certain how the full name of the note is spelled, or whether it had capital letters, etc.
So for example if you have lots of notes in Shattrath city, and can't remember which one was the "Spymistress Mehlisah Highcrown", then you can type "/mn -hl spy", and that note will be highlighted on the map. More than one note might be highlighted if more than one note has the text "spy" in it.
You will still need to specify the exactly identical note name to make the highlighted note appear as a MiniNote automatically -  although this is no longer case-sensitive either.
To remove Highlighting, just type "/mn -hl".
This functionality will highlight notes in any zone you look at on the Map.

- Fixed a problem with Alt-Clicking on the Minimap Coordinates to create Target/Merge Notes, which sometimes required double clicking

- Now Hides the World Map area Label information while the <Control> Key is depressed to hide clutter

- Now Hides the World Map area Label information when the MapNotes Quick Options Drop Down Menu is open

- MapNotes Quick Options Drop Down Menu will now close when the Map closes

- Added support that Cartographer users who want to use MapNotes (Fan's Update) requested.
<Control>-Right Click will now show the MapNotes note menu rather than the Cartographer note menu



=======================================
Changes in v3.30.20003 from v3.27.20003
=======================================

- improved the MiniMap Tooltip to show all the same information as the WorldMap Tooltip

- now while holding down the Control key to create a Note, or the Shift key to create a Party Note on the World Map, the World Map Magnifying button will be hidden allowing notes to be made on that part of the map if needed

- Made sure WorldMapToolip will appear above other WorldMap components

- can now use x,y coordinate separators other than the commas, and/or spaces
(Its still possible to input bad coordinates, but much harder, and if bad coordinates are passed, the player will receive a warning message in the chat frame, rather than an error message box)

- can now use the decimal point as a separator between the x and y coordinates
NOTE: if using the decimal point as a separator between the x and y coordinates, then it is advisable to NOT use x and y coordinates that also contain decimal points - if you must use decimal points in the coordinates AND as a separator, then you should use a decimal point in BOTH the x and y coordinates
For Example :
/mn -tloc 10.50.90.0     will be correctly located at  10.5, 90.0
BUT if passed
/mn -tloc 10.50.90    then there's no way for MapNotes to know if you mean   10.5, 90   or   10, 50.9
I now have a headache, so please leave me alone ;p



=======================================
Changes in v3.27.20003 from v3.26.20003
=======================================

- fixed a problem with the "/mn -q [icon] [text]" slash command when passing the optional [icon] and/or [text]



=======================================
Changes in v3.26.20003 from v3.25.20003
=======================================

- fixed a bug with Send Note functionality after I suffered a particularly severe brain fart in v3.22.20003



=======================================
Changes in v3.25.20003 from v3.24.20003
=======================================

- hopefully fixed problems with the /mn -qtloc xx,yy [icon] [text] slash command when passing extra Icon/Text information

- change to make sure that the Map Zone is the current one by default when logging in or using ReloadUI(), or when first showing the Minimap coordinates



=======================================
Changes in v3.24.20003 from v3.23.20003
=======================================

- hopefully fixed the Send Note problem introduced in v3.22.20003

- fixed a problem sending the "|" character in merged notes



=======================================
Changes in v3.23.20003 from v3.22.20003
=======================================

- new Slash Command     "/mn -scale [0.5 - 1.5]"
The size of MapNotes Menus and Frames are now fixed no matter what the scale of the World Map or other AddOn Map being used.
This command can be used to change the default size of MapNotes Menus and Frames if the user finds it too small or too large.
The default value is 0.7
Therefore  "/mn -scale 1.0"  will make the Menus and Frames appear larger than they do by default.
Obviously MapNotes will remember this setting between sessions.



=======================================
Changes in v3.22.20003 from v3.21.20003
=======================================

- fixed a problem that made the Send Note buttons difficult to click upon

- small changes to the Send Note functionality to ensure a message can be sent more than once to Party/Raid members if necessary
(Blizzard's standard functionality seems to be to suppress consecutive duplicate SendAddonMessages)



=======================================
Changes in v3.21.20003 from v3.20.20003
=======================================

- fixed a bug with the Key Bindings for making Target/Merge notes



=======================================
Changes in v3.20.20003 from v3.17.20000
=======================================

- toc update

- made several enhancements to the MapNotes Target and Merge note functionality :
1.) Now correctly fetches the Profession of friendly NPCs such as Bankers, FlightMasters, etc.
2.) Can now include an optional icon and extra text with both the Target and Merge commands
/mn -t [icon] [text]
/mn -m [icon] [text]
The text is still optional, but if included will appear on the second Info Line of the Map Note.
The icon is also optional, and doesn't have to be included even if text is provided; However, if an icon and text is entered, then there must be a space between the icon and the text. Any provided icon will overide the default/determined icon.
As per other slash commands the icon must be a number between 0-9 representing the list of icons available for selection when you create/filter Map Notes.

- the /mn -tloc x,y  (and /mntloc x,y) (and /mn -qtloc x,y) commands are now more forgiving and will allow the following coordinate formatting
1.) The coordinates may now include decimal points
2.) The separator between coordinates may now include spaces, or be a simple space instead of a comma

- notes can now be sent to the whole Raid as well as the your immediate Party members. On the Send Note frame, a Left Click will still send a note to just your Party; But a Right Click will send the note to everyone in the Raid.
(Other members of your Party/Raid must have MapNotes(Fan's Update) installed to receive the note)

- the actual Party Note itself can now also be sent to the all members of the Raid. <Shift><Right-Click> will still just send to your immediate Party members, but <Control><Shift><Right-Click> will set a Party Note for the entire Raid.
(Other members of your Party/Raid must have MapNotes(Fan's Update) installed to receive the note)

- changed the Chat Frame hooks to address problems with Pet Bars and handling functions when a Pet is summoned while in combat

- the scale of the Menus and frames has been normalised so that no matter what scale the Map frame is, the MapNotes menus and frames will always be constant. i.e. if you have changed the scale of the World Map or are making notes on AlphaMap or Atlas

- some small fixes such as making sure the World Map isn't toggled when using the Escape key to close the MapNote editing frame for notes in other AddOns such as AlphaMap or Atlas

- extended an original bug avoidance measure to try and avoid any possibility of a recursive stack overflow error



=======================================
Changes in v3.17.20000 from v3.16.20000
=======================================

- added a new option to the note creation slash command allowing the created note to be set as a mininote ( mn<boolean> i.e. 0 or 1 )
Please see the Readme.txt file for more details.

- fixed a potential MapNotes compatibility issue with Ciphersimian's recent update of WoWKB when deleting notes in multiple zones

- fixed an issue that could cause the User Interface to remain hidden if entering combat when the map was open

- the options to "Set next note as mininote Also" and "Set next note as mininote Only",  will now remain on until toggled off again
("/mn -nextmini"  and  "/mn -minionly")



=======================================
Changes in v3.16.20000 from v3.15.20000
=======================================

- made sure that MapNotes are displayed by default when first installing

- fixed the check mark against the Show Notes options so it correctly displays the option status

- fixed the Edit Box labels on the Note Edit frame



=======================================
Changes in v3.15.20000 from v3.12.20000
=======================================

- un-hooking of unnecessary functions to fix the PetDismiss() Blocked Action problem
(Thanks to Quel for his input in solving this issue)
(Rumour has it that Blizzard will be addressing this issue themselves, as it seems to have affected many AddOns that Hook DropDownMenu functionality in perfectly benign ways)

- made sure the Options frame will Show properly

- fixed some small issues with the positioning of Menu frames when using MapNotes on AlphaMap/Atlas maps

- update to support ciphersimian's recent update of WoWKB v20000 (i.e. NOT MetaMap)

- updated the "/MapNotes_Import_MetaMap" command to work with MetaMap v20000-3 and later
NOTE: although this version of MapNotes (Fan's Update) can fix ZoneShift errors caused by the Blizzard Patch 2.01 in older versions of MapNotes when upgrading to this version, it can't fix any ZoneShift errors when importing data from MetaMap, so if a note was in the wrong Zone in MetaMap, then it will still be in the wrong Zone.

- variable name clean-up

- included a data checking function that may help find notes that appear to be missing due to the Zone Shift errors that the WoW 2.01 patch caused in previous versions of MapNotes. If your notes don't seem to be showing, then backup your \SavedVariables\MapNotes.lua file before using the following Slash Command :

	/mn -datacheck

If that still doesn't help, double check the "ShowNotes" option in the "Quick Options" drop down box on the World Map frame.



=======================================
Changes in v3.12.20000 from v3.11.20000
=======================================

- Spanish added to the list of Clients that can be corrected by the datafix introduced in 3.11.20000
See Change Log for v3.11.20000 on how to run the datafix manually if you have already imported Zone Shift errors in to your MapNotes (Fan's Update) database.

- people can now upgrade from old versions of MapNotes to MapNotes (Fan's Update), on English, German, French, and SPANISH Clients, even if they have Zone Shift errors created by the WoW 2.01 Patch, and the data will be corrected automatically, and you won't see any Zone Shift errors.

- NOTE : I repeat, this datafix should NOT be required by people who had changed to MapNotes (Fan's Update) BEFORE WoW Patch 2.01.

- NOTE 2 : After upgrading to MapNotes (Fan's Update), you shouldn't have any further Zone Shift problems in the future.




=======================================
Changes in v3.11.20000 from v3.10.20000
=======================================

- a datafix will run automatically for people upgrading to MapNotes (Fan's Update) at the same time as upgrading to the WoW 2.01 Patch.

- included a manual datafix mainly for Cosmos users who already have Zone Shift errors since the WoW 2.01 Patch
Users who upgraded to MapNotes (Fan's Update) BEFORE the WoW 2.01 Patch should NOT need to run this data fix.
Non-Cosmos users who have upgraded to WoW 2.01 before changing to MapNotes (Fan's Update) may also find this fix useful.

NOTE :
Only use this datafix ONCE, and only if your data contained Zone Shift errors, or they occured after the WoW 2.01 Patch.
If you have created notes since the WoW 2.01 Patch, and run this datafix, your new notes will also be moved if they are in zones affected by the problem.
Any MapNotes LandMark notes that have been automatically created since updgrading to MapNotes (Fan's Update) will be deleted.

Tested for English Client
Limited testing for French and German Clients - let me know if you still have errors
No datafix data available for other Clients atm.

Type the following in to the command line :

/script MN_WoW_DFix1(1);

You should receive confirmation of the number of Notes and Lines that have been fixed.




=======================================
Changes in v3.10.20000 from v3.00.20000
=======================================

- Multiple Mininotes - can now display more than one Mininote.
Can still only display one Thottbott Location / PartyNote, but any number of normal MapNotes can now be left displayed as Mininotes.

- Easily remove Mininotes by <Control><Alt>-Clicking on the actual Mininote on the Minimap
(This won't delete underlying notes - just stops using them as Mininotes.)

- Enhanced the Highlighting function to display highlighted notes as Mininotes that can be tracked in the Minimap.
'/mn -hl <Note Name>' will highlight all notes with that name, on all maps.
'/mn -s <text>' allows you to search for text, and will report to the Chat frame all zones with notes containing the text

- Where the user has selected to make the next received/created note as a Mininote Only, then that note will be displayed as a Thottbott style note. Any existing Thottbott Mininote the user may already be displaying will be overidden by the new note.

- Legacy Slash Commands still work : But new Slash commands implemented, including a help command.
"/mn -help" or "/mn -h" or "/mn -?"

- Fixed a small bug in generating a MapNotes string in the Send Note frame

- Fixed a small bug when creating notes via Slash command input

- Fixed a BC compatibility problem when clicking on Mininotes

- Fixed a BC compatibility issue with drawing lines between notes on Plugin frames/maps, such as AlphaMap or Atlas


- "/tloc" can now be used to toggle this AddOn's minimap coordinates instead of Thottbott's minimap coordinates.

NOTE : PLEASE still use  "/mntloc xx,yy" or "/mn -tloc xx,yy"  to place a Thottbott marker on the map.
----
("/tloc" only toggles Minimap Coordinates.)








=======================================
Changes in v3.00.20000 from v2.40.11200
=======================================

- Burning Crusade Compatibility

- changed the way the options work so that using a Checkbox takes affect immediately and the 'Save' button is no longer required

- added new check-box on Options frame to auto-note Landmarks. Based on Magellan functionality.

- added new button on Options frame to delete auto-noted Landmarks in the current zone.



=======================================
Changes in v2.40.11200 from v2.30.11200
=======================================

- Added 90% Traditional Chinese Localisation

- If the Thottbott note is set as a Mininote, then I now make sure the Mininote is removed when the Thottbott note is deleted.
(Thottbott notes are set using the "/mntloc xx,yy" slash command)

- Some preliminary coding changes for compatiblity with The Burning Crusade Expansion pack. (Not fully compatible yet)



=======================================
Changes in v2.30.11200 from v2.25.11200
=======================================

- Added 90% Korean Localisation (Thanks to Gigabyte)

- Fixed a compatibility issue with AddOns that intercept Mouse clicks on the MiniMap (e.g. SilverTrack)

- Made sure coordinates are correct for current Zone when the WorldMap / AlphaMap closes

- Removed a debug message about MiniNote Map Key that should not have been left in ;p



=======================================
Changes in v2.25.11200 from v2.00.11200
=======================================

- NEW option to display Player and Cursor Coordinates on the World Map.
Control-Left-Click and drag the coordinates to move them to a different position on the World Map if you are not happy with the default.
Use the "/mnmapc" slash command to toggle display of World Map coordinates, or the new checkbox on the Options Frame

- NEW option to display Player Coordinates below the Minimap.
If you are NOT targetting anything, then  ALT-Left-Click  on these coordinates to create a QuickNote.
If you are targetting something, then  ALT-Left-Click  to create a Target Note at the PLAYER'S current location - you will be warned if you are too near to an existing note to create a new note.
If you are targetting something, then you may also  ALT-Right-Click  if you wish to create a note for your Target at the PLAYER'S current location. However when  ALT-Right-Clicking  the Minimap Coordinates, if a MapNote already exists at Player's location, then the details will be merged with the existing note.
Use the "/mnminic" slash command to toggle display of Minimap coordinates, or the new checkbox on the Options Frame.

- NEW Key bindings available that will do the same thing as Clicking on the Minimap Coordinates.
i.e. either create a new QuickNote/TargetNote,  or Create/Merge a TargetNote.

- NEW Slash commands can be used for the same functions :
/mnt	- create a new QuickNote/TargetNote at the player's Current location
/mnm	- create/merge a TargetNote for the Player's current target at the Player's current location



==================================================================
Changes from the Base Version to MapNotes(Fan's Update)v2.00.11200
==================================================================

NOTE: IF UPGRADING FROM PREVIOUS VERSIONS OF MAPNOTES - BACKUP YOUR MAPNOTES.LUA
DATABASE FILE FROM YOUR SAVEDVARIABLES FOLDER FIRST

- This version of MapNotes changes the Keying system used to record notes. If you are upgrading from a previous version of MapNotes, then it is important to save a copy of your MapNotes.lua file from your saved variables directory.
Because of these changes, people upgrading from old versions will lose there old style data and will not be able to revert to their old version unless they have saved a copy of their MapNotes.lua database file.
See the "MapNotes ZoneShift Conversions" section of the Readme.txt file for more details.

- You can now make notes on the Continent Maps and the overal World Map

- You can now make notes on Battleground Maps


MapNotes PlugIn Interface and Support for AlphaMap & Atlas
----------------------------------------------------------
- Added the ability to create MapNotes on AlphaMap (Fan's Update) v2.60.11200 Instance, Battleground, & World Boss Maps.  Note that AlphaMap already supports the display of MapNotes on World maps, and you must still use the World Map to create World map notes; However, you can now make MapNotes on the AlphaMap when displaying Instances, Battlegrounds, and World Boss maps.(This functionality is actually built in to AlphaMap itself, and takes advantage of the PlugIn feature now built in to this version of MapNotes.)

- Added the ability to create MapNotes on Atlas maps. (Again, this uses the Plugin features added to this version of MapNotes, but I have included the Atlas support natively, and it should work with most recent versions of Atlas)

- Provided a PlugIn interface by which other AddOns can add their own Frames over which MapNotes can then create MapNotes. Other Developers should see the extensive comments in the code, and check AlphaMap (Fan's Update) for an example of how to use this interface. (Read Plugins.lua)


MapNotes Import Functions
-------------------------
- For people moving from MetaMap or CTMapMod, there are 2 new slash commands available for people to import the notes made in those AddOns in to this version of MapNotes.
There are also 2 commands available to import AlphaMap's built in notes if you prefer to use MapNotes notes instead of AlphaMap's own.
All of these functions are mainly designed for people who have just installed MapNotes (Fan's Update).  If you have been using this version of MapNotes for some time already, and have your own notes, then these functions may overwrite your existing notes.
See the Slash Commands section for details on use.


Movable MapNotes
----------------
- You can now Control-Alt-Click Drag Notes to move them to different locations on the Map. No need to delete and re-create, just ctrl-alt-drag.


Changes to the Party Note
-------------------------
- First of all, the bug causing it to not be displayed on the World Map has been fixed.

- Shift-Right clicking places the note, and now Shift-Right clicking will also remove it, and make sure the MiniMap icon is also removed

- Removed the dependancy on Sky. Only members of your Party who also have MapNotes (Fan's Update) installed will receive a note. You will NOT spam the members of your party who do not have this AddOn with strange MapNotes coordinates.


Changes to the MiniMapNote
--------------------------
- Stopped the Mininote from preventing use of the WorldMap

- Made sure the Mininote stops displaying if the underlying MapNote is deleted


Change to Maximum number of Notes
---------------------------------
- No longer a maximum number of notes/lines. Notes and Lines are now created dynamically which will save memory for most people


MapNotes Search Feature
-----------------------
- Can now search your MapNotes database for certain text, and MapNotes will report the number and locations of all notes containing that text to the default chat window
(SEE Slash Commands)


MapNotes Highlighting
---------------------
- If you have lots of notes and want to clearly identify a single one on a map, or if you want a certain note to remain highlighted, then use this command and they will be displayed with a green circle around them.
If there are several notes with that name, then they will all be highlighted
(SEE Slash Commands)


Miscallaneous Changes
---------------------
- Compatibility changes ensuring the menu frames are always fully opaque and appear near the cursor when the WorldMap has been altered by other AddOns.

- Made some updates more immediate so that maps/frames show new/deleted notes/lines as soon as you add/delete them.

- Multiple small bug fixes





SEE Readme.old.txt FOR HISTORIC CHANGES TO EARLIER VERSIONS OF MAPNOTS
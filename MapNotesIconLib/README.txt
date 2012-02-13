
MapNotesIconLib
_______________

Provides a much larger set of Icons to use for MapNotes (Fan's Update).

MapNotesIconLib comes with 76 new core icons, mainly sourced from the Game itself.

Packaged with the library are 3 other Plugin libraries : 
Fancy		- some fancy icons modified from source graphics at from http://www.freebuttons.com
Numbered	- a variety of numbered icons (again, some modified versions of http://www.freebuttons.com)
Neptunia	- the Icons originally donated by Neptunia

With MapNotesIconLib installed, Icon choices are applied immediately when selected without having to save the Note.



Getting Started
_______________

Open up a Note Edit Frame via MapNotes menus, or <Ctrl><Alt>-Right clicking on a MapNote.

There is a new empty blue highlighted button to the right of the normal MapNote Icons.
Click on this square to open up the Icon Library Browser frame and choose a new Icon for this MapNote :)
<Alt>-Click on this square to delete the custom Icon choice, and MapNotes will revert to using the default Icon it was using originally.

The change will take effect immediately without having to save the note.



Advanced Use
____________

1.) You can change the original 10 default icons used by MapNotes

Open up a Note Edit Frame via MapNotes menus, or <Ctrl><Alt>-Right clicking on a MapNote.
<Ctrl>-Click on any of the default MapNote Icons to open up the Icon Library Browser frame and choose a new default icon :)
<Alt>-Click on any of the default MapNote Icons to reset it to the original MapNotes version.

The changes will take effect immediately, and will propagate thoughout the database and change all MapNotes that were using that default Icon.


2.) The Icon Library Options frame

Use the "/mnil" slash command to open the Icon Library Options frame
From the Options frame you can : 

a.) Change the default Party / tloc Icons by clicking on them and choosing new ones from the Icon Library Browser frame
b.) Simply open the Icon Library Broswer frame just to look through the Icons available
c.) Reset ALL MapNotes to use the original MapNotes defaults, and remove ALL customised Icons
d.) This Option will "clean" the MapNotes database, by removing any references to icons that you no longer explicitly load.
[See Special Note for more details]
e.) Cancel and close the Options frame

NOTE that to "Reset" or "Clean" the Icons requires clicking Okay in a Confirmation dialogue box.
So if you don't see the confirmation box, then close the World Map and move frames around until it is visible ;)



Special Note on Database Cleaning
_________________________________

If you use icons from a certain library, but don't load that particular library - those Icons will still be displayed in game if the directory paths still exist.
In order to completely remove traces of library icons that you don't want to see, you should NOT load the library, and then manually use the "Clean" option, and/or physically remove the AddOn library from the AddOns folder.
The results of the "cleaning" will be reported in the chat frame, detailing the names of the textures that have been cleaned and the total number.

I have made the conscious decision not to automatically clean Icon data when a specific library is not loaded for a couple of reasons :
a.) it is more forgiving to people who don't load a library by mistake. Auto-cleaning would mean that people would have to manually select all the icons again when they logged in again with that library.
But with this set up, then the Icons will be remembered even when a library isn't loaded - unless you manually choose to clean the data.
b.) it also allows the user to specify special icons for very rare MapNotes, and then save memory by not loading the icon library.
i.e. the rare icon they selected will still show, but they won't be loading all the other Icon graphics.



How To Publish a Plugin Library of Icons
________________________________________

I'm not gonna describe the general process of AddOn publication, so you'll need some knowledge about how to make AddOns ;p

Basically you need to do 3 things :
1.) Provide the Icons as .tga or .blp
2.) Define a data array describing the library, and the paths to the Icons (See the _Fancy / _Neptunia / _Numbered libraries for examples)
3.) After the "VARIABLES_LOADED" event, register your library of Icons with MapNotesIconLib by calling the following function : 

		MNIL_RegisterLibrary(newLib);

	... where newLib is the data array you have used to define your library in step 2 above.
		
Obviously, the best place to start is by looking at the other examples, so just look at how MapNotesIconLib_Fancy, etc. have been designed to load.

The Icons in the browser frame can be formatted, and blanks inserted by using the special Texture :
"Interface\\AddOns\\MapNotesIconLib\\Icons\\Empty"
See the _Fancy icon library for an example of how this is used to include a "blank" icon as a spacer between other ones :)



__________

Change Log
__________

Changes in v1.04.30000 from v1.03.30000
---------------------------------------

- fix to FrameXML.log font error

- fix to MapNotes plugin custom icon selection





Changes in v1.03.30000 from v1.02.30000
---------------------------------------

- small fix to allow selection of original default icons after having selected a custom icon



Changes in v1.02.30000 from v1.01.20400
---------------------------------------

- update for toc 3 and WotLK

- fix to prevent single error message for new installation



Changes in v1.01.20400 from v1.01.20300
---------------------------------------

- toc update



Changes in v1.01.20300 from v1.00.20300
---------------------------------------

- Added 5 NEW Icons to the base library for :
Mail, Herbalist, RepairNPC, MiningTrainer, Magnifying Glass

- Saving a note with a pre-existing custom icon selection, will no longer reset when using customised defaults

- choosing a default Icon that you have customised will now be applied immediatly without having to save the note
(As per the other functionality provided by this AddOn)


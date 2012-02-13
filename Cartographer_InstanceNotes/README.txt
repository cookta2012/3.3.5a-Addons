For people who wish to change the instance note positions or add new ones, the following steps are to be taken:

1. Add Cartographer_InstanceNotesDB to the SavedVariables in Cartographer.toc
Before:
    ## SavedVariables: CartographerDB
After:
    ## SavedVariables: CartographerDB, Cartographer_InstanceNotesDB

2. Fully restart WoW if you are current in the game.

3. When logged on, type this command: /script Cartographer_Notes:EnableDevelopment("InstanceNotes")
   Doing this will allow you to change positions as well as make new notes.

4. Change any note positions by alt-dragging
   Create any new notes by either ctrl-right click or alt-right click.

5. When finished, close WoW and open C:\Program Files\World of Warcraft\WTF\Account\<ACCOUNTNAME>\SavedVariables\Cartographer.lua
   You'll see `Cartographer_InstanceNotesDB = {`, copy that and whatever is underneath it and replace the section which is currently in Interface\AddOns\Cartographer\Cartographer_InstanceNotes\notes.lua

6. Before committing (or sending the data to a developer), remove Cartographer_InstanceNotesDB from SavedVariables (as added in step 1), restart WoW and double-check that your changes took effect.

7. Commit your changes to the SVN or send your changes to a developer.
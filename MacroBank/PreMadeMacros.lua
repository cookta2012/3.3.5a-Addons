local Addon = LibStub("AceAddon-3.0"):GetAddon("MacroBank");
-- Names can't be longer than 16 letters (Blizzard restriction)  They will be truncated to 16 if they are longer
-- If you do not include a name, category, or description, the temporary ones will be used
-- Anything between [=[  and ]=]  is treated as literal text, so you can use single or double quotes (' or ") without it messing up LUA.

Addon.PreMadeMacros = {
  {
    name = "Macro1",
    category = "Test Macros",
    desc = "was just testing",
    body = [=[/script print("blah")]=],
  },
  {
    name = "Macro2",
    category = "Test Macros",
    desc = "pet passive",
    body = "/petpassive",
  },
  {
    name = "Macro3",
    body = [=[/cast [target=focus] Hunter's Mark
/petattack]=],
  },
};

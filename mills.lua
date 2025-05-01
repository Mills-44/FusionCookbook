--For my Util and Define
if not MILLS then
    MILLS = {}
end
--Loads Mod
mills = SMODS.current_mod
mills_path = SMODS.current_mod.path

--Config Lib
MILLS.config = SMODS.load_file("config.lua")() -- When I set up UI I this will actually do sum for now its a dummy config 

--Load lib
SMODS.load_file("lib/define.lua")() -- Definitions 
SMODS.load_file("lib/util.lua")() -- Utility functions built
--SMODS.load_file("lib/ui.lua")() -- Not Today :(

SMODS.load_file("items/atlas.lua")() -- Pictures
SMODS.load_file("items/sounds.lua")() -- Sounds

MILLS.register_items(MILLS.PEPPER_JOKERS, "items/joker/pepper")
MILLS.register_items(MILLS.SWEET_JOKERS, "items/joker/sweet")
--MILLS.register_items(MILLS.SANDWICH_JOKERS, "items/joker/sandwich")

SMODS.ConsumableType {
  key = "Snack",
  set = 'Snack',
  primary_colour = MILLS.COLORS.COOKIE,
  secondary_colour = MILLS.COLORS.COOKIE,
  collection_rows = {3,3},
  loc_txt ={
      name = 'Snacks',
      collection = 'Snacks', 
  },
  cards = {
    ["c_mills_biscoff"] = true,
    ["c_mills_blondwie"] = true,
    ["c_mills_bubblegum"] = true,
    ["c_mills_choffle"] = true,
    ["c_mills_cream_puff"] = true,
    ["c_mills_frosting"] = true,
    ["c_mills_homeys_doney"] = true,
    ["c_mills_kinder_egg"] = true,
    ["c_mills_pretzel"] = true,
    ["c_mills_rye_chip"] = true,
    ["c_mills_slice_of_bread"] = true,
    ["c_mills_whipping cream"] = true
  }
}

-- PATCH: Ensure pool is initialized before injection
local orig_insert_pool = SMODS.insert_pool
SMODS.insert_pool = function(pool, center, ...)
  if type(pool) ~= "table" then
    pool = {}
  end
  return orig_insert_pool(pool, center, ...)
end

MILLS.register_items(MILLS.SNACKBOOSTER, "items/snack/boosters")
MILLS.register_items(MILLS.SNACKS, "items/snack/snacks")


MILLS.register_items(MILLS.ENHANCEMENTS, "items/enhancements")

--MILLS.register_items(MILLS.SPECTRAL, "items/spectral")

--MILLS.register_items(MILLS.SEALS, "items/seals")

--MILLS.register_items(MILLS.TAGS, "items/tags")

--MILLS.register_items(MILLS.EDITIONS, "items/editions")

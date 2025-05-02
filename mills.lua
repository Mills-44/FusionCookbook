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

-- Register custom ConsumableType: Snack
SMODS.ConsumableType {
  object_type = "ConsumableType",
  key = 'Snack',
  default = 'c_mills_bubblegum',
  collection_rows = { 3,4 },
  primary_colour = HEX("572501"),
  secondary_colour = HEX("D7A450"),
  loc_txt = {
      collection = 'Snack Cards',
      name = 'Snack',
      label = 'Snack',
      },
  shop_rate = 1.0,    
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


MILLS.register_items(MILLS.SWEET_ENHANCEMENTS, "items/enhancements/sweet")
MILLS.register_items(MILLS.ORE_ENHANCEMENTS, "items/enhancements/ore")

MILLS.register_items(MILLS.SPECTRAL, "items/spectral")

MILLS.register_items(MILLS.SEALS, "items/seals")

MILLS.register_items(MILLS.TAGS, "items/tags")

--MILLS.register_items(MILLS.EDITIONS, "items/editions")

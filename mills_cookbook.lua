
-- JOKERS
--Pepper Atlas
SMODS.Atlas {
    key = "pepper_jokers", --For the pepper jokers implemented in mod
    path = "pepper_jokers.png", --image used for peppers
    px = 71, --Sizing of jokers in 1x
    py = 95 --1x y direction
}
-- Load Pepper Jokers
local pepper_jokers = {
"pimento_pepper", --Lvl 1
"anaheim_chile", --Lvl 2
"jalapeno", --Lvl 3
"cayenne", --Lvl 4
"habanero", --Lvl 5
"ghost_pepper", --Lvl 6
"carolina_reaper" --Final Lvl
}
for _, joker in ipairs(pepper_jokers) do
    local path = SMODS.current_mod.path .. "/jokers/peppers/" .. joker .. ".lua"
    local joker_def = dofile(SMODS.current_mod.path .. "/jokers/peppers/" .. joker .. ".lua")
SMODS.Joker(joker_def)
end
-- SWEETS JOKERS
-- Sweets Atlas
--SMODS.Atlas {
 --   key = "sweets_jokers", --For the sweets jokers implemented in mod
 --   path = "sweets_jokers.png", --image used for sweets
 --   px = 71, --Sizing of jokers in 1x
 --   py = 95 --1x y direction
--}
-- Load Sweets Jokers
--local sweets_jokers = {
 --   "wonkas_chocolate_bar",
 --   "nutty_buddy",
 --   "jammin_jelly",
 --   "stay_puft",
 --   "barry_b",
 --   "gummibar",
 --   "peppermint_butler"
 --   "apple_of_jacks eye",
 --   "koolaid_man",
 --   ""
--}
--    for _, joker in ipairs(sweets_jokers) do
--    local path = SMODS.current_mod.path .. "/jokers/sweets/" .. joker .. ".lua"
--    local joker_def = dofile(SMODS.current_mod.path .. "/jokers/sweets/" .. joker .. ".lua")
--SMODS.Joker(joker_def)
--end
-- SANDWHICH JOKERS
-- Sandwhich Atlas
--SMODS.Atlas {
  --  key = "sandwhich_jokers", --For the sandwhich jokers implemented in mod
  --  path = "sandwhich_jokers.png", --image used for sandwhich
  --  px = 71, --Sizing of jokers in 1x
  --  py = 95 --1x y direction
--}
-- Load Sandwhich Jokers
 -- local sandwhich_jokers = {
  --  "everlasting_pollenstopper",
  --  "golden_crunch",
  --  "mrpb_and_jelly",
  --  "flayfluff_sub",
   -- "gloopwhich"
--}
--for _, joker in ipairs(sandwhich_jokers) do
--    local path = SMODS.current_mod.path .. "/jokers/sandwhiches/" .. joker .. ".lua"
--    local joker_def = dofile(path)
--    SMODS.Joker(joker_def)
--end


-- CONSUMABLES

-- Register Snack Pack image
--SMODS.Atlas {
  --  key = "snack_pack",
   -- path = "snack_pack.png",
  --  px = 71, --Sizing in 1x
  --  py = 95 --1x y direction
--}

--Register Snack Pack
--  local snack_pack = dofile(SMODS.current_mod.path .. "/boosters/snack_packs/snack_pack.lua")
--  SMODS.Booster(snack_pack)

-- Register Snack Cards
--  local slice_of_bread = dofile(SMODS.current_mod.path .. "/boosters/snack_packs/snack_cards.lua")
--  SMODS.Consumable(slice_of_bread)

-- SOUNDS
SMODS.Sound{
    key = 'tangy',
    path = 'tangy.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'sayonara',
    path = 'sayonara.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'piquant',
    path = 'piquant.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'bye',
    path = 'bye.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'spicy',
    path = 'spicy.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'adios',
    path = 'adios.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'sizziling',
    path = 'sizziling.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'fiery',
    path = 'fiery.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'later',
    path = 'later.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'death',
    path = 'death.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'scorching',
    path = 'scorching.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'crunch',
    path = 'crunch.ogg',
    volume = 1.0,
    pitch = 1.0
}
SMODS.Sound{
    key = 'goopy',
    path = 'Goopy.ogg',
    volume = 1.0,
    pitch = 1.0
}

-- ENHANCEMENTS
 --Register Snack Pack image
SMODS.Atlas {
    key = "enhancements",
    path = "enhancements.png",
    px = 71, --Sizing in 1x
    py = 95 --1x y direction
}


local candisimo_path = SMODS.current_mod.path .. "items/enhancements.lua"
local candisimo = dofile(candisimo_path)
local cookiesimo = dofile(cookiesimo_path)
SMODS.Enhancement(cookiesimo)
SMODS.Enhancement(candisimo)
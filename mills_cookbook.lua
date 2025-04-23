mills = SMODS.current_mod
mills_path = SMODS.current_mod.path


-- ||       ATLAS       ||
-- Pepper Jokers
SMODS.Atlas { 
    key = 'pepper_jokers',
    path = "pepper_jokers.png",
    px = 71,
    py = 95
}
--Sweet Jokers
SMODS.Atlas { 
    key = 'sweet_jokers',
    path = "sweet_jokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas { 
    key = 'koolaid_man',
    path = "koolaid_man.png",
    px = 71,
    py = 95
}
-- Register Sandwhich Atlas (commented out for now)
SMODS.Atlas {
    key = "sandwich_jokers", 
    path = "sandwich_jokers.png", 
    px = 71, 
    py = 95 
}
-- Snack Packs
SMODS.Atlas { 
    key = 'snack_pack',
    path = "snack_pack.png",
    px = 71,
    py = 95
}
--Snack Cards
SMODS.Atlas { 
    key = 'snack_cards',
    path = "snack_cards.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = "enhancements",
    path = "enhancements.png",
    px = 71, --Sizing in 1x
    py = 95 --1x y direction
}

-- ||       INSERT SNACK SET        ||
--Insert Snack Cards
SMODS.ConsumableType {
    key = 'Snack',
    primary_colour = G.C.SET.Tarot,
    secondary_colour = G.C.SECONDARY_SET.Tarot,
    default = 'c_mills_slice_of_bread',
    loc_txt = {
        name = 'Snack',
        collection = 'Snack Cards',
    },
    collection_rows = {3,3},
    shop_rate = 1
}

local INSERT_SNACKS = {
    'slice_of_bread',
    'cream_puff',
    'homeys_doney',
    'butterscotch',
    'bubblegum',
  --  'rye_chip',
   -- 'kinder_egg',
 --   'biscoff',
   -- 'pretzel'
}
for _, file in ipairs(INSERT_SNACKS) do
    sendDebugMessage("Executing items/snacks/" .. file .. ".lua", "mills")
    assert(SMODS.load_file("items/snacks/" .. file .. ".lua"))()
end

--Insert Snack Pack
local INSERT_SNACK_PACKS = {
    'snack_pack_normal_1',
    'snack_pack_normal_2',
    'snack_pack_jumbo_1',
    --'' For future cards
}

mills.getsnackkey = function(seed)
    seed = seed or 'seed'
    local pool = get_current_pool('Snack')
    local snackkey = pseudorandom_element(pool, pseudoseed(seed))
    local it, itlimit = 0, 100 -- so we don't lock the game up.
    while snackkey == 'UNAVAILABLE' do
      it = it + 1
      if it >= itlimit then break end
      snackkey = pseudorandom_element(pool, pseudoseed(seed))
    end
  
    return snackkey ~= 'UNAVAILABLE' and snackkey or 'c_mills_slice_of_bread'
  end
  
for i = 1, #INSERT_SNACK_PACKS do
    local status, err = pcall(function()
        return NFS.load(SMODS.current_mod.path .. 'items/boosters/' .. INSERT_SNACK_PACKS[i] .. '.lua')()
    end)
    sendDebugMessage("Loaded Snack Packs: " .. INSERT_SNACK_PACKS[i], 'mills')
    if not status then
        error(INSERT_SNACK_PACKS[i] .. ": " .. err)
    end
end

-- ||       INSERT JOKER SETS        ||
-- Insert Pepper Jokers
local pepper_jokers = {
    "pimento_pepper",
    "anaheim_chile",
    "jalapeno",
    "cayenne",
    "habanero",
    "ghost_pepper",
    "carolina_reaper",
}

for _, file in ipairs(pepper_jokers) do
    sendDebugMessage("Executing items/jokers/pepper/" .. file .. ".lua", "mills")
    assert(SMODS.load_file("items/jokers/pepper/" .. file .. ".lua"))()
end
local sweet_jokers = {
    "apple_of_jacks_eye",
    "barry_b",
    "gummibar",
    "honey_nuts_cheerio",
    "jammin_jelly",
  --  "koolaid_man",
    "nutty_buddy",
    "peppermint_butler",
    "stay_puft"
}

for _, file in ipairs(sweet_jokers) do
    sendDebugMessage("Executing items/jokers/sweet/" .. file .. ".lua", "mills")
    assert(SMODS.load_file("items/jokers/sweet/" .. file .. ".lua"))()
end

local sandwich_jokers = {
 --  "everlasting_pollenstopper",
 --  "flayfluff_sub",
 --  "gloopwhich",
 --  "mr_pb_and_jelly",
 --  "golden_crunch"
}

for _, file in ipairs(sandwich_jokers) do
    sendDebugMessage("Executing items/jokers/sandwiches/" .. file .. ".lua", "mills")
    assert(SMODS.load_file("items/jokers/sandwiches/" .. file .. ".lua"))()
end

-- ||       INSERT CARD MODS        ||

local card_mod = {
    "cookiesimo",
    "candisimo"
 }

 for _, file in ipairs(card_mod) do
    sendDebugMessage("Executing items/modifiers/" .. file .. ".lua", "mills")
    assert(SMODS.load_file("items/modifiers/" .. file .. ".lua"))()
end

-- ||       SOUNDS         ||

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
    path = 'goopy.ogg',
    volume = 1.0,
    pitch = 1.0
}

SMODS.Sound{
    key = 'doh',
    path = 'doh.ogg',
    volume = 1.0,
    pitch = 1.0
}

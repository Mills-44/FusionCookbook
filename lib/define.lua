-- I really like this idea of setting up a Definition Lua I think this will benefit ideas for the mod down the line
-- I Idealy made this to keep track of stuff for Jokers, Enhancements, etc. for easier logic to when im making them
-- As a new coder I hope this will help people out build a mod if wanted 
-- Shoutout to PaperMoon, OppositeWolf770, srockw, GitNether, Victin, BBBalatroMod for this idea used in Paperback

--Poker Hands
MILLS.base_poker_hands = {
  "Straight Flush",
  "Four of a Kind",
  "Full House",
  "Flush",
  "Straight",
  "Three of a Kind",
  "Two Pair",
  "Pair",
  "High Card"
}

--Poker Ranks
MILLS.base_ranks = {
  "Ace",
  "King",
  "Queen",
  "Jack",
  "10",
  "9",
  "8",
  "7",
  "6",
  "5",
  "4",
  "3",
  "2"
}

--Rarities 
MILLS.base_rarities = {
  "Common",
  "Uncommon",
  "Rare",
  "Legendary"
  --Maybe add more?
}

MILLS.base_suits = {
  "Spades",
  "Hearts",
  "Clubs",
  "Diamonds"
  --Highly Doubt but maybe more suits in the long run
}

-- Define light and dark suits
MILLS.light_suits = { 'Diamonds', 'Hearts' }
MILLS.dark_suits = { 'Spades', 'Clubs' }

MILLS.COLORS = { --Sorry bro the u is too confusing for my american brain XD
--Pepper Colors
DEATH = HEX("a21c0d"),
FIERY = HEX("ce9e17"),
PIQUANT = HEX("2c7515"),
SCORCHING = HEX("ce6417"),
SIZZILING = HEX("afac1a"),
SPICY = HEX("667515"),
TANGY = HEX("19460b"),
--Sweet Colors
BOB = HEX("2ec3f1"),
COOKIE = HEX("834f0d"),
GINGY = HEX("6f4305"),
GUMMY = HEX("21de24"),
JELLY = HEX("820f8a"),
SWEET = HEX("d31a9a"),
SANDWICH = HEX("9615aa"),
-- Fusion Colors
FUSION = HEX("FF00FF"),
--Misc Colors
ART = HEX("5e819d"),
-- _ = HEX(""),
-- _ = HEX(""),
-- _ = HEX(""),
-- _ = HEX(""),
-- _ = HEX(""),

}

-- ||           MOD ADDITIONS             ||

-- ||           JOKERS          ||

-- You can comment anything you dont want in game will be removed by set up

--Pepper Jokers
MILLS.PEPPER_JOKERS = {
"pimento_pepper",
"anaheim_chile",
"jalapeno",
"cayenne",
"habanero",
"ghost_pepper",
"carolina_reaper",
}

--Sweet Jokers
MILLS.SWEET_JOKERS = {
-- Common
"gummibar",
"honey_nut_cheerios",
"nutty_buddy",
"peppermint_butler",
"stay_puft",

-- Uncommon
"barry_b",
"bob",
"gingy",
"jammin_jelly",
"koolaid_man",
"wonkas_chocolate_bar",

-- Rare
"cookie_monster",
"jimbo_gump",
"king_candy",

-- Legendary


-- Unfinished
--"apple_of_jacks_eye",
--"better_call_bon",

--"heisenbergs_baby_blue",
--"king_dice",
--"pos_baozis",
--"stuart_on_a_stick",
--"", -- More Ideas
}

MILLS.FUSION_JOKERS = {
  --Common

  -- Uncommon

  --Rare
  "cave",
  "monster",

  -- Legendary

  -- Not Finished
  
}
--Sandwich Jokers
MILLS.SANDWICH_JOKERS = {
--"flayfluff_sub",
--"golden_crunch",
--"mr_pb_and_jelly",
--"gloopwich",
--"everlasting_pollenstopper",
}

--Misc Jokers
MILLS.MISC_JOKERS = {
-- Common 
"clown",
"serious",
--"scorecard",
"stowaway",
"snake_eyes",
--"topsy_turvy",
"waste_worker",

-- Uncommon
"calculator",
--"russian_roulette",

-- Rare
--"missing",

-- Legendary


-- Not Finished
--"curly"

}

-- ||           BOOSTER          ||

-- Snack Pack Booster 
MILLS.BOOSTER = {
--"fusion_pack"
"snack_pack",
"snack_pack_jumbo",
"snack_pack_mega",

}

-- ||           SNACKS          ||
---@class Consumable
---@field key string
---@field atlas string
---@field weight integer
--Snack Cards
MILLS.SNACKS = {
"biscoff",
"blondwie",
"bubblegum",
"butterscotch",
"cake_pop",
--"cannoli",
"choffle",
--"cream_puff",
"frosting",
"homeys_doney",
"kinder_egg",
"m_and_m",
"pretzel",
"rock_candy",
"rye_chip",
"shortbread",
"slice_of_bread",
--"taffy",
"take_5",
"whipping_cream",
}

-- ||           FUSIONS          ||
MILLS.FUSION = {
 "enh_fus"
}

-- ||           ENHANCEMENTS          ||
MILLS.SWEET_ENHANCEMENTS = {
  -- Sweet Modifiers
 "candisimo",
 "cookiesimo",
 "whippisimo",
 "frostisimo"
}
 MILLS.FUSION_BONUS_ENHANCEMENTS = {
 -- Fusion Enhancements

 -- ===Bonus===

"lots",
"extra",
"water",
"tempered",
"sapph",
"cob",
"ori",
"scratch",
}

MILLS.FUSION_MULT_ENHANCEMENTS = {
-- ===Mult===
"ex",
"power",
"lava",
"color",
"ruby",
"cinna",
"rhondite",
"prize",
}

MILLS.FUSION_WILD_ENHANCEMENTS = {
-- ===Wild===
"wat",
"lav",
"wow",
"stain",
"claws",
"bou",
"pig",
"clov",
}

MILLS.FUSION_GLASS_ENHANCEMENTS = {
-- ===Glass===
"temp",
"col",
"stan",
"crack",
"mirror",
"obs",
"dia",
"cry",
}

MILLS.FUSION_STEEL_ENHANCEMENTS = {
-- ===Steel===
 "sapphire",
 "rub",
 "claw",
 "mir",
 "titanium",
 "concrete",
 "electrum",
 "iron"
}

MILLS.FUSION_STONE_ENHANCEMENTS = {
-- ===Stone===
"cobalt",
"cinnabar",
"boulder",
"obsidian",
"conc",
"granite",
"fools",
"dice"
}


MILLS.FUSION_GOLD_ENHANCEMENTS = {
-- ===Gold===
"orichal",
"rhond",
"piggy",
"diamond",
"elec",
"fool",
"phil",
"money"
}

MILLS.FUSION_LUCKY_ENHANCEMENTS = {
-- ===Lucky===
"scra",
"prized",
"clover",
"crystal",
"ir",
"die",
"mon",
"seren"
}

-- ||           SPECTRAL          || 
MILLS.SPECTRAL = {
-- "baker",
 "munch",
}

-- ||           TAROT          ||
MILLS.TAROT = {
  "chromlech",
  "thermality",
   --""
  }

-- ||           SEALS          ||
MILLS.SEALS = {
-- "bubblegum",
 "cookie",
-- "donut",
-- "",
}

-- ||           TAGS          ||
MILLS.TAGS = {
 "nom",
 "sweet",
-- "",
}

-- ||           VOUCHERS          ||
MILLS.VOUCHERS = {
 "snack_merchant",
 "snack_tycoon",
-- "",
}

-- ||           EDITIONS          ||
MILLS.EDITIONS = {
-- "dipped",  
-- "powedered",
-- "sprinkled",
-- "",
}

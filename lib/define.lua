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

---@return table
MILLS.COLORS = { --Sorry bro the u is too confusing for my american brain XD
--Pepper Colors
TANGY = HEX("19460b"),
PIQUANT = HEX("2c7515"),
SPICY = HEX("667515"),
SIZZILING = HEX("afac1a"),
FIERY = HEX("ce9e17"),
SCORCHING = HEX("ce6417"),
DEATH = HEX("a21c0d"),
--Sweet Colors
COOKIE = HEX("834f0d"),
BOB = HEX("2ec3f1"),
GINGY = HEX("6f4305"),
GUMMY = HEX("21de24"),
JELLY = HEX("820f8a"),
-- Fusion Colors
FUSION = HEX("FF00FF"),
-- _ = HEX(""),
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
  "carolina_reaper"
}

--Sweet Jokers
MILLS.SWEET_JOKERS = {
--"apple_of_jacks_eye",
"barry_b",
"bob",
--"cookie_monster",
--"gingy",
"gummibar",
"honey_nut_cheerios",
"jammin_jelly",
"king_candy",
"koolaid_man",
"nutty_buddy",
"peppermint_butler",
"stay_puft",
"wonkas_chocolate_bar",
--"", -- More Ideas
}

MILLS.FUSION_JOKERS = {
 -- "monster",
 -- "cave"
}
--Sandwich Jokers
MILLS.SANDWHICH_JOKERS = {
--"flayfluff_sub"
--"golden_crunch"
--"mr_pb_and_jelly"
--"gloopwich"
--"everlasting_pollenstopper"
--"" -- More to come :)
--""
}

-- ||           BOOSTER          ||

-- Snack Pack Booster 
MILLS.BOOSTER = {
"snack_pack",
"snack_pack_jumbo",
"snack_pack_mega",
--"fusion_pack"
}

-- ||           SNACKS          ||
--Snack Cards
MILLS.SNACKS = {
--"slice_of_bread",
--"cream_puff",
"rye_chip",
--"pretzel",
"homeys_doney",
--"kinder_egg",
"biscoff",
--"bubblegum",
"butterscotch",
"frosting",
"whipping_cream",
-- "cannoli",
-- "taffy",
-- "shortbread",
-- "choffle",
-- "blondwie",
-- "",
}
-- ||           FUSIONS          ||
MILLS.FUSION = {
 -- "global"
}

-- ||           ENHANCEMENTS          ||
MILLS.SWEET_ENHANCEMENTS = {
  -- Sweet Modifiers
 "candisimo",
 "cookiesimo",
 "whippisimo",
 "frostisimo"
}
 MILLS.ORE_ENHANCEMENTS = {
 -- Fusion Enhancements
--"lots",
-- "extra",
-- "untamed",
-- "tempered",
-- "sapph",
-- "cob",
-- "ori",
-- "scratch",
-- "power",
-- "feral",
-- "color",
-- "ruby",
-- "cinna",
-- "rhondite",
-- "prize",
-- "wow",
-- "stain",
-- "claws",
-- "bou",
-- "pig",
-- "clov"
}

-- ||           SPECTRAL          ||
MILLS.SPECTRAL = {
-- "munch",
-- "baker",
}

-- ||           TAROT          ||
MILLS.TAROT = {
  -- "animal",
  -- "chromlech",
  }

-- ||           SEALS          ||
MILLS.SEALS = {
-- "cookie",
-- "donut",
-- "bubblegum",
-- "",
}

-- ||           TAGS          ||
MILLS.TAGS = {
-- "nom",
-- "sweet",
-- "",
}

-- ||           EDITIONS          ||
MILLS.EDITIONS = {
-- "powedered",
-- "sprinkled",
-- "dipped",  
-- "",
}

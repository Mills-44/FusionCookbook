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
"anaheim_chile",
"carolina_reaper",
"cayenne",
"ghost_pepper",
"habanero",
"jalapeno",
"pimento_pepper",
}

--Sweet Jokers
MILLS.SWEET_JOKERS = {
--"apple_of_jacks_eye",
"barry_b",
--"better_call_bon",
"bob",
--"cookie_monster",
--"gingy",
"gummibar",
--"heisenbergs_baby_blue",
"honey_nut_cheerios",
"jammin_jelly",
"king_candy",
--"king_dice",
"koolaid_man",
"nutty_buddy",
"peppermint_butler",
--"pos_baozis",
"stay_puft",
--"stuart_on_a_stick",
"wonkas_chocolate_bar",
--"", -- More Ideas
}

MILLS.FUSION_JOKERS = {
  -- "cave"
  -- "monster",
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
--"fusion_pack"
"snack_pack",
"snack_pack_jumbo",
"snack_pack_mega",

}

-- ||           SNACKS          ||
--Snack Cards
MILLS.SNACKS = {
"biscoff",
--"blondwie",
"bubblegum",
"butterscotch",
--"cannoli",
--"choffle",
--"cream_puff",
"frosting",
"homeys_doney",
"kinder_egg",
"m_and_m",
"pretzel",
"rock_candy",
"rye_chip",
"shortbread",
--"slice_of_bread",
--"taffy",
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
 MILLS.FUSION_ENHANCEMENTS = {
 -- Fusion Enhancements
"bou",
"cinna",
"claws",
"clov",
"cob",
"color",
"crack",
--"dia",
"extra",
"feral",
"lots",
"mirror",
"obs",
"ori",
"pig",
"power",
"prize",
"rhondite",
"ruby",
"sapph",
"scratch",
"stain",
"tempered",
"untamed",
}

-- ||           SPECTRAL          || 
MILLS.SPECTRAL = {
-- "baker",
-- "munch",
}

-- ||           TAROT          ||
MILLS.TAROT = {
   "animal",
   "chromlech",
   "omnipotent",
   --""
  }

-- ||           SEALS          ||
MILLS.SEALS = {
-- "bubblegum",
-- "cookie",
-- "donut",
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
-- "dipped",  
-- "powedered",
-- "sprinkled",
-- "",
}

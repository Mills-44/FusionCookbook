return {
descriptions = {
    Back={},
    Blind={},
    Edition={},
    Enhanced={
        m_mills_candisimo = {
            name = "Candisimo",
            text ={ 
                "Scored hands that are {C:attention}Flush or Lower{} this card gains {C:chips}+#3#{} Chips",
                "Scored hands that are {C:attention}Full House or Higher{} this card gains {C:mult}+#4#{} Mult",
                "{C:inactive}Total: {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult"
            }
        },
        m_mills_cookiesimo = {
        name = "Cookiesimo",
        text = {
            "Triggers a random surprise!",
            "{C:inactive}Surprise include mult, xmult, chips, consumeables"
            }
        },
        m_mills_whippisimo = {
          name = "Whippisimo",
          text = {
            "{X:mult,C:white}X#1#{} Mult when scored",
            "Alternates between {X:mult,C:white}X2{} and {X:mult,C:white}X1{} when scored"
          }
        },
          m_mills_frostisimo = {
            name = "Frostisimo",
            text = {
                "{C:gold}$1{} when scored if you have a {C:attention}Sweet joker{}",
                "the amount of money increases by {C:gold}$1{}"
                }
            },
        },
        Joker={
             --PEPPER JOKERS
             j_mills_pimento_pepper = {
                name = "Pimento Pepper",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "When a {C:attention}Flush{} or {C:attention}Full{} House is played",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg",
                }
            },  
            j_mills_anaheim_chile = {
                name = "Anaheim Chile",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or Full House is played",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_jalapeno = {
                name = "Jalapeno",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or Full House is played",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_cayenne = {
                name = "Cayenne",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or Full House is played",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_habanero = {
                name = "Habanero",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or Full House is played",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            }, j_mills_ghost_pepper = {
                name = "Ghost Pepper",
                text = {
                    "This Joker gives {C:mult}+#1#{} Mult and {X:mult,C:white}X2{} ",
                    "On {C:attention}Flush{} or {C:attention}Full Houses{}, levels up Spicyness",
                    "The {C:attention}5th{} level activates Pain!",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg "
                }
            }, j_mills_carolina_reaper = {
                name = "Carolina Reaper",
                text = {
                    "This Joker gives {C:mult}+#1#{} and",
                    "{C:dark_edition}^#2# Mult{} on any scoring hands",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg "
                }
            },
            --SWEET JOKERS
            j_mills_apple_of_jacks_eye = {
                name = "Apple Jack",
                text = {
                  "When 3 of one suit are scored create a random {C:attention}Snack{} card"
                }
              },
              j_mills_barry_b = {
                name = "Barry B.",
                text = {
                  "When scoring hands contains a {C:attention}Four of a Kind{}",
                  "all cards turn into {C:attention}Glass Cards{}"
                }
              },
              j_mills_bob = {
                name = "B.O.B",
                text = {
                  "When scoring hands contains a {C:attention}Flush{}",
                  "all cards turn into {C:attention}Whippisimo Cards{}"
                }
              },
              j_mills_cookie_monster = {
                name = "Cookie Monster",
                text = {
                  "When scoring hands contains a {C:attention}Straight Flush{}",
                  "all cards turn into {C:attention}Cookiesimo Cards{}"
                }
              },
              j_mills_gingy = {
                name = "Gingy",
                text = {
                  "When scoring hands contains a {C:attention}Full House{}",
                  "all cards turn into {C:attention}Frostisimo Cards{}"
                }
              },
              j_mills_gummibar = {
                name = "Gummibar",
                text = {
                  "This Joker gains +4 {C:mult}Mult{} When scoring hand is a {C:attention}Straight{},",
                  "{C:inactive}Total Mult: {C:mult}+#2#{}"
                }
              },
              j_mills_honey_nut_cheerios = {
                name = "Honey Nut Cheerio's",
                text = {
                  "All {C:spades}Spades{} played in scoring hand,",
                  "turn into {C:attention}Gold Cards{}"
                }
              },
              j_mills_jammin_jelly = {
                name = "Jammin' Jelly",
                text = {
                  "When scoring hands contains a {C:attention}Three of a Kind{}",
                  "all cards turn into {C:attention}Mult Cards{}"
                }
              },
              j_mills_king_candy = {
                name = "King Candy",
                text = {
                  "When scoring hands contains a {C:attention}Five of a Kind{}",
                  "all cards turn into {C:attention}Candisimo Cards{}"
                }
              },
              j_mills_koolaid_man = {
                name = "Kool-Aid Man",
                text = {
                  "When scoring hands contains a {C:attention}Three of a Kind{} gain {C:money}$3{}"
                }
              },
              j_mills_nutty_buddy = {
                name = "Nutty Buddy",
                text = {
                  "When scoring hands contains a {C:attention}Pair{}",
                  "all cards turn into {C:attention}Bonus Cards{}"
                }
              },
              j_mills_peppermint_butler = {
                name = "Peppermint Butler",
                text = {
                 "This Joker gains {C:chips}+#1# chips{} When scoring hand contains a {C:attention}Pair{}",
                 "{C:inactive}Total Chips: {C:chips}+#2#{}"
                }
              },
              j_mills_stay_puft = {
                name = "Stay Puft",
                text = {
                  "When scored hand contains a {C:attention}Straight{}",
                  "turn all cards in the hand into either {C:attention}Wild or Steel Cards{}",
                  "{C:green}(1 in 2){} for each"
                }
              },
              j_mills_wonkas_chocolate_bar = {
                name = "Wonka's Chocolate Bar",
                text = {
                  "When scored hand contains a {C:attention}Two Pair{}",
                  "turn all cards in the hand into {C:attention}Lucky Cards{}"
                }
            },
            --SANDWICH JOKERS
            j_mills_everlasting_pollenstopper = {
                name = "Everlasting Pollenstopper",
                text = {
                    "When scored hand contains a {C:attention}Lucky and Glass Card{},",
                    "create a {C:negative}Negative Spectral{} card"
                }
            },
            j_mills_flayfluff_sub = {
                name = "Flayfluff Sub",
                text = {
                    "When scored hand contains a {C:attention} Wild and Glass Card{},",
                    "create a {C:negative}Negative Joker{}"
                }
            },
            j_mills_gloopwich = {
                name = "Gloopwich",
                text = {
                    "When scored hand contains a {C:attention}Wild and Mult Card{},",
                    "all cards upgrade one editions",
                    "{C:inactive}None → Foil → Holographic → Negative → Polychrome{}"
                }
            },
            j_mills_golden_crunch = {
                name = "Golden Crunch",
                text = {
                    "When scored hand contains a {C:attention}Lucky and Glass Card{},",
                    "all cards gain a random {C:attention}Seal{}"
                }
            },
            j_mills_mr_pb_and_jelly = {
                name = "Mr.PB & Jelly",
                text = {
                   "When scored hand contains a {C:attention}Lucky and Glass Card{},",
                   "create a {C:negative}Negative Snack{} card"
                }
            },
        },
        Other={
            p_mills_snack_pack = {
                name = "Snack Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
					          "{C:attention}#2#{} Snacks",
                }
            },
            p_mills_snack_pack_jumbo = {
                name = "Jumbo Snack Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
					          "{C:attention}#2#{} Snacks",
                }
            },
            p_mills_snack_pack_mega = {
                name = "Mega Snack Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
					          "{C:attention}#2#{} Snacks",
                }
            },
            --SEALS
            mills_cookie_seal = {
                name = "Cookie Seal",
                text = {
                    "Creates a Snack card when {C:attention}discarded{}",
                    "{C:inactive}(Must have room){}",
                }
            },
        },
        Planet={},
        Snack = {
            --SNACK Cards
            c_mills_biscoff = {
                name = "Biscoff",
                text = {
                  "Select 2 cards to turn to Candisimo"
                }
              },
              c_mills_blondwie = {
                name = "Blondwie",
                text = {
                  "Select 2 cards and destroy them add combined card off the difference between the 2 cards"
                }
              },
              c_mills_bubblegum = {
                name = "Bubblegum",
                text = {
                  "Gain {C:money}$2{} per {C:attention{} Gold Card{} in your deck"
                }
              },
              c_mills_butterscotch = {
                name = "Butterscotch",
                text = {
                  "Gain {X:mult,C:white}X0.5{} for each {C:attention}Sweet Joker{},",
                  "and multiply by your total result",
                  "{C:inactive}Starts on {X:mult,C:white}1x{}"
                }
              },
              c_mills_choffle = {
                name = "Choffle",
                text = {
                  "Select 2 cards and destroy them, add combined sum card to the deck"
                }
              },
              c_mills_cream_puff = {
                name = "Cream Puff",
                text = {
                  "Boosts all {C:attention}Jokers{} compatible by {C:enhancement}+20%{}",
                  "{C:inactive}(Chips, Mult, XMult, etc){}"
                }
              },
              c_mills_frosting = {
                name = "Frosting",
                text = {
                  "Select 2 cards to turn to Frostisimo"
                }
              },
              c_mills_homeys_doney = {
                name = "Homey's Doney",
                text = {
                  "{C:green}1 in 2{} chance to get +1 Discard or,",
                  "{C:green}1 in 2{} chance to get +1 Hand"
                }
              },
              c_mills_kinder_egg = {
                name = "Kinder Egg",
                text = {
                  "Create one random {C:attention}Sweet Joker{}"
                }
              },
              c_mills_pretzel = {
                name = "Pretzel",
                text = {
                  "Select 1 card to turn to Cookiesimo"
                }
              },
              c_mills_rye_chip = {
                name = "Rye Chip",
                text = {
                  "Create 2 random Snack Cards"
                }
              },
              c_mills_slice_of_bread = {
                name = "Slice of Bread",
                text = {
                  "Combine two compatible Jokers to create a {C:attention}Sandwich Joker{}"
                }
              },
              c_mills_whipping_cream = {
                name = "Whipping Cream",
                text = {
                  "Select 2 cards to turn to Whippisimo"
                }
              },
            },
        Spectral={
            c_mills_munch = {
                name = "Munch",
                 text = { 
                    "Add a {C:attention}Cookie Seal{} to 1 selected card"
                    }
            },
        },
        Stake={},
        Tag={},
        Tarot={},
        Voucher={},
    },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_mills_snack_pack = "Snack",
            b_mills_snack_pack = "Snack",
            mills_flayfluff = "Makes Flayfluff!",
            mills_not_valid_fusion = "No Valid Combos",
            mills_unknwown_fusion = "Unknown Combo"

        },
        high_scores={},
        labels={
            mills_cookie_seal = "Cookie Seal",
        },
        poker_hand_descriptions={},
        poker_hands={},
        quips={},
        ranks={},
        suits_plural={},
        suits_singular={},
        tutorial={},
        v_dictionary={
            a_mult = {"+#1# Mult"},
            a_chips = {"+#1# Chips"},
            a_xchips = {"X#1# Chips"},
            a_powmult = {"^#1# Mult"},
            a_powchips = {"^#1# Chips"},
            a_powmultchips = {"^#1# Mult+Chips"},
            a_round = {"+#1# Round"},
            a_candy = {"+#1# Candy"},
            a_xchips_minus = {"-X#1# Chips"},
            a_powmult_minus = {"-^#1# Mult"},
            a_powchips_minus = {"-^#1# Chips"},
            a_powmultchips_minus = {"-^#1# Mult+Chips"},
            a_round_minus = {"-#1# Round"},

            a_tag = {"#1# Tag"},
            a_tags = {"#1# Tags"},
        },
        v_text={},
    },
}

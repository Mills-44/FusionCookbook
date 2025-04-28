return {
descriptions = {
    Back={},
    Blind={},
    Edition={},
    Enhanced={
        m_mills_candisimo = {
            name = "Candisimo",
            text ={ 
                "If scored hand is a {C:attention}Flush or lower{}, gain {C:chips}+50{} chips.",
                "If scored hand is a {C:attention}Full House or higher{}, ",
                "gain {C:mult}+8{} mult."
            }
        },
        m_mills_cookiesimo = {
        name = "Cookiesimo",
        text = {
            "On score, trigger a {C:attention}sweet surprise{},",
            "Bonus includes mult, chips, money, or more!"
            }
        },
        },
        Joker={
             --PEPPER JOKERS
             j_mills_pimento_pepper = {
                name = "Pimento Pepper",
                text = {
                    "When a {C:attention}Flush{} or {C:attention}Full{} House is played",
                    "this Joker gains {C:mult}+#1#{} Mult",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg",
                }
            },  
            j_mills_anaheim_chile = {
                name = "Anaheim Chile",
                text = {
                    "{C:attention}When a Flush{} or Full House is played",
                    "this Joker gains {C:mult}+#1#{} Mult",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_jalapeno = {
                name = "Jalapeno",
                text = {
                    "{C:attention}When a Flush{} or Full House is played",
                    "this Joker gains {C:mult}+#1#{} Mult",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_cayenne = {
                name = "Cayenne",
                text = {
                    "{C:attention}When a Flush{} or Full House is played",
                    "this Joker gains {C:mult}+#1#{} Mult",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_habanero = {
                name = "Habanero",
                text = {
                    "{C:attention}When a Flush{} or Full House is played",
                    "this Joker gains {C:mult}+#1#{} Mult",
                    "Every {C:attention}3rd{} activation levels up Spicyness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            }, j_mills_ghost_pepper = {
                name = "Ghost Pepper",
                text = {
                    "{C:mult}+125{} Mult and doubles your current Mult,",
                    "On {C:attention}Flush{} or {C:attention}Full Houses{}, Level up.",
                    "After {C:attention}5{} infernos,",
                    "The {C:attention}5th{} level activates Pain!",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg "
                }
            }, j_mills_carolina_reaper = {
                name = "Carolina Reaper",
                text = {
                    "When any hand scores, this Joker gives {C:mult}+#1#{} and",
                    "{C:dark_edition}^#2# Mult{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg "
                }
            },
            --SWEET JOKERS
            j_mills_apple_of_jacks_eye = {
                name = "Apple of Jack's Eye",
                text = {
                  "If scoring hand contains at least 3 of one suit,",
                  "Generate one random {C:gold}Snack Card{}"
                }
              },
              j_mills_barry_b = {
                name = "Barry B's Honey Tree",
                text = {
                  "When scored hand contains a {C:attention}Four of a Kind{},",
                  "turn all cards in the hand into Glass cards",
                }
              },
              j_mills_gummibar = {
                name = "Gummibar",
                text = {
                  "If the scoring hand is a {C:attention}Straight{},",
                  "this Joker gains +3 {C:mult}Mult{}",
                  "{C:inactive}Total Mult: {C:mult}+#2#{}"
                }
              },
              j_mills_honey_nut_cheerios = {
                name = "Honey Nut Cheerio's",
                text = {
                  "All {C:spades}Spades{} played in scoring hand,",
                  "turn into Gold Cards"
                }
              },
              j_mills_jammin_jelly = {
                name = "Jammin' Jelly",
                text = {
                  "When scored hand contains a {C:attention}Three of a Kind{},",
                  "turn all cards in the hand into {C:mult}Mult{} Cards"
                }
              },
              j_mills_koolaid_man = {
                name = "Kool-Aid Man",
                text = {
                  "When scoring hand contains a {C:attention}Three of a Kind{},",
                  "this Joker gives {C:money}$3"
                }
              },
              j_mills_nutty_buddy = {
                name = "Nutty Buddy",
                text = {
                  "When scored hand contains a {C:attention}Pair{},",
                  "turn all cards in the hand into {C:chips}Bonus{} Cards"
                }
              },
              j_mills_peppermint_butler = {
                name = "Peppermint Butler",
                text = {
                  "If the scoring hand contains a {C:attention}Pair{},",
                  "this Joker gains {C:chips}+#1#{} Chips (Total: {C:chips}#2#{})"
                }
              },
              j_mills_stay_puft = {
                name = "Stay Puft",
                text = {
                  "When scored hand contains a {C:attention}Straight{},",
                  "turn all cards in the hand into either Wild or Steel Cards (50/50)"
                }
              },
              j_mills_wonkas_chocolate_bar = {
                name = "Wonka's Chocolate Bar",
                text = {
                  "When scored hand contains a {C:attention}Two Pair{},",
                  "turn all cards in the hand into Lucky Cards"
                }
            },
            --SANDWICH JOKERS
            j_mills_everlasting_pollenstopper = {
                name = "Everlasting Pollenstopper",
                text = {
                    "When a scoring hand contains a Lucky and Glass Card create a {C:negative}Negative Spectral{} Card"
                }
            },
            j_mills_flayfluff_sub = {
                name = "Flayfluff Sub",
                text = {
                    "When a scoring hand contains a Glass and Wild Card create a {C:dark_edition}Negative Joker{}"
                }
            },
            j_mills_gloopwich = {
                name = "Gloopwich",
                text = {
                    "When a scoring hand contains a Wild and Mult Card  all cards upgrade one edition,",
                    "{C:inactive}None → Foil → Holographic → Negative → Polychrome{}"
                }
            },
            j_mills_golden_crunch = {
                name = "Golden Crunch",
                text = {
                    "When a scoring hand contains a Lucky and Bonus Card all cards get a random seal"
                }
            },
            j_mills_mr_pb_and_jelly = {
                name = "Mr.PB & Jelly",
                text = {
                    "When a scoring hand contains a Mult and Bonus Card create a {C:dark_edition}Negative Snack{} Card"
                }
            },
        },
        Other={
            p_mills_snack_pack = {
                name = "Snack Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} Snack Cards",
                }
            },
            p_mills_snack_pack_jumbo = {
                name = "Jumbo Snack Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} Snack Cards",
                }
            },
            p_mills_snack_pack_mega = {
                name = "Mega Snack Pack",
                text = {
                    "Choose {C:attention}#1#{} of up to",
					"{C:attention}#2#{} Snack Cards",
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
                  "Choose 2 cards to turn into Candisimo Cards"
                }
              },
              c_mills_bubblegum = {
                name = "Bubblegum",
                text = {
                  "Gives {C:money}$2{} per Gold Card",
                  "in your deck"
                }
              },
              c_mills_butterscotch = {
                name = "Butterscotch",
                text = {
                  "Gains {X:mult,C:white}X0.5{} for each {C:attention}Sweet Joker{},",
                  "and multiplies money by total result",
                  "{C:inactive}Starts on {X:mult,C:white}1x{}"
                }
              },
              c_mills_cream_puff = {
                name = "Cream Puff",
                text = {
                  "Boosts all {C:attention} Jokers{} by {C:enhancement}+20%{} stats",
                  "{C:inactive}(Chips, Mult, XMult, etc){}"
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
                  "Select 1 card to become a Cookiesimo Card"
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
            k_mills_snack_pack = "Snack Pack",

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

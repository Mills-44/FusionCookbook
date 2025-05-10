return {
descriptions = {
    Back={},
    Blind={},
    Edition={},
    Enhanced={
        m_mills_candisimo = {
            name = "Candisimo Card",
            text ={ 
                "If scored in {C:attention}Flush or Lower{}, this card gains {C:chips}+#3#{} Chips",
                "If scored in {C:attention}Full House or Higher{} this card gains {C:mult}+#4#{} Mult card",
                "{C:inactive}Total: {C:chips}+#1#{} Chips and {C:mult}+#2#{} Mult"
            }
        },
        m_mills_cookiesimo = {
        name = "Cookiesimo Card",
        text = {
            "Triggers a random surprise!",
            "{C:inactive}Surprise include chips, mult, $, xmult, consumeables"
            }
        },
        m_mills_whippisimo = {
          name = "Whippisimo Card",
          text = {
            "{X:mult,C:white}X#1#{} Mult when scored",
            "Alternates between {X:mult,C:white}X2{} and {X:mult,C:white}X1{} when scored"
          }
        },
          m_mills_frostisimo = {
            name = "Frostisimo Card",
            text = {
                "{C:gold}$#1#{} when scored if you have a {C:attention}Sweet Joker{}",
                "the amount of money increases by {C:gold}$1{}"
                }
            },
            m_mills_bou = {
              name = "Boulder Card",
              text = {
                 "Considered as any suit with no rank",
                 "{C:chips}+#1#{} chips",
                  }
              },
            m_mills_cinna = {
              name = "Cinnabar Card",
              text = {
                 "{C:mult}+#1#{} Mult & {C:chips}+#2#{} Chips",
                 "has no rank or suit"
                  }
              },
            m_mills_claws = {
              name = "Claws Card",
              text = {
                "{X:mult,C:white}X#1#{} Mult",
                "Destroyed after {C:attention}#2#{} times scored"

                  }
              },
            m_mills_clov = {
              name = "Clover Card",
              text = {
                "{C:green}#3# in #4#{} chance",
                "for {C:mult}+#1#{} Mult",
                "{C:green}#3# in #5#{} chance",
                "{C:money}$#2#{} dollars"}
                  },
            m_mills_cob = {
              name = "Cobalt Card",
              text = {
                 "{C:chips}+#1#{} Chips",
                  "has no rank or suit"
                  }
              },
            m_mills_color = {
              name = "Colored Glass Card",
              text = {
                "{X:mult,C:white}X#1#{} Mult",
                "{C:green}#2# in #3#{} card is destroyed"
                  }
              },
            m_mills_extra = {
              name = "Extra Card",
              text = {
                 "{C:chips}+#1#{} Chips",
                 "{C:mult}+#2#{} Mult"
                  }
              },
            m_mills_feral = {
              name = "Lava Card",
              text = {
                 "{C:mult}+#1#{} Mult",
                 "and can be scored as any suit"
                  }
              },
            m_mills_lots = {
              name = "Lots Card",
              text = {
                 "{C:chips}+#1#{} Chips"
                  }
              },  
            m_mills_ori = {
              name = "Orichalcum Card",
              text = {
                 "{C:money}$#1#{} when held in hand card",
                 "then addds {C:bonus}Chips{} equal to the amount of total {C:attention}money{}"
                  }
              },
            m_mills_pig = {
              name = "Piggy Card",
              text = {
                 "{C:money}+$#1#{} dollars when scored and",
                 "{C:money}+$#2#{} while held in hand"
                  }
              },
            m_mills_power = {
              name = "Power Card",
              text = {
                 "{C:mult}+#1#{} Mult"
                  }
              },
            m_mills_prize = {
              name = "Prize Card",
              text = {
                "{C:green}#3# in #4#{} chance",
                "for {X:mult,C:white}X#1#{} Mult",
                "{C:green}#3# in #5#{} chance for {C:money}$#2#{}"
                  }
                },

            m_mills_crack = { 
              name = "Cracked Glass Card",
              text = {
                      "{X:mult,C:white}X#1#{} mult",
                      "{E:2}breaks{} after use"
                    }
              },

            m_mills_rhondite = {
              name = "Rhondite Card",
              text = {
                "{C:money}-$1{} when scored",
                "{C:green}#2# in #3#{} chance earn {C:money}$#1#{}"
                  }
              },
            m_mills_ruby = {
              name = "Ruby Card",
              text = {
                 "{X:mult,C:white}X#1#{} Mult"
                  }
              },
            m_mills_sapph = {
              name = "Sapphire Card",
              text = {
                "{X:chips,C:white}X#1#{} Chips",
                "while held in hand"
                  }
              },
            m_mills_scratch = {
              name = "Scratch Card",
              text = {
                "{C:green}#1# in #2#{} chance",
                "for {C:chips}+#3#{} chips",
                "{C:green}#4# in #5#{} chance",
                "for {C:money}$#6# "
                  }
              },
            m_mills_stain = {
              name = "Stained Glass Card",
              text = {
                "{X:mult,C:white}X#2#{} Mult",
                "{C:green}#3# in #1#{} card is destroyed"
                  }
              },
            m_mills_tempered = {
              name = "Tempered Glass Card",
              text = {
                "{X:chips,C:white}X#1#{} Chips",
                "{C:green}#2# in #3#{} card is destroyed"
                  }
              },
            m_mills_untamed = {
              name = "Water Card",
              text = {
                 "{C:chips}+#1#{} Chips",
                "and can be scored as any suit"
                  }
              },
            m_mills_wow = {
              name = "Monster Card",
              text = {
                "{C:legendary}I keep it caged{}",
                "{C:legendary}and i just can't",
                "{C:legendary}hold it..."
                  }
              },

              m_mills_mirror = {
                name = "Mirror Card",
                text = {
                  "{X:mult,C:white}X#1#{} Mult",
                  "{C:green}#3# in #2#{} chance to retrigger",
                    }
                },

                m_mills_obs = {
                  name = "Obsidian Card",
                  text = {
                    "{X:mult,C:white}X#1#{} Mult",
                    "Never breaks",
                      }
                  },
		            m_mills_dia = {
                    name = "Diamond Card",
                    text = {
                      "{C:green}#3# in #4#{} chance for ${X:money,C:white}X2{}",
                      "{C:green}#3# in #5#{} chance card breaks",
                        }
                    },
                 m_mills_sup = {
                    name = "Supersteel Card",
                    text ={ 
                      "{X:mult,C:white}X#1#{} mult when held in hand",
            }
        },
        },
        Joker={
             --PEPPER JOKERS
             j_mills_pimento_pepper = {
                name = "Pimento Pepper",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
                    "Every {C:attention}3rd{} activation levels up Spiciness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg",
                }
            },  
            j_mills_anaheim_chile = {
                name = "Anaheim Chile",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or {C:attention}Full House{} is played",
                    "Every {C:attention}3rd{} activation levels up Spiciness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_jalapeno = {
                name = "Jalapeno",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or {C:attention}Full House{} is played",
                    "Every {C:attention}3rd{} activation levels up Spiciness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_cayenne = {
                name = "Cayenne",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or {C:attention}Full House{} is played",
                    "Every {C:attention}3rd{} activation levels up Spiciness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            },
            j_mills_habanero = {
                name = "Habanero",
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "{C:attention}When a Flush{} or {C:attention}Full House{} is played",
                    "Every {C:attention}3rd{} activation levels up Spiciness!",
                    "{C:inactive}Total Mult: {C:mult}+#2#{}",
                    "{X:gold,C:blue} Art:{X:blue,C:gold}gfsg ",
                }
            }, j_mills_ghost_pepper = {
                name = "Ghost Pepper",
                text = {
                    "This Joker gives {C:mult}+#1#{} Mult and {X:mult,C:white}X2{} ",
                    "On {C:attention}Flush{} or {C:attention}Full Houses{}, levels up Spiciness!",
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
                  "When scoring hand contains all face cards",
                  "create a random {C:attention}Snack{} card"
                }
              },
              j_mills_barry_b = {
                name = "Barry B.",
                text = {
                  "When scoring hands contains a {C:attention}Four of a Kind{}",
                  "turn hand into {C:attention}Glass Cards{}"
                }
              },
              j_mills_bob = {
                name = "B.O.B",
                text = {
                  "When scoring hands contains a {C:attention}Flush{}",
                  "turn hand into {C:attention}Whippisimo Cards{}"
                }
              },
              j_mills_cookie_monster = {
                name = "Cookie Monster",
                text = {
                  "When scoring hands contains a {C:attention}Straight Flush{}",
                  "turn hand into {C:attention}Cookiesimo Cards{}"
                }
              },
              j_mills_gingy = {
                name = "Gingy",
                text = {
                  "When scoring hands contains a {C:attention}Full House{}",
                  "turn hand into {C:attention}Frostisimo Cards{}"
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
                  "turn hand into {C:attention}Mult Cards{}"
                }
              },
              j_mills_king_candy = {
                name = "King Candy",
                text = {
                  "When scoring hands contains a {C:attention}Five of a Kind{}",
                  "turn hand into {C:attention}Candisimo Cards{}"
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
                  "turn hand into {C:attention}Bonus Cards{}"
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
                   "When scored hand contains a {C:attention}Mult{} and {C:attention}Bonus{},",
                   "create a {C:negative}Negative Snack{} card"
                }
            },
            j_mills_cave = {
              name = "Cave Joker",
              text = {
                "Creates a random {C:attention}Ore{} card",
                "when blind selected"
              }
          },
          j_mills_monster = {
            name = "Monster",
            text = {
               "Turns {C:attention}Steel Cards{}",
                "into {C:attention}Claws Cards{}"
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
                  "Select 2 cards to turn to {C:attention}Candisimo Cards{}"
                }
              },
              c_mills_blondwie = {
                name = "Blondwie",
                text = {
                  "Select 2 {C:attention}Mult, Lucky, or Glass Cards{},",
                  "To enfuse and create a new enhancement card"
                }
              },
              c_mills_bubblegum = {
                name = "Bubblegum",
                text = {
                  "Gain {C:money}$2{} per {C:attention{}Gold Card{} in your deck"
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
              c_mills_cake_pop = {
                name = "Cake Pop",
                text = {
                  "Select 2 {C:attention}Mult, Stone, or Glass Cards{},",
                 "To enfuse and create a new enhancement card"
                }
              },
              c_mills_cannoli = {
                name = "Cannoli",
                text = {
                  "Create a copy of selected card with a chance to have,",
                  "enhancement, seal, or edition"
                }
              },
              c_mills_choffle = {
                name = "Choffle",
                text = {
                  "Select 2 {C:attention}Lucky, Gold, or Bonus Cards{},",
                  "To enfuse and create a new enhancement card"
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
                  "Select 2 cards to turn to {C:attention}Frostisimo Cards{}"
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
              c_mills_m_and_m = {
                name = "M&M",
                text = {
                  "{C:green} 1 in 3{} chance to get a {C:negative}Spectral{} card."
                }
              },
              c_mills_pretzel = {
                name = "Pretzel",
                text = {
                  "Select 1 card to turn into {C:attention}Cookiesimo Card{}"
                }
              },
              c_mills_rock_candy = {
                name = "Rock Candy",
                text = {
                  "Select 2 {C:attention}Glass Cards{} or {C:attention}Bonus Cards{},",
                  "To enfuse and create a new enhancement card"
                }
              },
              c_mills_rye_chip = {
                name = "Rye Chip",
                text = {
                  "Create 2 random {C:attention}Snacks Cards{}"
                }
              },
              c_mills_shortbread = {
                name = "Shortbread",
                text = {
                    "Decreases rank of up to {C:attention}2{},",
                    "selected cards by {C:attention}1{}"
                }
            },         
              c_mills_slice_of_bread = {
                name = "Slice of Bread",
                text = {
                  "Combine two compatible Jokers,",
                  "to create a {C:attention}Sandwich Joker{}"
                }
              },
              c_mills_take_5 = {
                name = "Take 5",
                text = {
                  "Select 2 {C:attention}Wild, Glass, or Mult Cards{},",
                 "To enfuse and create a new enhancement card"
                }
              },
              c_mills_whipping_cream = {
                name = "Whipping Cream",
                text = {
                  "Select 2 cards to turn to {C:attention}Whippisimo Cards{}"
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
        Tag={
          tag_mills_sweet = {
          name = "Sweet Tag",
           text = { 
                 "The next shop will have a free {C:attention}Sweet Joker{}."
              }
        },
        tag_mills_nom = {
          name = "Nom Tag",
           text = { 
                 "Immediately open a free {C:attention}Mega Snack Pack{}."
              }
        },
        },
        Tarot={
          c_mills_animal = {
            name = "Animal",
             text = { 
               "Select 2 {C:attention} Mult, Wild or Bonus Cards{},",
               "To enfuse and create a new enhancement card"
                }
        },
          c_mills_chromlech = {
            name = "Cromlech",
             text = { 
                "Select 2 {C:attention} Mult, Stone or Bonus Cards{},",
                "To enfuse and create a new enhancement card"
                }
        },
        c_mills_omnipotent = {
          name = "Omnipotent",
           text = { 
              "Select 2 {C:attention} Mult or Bonus Cards{},",
              "To enfuse and create a new enhancement card"
              }
      },
        },
        Fusion = {
          c_mills_enh_fus = {
            name = "Enhancement Fusion",
            text = {
              "{C:purple}Fuses{} 2 different {C:attention}enhancements{}",
              "into one {C:purple,E:1}fused{} enhancement card"
            }
          },
        },
        Tabs = {
          mills_fusions_glob = {
            name = "",
            text = {
              "{C:purple, S:1.2}Global Fusion Card:{} Fuses 2 diferent selected cards of any type"
            }
          },

          mills_fusions_glob_enh = {
            name = "",
            text = {
              "{C:purple, S:1.2}Global Modification Fusion Card:{} Fuses 2 diferent selected cards of any type"
            }
          },

          mills_fusions_glob_cons = {
            name = "",
            text = {
              "{C:purple, S:1.2}Global Consumable Fusion Card:{} Fuses 2 diferent selected cards of any type"
            }
          },

          mills_fusions_enh = {
            name = "",
            text = {
              "{C:purple, S:1.2}Enhanc Fusion Card:{} Fuses 2 diferent selected {C:attention)enhancement{}"
            }
          },

          mills_fusions_edi = {
            name = "",
            text = {
              "{C:purple, S:1.2}Edition Fusion Card:{} Fuses 2 diferent selected {C:attention)editions{}"
            }
          },

          mills_fusions_seal = {
            name = "",
            text = {
              "{C:purple, S:1.2}Seal Fusion Card:{} Fuses 2 diferent selected {C:attention)Seals{}"
            }
          },

          mills_fusions_tarot = {
            name = "",
            text = {
              "{C:purple, S:1.2}Tarot Fusion Card:{} Fuses 2 diferent selected {C:attention)Tarot Cards{}"
            }
          },

          mills_fusions_spec = {
            name = "",
            text = {
              "{C:purple, S:1.2}Spectral Fusion Card:{} Fuses 2 diferent selected {C:attention)spectral cards{}"
            }
          },

          mills_fusions_snack = {
            name = "",
            text = {
              "{C:purple, S:1.2}Snack Fusion Card:{} Fuses 2 diferent selected {C:attention)snack cards{}"
            }
          },

          mills_fusions_plan = {
            name = "",
            text = {
              "{C:purple, S:1.2}Planet Fusion Card:{} Fuses 2 diferent selected {C:attention)planet card{}"
            }
          },
          mills_fusions_cred = {
            name = "",
            text = {
              "MOD MADE BY:",
              "{X:legendary,C:white}Artist:{} {C:dark_blue}Rafaelly, Mills-44 and GSFG{}",
              "{X:legendary,C:white}Developer:{} {C:dark_blue}Rafaelly and Mills-44{}",
              "{X:legendary,C:white}Localization:{}",
              "{C:dark_blue}Rafaelly(Portuguese[WIP] & english) and Mills-44(English){}"
              
            }
          },
        },
        Voucher={
          v_mills_snack_merchant = {
            name = "Snack Merchant",
            text = {
              "{C:attention}Snack{} cards appear 2X more frequently in the shop"
            },
          },
          v_mills_snack_tycoon = {
            name = "Snack Tycoon",
            text = {
              "{C:attention}Snack{} cards appear 4X more frequently in the shop"
            },
          },
        },
    misc = {
        achievement_descriptions={},
        achievement_names={},
        blind_states={},
        challenge_names={},
        collabs={},
        dictionary={
            k_mills_snack_pack = "Snack Pack",
           -- b_mills_snack_pack = "Snack",
            mills_flayfluff = "Makes Flayfluff!",
            mills_not_valid_fusion = "No Valid Combos",
            mills_unknwown_fusion = "Unknown Combo",
	    -- menus
           k_mills_instruction_cred = "Credits!",
           k_mills_instruction_glob = "Fusing Global!",
           k_mills_instruction_mod = "Fusing Mods!",
           k_mills_instruction_cons = "Fusing Consume!",

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
}

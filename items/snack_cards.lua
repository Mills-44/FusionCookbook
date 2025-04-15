
-- To Combine and Make Sandwhich Jokers
local sandwich_recipes = {
    ['wonkas_chocolate_bar+barry_b'] = 'everlasting_pollenstopper',
    ['nutty_buddy+jammin_jelly'] = 'mrpb_and_jelly',
    ['nutty_buddy+wonkas_chocolate_bar'] = 'golden_crunch',
    ['stay_puft+barry_b'] = 'flayfluff_sub',
    ['stay_puft+jammin_jelly'] = 'goopwhich'
}

local function get_recipe_key(j1, j2)
    local key1, key2 = j1.config.center.key, j2.config.center.key
    local recipe_key = sandwich_recipes[key1 .. '+' .. key2] or sandwich_recipes[key2 .. '+' .. key1]
    return recipe_key
end

-- Bread card to make sandwhiches
local slice_of_bread = {
    key = 'slice_of_bread',
    loc_txt = {
        name = 'Slice Of Bread',
        text = { 
            "Combine {C:attention}2 Compatible Jokers{} into",
            "a {C:attention}Sandwich Joker{}"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true,
    booster_pack = 'snack_packs',
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local selected = G.SELECTED_CARDS
                if #selected == 2 and selected[1].area == G.jokers and selected[2].area == G.jokers then
                    local j1, j2 = selected[1], selected[2]
                    if j1.ability.sandwichable and j2.ability.sandwichable then
                        local new_key = get_recipe_key(j1, j2)
                        if new_key then
                            local new_joker = create_card('Joker', G.jokers, new_key, 1, nil, nil)
                            j1:remove()
                            j2:remove()
                            play_sound('tasty1')
                            G.hand_text:add({text = 'Scrumptious!', scale = 1.2, color = G.C.MONEY})
                        else
                            G.hand_text:add({text = 'That Ain\'t a Sandwhich!', scale = 1, color = G.C.RED})
                        end
                    else
                        G.hand_text:add({text = 'Incompatible Jokers!', scale = 1, color = G.C.RED})
                    end
                else
                    G.hand_text:add({text = 'Select 2 Jokers', scale = 1, color = G.C.RED})
                end
                return true
            end
        }))
    end
}

local cream_puff = {
    key = 'cream_puff',
    loc_txt = {
        name = "Cream Puff",
        text = {
            "Boosts all {C:attention}Sweet Jokers{} by {C:enhancement}+20%{} stats",
            "{C:inactive}(Chips, Mult, XMult, etc)"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true, 
    unlocked = true,
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local count = 0
                for _, j in ipairs(G.jokers.cards) do
                    if j.ability and j.ability.tags and j.ability.tags.sweet then
                        j.ability.perma_bonus = j.ability.perma_bonus or {}
                        local bonus = j.ability.perma_bonus
                        bonus.mult = math.floor((bonus.mult or 0) * 1.2 + 0.5)
                        bonus.x_mult = math.floor((bonus.x_mult or 0) * 1.2 + 0.5)
                        bonus.chips = math.floor((bonus.chips or 0) * 1.2 + 0.5)
                        j:juice_up(0.5)
                        count = count + 1
                    end
                end
                if count > 0 then
                    play_sound('tasty1')
                    G.hand_text:add({text = 'Sweet Boost!', scale = 1.2, color = G.C.MULT})
                else
                    G.hand_text:add({text = 'No Sweet Jokers!', scale = 1.0, color = G.C.RED})
                end
                return true
            end
        }))
    end
}

local homeys_doney = {
    key = 'homeys_doney',
    loc_txt = {
        name = "Homey\'s Doney",
        text = {
            "{C:green} 1 in 2{} chance to get +1 Discard or,",
            "{C:green} 1 in 2{} chance to get +1 Hand"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true, 
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local buff_type = pseudorandom('homeys_doney', 2)
                if buff_type == 1 then
                    G.consumeables.discards = G.consumeables.discards + 1
                    G.hand_text:add({text = '+1 Discard!', scale = 1.2, color = G.C.CHIP})
                else
                    G.consumeables.hands = G.consumeables.hands + 1
                    G.hand_text:add({text = '+1 Hand!', scale = 1.2, color = G.C.MULT})
                end
                play_sound('tasty1')
                return true
            end
        }))
    end
}

local butterscotch = {
    key = 'butterscotch',
    loc_txt = {
        name = "Butterscotch",
        text = {
            "Gains {X:mult,C:white}X0.5{} for each {C:attention}Sweets Joker{},",
            "and multiplies money by total result",
            "{C:inactive}Starts on {X:mult,C:white}1x"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true,
    booster_pack = 'snack_pack',
    use = function(self, card)
    end
}

local bubblegum = {
    key = 'bubblegum',
    loc_txt = {
        name = "Bubblegum",
        text = {
            "Gives {C:money}$2{} per {C:gold}Gold Card{}",
            "in your deck"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true,
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local gold_count = 0
                for _, j in ipairs(G.jokers.cards) do
                    if c.edition and c.edition.etype == 'gold' then
                        gold_count = gold_count + 1
                    end
                end
                local reward = gold_count * 2
                G.GAME.dollar = G.GAME.dollar + reward
                play_sound('money')
                G.hand_text:add({
                    text = 'Bubblicious!',
                    colour = G.C.MONEY,
                    scale = 1.2
                })
                return true
            end
        }))
    end
}

local kinder_egg = {
    key = 'kinder_egg',
    loc_txt = {
        name = "Kinder Egg",
        text = {
            "Create one random Sweets Joker"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true,
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
        blocking = true,
        func = function ()
            local sweets_jokers = {
                'wonkas_chocolate_bar',
                'nutty_buddy',
                'stay_puft',
                'barry_b',
                'jammin_jelly',
                'apple_of_jacks_eye',
                'gummibar',
                'koolaid_man'
            }

            local chosen_key = pseudorandom_element(sweets_jokers)
            local new_joker = create_card('Joker', G.jokers, chosen_key, 1, nil, nil)
            G.jokers:emplace(new_joker)

            play_sound('tasty2')
            G.hand_text:add({
                text = 'Sweet!',
                scale = 1.3,
                color = G.C.GREEN
            })
            return true
        end
        }))
    end
}

local rye_chip = {
    key = 'rye_chip',
    loc_txt = {
        name = "Rye Chip",
        text = {
            "Create 2 random Snack Cards"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true,
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true, 
            func = function()
                local snack_cards = {
                    'slice_of_bread',
                    'cream_puff',
                    'homeys_doney',
                    'butterscotch',
                    'bubblegum',
                    'kinder_egg'
                }
                for i = 1, 2 do
                    local key = pseudorandom_element(snack_card_keys)
                    local snack = create_card('Consumable', G.consumeables, key, 1, nil, nil)
                    G.consumeables:emplace(snack)
                end
                play_sound('tasty1')
                G.hand_text:add({
                    text = "Snack Time!",
                    color = G.C.GOLD,
                    scale = 1.2
                })

                return true
            end
        }))
    end
}

local biscoff = {
    key = 'biscoff'
    loc_txt = {
        name = 'Biscoff',
        text = "{Choose 2 cards to turn into Candisimo Cards"
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true, 
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.STATE_ARGS.selecting_card = true
        G:select_cards({
            amount = 2,
            prompt = 'Select 2 cards to become Candisimo',
            must_have = true,
            filter = function(c)
                return c.area == G.hand
            end,
            callback = function(selected)
                for _, c in ipairs(selected) do
                    c:set_edition({candisimo = true})
                    c:juice_up(0.5)
                end
                play_sound('holo1')
                G.hand_text:add({
                    text = "Sweetened!",
                    scale = 1.3,
                    color = G.C.FILTER
                })
            end
        })
        return true
    end
}

local pretzel = {
    key = 'pretzel',
    loc_txt = {
        name = 'Pretzel',
        text = "Select 1 card to become a Cookiesimo Card"
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true, 
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.STATE_ARGS.selecting_card = true
        G:select_cards({
            amount = 1,
            prompt = 'Select 1 card to become a Cookiesimo Card',
            must_have = true,
            filter = function(c)
                return c.area == G.hand
            end,
            callback = function(selected)
                for _, c in ipairs(selected) do
                    c:set_edition({cookiesimo = true})
                    c:juice_up(0.5)
                end
                play_sound('holo1')
                G.hand_text:add({
                    text = "Salty!",
                    scale = 1.3,
                    color = G.C.FILTER
                })
            end
        })
        return true
    end
}


return {slice_of_bread, cream_puff, homeys_doney, butterscotch, bubblegum, kinder_egg, rye_chip, biscoff, preztel}

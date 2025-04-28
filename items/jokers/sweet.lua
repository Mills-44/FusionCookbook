register_joker_to_pool("Sweet", "wonkas_chocolate_bar")
register_joker_to_pool("Sweet", "barry_b")
register_joker_to_pool("Sweet", "gummibar")
register_joker_to_pool("Sweet", "jammin_jelly")
register_joker_to_pool("Sweet", "koolaid_man")
register_joker_to_pool("Sweet", "nutty_buddy")
register_joker_to_pool("Sweet", "peppermint_butler")
register_joker_to_pool("Sweet", "stay_puft")
register_joker_to_pool("Sweet", "honey_nut_cheerios")
register_joker_to_pool("Sweet", "apple_of_jacks_eye")
SMODS.Joker {
    object_type = "Joker",
    name = "mills-wonkas_chocolate_bar",
    key = "wonkas_chocolate_bar",
    config = {
        joker_type = "Sweet"
    },
    rarity = 2,
    atlas = 'wonkas_chocolate_bar',
    pos = {
        x = 0,
        y = 0
    },
    cost = 6, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        -- Trigger only once for the whole hand (context.before)
        if context.before and (context.scoring_name == 'Two Pair' or context.scoring_name == 'Full House'  ) and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                -- Schedule the change as an event so it's done safely
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('mills_wonka')
                        -- Set edition to Lucky
                        c:set_ability('m_lucky')
                        -- Optional visual feedback
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end  
            return {
                message = "Dandy!",
                colour = G.C.MONEY
            }
        end
    end    
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-barry_b",
    key = "barry_b",
    config = {
        joker_type = "Sweet"
    },
    rarity = 2,
    atlas = 'barry_b',
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        -- Trigger only once for the whole hand (context.before)
        if context.before and context.scoring_name == 'Four of a Kind' and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                -- Schedule the change as an event so it's done safely
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('mills_jazz')
                        -- Set edition to Lucky
                        c:set_ability('m_glass')
                        -- Optional visual feedback
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end  
            return {
                message = "Jazz?",
                colour = G.C.FILTER
            }
        end
    end    
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-apple_of_jacks_eye",
    key = "apple_of_jacks_eye",
    config = {
        joker_type = "Sweet"
    },
    atlas = 'apple_of_jacks_eye',
    pos = {
        x = 0,
        y = 0
    },        
    cost = 5,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.main_scoring and context.cardarea == G.play then
            local counts = {}
            for _, played in ipairs(context.scoring_hand) do
                if     played:is_suit("Hearts",  true) then counts.Hearts  = counts.Hearts  + 1
                elseif played:is_suit("Diamonds",true) then counts.Diamonds= counts.Diamonds+ 1
                elseif played:is_suit("Clubs",   true) then counts.Clubs   = counts.Clubs   + 1
                elseif played:is_suit("Spades",  true) then counts.Spades  = counts.Spades  + 1
                end      
            -- 3) look for any suit with 3+ cards
            for suitName, ct in pairs(counts) do
                if ct >= 3 then
                    local available_snacks = {
                        "c_mills_biscoff", 
                        "c_mills_butterscotch", 
                        "c_mills_kinder_egg",
                        "c_mills_pretzel",
                        "c_mills_cream_puff",
                        "c_mills_bubblegum",
                        "c_mills_homeys_doney"
                    }
                    
                    local function simple_shuffle(t)
                        for i = #t, 1, -1 do
                            local j = love.math.random(i)
                            t[i], t[j] = t[j], t[i]
                        end
                    end
                    simple_shuffle(available_snacks)
            
                    for i = 1, 1 do
                        if #available_snacks > 0 then
                            local snack_key = table.remove(available_snacks)
                            suitName = SMODS.add_card {
                                set = 'Snack',
                                area = G.consumeables,
                                key = snack_key
                            }
                            if suitName then
                                suitName:juice_up(0.4, 0.4)
                            end
                            
                        end
                    end
                end
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                play_sound('mills_jack')
                return true
            end
        }))
        end
    end
end
}    
SMODS.Joker {
    object_type = "Joker",
    name = "mills-honey_nut_cheerios",
    key = "honey_nut_cheerios",
    config = {
        joker_type = "Sweet"
    },
    atlas = 'honey_nut_cheerios',
    pos = {
        x = 0,
        y = 0
    },
    cost = 6,
    rarity = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { }
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                if c:is_suit('Spades') then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('mills_honey')
                            c:set_ability('m_gold')
                            c:juice_up(0.4, 0.4)
                            return true
                        end
                    }))
                end
            end
            return {
                message = "Delicious!",
                colour = G.C.GOLD
            }
        end
    end
} 
SMODS.Joker {
    object_type = "Joker",
    name = "mills-nutty_buddy",
    key = "nutty_buddy",
    config = {
        joker_type = "Sweet"
    },
    rarity = 1,
    atlas = 'nutty_buddy',
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            local rank_counts = {}
            for _, c in ipairs(context.scoring_hand) do
                local v = c.base.value
                rank_counts[v] = (rank_counts[v] or 0) + 1
            end

            local has_pair = false
            for _, count in pairs(rank_counts) do
                if count == 2 then
                    has_pair = true
                    break
                end
            end
    
            if has_pair then
                for _, c in ipairs(context.scoring_hand) do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('mills_nutty')
                            c:set_ability('m_bonus')
                            c:juice_up(0.4, 0.4)
                            return true
                        end
                    }))
                end
                return {
                    message = "Nutty!",
                    colour = G.C.CHIPS
                }
            end
        end
    end     
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-stay_puft",
    key = "stay_puft",
    config = {
        joker_type = "Sweet"
    },
    rarity = 1,
    atlas = 'stay_puft',
    pos = {
        x = 0,
        y = 0
    },
    cost = 5, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        -- Trigger only once for the whole hand (context.before)
        if context.before and context.scoring_name == 'Straight' and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                -- Schedule the change as an event so it's done safely
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('mills_puft')
                        if math.random() < .5 then
                        c:set_ability('m_steel')
                        else
                        c:set_ability('m_wild')
                        end
                        -- Optional visual feedback
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
            return {
                message = "Squish!",
                colour = G.C.WHITE
            }
        end
    end    
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-peppermint_butler",
    key = "peppermint_butler",
    config = {
        joker_type = "Sweet",
        extra = {
            gain = 5,
            chips = 0
        }, 
    }, 
    atlas = 'peppermint_butler',
    pos = {
        x = 0, 
        y = 0 
    }, 
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.gain or 5,
                card.ability.extra.chips or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
            return {
                chips = card.ability.extra.chips or 0
            }
        end

        if context.before and context.full_hand then
            local rank_counts = {}
            for _, c in ipairs(context.full_hand) do
                local v = c.base.value
                rank_counts[v] = (rank_counts[v] or 0) + 1
            end

            local has_pair = false
            for _, count in pairs(rank_counts) do
                if count == 2 then
                    has_pair = true
                    break
                end
            end

            if has_pair then
                card.ability.extra.chips = (card.ability.extra.chips or 0) + (card.ability.extra.gain or 5)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('mills_minty')
                        return true
                    end
                }))
                return {
                    message = "Minty!",
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-gummibar",
    key = "gummibar",
    config = {
        joker_type = "Sweet",
        extra = {
            gain = 3,
            mult = 0
        }
    }, 
    atlas = 'gummibar',
    pos = {
        x = 0, 
        y = 0 
    },
    cost = 5,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.gain or 3,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.before and context.scoring_name == "Straight" then
            card.ability.extra.mult = (card.ability.extra.mult or 0) + card.ability.extra.gain
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_gummy')
                    return true
                end
            }))
            return {
                message = "Beba bi duba duba yum yum!",
                colour = G.C.MULT,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-jammin_jelly",
    key = "jammin_jelly",
    config = {
        joker_type = "Sweet"
    },
    rarity = 2,
    atlas = 'jammin_jelly',
    pos = {
        x = 0,
        y = 0
    },  
    cost = 6,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            local rank_counts = {}
    
            -- Count how many of each rank
            for _, c in ipairs(context.scoring_hand) do
                if c.base and c.base.id then
                    rank_counts[c.base.id] = (rank_counts[c.base.id] or 0) + 1
                end
            end
    
            -- Check if any rank hits 3, 4, or 5
            local has_matching_group = false
            for _, count in pairs(rank_counts) do
                if count == 3 or count == 4 or count == 5 then
                    has_matching_group = true
                    break
                end
            end
    
            if has_matching_group then
                for _, c in ipairs(context.scoring_hand) do
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('mills_jam')
                            if G.P_CENTERS['m_mult'] then
                                c:set_ability(G.P_CENTERS['m_mult'], true, nil)
                                c:juice_up(0.4, 0.4)
                            else
                                print("[ERROR] m_mult modifier not found!")
                            end
                            return true
                        end
                    }))
                end
                return {
                    message = "Groovy!",
                    colour = G.C.RED
                }
            end
        end
    end 
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-koolaid_man",
    key = "koolaid_man",
    config = {
        joker_type = "Sweet",
        money = 3
    },
    rarity = 2,
    atlas = 'koolaid_man',
    pos = {
        x = 0,
        y = 0
    }, 
    cost = 7,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                self.config.money or 0 
            }
        }
    end,
    calculate = function(self, card, context)
        local valid_hands = {
            ['Three of a Kind'] = true,
            ['Full House'] = true,
            ['Four of a Kind'] = true,
            ['Five of a Kind'] = true
        }

        if context.before and valid_hands[context.scoring_name] and context.scoring_hand then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_koolaid')
                    return true
                end
            }))
            return {
                dollars = self.config.money,
                message = "Oh Yeah!",
                colour = G.C.MONEY
            }
        end
    end
}    

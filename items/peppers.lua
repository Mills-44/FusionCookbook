SMODS.Joker {
    object_type = "Joker",
    name = "mills-pimento_pepper",
    key = "pimento_pepper",
    config = {
        extra = {
            gain = 3,
            mult = 0
        },
        levels = 0
    },
    atlas = 'pepper_jokers',
    pos = { 
        x = 0, 
        y = 0 
    },
    soul_pos = { 
        x = 0, 
        y = 1 
    },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
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
        if context.joker_main and not (context.before or context.after) then
            return {
                mult = card.ability.extra.mult,
            }
        end
    
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.gain or 3)
            card.ability.levels = (card.ability.levels or 0) + 1
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_tangy')
                    return true
                end
            }))
    
            if card.ability.levels >= 3 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                play_sound('mills_sayonara')
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_anaheim_chile'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
            return {
                message = 'Tangy!',
                colour = G.C.GREEN,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-anaheim_chile",
    key = "anaheim_chile",
    atlas = 'pepper_jokers',
    config = {
        extra = {
            gain = 5,
            mult = 0
        },
        levels = 0
    },
    pos = { 
        x = 1,
        y = 0 },
    soul_pos = { 
        x = 1,
        y = 1 
    },
    in_pool = function(self, args)
        return false
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain or 5,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not (context.before or context.after) then
            return {
                mult = card.ability.extra.mult,
            }
        end
    
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.gain or 5)
            card.ability.levels = (card.ability.levels or 0) + 1
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_piquant')
                    return true
                end
            }))  
            if card.ability.levels >= 3 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                play_sound('mills_bye')
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_jalapeno'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
            return {
                message = 'Piquant!',
                colour = G.C.GREEN,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-jalapeno",
    key = "jalapeno",
    config = {
        joker_type = "Pepper",
        extra = {
            gain = 7,
            mult = 0
        },
        levels = 0
    },
    atlas = 'pepper_jokers',
    pos = { 
        x = 2, 
        y = 0 },
    soul_pos = { 
        x = 2, 
        y = 1 
    },
    in_pool = function(self, args)
        return false
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain or 7,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not (context.before or context.after) then
            return {
                mult = card.ability.extra.mult,
            }
        end
    
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.gain or 7)
            card.ability.levels = (card.ability.levels or 0) + 1
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_spicy')
                    return true
                end
            }))
    
            if card.ability.levels >= 3 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                play_sound('mills_adios')
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_cayenne'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
            return {
                message = 'Spicy!',
                colour = G.C.RARITY.Uncommon,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-cayenne",
    key = "cayenne",
    config = {
        joker_type = "Pepper",
        extra = {
            gain = 10,
            mult = 0
        },
        levels = 0
    },
    pos = { 
        x = 3, 
        y = 0 
    },
    soul_pos = { 
        x = 3,
        y = 1 
},
    atlas = 'pepper_jokers',
    in_pool = function(self, args)
        return false
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain or 10,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not (context.before or context.after) then
            return {
                mult = card.ability.extra.mult,
            }
        end
    
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.gain or 10)
            card.ability.levels = (card.ability.levels or 0) + 1
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_sizziling')
                    return true
                end
            }))
    
            if card.ability.levels >= 3 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                play_sound('mills_later')
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_habanero'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
            return {
                message = 'Sizziling!',
                colour = G.C.GOLD,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-habanero",
    key = "habanero",
    config = {
        joker_type = "Pepper",
        extra = {
            gain = 25,
            mult = 0
        },
        levels = 0
    },
    atlas = 'pepper_jokers',
    pos = { 
        x = 4, 
        y = 0 
    },
    soul_pos = {
        x = 4, 
        y = 1 
    },
    rarity = 2,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.gain or 25,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not (context.before or context.after) then
            return {
                mult = card.ability.extra.mult,
            }
        end
    
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.extra.mult = card.ability.extra.mult + (card.ability.extra.gain or 25)
            card.ability.levels = (card.ability.levels or 0) + 1
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_fiery')
                    return true
                end
            }))
    
            if card.ability.levels >= 3 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                play_sound('mills_adios')
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_ghost_pepper'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
            return {
                message = 'Fiery!',
                colour = G.C.FILTER,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-ghost_pepper",
    key = "ghost_pepper",
    config = {
        joker_type = "Pepper",
        extra = {
            mult = 125,
            Xmult = 2
        },
        levels = 0
    },
    atlas = 'pepper_jokers',
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    rarity = 3,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        local total = card.ability.extra.mult + (G.GAME and G.GAME.hands and G.GAME.hands.mult or 1) * (card.ability.extra.Xmult - 1)
        return {
            vars = {
                card.ability.extra.mult or 125,
                math.floor(total)
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
            return {
                message = '+'..(card.ability.extra.mult or 125)..' Mult!',
                colour = G.C.MULT,
                mult_mod = card.ability.extra.mult or 0,

                message2 = 'X'..(card.ability.extra.Xmult or 2)..' Mult!',
                colour2 = G.C.MULT,
                x_mult_mod = (card.ability.extra.Xmult or 2),
            }
        end

        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.levels = (card.ability.levels or 0) + 1

            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_scorching')
                    return true
                end
            }))

            if card.ability.levels >= 5 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                play_sound('mills_sayonara')
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_carolina_reaper'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
            return {
                message = 'Scorching!',
                colour = G.C.MULT,
                card = card
            }
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-carolina_reaper",
    key = "carolina_reaper",
    config = {
        joker_type = "Pepper",
        extra = {
            mult = 150,
            power = 2
        }
    },
    atlas = 'pepper_jokers',
    pos = { 
        x = 6, 
        y = 0 
    },
    soul_pos = {
         x = 6, 
         y = 1 
        },
    rarity = 4,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                125, -- Hardcoded display value
                2,   -- Hardcoded display Xmult
                5    -- Hardcoded number of infernos
            }
            }
        end,
        calculate = function(self, card, context)
            if context.joker_main and not context.before then
                return {
                    message = '+125 Mult!',
                    colour = G.C.MULT,
                    mult_mod = 125,
        
                    message2 = 'X2 Mult!',
                    colour2 = G.C.MULT,
                    x_mult_mod = 2
                }
            end
        if context.after then
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_death')
                    return true
                end
            }))
        end
    end
}
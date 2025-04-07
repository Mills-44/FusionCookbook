
-- ATLAS
SMODS.Atlas {
    key = "pepper_jokers", --For the pepper jokers implemented in mod
    path = "pepper_jokers.png", --image used for peppers
    px = 71, --Sizing of jokers in 1x
    py = 95 --1x y direction
}
-- JOKERS

-- Pepper Jokers
SMODS.Joker {
    key = 'pimento_pepper', -- Level 1 of joker 
    loc_txt = {
        name = 'Pimento Pepper',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!" ,
            "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
            gain = 3,
            mult = 0
        },
        levels = 0 -- To track its leveling
        }, 
    rarity = 1,  -- Common Joker
    atlas = 'pepper_jokers',
    pos = {
        x = 6, 
        y = 0 
    },
    cost = 4,
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
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
        }
        end
        -- To look if flush or full house is played
        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 3 -- Gives the mult +3
            card.ability.levels = (card.ability.levels or 0) + 1 --Gains one level
            local result = {
                message = 'Tangy!',
                colour = G.C.MULT, -- Red Text
                card = card
            }
            if card.ability.levels >= 2 then
                card.ability.levels = 0
                --Flags new version
                card.ability.evolve_to = "j_mills_anaheim_chile"
            end
                return result
        end
            -- Loop used for creating new card and to delete previous joker 
        if context.after and card.ability.evolve_to then
        local evolve_key = card.ability.evolve_to
        card.ability.evolve_to = nil
        SMODS.add_card({key = evolve_key})
            local cards= G.jokers.cards
            local new_card = cards[#cards]
            if new_card then  
                new_card.ability.extra.mult = card.ability.extra.mult or 0
                new_card.ability.levels = 0
            end 
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                    G.jokers:remove_card(card) --Previous Joker deletes
                    card:remove()
                    card = nil
                    return true; 
                end
            })) 
            return true
        end
        })) 
        return {
            message = "Sayonara!",--Message displayed as joker leaves
            colour = G.C.CHIPS --Blue Text
            }     
        end
    end
}
    -- Not Finished yet with the implemented level system on card 
        --set_badges = function(self, card, badges)
            --table.insert(badges, create_badge(
            --    tostring(card.ability.levels or 0),
            --    G.C.MULT,
            --    G.C.UI.TEXT_LIGHT,
           --     1.0
          --  ))
        --    return badges

SMODS.Joker {
    key = 'anaheim_chile', -- Level 2 of Pepper Joker 
    loc_txt = {
        name = 'Anaheim Chile',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {extra = {
        gain = 5,
        mult = 0
       }, 
    levels = 0
       }, 
    atlas = 'pepper_jokers',
    pos = {x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
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
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
          }
        end
        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 5
            card.ability.levels = (card.ability.levels or 0) + 1
            local result = {
                message = 'Piquant!',
                colour = G.C.MULT,
                card = card
            }
            if card.ability.levels >= 2 then
                card.ability.levels = 0
                -- Flags new version
                card.ability.evolve_to = "j_mills_jalapeno"
            end
                return result
        end
            if context.after and card.ability.evolve_to then
                local evolve_key = card.ability.evolve_to
                card.ability.evolve_to = nil

                SMODS.add_card({key = evolve_key})
                local cards = G.jokers.cards
                local new_card = cards[#cards]
            if new_card then
                new_card.ability.extra.mult = card.ability.extra.mult or 0
                new_card.ability.levels = 0    
            end
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    card = nil
                    return true; 
                end
                })) 
                return true
            end
            })) 
            return {
                message = "Buh-Bye!",
                colour = G.C.CHIPS
                }     
        end
    end
}

SMODS.Joker {
    key = 'jalapeno', -- Level 3 of the pepper joker 
    loc_txt = {
        name = 'Jalapeno',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
        gain = 7,    
        mult = 0
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 1, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
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
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
          }
        end
        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 7
            card.ability.levels = (card.ability.levels or 0) + 1
            local result = {
                message = 'Spicy!',
                colour = G.C.MULT,
                card = card
            }
            if card.ability.levels >= 2 then
                card.ability.levels = 0       
                card.ability.evolve_to = "j_mills_cayenne"
            end
            return result
        end
            if context.after and card.ability.evolve_to then
                local evolve_key = card.ability.evolve_to
                card.ability.evolve_to = nil
                SMODS.add_card({key = evolve_key})
                local cards= G.jokers.cards
                local new_card = cards[#cards]
            if new_card then  
                new_card.ability.extra.mult = card.ability.extra.mult or 0
                new_card.ability.levels = 0
            end 
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                    G.jokers:remove_card(card)
                    card:remove()
                    card = nil
                    return true; 
                end
                })) 
            return true
        end
        })) 
        return {
            message = "Adios!",
            colour = G.C.CHIPS
            }     
        end
    end
}

SMODS.Joker {
    key = 'cayenne', -- Level 4 of pepper joker 
    loc_txt = {
        name = 'Cayenne',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
            gain = 10,
            mult = 0
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 2, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
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
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 10
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Fiery!',
                colour = G.C.MULT,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                  --Flags new version
                card.ability.evolve_to = "j_mills_habanero"
            end
                return result
            end
            if context.after and card.ability.evolve_to then
                local evolve_key = card.ability.evolve_to
                card.ability.evolve_to = nil
                SMODS.add_card({key = evolve_key})
                local cards= G.jokers.cards
                local new_card = cards[#cards]
                if new_card then  
                    new_card.ability.extra.mult = card.ability.extra.mult or 0
                    new_card.ability.levels = 0
                end 
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                    func = function()
                        G.jokers:remove_card(card)
                        card:remove()
                        card = nil
                        return true; 
                    end
                    })) 
                return true
            end
            })) 
            return {
                message = "Later!",
                colour = G.C.CHIPS
                }     
        end
    end
  }

SMODS.Joker {
    key = 'habanero', -- Level 5 of pepper joker
    loc_txt = {
        name = 'Habanero',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
            gain = 25,
            mult = 0
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 3, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.gain or 25,
                card.ability.extra.gain or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            card = card
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 25
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Sizziling!',
                colour = G.C.MULT,
                card = card
            }
            if card.ability.levels >= 2 then
                card.ability.levels = 0
                 --Flags new version
                card.ability.evolve_to = "j_mills_ghost_pepper"
                end
                    return result
                end
                if context.after and card.ability.evolve_to then
                    local evolve_key = card.ability.evolve_to
                    card.ability.evolve_to = nil
                    SMODS.add_card({key = evolve_key})
                    local cards= G.jokers.cards
                    local new_card = cards[#cards]
                    if new_card then  
                        new_card.ability.extra.mult = card.ability.extra.mult or 0
                        new_card.ability.levels = 0
                    end  
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            play_sound('tarot1')
                            card.T.r = -0.2
                            card:juice_up(0.3, 0.4)
                            card.states.drag.is = true
                            card.children.center.pinch.x = true
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                        func = function()
                            G.jokers:remove_card(card)
                            card:remove()
                            card = nil
                            return true; 
                        end
                        })) 
                        return true
                    end
                    })) 
                    return {
                        message = "Adios!",
                        colour = G.C.CHIPS
                    }     
                end
        end
    }

SMODS.Joker {
    key = 'ghost_pepper',
    loc_txt = {
        name = 'Ghost Pepper',
        text = {
           "Adds {C:mult}+100{} Mult and doubles your current Mult on {C:attention}Flush{} or {C:attention}Full House{}.",
            "Levels up after {C:attention}3{} infernos.",
            "Every {C:attention}2nd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
            gain = 100,
            mult = 0
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 4, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.gain or 100,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
                card = card
            }
        end
    
        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.levels = (card.ability.levels or 0) + 1
    
            local base_mult = G.GAME.round_reserve.mult
            local final_mult = (base_mult * 2) + 100
    
            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_mult(self, base_mult, final_mult, 0.5, 'easeOutCubic')
                    G.GAME.round_reserve.mult = final_mult
                    return true
                end
            }))
    
            local result = {
                message = 'Scorching!',
                colour = G.C.XMULT,
                card = card
            }
    
            if card.ability.levels >= 2 then
                card.ability.levels = 0
               --Flags new version
               card.ability.evolve_to = "j_mills_carolina_reaper"
            end
                return result
        end
            -- Loop used for creating new card and to delete previous joker 
        if context.after and card.ability.evolve_to then
        local evolve_key = card.ability.evolve_to
        card.ability.evolve_to = nil
        SMODS.add_card({key = evolve_key})
            local cards= G.jokers.cards
            local new_card = cards[#cards]
            if new_card then  
                new_card.ability.extra.mult = card.ability.extra.mult or 0
                new_card.ability.levels = 0
            end 
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    card.states.drag.is = true
                    card.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                    G.jokers:remove_card(card) --Previous Joker deletes
                    card:remove()
                    card = nil
                    return true; 
                end
            })) 
            return true
        end
        })) 
        return {
            message = "Ciao!",--Message displayed as joker leaves
            colour = G.C.CHIPS --Blue Text
            }     
        end
    end
}

SMODS.Joker {
    key = 'carolina_reaper',
    loc_txt = {
        name = 'Carolina Reaper',
        text = {
           "Applies {C:xmult}^2{} Mult to your total Mult each hand.",
           "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 5, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = {"^2"} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            message = "^2",
            colour = G.C.XMULT,
            card = card
          }
        end

        if context.before then
            local base_mult = G.GAME.round_reserve.mult
            local final_mult = math.max(0, base_mult ^ 2)

            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_mult(self, base_mult, final_mult, 0.5, 'easeOutCubic')
                    G.GAME.round_reserve.mult = final_mult
                    return true
                end
            }))
            
            local result = {
                message = ' Death -_- ',
                colour = G.C.XMULT,
                card = card
            }
        end
    end
}

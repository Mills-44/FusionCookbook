return {
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
    unlocked = false,
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
            local base_mult = (G.GAME.round_reserve and G.GAME.round_reserve.mult) or 0
            local final_mult = (base_mult * 2) + 100
            G.E_MANAGER:add_event(Event({
                func = function()
                    if not G.GAME.round_reserve then
                        G.GAME.round_reserve = { mult = 0 }
                    end
                    ease_variable(G.GAME.round_reserve, 'mult', base_mult, final_mult, 0.5, 'easeOutCubic')
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

return {
    key = 'ghost_pepper',
    loc_txt = {
        name = 'Ghost Pepper',
        text = {
           "Gives {C:mult}+100{} Mult and doubles your current Mult,",
            "On {C:attention}Flush{} or {C:attention}Full Houses{} Level up and after {C:attention}5{} infernos.",
            "The {C:attention}5th{} level activates Pain!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}",
             "{X:gold,C:blue} Art By gfsg "
        }
    },
    config = {
        extra = {
            mult = 100,
            Xmult = 2
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {
        x = 5, 
        y = 0 
    },
    soul_pos = {
        x = 5, 
        y = 1
    },
    rarity = 3,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        local total = card.ability.extra.mult + (G.GAME and G.GAME.hands and G.GAME.hands.mult or 1) * (card.ability.extra.Xmult - 1)
        return { 
            vars = {
                card.ability.extra.mult or 100,
                math.floor(total)
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
            return {
                message = '+100 Mult!',
                colour = G.C.MULT,
                mult_mod = card.ability.extra.mult or 0,
            }
        end
        return { 
            message = '+X2 Mult!',
            colour = G.C.MULT,
            Xmult_mod = card.ability.extra.Xmult or 0
        }
        local in_pool = function(self, args)
            return false
        end 
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.levels = (card.ability.levels or 0) + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_scorching')
                    return true
                end
            }))
            local result = {
                message = 'Scorching!',
                colour = G.C.MULT,
                card = card
            }
            if card.ability.levels >= 5 then
                card.ability.levels = 0
                  --Flags new version
                card.ability.evolve_to = "j_mills_carolina_reaper"
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
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_adios')
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

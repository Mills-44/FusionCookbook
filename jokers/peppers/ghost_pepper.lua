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
            mult = 100,
            Xmult = 2
        }, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 4, y = 0 },
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
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
        if context.joker_main then
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult } },
                Xmult_mod = card.ability.extra.Xmult,
                mult_mod = card.ability.extra.mult
            }
        end   
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.levels = (card.ability.levels or 0) + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('tarot1')
                    card.T.r = -0.2
                    card:juice_up(0.3, 0.4)
                    return true
                end
            }))
            end
        end
            }
    

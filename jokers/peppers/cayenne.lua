return {
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
    unlocked = false,
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

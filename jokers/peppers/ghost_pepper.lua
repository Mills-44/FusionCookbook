return {
    key = 'pimento_pepper', -- Level 1 of joker 
    loc_txt = {
        name = 'Pimento Pepper',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} scored",
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
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
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

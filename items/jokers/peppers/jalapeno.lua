SMODS.Joker {
    key = 'jalapeno',
    config = {
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
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_txt = {
        name = 'Jalapeno',
        text = {
            "{C:attention}When a Flush{} or Full House is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}3rd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}",
            "{X:gold,C:blue} Art By: gfsg "
        }
    },
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
            card.ability.extra.mult = card.ability.extra.mult + 7
            card.ability.levels = (card.ability.levels or 0) + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_spicy')
                    return true
                end
            }))
            local result = {
                message = 'Spicy!',
                colour = G.C.MULT,
                card = card
            }
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
        end
    end
}
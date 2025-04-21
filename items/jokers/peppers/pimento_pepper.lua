SMODS.Joker {
    key = 'pimento_pepper',
    config = {
        extra = {
            gain = 3,
            mult = 0
        },
        levels = 0
    },
    atlas = 'pepper_jokers',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 0, y = 1 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,

    loc_txt = {
        name = 'Pimento Pepper',
        text = {
            "When a {C:attention}Flush{} or {C:attention}Full{} House is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}3rd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}",
            "{X:gold,C:blue} Art By gfsg "
        }
    },

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
            card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
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
                colour = G.C.MULT,
                card = card
            }
        end
    end
}

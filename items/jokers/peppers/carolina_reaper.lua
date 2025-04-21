SMODS.Joker {
    key = 'carolina_reaper',
    config = {
        extra = {
            mult = 100,
            power = 2
        }
    },
    atlas = 'pepper_jokers',
    pos = { 
        x = 6, 
        y = 0 },
    soul_pos = {
         x = 6, 
         y = 1 },
    rarity = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_txt = {
        name = 'Anaheim Chile',
        text = {
            "When any hand scores, this Joker gives {C:mult}+#1#{} Mult",
            "Every {C:attention}3rd{} activation levels up Spicyness!",
            "{C:inactive}Total Mult: {C:dark_edition}+#2#{}",
            "{X:gold,C:blue} Art By gfsg "
        }
    },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {
                center.ability.extra.mult,
                center.ability.extra.power
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then  
            return {
                message = '+150 Mult!',
                colour = G.C.MULT,
                mult_mod = card.ability.extra.mult,
                message2 = '^2 Mult!',
                colour2 = G.C.DARK_EDITION
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

  
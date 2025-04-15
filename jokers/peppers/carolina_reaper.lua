return {
    key = 'carolina_reaper',
    loc_txt = {
        name = 'Carolina Reaper',
        text = {
            "Applies {C:mult}+100{} to total Mult, then {C:dark_edition}^2{} that value.",
            "{X:gold,C:blue} Art by gfsg"
        }
    },
    config = {
        extra = {
            mult = 100,
            power = 2
        }
    },
    atlas = 'pepper_jokers',
    pos = { x = 6, y = 0 },
    soul_pos = { x = 6, y = 1 },
    rarity = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
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
                message = '+100 Mult!',
                colour = G.C.MULT,
                mult_mod = card.ability.extra.mult,
            }
        end
            return{
                message = '^2 Mult!',
                colour = G.C.DARK_EDITION,
                Emult_mod = card.ability.extra.power
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
return {
    key = 'carolina_reaper',
    loc_txt = {
        name = 'Carolina Reaper',
        text = {
           "Applies {C:xmult}^2{} Mult to your total Mult each hand.",
           "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {}, 
        levels = 0
    }, 
    atlas = 'pepper_jokers',
    pos = {x = 5, y = 0 },
    unlocked = false,
    discovered = false,
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

SMODS.Enhancement {
    key = "sapph",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 0
    },
    config = {
        extra = {
            x_chips = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.x_chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.hand then
           return {
            x_chips = card.ability.extra.x_chips
        }
        end
end
}
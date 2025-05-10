SMODS.Enhancement {
    key = "ruby",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 1
    },
    config = {extra = {x_mult = 2.5}},
    loc_vars = function(self, info_queue, card)
        return { 
            vars={
                card.ability.extra.x_mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.play then
            return {
                x_mult = card.ability.extra.x_mult
            }
         end
    end
}
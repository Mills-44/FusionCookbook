SMODS.Enhancement {
    key = "lots",
    atlas = 'enhanc_fus',
    pos = {
        x = 0, 
        y = 0
    },
    config = {extra = {
        bonus = 80
    }},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus
            }
        }
    end,
    calculate = function(self, card, context)
         if context.cardarea == G.play and context.main_scoring then
            return {
                chips = card.ability.extra.bonus
            }
         end
    end
}
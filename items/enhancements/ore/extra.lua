SMODS.Enhancement {
    key = "extra",
    atlas = 'enhanc_fus',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            bonus = 30, 
            mult = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus, 
                card.ability.extra.mult
        }
    }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
           return {
            chips = card.ability.extra.bonus, 
            mult = card.ability.extra.mult
        }
        end
   end
}
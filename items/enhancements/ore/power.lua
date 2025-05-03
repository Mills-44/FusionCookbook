SMODS.Enhancement {
    key = "power",
    atlas = 'enhanc_fus',
    pos = {
        x = 1,
        y = 1
    },
    config = {extra = {
         mult = 16
        }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={ 
            card.ability.extra.mult 
        }
    }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
           return {
            mult = card.ability.extra.mult
        }
        end
end
}
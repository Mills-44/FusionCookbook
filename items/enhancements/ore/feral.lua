SMODS.Enhancement {
    key = "feral", 
    atlas = 'enhanc_fus',
    pos = {
        x = 2,
        y = 1
    },
    config = {
        extra = {
            mult = 4
        }
    },
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
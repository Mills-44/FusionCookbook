SMODS.Enhancement {
    key = "cinna",
    atlas = 'enhanc_fus',
    pos = {
        x = 5, 
        y = 1
    },
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    config = {
        extra = {
            mult = 6,
            chips = 75
        }
    },
    order = 6,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
         end
    end
}
SMODS.Enhancement {
    key = "cob",
    atlas = 'enhanc_fus',
    pos = {
        x = 5,
        y = 0
    },
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    config = {
        extra = {
            bonus = 120
        }
    },
    order = 4,
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.bonus
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
           return {
            chips = card.ability.extra.bonus,
            card = card
        }
        end
end
}
SMODS.Enhancement {
    key = "untamed", 
    atlas = 'enhanc_fus',
    any_suit = true,
    pos = {
        x = 2,
        y = 0
    },
    config = {extra = {bonus = 30}},
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
            chips = card.ability.extra.bonus
        }
        end
end
}
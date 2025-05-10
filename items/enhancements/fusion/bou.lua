

SMODS.Enhancement {
    key = "bou",
    atlas = 'enhanc_fus', 
    any_rank = true,
    no_suit = true,
    always_scores = true,
    replace_base_card = true,
    pos = {
        x= 5,
        y= 2
    },
    config = {
        extra = {
            chips = 75
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
        }}
    end,
    calculate = function(self, card, context)
        if context.cardarea and context.main_scoring == G.play then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
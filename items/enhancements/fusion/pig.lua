SMODS.Enhancement {
    key = "pig",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y= 2
    },
    any_suit = true,
    no_rank = true,
    config = {
        extra = {
            p_dollars = 0, 
            bonus_dollars = 5
        }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.p_dollars, 
                card.ability.extra.bonus_dollars
            }}
    end,
    calculate = function (self, card, context)
        if context.final_scoring_step and context.cardarea == G.hand then
            card.ability.extra.p_dollars = card.ability.extra.p_dollars + card.ability.extra.bonus_dollars
            end
            if context.cardarea == G.play and context.main_scoring then
                return {
                    dollars = card.ability.extra.p_dollars
                }
            end
            if context.cardarea == G.play and context.main_scoring then
                return { 
                    remove = true 
                }
            end
        end
    }
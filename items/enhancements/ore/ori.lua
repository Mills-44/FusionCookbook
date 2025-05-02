SMODS.Enhancement {
    key = "ori",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y = 0
    },
    config = {extra = {h_dollars = 6}},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
            card.ability.extra.h_dollars, 
            format_ui_value(G.GAME.dollars)or 0
        }
    }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                chips = tonumber(format_ui_value(G.GAME.dollars)) or 0,
                card = card
            }
        end
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
               return {
                dollars = card.ability.extra.h_dollars
            }
            end
        end
}
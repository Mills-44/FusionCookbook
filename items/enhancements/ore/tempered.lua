SMODS.Enhancement {
    key = "tempered",
    atlas = 'enhanc_fus',
    pos = {
        x = 3, 
        y = 0
    },
    config = {
        extra = {
            x_chips = 2, 
            odds = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.x_chips, 
                (G.GAME.probabilities.normal or 1), 
                card.ability.extra.odds}}
end,
calculate = function(self, card, context)
    if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and pseudorandom('glass') < G.GAME.probabilities.normal/card.ability.extra.odds then
        return { 
            remove = true 
        }
    end
        if context.cardarea == G.play and context.main_scoring then
        return {
            x_chips = card.ability.extra.x_chips
        }
        end
    end
}
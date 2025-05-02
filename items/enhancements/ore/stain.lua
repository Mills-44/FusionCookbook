SMODS.Enhancement {
    key = "stain",
    atlas = "enhanc_fus",
    pos = {
        x = 3, 
        y = 2
    },
    any_suit = true,
    config = {
        extra = {
            x_mult = 2.5, 
            odds = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.odds, 
                card.ability.extra.x_mult, 
                (G.GAME.probabilities.normal or 1)
            }
        }
    end,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and pseudorandom("stain") < G.GAME.probabilities.normal / card.ability.extra.odds then
            return { 
                remove = true 
            }
        end
        if context.cardarea == G.play and context.main_scoring then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
    end
}
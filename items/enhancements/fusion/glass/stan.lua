SMODS.Enhancement {
    key = "stan",
    atlas = "enhanc_fus",
    pos = {
        x = 3, 
        y = 2
    },
    any_suit = true,
    config = {
        extra = {
            x_mult = 2.5, 
            odds = 5
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
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
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

-- Grunkle Stunkle wins the Funkle Bunkle
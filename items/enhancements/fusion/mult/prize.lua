SMODS.Enhancement {
    key = "prize",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 1
    },
    config = {
        extra = {
            odd = 5, 
            odds = 15, 
            x_mult = 3, 
            p_dollars = 30
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.x_mult, 
            card.ability.extra.p_dollars, 
            (G.GAME.probabilities.normal or 1), 
            card.ability.extra.odd, card.ability.extra.odds
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
        if context.cardarea == G.play and context.main_scoring then
            local x_mult = 1
            local dol = 0
            if pseudorandom('multodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
                x_mult = card.ability.extra.x_mult
            end
            if pseudorandom('dollarodd') < G.GAME.probabilities.normal / card.ability.extra.odds then
                dol = card.ability.extra.p_dollars
            end
            return {
                x_mult = x_mult,
                dollars = dol
            }
        end
end
}
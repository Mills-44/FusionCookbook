SMODS.Enhancement {
    key = "prize",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 1
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            odd = 5, 
            odds = 15, 
            x_mult = 0,
            x_mult_give = 3,
            p_dollars = 30
        }
    },
    loc_vars = function(self, info_queue, card)
        return { vars = {
            card.ability.extra.x_mult_give, 
            card.ability.extra.p_dollars, 
            (G.GAME.probabilities.normal or 1), 
            card.ability.extra.odd, 
            card.ability.extra.odds
        }
    }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Mult + Lucky", 
        MILLS.COLORS.FUSION, 
        G.C.WHITE, 
        1.0 )
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            local x_mult = 0
            if (pseudorandom('prize_odd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
                x_mult = card.ability.extra.x_mult_give
            end
            if (pseudorandom('prize_odds') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                ease_dollars(30)
            end
            return {
                x_mult = x_mult,
            }
        end
end
}
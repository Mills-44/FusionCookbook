SMODS.Enhancement {
    key = "ir",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 4
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            odds_xmult = 4,
            odds_money = 10,
            x_mult = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.odds_xmult,
                card.ability.extra.odds_money
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Lucky + Steel", 
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
            if (pseudorandom('ir_odds_xmult') < G.GAME.probabilities.normal/card.ability.extra.odds_xmult) then
           return {
            x_mult = card.ability.extra.x_mult
        }
        end
        if (pseudorandom('ir_odds_money') < G.GAME.probabilities.normal/card.ability.extra.odds_xmult) then
            ease_dollars(25)
    end
end
end
}
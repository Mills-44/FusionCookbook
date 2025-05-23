SMODS.Enhancement {
    key = "scratch",
    atlas = 'enhanc_fus',
    any_suit = true,
    pos = {
        x = 7, 
        y = 0
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {
        odd = 4, 
        odds = 8, 
        bonus = 60, 
        p_dollars = 10
    }
},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                (G.GAME.probabilities.normal or 1), 
                card.ability.extra.odd,
                card.ability.extra.bonus,
                (G.GAME.probabilities.normal or 1), 
                card.ability.extra.odds, 
                card.ability.extra.p_dollars, 
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Bonus + Lucky", 
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
            local bonus = 0
            local dol = 0
            if (pseudorandom('scratch_odd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
                bonus = card.ability.extra.bonus
            end
            if (pseudorandom('scratch_odds') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                ease_dollars(10)
            end
            return {
                chips = bonus,
            }
        end
end
}
SMODS.Enhancement {
    key = "seren",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 7
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            odds_mult = 3,
            odds_money = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                (G.GAME.probabilities.normal or 1), 
                card.ability.extra.odds_mult,
                card.ability.extra.odds_money
            }}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Lucky + Lucky", 
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
            if (pseudorandom('seren_odd') < G.GAME.probabilities.normal / card.ability.extra.odd_mult) then
                return {
                    mult = 30
                }
            end
             if (pseudorandom('seren_odd') < G.GAME.probabilities.normal / card.ability.extra.odd_money) then
                ease_dollars(8)
        end
    end
end
}
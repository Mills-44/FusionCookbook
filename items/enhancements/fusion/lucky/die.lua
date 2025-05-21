SMODS.Enhancement {
    key = "die",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 5
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            xmult = 0,
            roll_1 = 6,
            roll_2 = 6,
        }},
    loc_vars = function(self, info_queue, card)
        return { 
            vars={
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.roll_1,
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Lucky + Stone", 
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
            xmult = 0
            if (pseudorandom('die_roll_1') < G.GAME.probabilities.normal / card.ability.extra.roll_1) then
                return {
                xmult = 5
                }
            end
             if (pseudorandom('die_roll_2') < G.GAME.probabilities.normal / card.ability.extra.roll_2) then
               return {
                xmult = -5
                }
            end
    end
end
}
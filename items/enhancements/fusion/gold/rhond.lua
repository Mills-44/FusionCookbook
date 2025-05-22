SMODS.Enhancement {
key = "rhond",
atlas = 'enhanc_fus',
pos = {
    x = 6, 
    y = 1
},
in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
config = {extra = {p_dollars = 25, odds = 10}},
loc_vars = function(self, info_queue, card)
    return { 
        vars = {
            card.ability.extra.p_dollars, 
            (G.GAME.probabilities.normal or 1), 
            card.ability.extra.odds
        }
    }
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Gold + Mult", 
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
        if context.cardarea == G.hand and context.main_scoring then
               return {
                    ease_dollars(2),
                    message = "$5",
                    colour = G.C.GOLD
        }
            end
        if context.cardarea == G.play and context.main_scoring then
            return {
            ease_dollars(5),
            message = "$5",
            colour = G.C.GOLD
        }
    end
    end
}
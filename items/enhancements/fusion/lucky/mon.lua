SMODS.Enhancement {
    key = "mon",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 6
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            odd_low_money = 5,
            odd_high_money = 10
        }},
    loc_vars = function(self, info_queue, card)
        return { 
            vars={
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.odd_low_money,
                card.ability.extra.odd_high_money
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Lucky + Gold", 
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
             if (pseudorandom('money_odd_low_money') < G.GAME.probabilities.normal / card.ability.extra.odd_low_money) then
                ease_dollars(15)
            end
            if (pseudorandom('money_odd_high_money') < G.GAME.probabilities.normal / card.ability.extra.odd_high_money) then
                ease_dollars(20)
            end
            end
    end
}
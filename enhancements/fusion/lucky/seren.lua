SMODS.Enhancement {
    key = "seren",
    atlas = 'enhanc_fus',
    pos = {
        x = 3, 
        y = 0
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            p_dollars = 2, 
            odds = 6
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.p_dollars, 
                (G.GAME.probabilities.normal or 1), 
                card.ability.extra.odds}}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
calculate = function(self, card, context)
    if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and (pseudorandom('glass') < G.GAME.probabilities.normal/card.ability.extra.odds) then
        return { 
            remove = true 
        }
    end
        if context.cardarea == G.play and context.main_scoring then
        return {
            x_chips = card.ability.extra.x_chips
        }
        end
    end
}
SMODS.Enhancement {
    key = "clov",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 2
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = 
        {
        odd = 4, 
        odds = 10, 
        mult = 20, 
        p_dollars = 20
    }},
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult, 
                card.ability.extra.p_dollars, 
                (G.GAME.probabilities.normal or 1), 
                card.ability.extra.odd, card.ability.extra.odds
            }}
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
            local mult = 0
            local dol = 0
            if (pseudorandom('multodd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
                mult = card.ability.extra.mult
            end
            if (pseudorandom('dollarodd') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                dol = card.ability.extra.p_dollars
            end
            return {
                mult = mult,
                dollars = dol
            }
        end
end
}

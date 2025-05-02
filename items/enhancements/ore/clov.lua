SMODS.Enhancement {
    key = "clov",
    atlas = 'enhanc_fus',
    pos = {
        x = 7, 
        y = 2
    },
    config = {
        extra = 
        {
        odd = 4, 
        odds = 8, 
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
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            local mult = 0
            local dol = 0
            if pseudorandom('multodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
                mult = card.ability.extra.mult
            end
            if pseudorandom('dollarodd') < G.GAME.probabilities.normal / card.ability.extra.odds then
                dol = card.ability.extra.p_dollars
            end
            return {
                mult = mult,
                dollars = dol
            }
        end
end
}

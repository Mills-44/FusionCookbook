SMODS.Enhancement {
key = "rhondite",
atlas = 'enhanc_fus',
pos = {
    x = 6, 
    y = 1
},
config = {extra = {p_dollars = 30, odds = 15}},
loc_vars = function(self, info_queue, card)
    return { 
        vars = {
            card.ability.extra.p_dollars, 
            (G.GAME.probabilities.normal or 1), 
            card.ability.extra.odds
        }
    }
end,
calculate = function(self, card, context)
if context.cardarea == G.play and context.main_scoring and pseudorandom('moneyodd') < G.GAME.probabilities.normal/card.ability.extra.odds then
    return {
        p_dollars = 30
    }
end
if context.cardarea == G.play and context.main_scoring then
    return{
        dollars = -1
}
end
end
}
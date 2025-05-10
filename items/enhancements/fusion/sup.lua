SMODS.Enhancement {
    key = "sup",
    atlas = "enhanc_fus",
    pos = {
    x = 5, 
    y = 4
},
    config = {extra = {
        x_mult = 3
    }},
    loc_vars = function(self, info_queue, card)
        return {vars={card.ability.extra.x_mult}}
end,
    calculate = function(self, card, context)
    if context.final_scoring_step and context.cardarea == G.hand then
        return { x_mult = card.ability.extra.x_mult }
    end
end
}
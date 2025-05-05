SMODS.Enhancement {
    key = "crack",
    atlas = "enhanc_fus",
    pos = {
        x = 3,
        y = 3
    },
    config = {extra = {x_mult = 4}},
    loc_vars = function(self, info_queue, card)
        return {vars={card.ability.extra.x_mult}}
end,
    calculate = function(self,card,context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
        if context.cardarea == G.play and context.main_scoring then
            return { 
                remove = true 
            }
        end
end
}
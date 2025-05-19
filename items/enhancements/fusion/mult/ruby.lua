SMODS.Enhancement {
    key = "ruby",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 1
    },
    config = {extra = {x_mult = 2.5}},
    loc_vars = function(self, info_queue, card)
        return { 
            vars={
                card.ability.extra.x_mult
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.play then
            return {
                x_mult = card.ability.extra.x_mult
            }
         end
    end
}
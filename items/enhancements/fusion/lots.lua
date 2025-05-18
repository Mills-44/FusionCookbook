SMODS.Enhancement {
    key = "lots",
    atlas = 'enhanc_fus',
    pos = {
        x = 0, 
        y = 0
    },
    config = {extra = {
        bonus = 75
    }},
    order = 1,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus
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
         if context.cardarea == G.play and context.main_scoring then
            return {
                chips = card.ability.extra.bonus
            }
         end
    end
}
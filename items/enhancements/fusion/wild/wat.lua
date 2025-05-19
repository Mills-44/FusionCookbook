SMODS.Enhancement {
    key = "wat", 
    atlas = 'enhanc_fus',
    any_suit = true,
    pos = {
        x = 2,
        y = 0
    },
    order = 3,
    config = {extra = {bonus = 45}},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
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
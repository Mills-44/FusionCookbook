

SMODS.Enhancement {
    key = "bou",
    atlas = 'enhanc_fus', 
    any_rank = true,
    no_suit = true,
    always_scores = true,
    replace_base_card = true,
    pos = {
        x= 5,
        y= 2
    },
    config = {
        extra = {
            chips = 75
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
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
        if context.cardarea and context.main_scoring == G.play then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}
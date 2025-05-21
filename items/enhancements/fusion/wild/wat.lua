SMODS.Enhancement {
    key = 'wat', 
    atlas = 'enhanc_fus',
    any_suit = true,
    pos = {
        x = 2,
        y = 0
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    order = 3,
    config = {
        extra = {
            bonus = 75
        }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.bonus
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Wild + Bonus", 
        MILLS.COLORS.FUSION, 
        G.C.WHITE, 
        1.0 )
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
SMODS.Enhancement {
    key = "sapphire",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 0
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            x_chips = 2.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars={
                card.ability.extra.x_chips
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Steel + Bonus", 
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
        if context.cardarea == G.hand and context.main_scoring then
           return {
            x_chips = card.ability.extra.x_chips
        }
        end
end
}
SMODS.Enhancement {
    key = "sapph",
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
            x_chips = 2
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
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.hand then
           return {
            x_chips = card.ability.extra.x_chips
        }
        end
end
}
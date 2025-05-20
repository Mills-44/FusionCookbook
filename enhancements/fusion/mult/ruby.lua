SMODS.Enhancement {
    key = "ruby",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 1
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            x_mult = 2.5
        }},
    loc_vars = function(self, info_queue, card)
        return { 
            vars={
                card.ability.extra.x_mult
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Mult + Steel", 
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
                x_mult = card.ability.extra.x_mult
            }
         end
    end
}
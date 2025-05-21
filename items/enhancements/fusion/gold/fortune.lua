SMODS.Enhancement {
    key = "fortune",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y = 6
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {}},
    loc_vars = function(self, info_queue, card)
        return { 
            vars={
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Gold + Gold", 
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
        if context.cardarea == G.hand and context. context.end_of_round then
            ease_dollars(8)
        end
    end
}
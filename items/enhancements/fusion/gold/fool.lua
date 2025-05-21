SMODS.Enhancement {
    key = "fool",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y = 5
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
        "Gold + Stone", 
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
            ease_dollars(3)
        if context.cardarea == G.play and context.individual and context.other_card:has_enhancement('m_mills_fools') then
         G.E_MANAGER:add_event(Event({
                   trigger = 'after',
                        delay = 0.15,
                        func = function()
                            ease_dollars(5)
                        return true
                        end 
                    }))
        end
        end
    end
}
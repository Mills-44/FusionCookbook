SMODS.Enhancement {
    key = "fools",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y = 5
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
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
        "Stone + Gold", 
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
                    ease_dollars(2),
                    message = "$2",
                    colour = G.C.GOLD
        }
            end
        if context.cardarea == G.play and context.main_scoring then
            return {
            ease_dollars(5),
            message = "$5",
            colour = G.C.GOLD
        }
    end
    end
}
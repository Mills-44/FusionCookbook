SMODS.Enhancement {
    key = "boulder",
    atlas = 'enhanc_fus', 
    no_rank = true,
    any_suit = true,
    always_scores = true,
    replace_base_card = true,
    pos = {
        x= 5,
        y= 2
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            chips = 80
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
        "Stone + Wild", 
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
                chips = card.ability.extra.chips
            }
        end
    end
}
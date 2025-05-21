SMODS.Enhancement {
    key = "cinnabar",
    atlas = 'enhanc_fus',
    pos = {
        x = 5, 
        y = 1
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    config = {
        extra = {
            mult = 8,
            chips = 80
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Stone + Mult", 
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
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
         end
    end
}
SMODS.Enhancement {
    key = "power",
    atlas = 'enhanc_fus',
    pos = {
        x = 1,
        y = 1
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {
         mult = 16
        }},
    loc_vars = function(self, info_queue, card)
        return {
            vars={ 
            card.ability.extra.mult 
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
        if context.cardarea == G.play and context.main_scoring then
           return {
            mult = card.ability.extra.mult
        }
        end
end
}
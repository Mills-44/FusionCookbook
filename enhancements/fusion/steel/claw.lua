SMODS.Enhancement {
    key = "claw",
    atlas = 'enhanc_fus',
    pos = {
        x = 4, 
        y = 2
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {
        extra = {
            x_mult = 3, 
            uses = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult, 
                card.ability.extra.uses
            }
        }
    end,
    set_badges = function(self, card, badges)
          badges[#badges+1] = create_badge(
        "Steel + Wild", 
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
        if context.main_scoring and context.cardarea == G.play then
            card.ability.extra.uses = card.ability.extra.uses - 1
        end
        if context.main_scoring and context.cardarea == G.play then
            return {
                x_mult = card.ability.extra.x_mult
            }
        end
        if card.ability.extra.uses == 0 then
            return { 
                remove = true 
            }
        end
    end
}
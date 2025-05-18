SMODS.Joker {
    key = 'snake_eyes',
    config = {
        extra = {
            xmult = 2.5
        }
    },
    atlas = 'misc_jokers',
    pos = {
        x = 4,
        y = 1
    }, 
    rarity = 1,
    cost = 5,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult,
        }
      }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
      if context.cardarea == G.play then
			if context.other_card then
                if context.other_card:get_id() == 2 then
                    return {
                        ease_dollars(-2),
                        xmult = 2.5,
                        colour = G.C.MULT,
					    card = card
                    }
                end
            end
        end
    end
}
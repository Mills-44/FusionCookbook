SMODS.Joker {
    key = 'calculator',
    config = {
        extra = {
            mult = 0
        }
    },
    atlas = 'misc_jokers',
    pos = {
        x = 3,
        y = 1
    }, 
    rarity = 2,
    cost = 6,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult,
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
                        mult = 2,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 3 then
                    return {
                        mult = 3,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 4 then
                    return {
                        mult = 4,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 5 then
                    return {
                        mult = 5,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 6 then
                    return {
                        mult = 6,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 7 then
                    return {
                        mult = 7,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 8 then
                    return {
                        mult = 8,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 9 then
                    return {
                        mult = 9,
                        colour = G.C.MULT,
					    card = card
                    }
                end
                if context.other_card:get_id() == 10 then
                    return {
                        mult = 10,
                        colour = G.C.MULT,
					    card = card
                    }
                end
            end
        end
    end
}
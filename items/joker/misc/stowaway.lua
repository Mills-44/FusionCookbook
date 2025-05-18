SMODS.Joker {
key = 'stowaway',
config = {
    extra = {
        joker_slot = 1,
        chips = 1
    }
  },
atlas = 'misc_jokers',
pos = {
    x = 1,
    y = 1
}, 
rarity = 1,
cost = 5,
unlocked = true, 
discovered = true, 
blueprint_compat = true,
eternal_compat = true,
perishable_compat = true,
loc_vars = function(self, info_queue, center)
    return {
      vars = { 
        center.ability.extra.joker_slot,
        center.ability.extra.chips
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
add_to_deck = function(self, card, from_debuff)
	G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_slot
	end,
	remove_from_deck = function(self, card, from_debuff)
	G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_slot
	end,
calculate = function(self, card, context)
      if context.joker_main then
        return {
          chips = card.ability.extra.chips,
        }
      end
    end
}
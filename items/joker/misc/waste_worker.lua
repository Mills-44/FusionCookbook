SMODS.Joker {
	key = 'waste_worker',
	config = { 
        extra = { 
            discard_size = 2, 
            hand_size = 2
         } 
        },
	atlas = 'misc_jokers',
	pos = { 
        x = 0, 
        y = 2 
    },
	rarity = 1,
    cost = 5,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
	loc_vars = function(self, info_queue, card)
		return { }
	end,
	add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
	G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_size
end,

remove_from_deck = function(self, card, from_debuff)
  G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
  G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_size
end
}
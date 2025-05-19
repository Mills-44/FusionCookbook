SMODS.Joker {
	key = 'waste_worker',
	config = { 
        extra = { 
            discard_size = 2, 
            hand_size = -2
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
	loc_vars = function(self, info_queue, card)
		return { }
	end,
	add_to_deck = function(self, card, from_debuff)
    G.GAME.round_resets.discards = card.ability.extra.discard_size
    ease_discard(G.GAME.round_resets.discards)

    G.GAME.round_resets.hands = card.ability.extra.hand_size
    ease_hands_played(G.GAME.round_resets.hands)
end,

remove_from_deck = function(self, card, from_debuff)
    G.E_MANAGER:add_event(Event({
        trigger = 'before', delay = 0,
        func = function()
            G.GAME.round_resets.hands = G.GAME.round_resets.hands + 2
            ease_hands_played(G.GAME.round_resets.hands)
            return true
        end
    }))
end
}
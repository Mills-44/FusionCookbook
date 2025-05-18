SMODS.Consumable {
    object_type = "Consumable",
    key = 'cannoli',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 5,
        y = 0
    },
    pools = { 
        Snack = true
     },
    cost = 4,
    weight = 5,
    unlocked = true,
    discovered = true,
    can_use = function(self)
        return #G.hand.highlighted == 1
      end,
    use = function(self, card, area)
      if G.hand.highlighted[1] then
			G.E_MANAGER:add_event(Event({
				func = function()
          local copy = G.hand.highlighted[1]
          local card = copy_card(copy)
          card:set_ability("m_", nil, true)
          card:set_edition("m_", nil, true)
          card:set_seal("m_", nil, true)
					card:add_to_deck()
					table.insert(G.playing_cards, card)
					G.hand:emplace(card)
					playing_card_joker_effects({ card })
					return true
				end,
			}))
		end
    end
}
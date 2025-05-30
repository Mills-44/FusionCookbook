SMODS.Gradient {
  key = 'enfuse',
  colours = {
    G.C.RARITY[4],
    G.C.GOLD
  },
  cycle = 3,
  interpolation = 'trig'
}

SMODS.Gradient {
  key = 'rafa',
  colours = {
    G.C.RARITY[4],
    HEX("e249ca"), -- Pink
    HEX("ef65d7")

  },
  cycle = 3,
  interpolation = 'trig'
}

SMODS.Gradient {
  key = 'mil',
  colours = {
    HEX("4983e2"), --Royal Blue
    HEX("0807b9"), -- Dark Blue
    HEX("1bb6e6") -- Light Blue
  },
  cycle = 3,
  interpolation = 'trig'
}

SMODS.Gradient {
  key = 'future',
  colours = {
    HEX("8025be"), -- Dark Purple
    HEX("b33ebf"), -- Amethyst
    HEX("c7256f"), -- Pink/Purple
    HEX("37085e") -- Dark Purple
  },
  cycle = 3,
  interpolation = 'trig'
}

-- Reroll function for packs 
local _reroll_shop = G.FUNCS.reroll_shop
function G.FUNCS.reroll_shop(e) 
	_reroll_shop(e)

	for i = #G.shop_booster.cards,1, -1 do
		local c = G.shop_booster:remove_card(G.shop_booster.cards[i])
		c:remove()
		c = nil
	end
	
	for i = 1, 2 do
		G.GAME.current_round.used_packs[i] = get_pack('shop_pack').key
		local card = Card(G.shop_booster.T.x + G.shop_booster.T.w/2,
		G.shop_booster.T.y, G.CARD_W*1.27, G.CARD_H*1.27, G.P_CARDS.empty, G.P_CENTERS[G.GAME.current_round.used_packs[i]], {bypass_discovery_center = true, bypass_discovery_ui = true})
		create_shop_card_ui(card, 'Booster', G.shop_booster)
		card.ability.booster_pos = i
		card:start_materialize()
		G.shop_booster:emplace(card)
	end
end

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
					card:add_to_deck()
          local chosen_enhancement
          local chosen_seal
          local chosen_edition
          if MILLS.random_chance(.75) then
            if MILLS.random_chance(.50) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_BONUS_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.40) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_MULT_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.50) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_WILD_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.25) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_GLASS_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.15) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_STEEL_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.50) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_STONE_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.30) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_GOLD_ENHANCEMENTS, pseudoseed('choice'))
            end
            if MILLS.random_chance(.40) then
              chosen_enhancement = pseudorandom_element(MILLS.FUSION_LUCKY_ENHANCEMENTS, pseudoseed('choice'))
            end
            card:set_ability("m_mills_" .. chosen_enhancement, true, nil)
          else 
            card:set_ability("m_", true, nil)
          end
          
          if MILLS.random_chance(.50) then
              chosen_seal = pseudorandom_element(MILLS.SEALS, pseudoseed('choice'))
              card:set_seal(chosen_seal, nil, true)
          end

          if MILLS.random_chance(.25) then
              chosen_edition = pseudorandom_element(MILLS.base_editions, pseudoseed('choice'))
              card:set_edition(chosen_edition, nil, true)
          end

					G.hand:emplace(card)
          card:juice_up(.3,.5)
					return true
				end,
			}))
		end
    end
}
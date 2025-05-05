SMODS.Consumable  {
  object_type = "Consumable",
  key = 'rye_chip',
  set = "Snack",
  atlas = 'rye_chip',
  pos = { x = 0, y = 0 },
  config = {},
  cost = 5,
  weight = 2,
  unlocked = true,
  discovered = true,
  pools = { Snack = true },

  can_use = function(self) return true end,

  use = function(self, card, area)
      G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.4, 
        func = function()
        if G.consumeables.config.card_limit > #G.consumeables.cards then
          play_sound('mills_nice')
          local card1 = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )
          local card2 = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )       
                    card1:add_to_deck()
                    card2:add_to_deck()
                    G.consumeables:emplace(card1)
                    G.consumeables:emplace(card2)
                    card1:juice_up(0.3, 0.5)
                    card2:juice_up(0.3, 0.5)
                end
                return true end }))
        delay(0.6)
    end
}

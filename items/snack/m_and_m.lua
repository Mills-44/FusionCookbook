SMODS.Consumable {
    object_type = "Consumable",
    key = 'm_and_m',
    set = "Snack",
    atlas = 'm_and_m',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            odd = 3
        }
    },
    pools = {
        Snack = true
    },
    cost = 3,
    weight = 10,
    unlocked = true,
    discovered = true,
    consumable = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                (G.GAME.probabilities.normal or 1),
                card.ability.extra.odd
            }
        }
    end,

    can_use = function(self)
        return true
    end,

    use = function(self, card, area)
        G.E_MANAGER:add_event(Event({
          trigger = 'after', 
          delay = 0.4, 
          func = function()
          if G.consumeables.config.card_limit > #G.consumeables.cards and pseudorandom('spectralodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
            play_sound('mills_nice')
            local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'c_' )
                      card:add_to_deck()
                      G.consumeables:emplace(card)
                      card:juice_up(0.3, 0.5)
                else 
                    return {
                        message = 'Nope!'
                    }
                end
                  return true end }))
          delay(0.6)
      end
  }

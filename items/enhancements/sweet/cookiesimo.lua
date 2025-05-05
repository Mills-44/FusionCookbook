SMODS.Enhancement {
  key = "cookiesimo",
  atlas = 'enhanc_sw',
  consumable = true,
  pos = {
      x = 0,
      y = 1
  },
  order = 2,
  config = {
      extra = {
      bonus = 50,
      mult = 8,
      p_dollars = 5,
      odd = 2
      }
  },
  loc_vars = function(self, info_queue, card)
      return {
        vars = {card.ability.extra.bonus, card.ability.extra.mult, card.ability.extra.p_dollars, (G.GAME.probabilities.normal or 1), card.ability.extra.odd}
      }
  end,
  calculate = function(self, card, context)
          if context.cardarea == G.play and context.main_scoring then
            local bonus = 0
            local mult = 0

              if pseudorandom('bonusodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              bonus = card.ability.extra.bonus
            elseif pseudorandom('multodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              mult = card.ability.extra.mult
            elseif pseudorandom('dollarsodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              return {ease_dollars(5)}

            elseif pseudorandom('tarotodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                if G.consumeables.config.card_limit > #G.consumeables.cards then
                  play_sound('mills_nice')
                  local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'c_' )
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            card:juice_up(0.3, 0.5)
                      end
                        return true end }))
            elseif pseudorandom('snackodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                  if G.consumeables.config.card_limit > #G.consumeables.cards then
                  play_sound('mills_nice')
                  local card = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            card:juice_up(0.3, 0.5)
                      end
                        return true end }))
            elseif pseudorandom('spectralodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                  if G.consumeables.config.card_limit > #G.consumeables.cards then
                  play_sound('mills_nice')
                  local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'c_' )
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            card:juice_up(0.3, 0.5)
                      end
                        return true end }))
            elseif pseudorandom('planetodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              G.E_MANAGER:add_event(Event({
                trigger = 'after', 
                delay = 0.4, 
                func = function()
                  if G.consumeables.config.card_limit > #G.consumeables.cards then
                  play_sound('mills_nice')
                  local card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'c_' )
                            card:add_to_deck()
                            G.consumeables:emplace(card)
                            card:juice_up(0.3, 0.5)
                      end
                        return true end }))
              end

              return {
                  chips = bonus,
                  mult = mult,
              }
          end
        end
      }

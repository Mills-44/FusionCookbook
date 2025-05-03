SMODS.Enhancement {
  key = "cookiesimo",
  atlas = 'enhanc_sw',
  pos = {
      x = 0,
      y = 1
  },
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
              return {card.ability.extra.p_dollars}

            elseif pseudorandom('tarotodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              return SMODS.create_card{
                 set = 'Tarot',
                 }
            elseif pseudorandom('snackodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              return SMODS.create_card{
                set = 'Snack',
                }
            elseif pseudorandom('spectralodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              return SMODS.create_card{
                set = 'Spectral',
                }
            elseif pseudorandom('planetodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
              return SMODS.create_card{
                set = 'Planet',
                }
              end

              return {
                  chips = bonus,
                  mult = mult,
              }
          end
        end}
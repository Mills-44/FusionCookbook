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
      bonus = 100,
      mult = 20,
      xmult = 3,
      p_dollars = 5,
      }
  },
  loc_vars = function(self, info_queue, card)
      return {
        vars = {card.ability.extra.bonus, card.ability.extra.mult, card.ability.extra.p_dollars, (G.GAME.probabilities.normal or 1), card.ability.extra.odd}
      }
  end,
  set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly & Mills", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
  calculate = function(self, card, context)
          if context.cardarea == G.play and context.main_scoring then
              if MILLS.random_chance(.5) then
              bonus = card.ability.extra.bonus
            elseif MILLS.random_chance(.65) then
              mult = card.ability.extra.mult
            elseif MILLS.random_chance(.8) then
             -- xmult = card.ability.extra.xmult
            else
              ease_dollars(5)
            end
              return {
                  chips = bonus,
                  mult = mult,
                  xmult = xmult,
              }
          end
        end
      }

SMODS.Enhancement {
  key = 'frostisimo',
  atlas = 'enhanc_sw',
  pos = {
    x = 1,
    y = 0
  },
  config = {
    extra = {
      base_money = 1
    }
  },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.base_money
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local money = card.ability.extra.base_money

      for _, v in ipairs(G.jokers.cards) do
        if MILLS.is_sweet(v) then
          money = money + 1
          break
        end
      end
      ease_dollars(money)
      SMODS.calculate_effect {
        message = "$" .. tostring(money) .. " Sweet Bonus!",
        card = card
      }
    end
  end
}
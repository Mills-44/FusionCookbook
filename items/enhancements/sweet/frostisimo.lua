SMODS.Enhancement {
  key = 'frostisimo',
  atlas = 'enhanc_sw',
  pos = {
    x = 1,
    y = 0
  },
  config = {
    extra = {
      base_money = 1,
      money_gain = 1
    }
  },
  order = 3,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.money_gain
      }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local money = card.ability.extra.base_money
      local money_gain = card.ability.extra.money_gain
      for _, v in ipairs(G.jokers.cards) do
        if MILLS.is_sweet(v) then
          money = money + 1
          card.ability.extra.money_gain = card.ability.extra.money_gain + 1   
          break
        end
      end
      ease_dollars(money_gain)
      SMODS.calculate_effect {
        card = card
      }
    end
  end
}
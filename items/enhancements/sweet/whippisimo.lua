SMODS.Enhancement {
  key = "whippisimo",
  atlas = 'enhanc_sw',
  pos = { x = 0, y = 0 },
  config = {
    extra = {
      toggle = true  -- true = x2 next, false = x1 next
    }
  },
  order = 4,
  loc_vars = function(self, info_queue, card)
    local next = card.ability.extra.toggle and 2 or 1
    local prev = card.ability.extra.toggle and 1 or 2
    return {
      vars = { tostring(next), tostring(prev) }
    }
  end,

  calculate = function(self, card, context)
    if context.cardarea == G.play and context.main_scoring then
      local mult = card.ability.extra.toggle and 2 or 1
      card.ability.extra.toggle = not card.ability.extra.toggle
      return {
        xmult = mult
      }
    end
  end
}

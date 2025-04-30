SMODS.Joker {
  key = 'carolina_reaper',
  config = {
    extra = {
      mult = 150,        -- Base multiplier
      a_powmult = 2          -- Constant exponent
    }
  },
  atlas = 'pepper_jokers',
  pos = {
    x = 6,
    y = 0
  },
  soul_pos = {
    x = 6,
    y = 1
  },
  in_pool = function(self, args)
    return false  -- Exclusive joker, cannot appear in normal pools
  end,
  rarity = 4,
  unlocked = true,
  discovered = true,
  blueprint_compat = true,
  eternal_compat = false,
  perishable_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.extra.power
      }
    }
  end,
  calculate = function(self, card, context)
    if context.joker_main then
      return {
        mult = math.pow(card.ability.extra.mult, card.ability.extra.power),
      }
    end
    if context.before and not context.blueprint then  
      G.E_MANAGER:add_event(Event({
        func = function()
          play_sound('mills_death')
          return true
        end
      }))
      SMODS.calculate_effect {
        message = 'Reaper Reapin!',
        colour = MILLS.COLORS.DEATH,
        card = card,
      }
    end
  end
}
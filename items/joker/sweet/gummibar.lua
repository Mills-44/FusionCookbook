SMODS.Joker {
    key = 'gummibar',
    config = {
      extra = {
        mult = 0,
        mult_mod = 4
      },
    },
    atlas = 'sweet_jokers_1',
    pos = {
      x = 4,
      y = 0
    },
    pools = { 
      Sweet = true
   },
    rarity = 1,
    cost = 5,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult_mod,
          card.ability.extra.mult,
        }
      }
    end,
    calculate = function(self, card, context)
      if context.joker_main then
        return {
          mult = card.ability.extra.mult,
        }
      end
      if context.before and not context.blueprint then
        if next(context.poker_hands['Straight']) then
          card.ability.extra.mult = card.ability.extra.mult + 4
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound('mills_gummy')
              return true
            end
          }))
          SMODS.calculate_effect {
            message = 'Gummy Gummy Gummy Bear!',
            colour = MILLS.COLORS.GUMMY,
            card = card,
          }
        end
      end
    end
  }
  
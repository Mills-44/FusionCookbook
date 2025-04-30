SMODS.Joker {
    key = 'koolaid_man',
    config = {
      extra = {
        money = 3
      },
    },
    atlas = 'koolaid_man',
    pos = {
      x = 0,
      y = 0
    },
    soul_pos = {
      x = 0,
      y = 1
    },
    in_pool = function(self, args)
        return false
    end,
    rarity = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.money,
        }
      }
    end,
    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        if next(context.poker_hands['Three of a Kind']) then
          ease_dollars(3)
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound('mills_koolaid')
              return true
            end
          }))
          SMODS.calculate_effect {
            message = 'Oh Yeah!',
            colour = G.C.MULT,
            card = card,
          }
        end
      end
    end
  }
  
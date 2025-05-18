SMODS.Joker {
    key = 'koolaid_man',
    config = {
      extra = {
        money = 3
      },
    },
    atlas = 'sweet_jokers',
    pos = {
      x = 2,
      y = 0
    },
    in_pool = function(self, args)
        return false
    end,
    rarity = 2,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.money,
        }
      }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Sweet", 
        MILLS.COLORS.SWEET, 
        G.C.WHITE, 
        1.2 )
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
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
  
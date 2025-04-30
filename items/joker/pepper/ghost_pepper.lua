--Same set up used for Pimento Through Habanero But I use Xmult logic here
--If you want to know how to build a System similar to this one go to anaheim_chile.lua

SMODS.Joker {
    key = 'ghost_pepper', -- Level 3 of Joker System
    config = {
      extra = {
        mult = 125,
        xmult = 2
      },
      levels = 0
    },
    atlas = 'pepper_jokers',
    pos = {
      x = 5,
      y = 0
    },
    soul_pos = {
      x = 5,
      y = 1
    },
    in_pool = function(self, args)
        return false
    end,
    rarity = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.mult,
          card.ability.extra.xmult,
        }
      }
    end,
    calculate = function(self, card, context)
      if context.joker_main then
        return {
          mult = card.ability.extra.mult,
          xmult = card.ability.extra.xmult,
        }
      end
      if context.before and not context.blueprint then
        if next(context.poker_hands['Full House']) or next(context.poker_hands['Flush']) then
          card.ability.extra.mult = 125 -- Logic for mult
          card.ability.levels = card.ability.levels + 1
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound('mills_scorching')
              return true
            end
          }))
          SMODS.calculate_effect {
            message = 'Scorching!',
            colour = MILLS.COLORS.SCORCHING,
            card = card,
          }
        end
      end
      if card.ability.levels >= 5 then
        card.ability.levels = 0
        G.E_MANAGER:add_event(Event({
          func = function()
            for i, c in ipairs(G.jokers.cards) do
              if c == card then
                table.remove(G.jokers.cards, i)
                play_sound('mills_sayonara')
                break
              end
            end
            SMODS.add_card {
              set = 'Joker',
              area = G.jokers,
              key = 'j_mills_carolina_reaper'
            }
            return true
          end
        }))
      end
    end
  }
  
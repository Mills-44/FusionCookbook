--For any info of how i made this system for Pimento through Habanero go to anaheim_chile.lua

SMODS.Joker {
    key = 'cayenne', -- Level 4 of Joker System
    config = {
      extra = {
        mult = 0,
        mult_mod = 10
      },
      levels = 0
    },
    atlas = 'pepper_jokers',
    pos = {
      x = 3,
      y = 0
    },
    soul_pos = {
      x = 3,
      y = 1
    },
    in_pool = function(self, args)
        return false
      end,   
    rarity = 1,
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
        if next(context.poker_hands['Full House']) or next(context.poker_hands['Flush']) then
          card.ability.extra.mult = card.ability.extra.mult + 10
          card.ability.levels = card.ability.levels + 1
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound('mills_sizzling')
              return true
            end
          }))
          SMODS.calculate_effect {
            message = 'Sizziling!',
            colour = MILLS.COLORS.SIZZILING,
            card = card,
          }
        end
      end
      if card.ability.levels >= 3 then
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
            local newcard = SMODS.add_card {
              set = 'Joker',
              area = G.jokers,
              key = 'j_mills_habanero'
            }
            newcard.ability.extra.mult = card.ability.extra.mult
            return true
          end
        }))
      end
    end
  }
  
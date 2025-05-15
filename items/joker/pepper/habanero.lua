--For any info of how i made this system for Pimento through Habanero go to anaheim_chile.lua

SMODS.Joker {
    key = 'habanero', -- Level 5 of Joker System
    config = {
      extra = {
        mult = 0,
        mult_mod = 25
      },
      levels = 0
    },
    atlas = 'pepper_jokers',
    pos = {
      x = 4,
      y = 0
    },
    soul_pos = {
      x = 4,
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
          card.ability.extra.mult = card.ability.extra.mult + 25
          card.ability.levels = card.ability.levels + 1
          G.E_MANAGER:add_event(Event({
            func = function()
              play_sound('mills_fiery')
              return true
            end
          }))
          SMODS.calculate_effect {
            message = 'Fiery!',
            colour = MILLS.COLORS.FIERY,
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
                play_sound('mills_adios')
                break
              end
            end
            local newcard = SMODS.add_card {
              set = 'Joker',
              area = G.jokers,
              key = 'j_mills_ghost_pepper'
            }
            return true
          end
        }))
      end
    end
  }

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_habanero"] = { -- Pulls definition from the localization file
      reminder_text = {
      { text = "(" },
      { ref_table = "card.joker_display_values", ref_value = "hand" },
      { text = " or Full House" },
      { text = ")" },
    },
    text = {
      { text = "+", colour = G.C.MULT },
      { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
    },
    calc_function = function(card)
      card.joker_display_values.hand = localize("Flush", 'poker_hands')
    end,
  }
end
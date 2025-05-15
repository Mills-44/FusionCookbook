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
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Sweet", 
        MILLS.COLORS.SWEET, 
        G.C.WHITE, 
        1.2 )
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
  
-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_gummibar"] = { -- Pulls definition from the localization file
      reminder_text = {
      { text = "(" },
      { ref_table = "card.joker_display_values", ref_value = "hand" },
      { text = ")" },
    },
    text = {
      { text = "+", colour = G.C.MULT },
      { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT }
    },
    calc_function = function(card)
      card.joker_display_values.hand = localize("Straight", 'poker_hands')
    end,
  }
end
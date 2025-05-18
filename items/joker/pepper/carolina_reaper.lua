SMODS.Joker {
  key = 'carolina_reaper',
  config = {
    extra = {
      mult = 150,        -- Base multiplier       
    },
    power = 2 -- Exponential mult
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
  set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Gsfg", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.mult,
        card.ability.power
      }
    }
  end,
  calculate = function(self, card, context)
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
    if context.joker_main then
      return {
        mult_mod = 150,
        Emult_mod = 2,
        card = card
      }
    end
  end
}

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_carolina_reaper"] = { -- Pulls definition from the localization file
      reminder_text = {
      { text = "(" },
      { text = "Any hand" },
      { text = ")" },
    },
    text = {
      { text = "+", colour = G.C.MULT },
       { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult", colour = G.C.MULT },
      { text = " and ", colour = G.C.INACTIVE },
      {
       border_nodes = {
          { text = "^" },
          { ref_table = "card.ability", ref_value = "power", retrigger_type = "exp" },
        },
        border_colour = G.C.DARK_EDITION
      }
    },
    calc_function = function(card)
      card.joker_display_values.hand = localize("Flush", 'poker_hands')
    end,
  }
end
SMODS.Joker {
    key = 'peppermint_butler',
    config = {
      extra = {
        chips = 0,
        chips_mod = 5
      },
    },
    atlas = 'sweet_jokers_1',
    pos = {
      x = 0,
      y = 1
    },
    pools = {
      Sweet = true
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.chips_mod,
          card.ability.extra.chips,
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
      if context.joker_main or context.main_scoring then    
        if next(context.poker_hands['Pair']) then
          card.ability.extra.chips = card.ability.extra.chips + 5
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('mills_minty')
            return true
          end
        })) 
    end
    return {
      message = 'Minty!',
      colour = G.C.CHIPS,
      chips = card.ability.extra.chips,
      card = card
    }
  end
end
}

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_peppermint_butler"] = { -- Pulls definition from the localization file
      reminder_text = {
      { text = "(" },
      { ref_table = "card.joker_display_values", ref_value = "hand" },
      { text = ")" },
    },
    text = {
      { text = "+", colour = G.C.CHIPS },
      { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS }
    },
    calc_function = function(card)
      card.joker_display_values.hand = localize("Pair", 'poker_hands')
    end,
  }
end
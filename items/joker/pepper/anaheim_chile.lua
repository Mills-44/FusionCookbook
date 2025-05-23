SMODS.Joker {
  key = 'anaheim_chile', -- Level 2 of Pepper Joker 
  config = {
    extra = {
      mult_gain = 5, -- Little Bonus :)
      mult = 0
    },
    levels = 0
  },
  atlas = 'pepper_jokers',
  pos = {
    x = 1,
    y = 0
  },
  soul_pos = {
    x = 1,
    y = 1
  },
 
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
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
        card.ability.extra.mult_gain,
        card.ability.extra.mult
      }
    }
  end,
  set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Gsfg", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
  calculate = function(self, card, context)
  -- Gives the mult during scoring
    if context.joker_main then
      return {
        mult = card.ability.extra.mult,
      }
    end
    if context.before and not context.blueprint then
      if next(context.poker_hands['Full House']) or next(context.poker_hands['Flush']) then --If hand has Full House or Flush will trigger
        card.ability.extra.mult = card.ability.extra.mult + 5 -- Adds Mult
        card.ability.levels = card.ability.levels + 1 --Adds Level
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('mills_piquant')
            return true
          end
        }))
        --Using these for calculate effect in game check out my util.lua for more information
        SMODS.calculate_effect {
          message = 'Piquant!',
          colour = MILLS.COLORS.PIQUANT,
          card = card,
        }
      end
    end
    if card.ability.levels >= 3 then -- Pepper levels up
      card.ability.levels = 0 --So we dont bug the system and reset next level of pepper it would be WILD if it didnt XD
      G.E_MANAGER:add_event(Event({
        func = function()
          for i, c in ipairs(G.jokers.cards) do
            if c == card then
              SMODS.destroy_card(G.jokers.cards, i) -- Removes This Joker
              play_sound('mills_bye')
              break
            end
          end
          local newcard = SMODS.add_card { -- Will add Next Joker
            set = 'Joker',
            area = G.jokers,
            key = 'j_mills_jalapeno' --Go look in define.lua to see why 'j_(modID)_JokerName' is used if new to coding
          }
          newcard.ability.extra.mult = card.ability.extra.mult --Will give the joker that spawns in the mult gained from this joker
          return true
        end
      }))
    end
  end
}

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_anaheim_chile"] = { -- Pulls definition from the localization file
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
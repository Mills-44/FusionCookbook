SMODS.Joker {
    key = 'clown',
    config = {
        extra = {
            chips = 40
        }
    },
    atlas = 'misc_jokers',
    pos = {
        x = 0,
        y = 0
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
          card.ability.extra.chips,
        }
      }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
      if context.joker_main then
        return {
          chips = card.ability.extra.chips,
        }
      end
    end
}

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_clown"] = { -- Pulls definition from the localization file
    text = {
      { text = "+", colour = G.C.CHIPS },
      { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS }
    },
  }
end
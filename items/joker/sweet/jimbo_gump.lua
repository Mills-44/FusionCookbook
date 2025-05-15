SMODS.Joker {
    key = 'jimbo_gump',
    config = {
      extra = {
        xmult = 1,
        xmult_mod = 0.1
      },
    },
    atlas = 'jimbo_gump',
    pos = {
      x = 0,
      y = 0
    },
    pools = { 
      Sweet = true
   },
    rarity = 3,
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult_mod,
          card.ability.extra.xmult,
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
          if context.before then
            local enhanced_count = 0
            for _, c in ipairs(context.full_hand or {}) do
                if next(SMODS.get_enhancements(c, false)) then
                    enhanced_count = enhanced_count + .1
                end
            end
            card.ability.extra.xmult = card.ability.extra.xmult +  enhanced_count
        end

        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult,
                colour = G.C.MULT,
                card = card
            }
        end
    end
}


-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_jimbo_gump"] = { -- Pulls definition from the localization file
     reminder_text = {
      { text = "(" },
      {text = "Enhanced Cards"},
      { text = ")" },
    },
    text = {
      {
       border_nodes = {
          { text = "X" },
          { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" },
        },
      }
    }
  }
end
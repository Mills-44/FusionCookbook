SMODS.Joker {
    key = 'tipsy_turvy',
    config = {},
    atlas = 'misc_jokers',
    pos = {
        x = 2,
        y = 1
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
        vars = {}
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
        if context.individual and context.cardarea == G.play then
            local check_suits = k
        end
    end
}
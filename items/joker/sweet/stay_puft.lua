SMODS.Joker {
    key = 'stay_puft',
    config = {},
    atlas = 'sweet_jokers',
    pos = {
        x = 2,
        y = 1
    },
    pools = { 
        Sweet = true
     },
    rarity = 1,
    cost = 4,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Sweet", 
        MILLS.COLORS.SWEET, 
        G.C.WHITE, 
        1.2 )
        badges[#badges+1] = create_badge(
        "Art: Mills", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
            if next(context.poker_hands['Straight']) then -- Checks if hand contains Three of a Kind
            for _, c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                       if MILLS.random_chance(.5) then
                        c:set_ability('m_wild') -- Turns it to wild
                       else
                        c:set_ability('m_steel')
                       end
                       play_sound('mills_puft')
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
            return {
                message = "PUFT!",
                colour = G.C.GREEN
            }
        end
    end 
end
}

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_stay_puft"] = { -- Pulls definition from the localization file
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hand" },
        { text = ")" },
    },
     text = {
        { text = "Steel or Wild Cards", colour = G.C.FILTER },
     },
     calc_function = function(card)
      card.joker_display_values.hand = localize("Straight", 'poker_hands')
    end,
    }   
end
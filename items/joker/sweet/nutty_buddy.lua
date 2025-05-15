SMODS.Joker {
    key = 'nutty_buddy',
    config = {},
    atlas = 'sweet_jokers_1',
    pos = {
        x = 3,
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
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
            if next(context.poker_hands['Pair']) then -- Checks if hand contains Pair
                for _,c in ipairs(context.scoring_hand) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                        c:flip()
                        c:juice_up(.3,.5)
                        return true
                           end}))
                    if not SMODS.has_enhancement(c, 'm_bonus') then
                        c:set_ability('m_bonus',nil,true) 
                    end
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = .3,
                        func = function()
                        c:flip()
                        return true
                        end}))
                end
                play_sound('mills_nutty')
                return {
                    message = "Shaped like a Peanut!",
                    colour = G.C.GOLD,
                }
            end
        end
    end
    }

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_nutty_buddy"] = { -- Pulls definition from the localization file
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hand" },
        { text = ")" },
    },
     text = {
        { text = "Bonus Cards", colour = G.C.FILTER },
     },
     calc_function = function(card)
      card.joker_display_values.hand = localize("Pair", 'poker_hands')
    end,
    }   
end
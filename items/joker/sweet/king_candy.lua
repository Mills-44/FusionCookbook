SMODS.Joker {
    key = 'king_candy',
    config = {},
    atlas = 'sweet_jokers',
    pos = {
        x = 3,
        y = 1
    },
    pools = { 
        Sweet = true
     },  
    rarity = 3,
    cost = 7,
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
            if next(context.poker_hands['Five of a Kind']) then -- Checks if hand contains Five of a Kind
                for _,c in ipairs(context.scoring_hand) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                        c:flip()
                        c:juice_up(.3,.5)
                        return true
                           end}))
                    if not SMODS.has_enhancement(c, 'm_mills_candisimo') then
                        c:set_ability('m_mills_candisimo',nil,true) 
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = .3,
                        func = function()
                        c:flip()
                        return true
                        end}))
                    end
                end
                play_sound('mills_candy')
                return {
                    message = "Glazed!",
                    colour = G.C.MULT,
                }
            end
        end
    end
    }

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_king_candy"] = { -- Pulls definition from the localization file
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hand" },
        { text = ")" },
    },
     text = {
        { text = "Candisimo Cards", colour = G.C.FILTER },
     },
     calc_function = function(card)
      card.joker_display_values.hand = localize("Five of a Kind", 'poker_hands')
    end,
    }   
end
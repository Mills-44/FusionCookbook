SMODS.Joker {
    key = 'gingy',
    config = {},
    atlas = 'sweet_jokers',
    pos = {
        x = 3,
        y = 2
    },
    pools = { 
        Sweet = true
     },
    rarity = 2,
    cost = 7,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
         if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
            if next(context.poker_hands['Full House']) then -- Checks if hand contains Full House
                for _,c in ipairs(context.scoring_hand) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                        c:flip()
                        c:juice_up(.3,.5)
                        return true
                           end}))
                    if not SMODS.has_enhancement(c, 'm_mills_frostisimo') then
                        c:set_ability('m_mills_frostisimo',nil,true) 
                    end
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = .3,
                        func = function()
                        c:flip()
                        return true
                        end}))
                end
                play_sound('mills_gingy')
                return {
                    message = "The Muffin Man!",
                    colour = MILLS.COLORS.GINGY,
                }
            end
        end
    end
    }

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_gingy"] = { -- Pulls definition from the localization file
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hand" },
        { text = ")" },
    },
     text = {
        { text = "Frostisimo Cards", colour = G.C.FILTER },
     },
     calc_function = function(card)
      card.joker_display_values.hand = localize("Full House", 'poker_hands')
    end,
    }   
end
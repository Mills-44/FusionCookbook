---@diagnostic disable: undefined-global
SMODS.Joker {
    key = 'barry_b',
    config = {},
    atlas = 'sweet_jokers',
    pos = {
        x = 0,
        y = 0
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
        if context.before and not context.blueprint then
            if next(context.poker_hands['Four of a Kind']) then
            for _,c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                    c:flip()
                    c:juice_up(.3,.5)
                    return true
                       end}))
                if not SMODS.has_enhancement(c, 'm_glass') then
                    c:set_ability('m_glass',nil,true) 
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = .3,
                    func = function()
                    c:flip()
                    return true
                    end}))
            end
            play_sound('mills_jazz')
            return {
                message = "Jazz?",
                colour = G.C.GOLD,
            }
        end
    end
end
}

-- Joker Display Compatability
if JokerDisplay then 
  JokerDisplay.Definitions["j_mills_barry_b"] = { -- Pulls definition from the localization file
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "hand" },
        { text = ")" },
    },
     text = {
        { text = "Glass Cards", colour = G.C.FILTER },
     },
     calc_function = function(card)
      card.joker_display_values.hand = localize("Four of a Kind", 'poker_hands')
    end,
    }   
end
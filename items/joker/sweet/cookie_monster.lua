SMODS.Joker {
    key = 'cookie_monster',
    config = {},
    atlas = 'sweet_jokers_1',
    pos = {
        x = 4,
        y = 1
    },
    pools = { 
        Sweet = true
     },
    rarity = 3,
    cost = 8,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
            if next(context.poker_hands['Straight Flush']) then -- Checks if hand contains Straight Flush
            for _, c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        c:set_ability('m_mills_cookiesimo') -- Turns it to Cookiesimo
                        play_sound('mills_cookie')
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
            return {
                message = "Cookie?",
                color = MILLS.COLORS.COOKIE
            }
        end
    end 
end
}

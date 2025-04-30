SMODS.Joker {
    key = 'barry_b',
    config = {},
    atlas = 'barry_b',
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
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
            if next(context.poker_hands['Four of a Kind']) then -- Checks if hand contains Four of a Kind
            for _, c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        c:set_ability('m_glass') -- Turns it to glass
                        play_sound('mills_jazz')
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
            return {
                message = "Jazz?",
                colour = G.C.GOLD
            }
        end
    end 
end
}

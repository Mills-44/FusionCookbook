SMODS.Joker {
    key = 'stay_puft',
    config = {},
    atlas = 'stay_puft',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Sweet = true
     },
    rarity = 1,
    cost = 4,
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
            if next(context.poker_hands['Straight']) then -- Checks if hand contains Three of a Kind
            for _, c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                       if MILLS.random_chance(.5) then
                        c:set_ability('m_mills_bou') -- Turns it to wild
                       else
                        c:set_ability('m_mills_lots')
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

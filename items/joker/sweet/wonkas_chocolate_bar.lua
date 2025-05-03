SMODS.Joker {
    key = 'wonkas_chocolate_bar',
    config = {},
    atlas = 'wonkas_chocolate_bar',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Sweet = true
     },
    rarity = 2,
    cost = 6,
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
            if next(context.poker_hands['Two Pair']) then -- Checks if hand contains Three of a Kind
            for _, c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        c:set_ability('m_lucky') -- Turns it to Mult
                        play_sound('mills_wonka')
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
            return {
                message = "Dandy!",
                colour = MILLS.COLORS.JELLY
            }
        end
    end 
end
}

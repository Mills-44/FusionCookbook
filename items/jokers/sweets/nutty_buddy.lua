return {
    key = 'nutty_buddy',
    loc_txt = {
        name = 'Nutty Buddy',
        text = {
            "When scored hand contains a {C:attention}Pair{},",
            "turn all cards in the hand into {C:chips}Bonus{} Cards"
        }
    },
    config = {},
    rarity = 1,
    atlas = 'sweets_jokers',
    pos = {
        x = 0,
        y = 0
    },
    cost = 5, 
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        -- Trigger only once for the whole hand (context.before)
        if context.before and context.scoring_name == 'Pair' and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                -- Schedule the change as an event so it's done safely
                G.E_MANAGER:add_event(Event({
                    func = function()
                        -- Set edition to Lucky
                        c:set_ability('m_bonus')
                        -- Optional visual feedback
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
    
            return {
                message = "Nutty!",
                colour = G.C.CHIPS
            }
        end
    end    
}

return {
    key = 'stay_puft',
    loc_txt = {
        name = 'Stay Puft',
        text = {
             "When scored hand contains a {C:attention}Straight{},",
            "turn all cards in the hand into either {C:attention}Wild{} or", 
            "{C:attention}Steel{} Cards (50/50)"
        }
    },
    config = {},
    rarity = 1,
    atlas = 'sweets_jokers',
    pos = {
        x = 3,
        y = 0
    },
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
        -- Trigger only once for the whole hand (context.before)
        if context.before and context.scoring_name == 'Straight' and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                -- Schedule the change as an event so it's done safely
                G.E_MANAGER:add_event(Event({
                    func = function()
                        if math.random() < .5 then
                            c:set_ability('m_steel')
                        else
                        c:set_ability('m_wild')
                        end
                        -- Optional visual feedback
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
            return {
                message = "Squish!",
                colour = G.C.WHITE
            }
        end
    end    
}

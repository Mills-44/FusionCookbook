SMODS.Consumable {
    key = 'homeys_doney',
    set = 'Snack',
    loc_txt = {
        name = "Homey\'s Doney",
        text = {
            "{C:green} 1 in 2{} chance to get +1 Discard or,",
            "{C:green} 1 in 2{} chance to get +1 Hand"
        }
    },
    atlas = 'snack_cards',
    pos = {
        x = 3,
        y = 0
    },
    cost = 3,
    discovered = true,
    unlocked = true,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local buff_type = pseudorandom('homeys_doney', 2)
                sendDebugMessage("Homey's Doney triggered, roll: " .. tostring(buff_type), "mills")
    
                if buff_type == 1 then
                    ease_hands_played(1)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = '+1 Hand', colour = G.C.CHIPS})
                    
                else
                    ease_discard(1)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = '+1 Discard', colour = G.C.MULT})
                end
                play_sound('mills_doh')
                return true
            end
        }))
    end
}    
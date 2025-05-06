local ANIM = {}

-- Cards flip from left to right one by one
function ANIM.card_snake(cards, opts)
    opts = opts or {}

    for i = 1, #cards do
        local card = cards[i]
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = .3,
            func = function()
                if card and card.flip and not card.fully_flipped then
                    card:flip()
                    card.fully_flipped = true
                else
                    card:flip()
                end
                return true
            end
        }))
    end
end

return ANIM
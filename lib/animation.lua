local ANIM = {}

-- Cards flip from left to right one by one
function ANIM.card_flip(cards, opts)
    opts = opts or {}

    for i = 1, #cards do
        local card = cards[i]
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.10,
            func = function()
            card:flip()
            return true
               end}))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = .75,
            func = function()
            card:flip()
            return true
            end
        }))
    end
end

return ANIM
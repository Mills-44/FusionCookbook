SMODS.Consumable {
    key = 'rye_chip',
    set = 'Snack',
    loc_txt = {
        name = "Rye Chip",
        text = {
            "Create 2 random Snack Cards"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 4,
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
                local snack_cards = {
                    'slice_of_bread',
                    'cream_puff',
                    'homeys_doney',
                    'butterscotch',
                    'bubblegum',
                    'kinder_egg',
                    'biscoff',
                    'pretzel'
                }
                for i = 1, 2 do
                    local key = pseudorandom_element(snack_cards)
                    local snack = create_card('Consumeable', G.consumeables, key, 1, nil, nil)
                    G.consumeables:emplace(snack)
                end
                play_sound('tasty1')
                G.hand_text:add({
                    text = "Snack Time!",
                    color = G.C.GOLD,
                    scale = 1.2
                })

                return true
            end
        }))
    end
}
SMODS.Consumable {
    key = 'kinder_egg',
    loc_txt = {
        name = "Kinder Egg",
        text = {
            "Create one random Sweets Joker"
        }
    },
    config = {},
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    discovered = true,
    unlocked = true,
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
        blocking = true,
        func = function ()
            local sweets_jokers = {
                'wonkas_chocolate_bar',
                'nutty_buddy',
                'stay_puft',
                'barry_b',
                'jammin_jelly',
                'apple_of_jacks_eye',
                'gummibar',
                'koolaid_man'
            }

            local chosen_key = pseudorandom_element(sweets_jokers)
            local new_joker = create_card('Joker', G.jokers, chosen_key, 1, nil, nil)
            G.jokers:emplace(new_joker)

            play_sound('tasty2')
            G.hand_text:add({
                text = 'Sweet!',
                scale = 1.3,
                color = G.C.GREEN
            })
            return true
        end
        }))
    end
}
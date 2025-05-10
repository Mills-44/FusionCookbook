SMODS.Joker {
    key = 'apple_of_jacks_eye',
    config = {},
    atlas = 'apple_of_jacks_eye',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Sweet = true
     },        
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and context.scoring_hand then
            local only_faces = true
             if context.scoring_hand[i]:is_face() then
                only_faces = true
             else
                only_faces = false
             end
            if only_faces then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('mills_nice')
                        local snack_card = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_')
                        snack_card:add_to_deck()
                        G.consumeables:emplace(snack_card)
                        snack_card:juice_up(0.3, 0.5)
                        return true
                    end
                }))
            end
        end
    end
}

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
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Spades") then  
            local spade_count = 0
            local club_count = 0
            local diamond_count = 0
            local heart_count = 0
            local other_card = context.other_card
            return {
            spade_count = spade_count + 1
            }
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Clubs") then 
            local other_card = context.other_card
             return {
            club_count_count_count = club_count + 1
             }
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Diamonds") then 
            local other_card = context.other_card
             return {
            diamond_count = diamond_count + 1 
             }
        elseif context.individual and context.cardarea == G.play and context.other_card:is_suit("Heart") then
            local other_card = context.other_card
             return {
            heart_count = heart_count + 1
             }
        end
        if spade_count > 2 or club_count > 2 or diamond_count > 2 or heart_count > 2 then
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
}

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
        if context.cardarea == G.play and conxtex.individual then
           for k, v in ipairs(MILLS.base_suits) do
            local suit_count = 0
                if context.other_card.base.suit == v then
                    suit_count = suit_count + 1
                end
           return suit_count
        end
        if suit_count == 3 then
            local newcard = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )
            newcard:add_to_deck()
            G.consumeables:emplace(newcard)
            newcard:juice_up(0.3, 0.5)  
        end
    end
end
}

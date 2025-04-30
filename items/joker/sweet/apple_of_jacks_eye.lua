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
        if context.individual and context.cardarea == G.play then         
            local card_type = 'Snack'
            for _, suit in ipairs(MILLS.base_suits) do --This should be counting suits essentially if it set up right :/
                local count = 0  
            for _, card in ipairs(context.hand) do
                if card:is_suit(suit) then
                    count = count + 1 --Will keep track of suits each
                end
            end
            if count >= 3 then --Looks to see if hand has 3 or more for easy logic
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = function()
                local card = create_card(card_type, G.consumeables, nil, nil, nil, nil, card_type, nil)
                play_sound('mills_jack') 
                card:add_to_deck()
                G.consumeables:emplace(card)
                return true
            end
        }))
        end
    end 
end
end
}
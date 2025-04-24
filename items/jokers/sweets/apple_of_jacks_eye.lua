SMODS.Joker {
    key = 'apple_of_jacks_eye',
    loc_txt = {
        name = 'Apple of Jack\'s Eye',
        text = {
            "If scoring hand contains at least 3 of one suit,",
            "Generate one random snack card"
        }
    },
    config = {},
    atlas = 'apple_of_jacks_eye',
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { }
    end,
    calculate = function(self, card, context)
        if context.scoring_hand and context.cardarea == G.play then
            local suit_count = { H = 0, D = 0, C = 0, S = 0 }
            for _, played_card in ipairs(context.full_hand or {}) do
                local suit = played_card.base.suit
                if suit then
                    suit_count[suit] = (suit_count[suit] or 0) + 1
                end
            end
    
            for _, count in pairs(suit_count) do
                if count >= 3 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local snack_cards = {
                                'slice_of_bread',
                                -- Add your future snack keys here
                            }
                            local selected = pseudorandom_element(snack_cards)
                            local snack_card = create_card('Consumable', G.consumables, selected, 1)
                            G.consumables:emplace(snack_card)
                            G.hand_text:add({ text = 'Snack Break!', scale = 1.1, colour = G.C.MONEY })
                            play_sound('tarot1')
                            return true
                        end
                    }))
                    break -- only 1 card should be added per scoring
                end
            end
        end
    end
}    
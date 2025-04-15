return {
    key = 'apple_of_jacks_eye',
    loc_txt = {
        name = 'Apple of Jack\'s Eye',
        text = {
            "If scoring hand contains at least 3 of one suit,",
            "Generate one random snack card"
        }
    },
    config = {},
    atlas = 'sweets_jokers',
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
            local suits_count = {H = 0, D = 0, C = 0, S = 0}
            for _, played_card in ipairs(context.full_hand or {}) do
                local suit = played_card.base.suit
                suits_count[suit] = (suits_count[suit] or 0) + 1
            end
            for _, count in pairs(suits_count) do
                if count >= 3 then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            local snack_cards = {
                                'slice_of_bread', 'cream_puff', 'kinder_egg', 'bubblegum', 'homeys_doney', 'butterscotch', 'rye_chip'
                            }
                            local chosen = pseudorandom_element(snack_cards)
                            G.consumeables:emplace(create_card('Consumeable', G.consumeables, chosen, 1))
                            play_sound('tarot1')
                            G.hand_text:add({text = 'Sweet Draw!', scale = 1.2, color = G.C.SECONDARY})
                            return true
                        end
                    }))
                    break
                end
            end
        end
    end
}
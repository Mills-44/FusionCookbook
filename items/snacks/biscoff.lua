SMODS.Consumable {
    key = 'biscoff',
    loc_txt = {
        name = 'Biscoff',
        text = "{Choose 2 cards to turn into Candisimo Cards"
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
        G.STATE_ARGS.selecting_card = true
        G:select_cards({
            amount = 2,
            prompt = 'Select 2 cards to become Candisimo',
            must_have = true,
            filter = function(c)
                return c.area == G.hand
            end,
            callback = function(selected)
                for _, c in ipairs(selected) do
                    c:set_edition({candisimo = true})
                    c:juice_up(0.5)
                end
                play_sound('holo1')
                G.hand_text:add({
                    text = "Sweetened!",
                    scale = 1.3,
                    color = G.C.FILTER
                })
            end
        })
        return true
    end
}
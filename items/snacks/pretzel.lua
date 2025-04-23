SMODS.Consumable {
    key = 'pretzel',
    set = 'Snack',
    loc_txt = {
        name = 'Pretzel',
        text = "Select 1 card to become a Cookiesimo Card"
    },
    config = {
        name = 'Pretzel'
    },
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    cost = 3,
    discovered = true,
    unlocked = true, 
    pool = {'c_shop'},
    booster_pack = 'snack_pack',
    use = function(self, card)
        G.STATE_ARGS.selecting_card = true
        G:select_cards({
            amount = 1,
            prompt = 'Select 1 card to become a Cookiesimo Card',
            must_have = true,
            filter = function(c)
                return c.area == G.hand
            end,
            callback = function(selected)
                for _, c in ipairs(selected) do
                    c:set_edition({cookiesimo = true})
                    c:juice_up(0.5)
                end
                play_sound('holo1')
                G.hand_text:add({
                    text = "Salty!",
                    scale = 1.3,
                    color = G.C.FILTER
                })
            end
        })
        return true
    end
}
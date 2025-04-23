SMODS.Consumable {
    key = 'butterscotch',
    set = 'Snack',
    loc_txt = {
        name = "Butterscotch",
        text = {
            "Gains {X:mult,C:white}X0.5{} for each {C:attention}Sweets Joker{},",
            "and multiplies money by total result",
            "{C:inactive}Starts on {X:mult,C:white}1x"
        }
    },
    atlas = 'snack_cards',
    pos = {
        x = 1,
        y = 0
    },
    cost = 3,
    discovered = true,
    unlocked = true,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        local sweet_keys = {
            apple_of_jacks_eye = true,
            barry_b = true,
            gummibar = true,
            honey_nuts_cheerio = true,
            jammin_jelly = true,
            koolaid_man = true,
            nutty_buddy = true,
            peppermint_butler = true,
            stay_puft = true
        }

        local count = 0
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and sweet_keys[j.config.center.key] then
                count = count + 1
            end
        end

        local multiplier = 1 + (0.5 * count)

        G.E_MANAGER:add_event(Event({
            func = function()
                G.GAME.round_money_mult = G.GAME.round_money_mult * multiplier
                create_floating_text("x"..multiplier.." Mult!", G.consumeables, nil, nil, true)
                return true
            end
        }))
    end
}
snacks
SMODS.Consumable {
    key = 'bubblegum',
    set = 'Snack',
    loc_txt = {
        name = "Bubblegum",
        text = {
            "Gives {C:money}$2{} per {C:gold}Gold Card{}",
            "in your deck"
        }
    },
    atlas = 'snack_cards',
    pos = {
        x = 0,
        y = 0
    },
    cost = 3,
    discovered = true,
    unlocked = true,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        local gold_count = 0
                for _, j in ipairs(G.jokers.cards) do
                    if j.edition and j.edition.type == 'gold' then
                        gold_count = gold_count + 1
                    end
                end
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local reward = gold_count * 2
                ease_dollars(reward)
                return true
            end
        }))
    end
}
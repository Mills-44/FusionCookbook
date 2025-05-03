SMODS.Consumable {
    object_type = "Consumable",
    key = 'bubblegum',
    set = "Snack",
    atlas = 'bubblegum',
    pos = { x = 0, y = 0 },
    pools = { Snack = true },
    cost = 3,
    discovered = true,
    unlocked = true,

    can_use = function(self)
        return true 
    end,

    use = function(self, card)
        local gold_count = 0
        -- Count gold cards in deck and hand
        for _, c in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(c, 'm_gold') then
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
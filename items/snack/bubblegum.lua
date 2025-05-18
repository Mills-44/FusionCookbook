SMODS.Consumable {
    object_type = "Consumable",
    key = 'bubblegum',
    set = "Snack",
    atlas = 'snack',
    pos = { 
        x = 2, 
        y = 0 
    },
    pools = { Snack = true },
    cost = 3,
    weight = 10,
    discovered = true,
    unlocked = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
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

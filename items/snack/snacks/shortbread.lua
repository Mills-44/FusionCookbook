-- consumables/custom/merge_sum_consumable.lua

SMODS.Consumable {
    object_type = "Consumable",
    key = 'shortbread',
    set = "Snack",
    atlas = 'shortbread',
    pos = { x = 0, y = 0 },
    config = {
        max_highlighted = 2,
    },
    pools = {
        Custom = true
    },
    cost = 3,
    unlocked = true,
    discovered = true,

    
    can_use = function(self)
        return #G.hand.highlighted == self.config.max_highlighted
    end,

    use = function(self, card, area)
        local selected = G.hand.highlighted
        if #selected ~= 2 then return end

        local base_rank = math.max(1, math.min(#MILLS.base_ranks, math.max(selected) - 1))
        local result_rank = MILLS.base_ranks[base_rank]

        for i = 1, #selected do
            local percent = 0.85 + (i - 0.999) / (#selected - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15, func = function()
                    selected[i]:flip()
                    selected[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end

        draw_card(G.hand, G.play, 1, 'up', false, selected[1], nil, true)
        draw_card(G.hand, G.play, 1, 'up', false, selected[2], nil, true)

        delay(0.4)
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.3, func = function()
                selected[1]:destroy(true)
                selected[2]:destroy(true)

                local new_card = create_card(nil, G.hand, nil, nil, nil, nil, nil, result_rank)
                new_card:add_to_deck()
                G.hand:emplace(new_card)
                return true
            end
        }))

        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.2, func = function()
                G.hand:unhighlight_all()
                return true
            end
        }))

        delay(0.5)
    end
}

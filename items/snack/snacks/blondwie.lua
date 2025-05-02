SMODS.Consumable {
    object_type = "Consumable",
    key = 'blondwie',
    set = "Snack",
    atlas = 'blondwie',
    pos = { x = 0, y = 0 },
    config = {
        max_highlighted = 2,
    },
    pools = {
        Snack = true
    },
    cost = 3,
    unlocked = true,
    discovered = true,

    can_use = function(self)
        return #G.hand.highlighted == self.config.max_highlighted
    end,

    use = function(self, card, area)
        local trig = G.hand.highlighted
        if #trig ~= 2 then return end

        local card1, card2 = trig[1], trig[2]

        local function get_rank_index(c)
            local id = type(c.get_id) == "function" and c:get_id() or nil
            if type(id) ~= "table" then return nil end
            for i, v in ipairs(MILLS.base_ranks) do
                if v == id.rank_index then return i end
            end
            return nil
        end

        local index1 = get_rank_index(card1)
        local index2 = get_rank_index(card2)
        if not index1 or not index2 then return end

        local diff = math.abs(index1 - index2)
        local result_rank = MILLS.base_ranks[math.max(1, math.min(#MILLS.base_ranks, diff + 1))]

        draw_card(G.hand, G.play, 1, 'up', false, card1, nil, true)
        draw_card(G.hand, G.play, 1, 'up', false, card2, nil, true)

        delay(0.4)
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.3, func = function()
                card1:destroy(true)
                card2:destroy(true)

                local new_card = create_card(nil, G.hand, nil, nil, nil, nil, nil, result_rank)
                new_card:add_to_deck()
                G.hand:emplace(new_card)
                play_sound('mills_munch')
                return true
            end
        }))
    end
}
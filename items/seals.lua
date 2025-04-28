SMODS.Seal {
    object_type = "Seal",
    key = "cookie",
    name = "mills-cookie-seal",
    badge_colour = HEX("854508"),
    atlas = 'cookie',
    pos = { x = 0, y = 0 },
    calculate = function(self, card, context)
        if context.discard and context.cardarea == G.hand then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if #G.consumeables.cards < G.consumeables.config.card_limit then
                        local available_snacks = {
                            "c_mills_biscoff",
                            "c_mills_butterscotch",
                            "c_mills_kinder_egg",
                            "c_mills_cream_puff",
                            "c_mills_bubblegum",
                            "c_mills_rye_chip",
                            "c_mills_pretzel",
                            "c_mills_slice_of_bread",
                            "c_mills_homeys_doney"
                        }

                        -- Shuffle the snack list
                        for i = #available_snacks, 1, -1 do
                            local j = love.math.random(i)
                            available_snacks[i], available_snacks[j] = available_snacks[j], available_snacks[i]
                        end
                            if #available_snacks > 0 and #G.consumeables.cards < G.consumeables.config.card_limit then
                                local snack_key = table.remove(available_snacks)
                                local newcard = SMODS.add_card({
                                    set = 'Snack',
                                    area = G.consumeables,
                                    key = snack_key
                                })
                                if newcard then
                                    newcard:add_to_deck()
                                    G.consumeables:emplace(newcard)
                                    newcard:juice_up(0.5, 0.5)
                                    play_sound('mills_munch')
                            end
                        end
                    end
                    return true
                end
            }))
        end
    end
}

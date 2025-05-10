SMODS.Seal {
    object_type = "Seal",
    loc_txt = {
        name = "Cookie Seal",
        label = "Cookie Seal"
    },
    key = 'cookie',
    badge_colour = HEX("854508"),
    atlas = 'cookie',
    pos ={
        x = 0,
        y = 0
    },
    calculate = function(self, card, context)
        if context.discard and context.cardarea == G.hand then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if #G.consumeables.cards < G.consumeables.config.card_limit then
                        if #G.consumeables.cards < G.consumeables.config.card_limit then
                            local newcard = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )
                                newcard:add_to_deck()
                                G.consumeables:emplace(newcard)
                                newcard:juice_up(0.5, 0.5)
                                play_sound('mills_nice')
                        end
                    end
                return true 
            end
            }))
        end
    end
}
                    
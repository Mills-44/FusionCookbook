SMODS.Joker {
    object_type = "Joker",
    key = 'mr_pb_and_jelly',
    atlas = 'mr_pb_and_jelly',
    pos = { x = 0, y = 0 },
    config = {},
    rarity = 3,
    unlocked = true,
    discovered = true,
    in_pool = function(self, args)
        return false
      end,
      
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            for _, v in ipairs(G.play.cards) do
                local count = 0
                if SMODS.has_enhancement(v, 'm_bonus') or SMODS.has_enhancement(v, 'm_mult') then
                    count = count + 1
                    if count ~= 2 then 
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', 
                        delay = 0.4,
                        func = function()
                            play_sound('mills_mrpb')
                            card:juice_up(0.3,0.5)
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                            local new_card = SMODS.create_card{
                                set = 'Snack',
                                area = G.consumeables,
                                key = 'c_mills_', 
                                edition = 'negative'
                            }
                            if new_card then
                                new_card:add_to_deck()
                                G.consumeables:emplace(new_card)
                            end
                            return true
                        end
                    }))
                end
            end
            end
        end
    end
}

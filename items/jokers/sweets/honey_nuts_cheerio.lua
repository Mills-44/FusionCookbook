SMODS.Joker {
    key = 'honey_nut_cheerios',
    loc_txt = {
        name = 'Honey Nut Cheerio\'s',
        text = {
            "All {C:spades}Spades{} played in scoring hand,",
            "turn into Gold Cards"
        }
    },
    config = {},
    atlas = 'honey_nut_cheerios',
    pos = {
        x = 0,
        y = 0
    },
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { }
    end,
    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                if c:is_suit('Spades') then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            c:set_ability('m_gold')
                            c:juice_up(0.4, 0.4)
                            return true
                        end
                    }))
                end
            end
            return {
                message = "Delicious!",
                colour = G.C.GOLD
            }
        end
    end
}    
SMODS.Joker {
    key = 'honey_nuts_cheerio',
    loc_txt = {
        name = 'Honey Nut\'s Cheerio',
        text = {
            "All {C:spades}spades{} played in scoring hand,",
            "turn into Gold Cards"
        }
    },
    config = {},
    atlas = 'sweet_jokers',
    pos = {
        x = 5,
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
        if context.individual and context.cardarea == G.play and context.before then
			if context.other_card:is_suit('Clubs') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                       c:set_ability('m_gold')
                       c:juice_up(0.4, 0.4)
                       return true
                    end
                }))
            end
            return {
                message = "Delicious!",
                colour = G.C.GOLD
            }
        end
    end
}
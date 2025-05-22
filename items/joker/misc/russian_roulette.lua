SMODS.Joker {
    key = 'russian_roulette',
    config = {
        extra = {
        xmult = 4
        }
    },
    atlas = 'misc_jokers',
    pos = {
        x = 1,
        y = 0
    },
    rarity = 2,
    cost = 6,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        } 
    end,
    calculate = function(self, card, context)
   if context.individual and context.cardarea == G.play then
       if context.other_card then
            if context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13 then
                if MILLS.random_chance(.167) then
                    return {
                    xmult = 4,
                    remove = true,
                    card = card
                },
                context.other_card:start_dissolve()
            end
        end
        end
    end
end
}
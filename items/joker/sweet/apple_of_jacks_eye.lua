SMODS.Joker {
    key = 'apple_of_jacks_eye',
    config = {},
    atlas = 'apple_of_jacks_eye',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Sweet = true
     },        
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, card, context)
    if context.cardarea == G.play then
		if context.other_card then
        if context.other_card:get_id() == 3 then
                    return {
                        mult = 4,
                        colour = G.C.MULT,
					    card = card
                    }
                end
            end
        end
    end
}

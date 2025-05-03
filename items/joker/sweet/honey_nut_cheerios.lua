SMODS.Joker {
    key = 'honey_nut_cheerios',
    config = {},
    atlas = 'honey_nut_cheerios',
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
        if context.individual and context.cardarea == G.play then         
        if context.other_card:is_suit("Spades") then -- Check if it is a spade
            for _, c in ipairs(context.scoring_hand) do
            G.E_MANAGER:add_event(Event({
                func = function()
                    c:set_ability('m_gold') -- Turns it to gold
                    play_sound('mills_honey')
                    c:juice_up(0.4, 0.4)
                    return true
                    end
                }))
            end
        end
        return {
            message = "Delicous!",
            colours = G.C.GOLD
        }
    end
end
}
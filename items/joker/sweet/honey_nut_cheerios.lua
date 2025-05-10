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

            local other_card = context.other_card

            if other_card.base.suit == ('Spades') then
            for _,c in ipairs(context.full_hand) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                    c:flip()
                    c:juice_up(.3,.5)
                    return true
                       end}))
                if not SMODS.has_enhancement(c, 'm_gold') then
                    c:set_ability('m_gold',nil,true) 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = .3,
                    func = function()
                    c:flip()
                    return true
                    end}))
                end
            end
        end
    end
end
}   
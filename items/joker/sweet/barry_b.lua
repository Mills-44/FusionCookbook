---@diagnostic disable: undefined-global
SMODS.Joker {
    key = 'barry_b',
    config = {},
    atlas = 'barry_b',
    pos = {
        x = 0,
        y = 0
    },
    pools = { 
        Sweet = true
     },  
    rarity = 2,
    cost = 7,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            if next(context.poker_hands['Four of a Kind']) then
            for _,c in ipairs(context.scoring_hand) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                    c:flip()
                    c:juice_up(.3,.5)
                    return true
                       end}))
                if not SMODS.has_enhancement(c, 'm_glass') then
                    c:set_ability('m_glass',nil,true) 
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = .3,
                    func = function()
                    c:flip()
                    return true
                    end}))
                end
            end
            play_sound('mills_jazz')
            return {
                message = "Jazz?",
                colour = G.C.GOLD,
            }
        end
    end
end
}
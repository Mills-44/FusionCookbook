SMODS.Joker {
    key = 'bob',
    config = {},
    atlas = 'sweet_jokers_1',
    pos = {
        x = 1,
        y = 0
    },
    pools = { 
        Sweet = true
     },
    rarity = 2,
    cost = 6,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return {} --Not needed for this type of card 
    end,
    calculate = function(self, card, context)
        if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
            if next(context.poker_hands['Flush']) then -- Checks if hand contains Flush
                for _,c in ipairs(context.scoring_hand) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.15,
                        func = function()
                        c:flip()
                        c:juice_up(.3,.5)
                        return true
                           end}))
                    if not SMODS.has_enhancement(c, 'm_mills_whippisimo') then
                        c:set_ability('m_mills_whippisimo',nil,true) 
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = .3,
                        func = function()
                        c:flip()
                        return true
                        end}))
                    end
                end
                play_sound('mills_bob')
                return {
                    message = "It's Over!",
                    colour = MILLS.COLORS.BOB,
                }
            end
        end
    end
    }
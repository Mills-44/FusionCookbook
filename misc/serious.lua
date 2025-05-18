SMODS.Joker {
    key = 'serious',
    config = {
        extra = {
            xmult = 1,
            xmult_gain = .2
        }
    },
    atlas = 'misc_jokers',
    pos = {
        x = 3,
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
            card.ability.extra.xmult_gain,
            card.ability.extra.xmult
             }
        }  
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
         if context.before and not context.blueprint then -- Just we dont have something weird happen here tbh
             if next(context.poker_hands['Straight Flush']) then
                 card.ability.extra.xmult = card.ability.extra.xmult + 0.2
            end
        end
    if context.joker_main then
        if next(context.poker_hands['Straight']) then
           return {
                    xmult = card.ability.extra.xmult,
                    card = card
                }
        end
    end
end
}
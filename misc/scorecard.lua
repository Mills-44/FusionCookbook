SMODS.Joker {
    key = 'scorecard',
    config = {
        extra = {
            mult = 0,
            mult_gain = 15,
            mult_loss = 5,
            hands = 3
        }
    },
    atlas = 'misc_jokers',
    pos = {
        x = 2,
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
            card.ability.extra.mult_gain,
            card.ability.extra.mult_loss,
            card.ability.extra.mult
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
        if context.joker_main and ( G.GAME.current_round.hands_left >= card.ability.extra.hands 
        and G.GAME.current_round.hands_left < card.ability.extra.hands + 1) then
            card.ability.extra.mult = card.ability.extra.mult + 15
        else
            card.ability.extra.mult = card.ability.extra.mult - 5
        return {
            mult = card.ability.extra.mult,
            card = card
        }
    end
    end
}
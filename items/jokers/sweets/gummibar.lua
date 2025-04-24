SMODS.Joker {
    key = 'gummibar',
    loc_txt = {
        name = 'Gummibar',
        text = {
            "If the scoring hand is a {C:attention}Straight{},",
           "this Joker gains +3 {C:mult}Mult{}",
           "{C:inactive}Total Mult: {C:mult}+#2#{}"
        }
    },
    config = {
        extra = {
            gain = 3,
            mult = 0
        }, 
    }, 
    atlas = 'gummibar',
    pos = {
        x = 0, 
        y = 0 
    },
    cost = 5,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.gain or 3,
                card.ability.extra.mult or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
            return {
                mult = card.ability.extra.mult
            }
        end

        if context.before and context.scoring_name == "Straight" then
            card.ability.extra.mult = (card.ability.extra.mult or 0) + card.ability.extra.gain
            return {
                message = "Beba bi duba duba yum yum!",
                colour = G.C.MULT,
                card = card
            }
        end
    end
}
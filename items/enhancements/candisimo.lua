SMODS.Enhancement {
    key = "candisimo",
    atlas = 'enhanc_sw',
    pos = {
        x = 1,
        y = 1
    },
    config = {
        extra = {
        chips = 0,
        mult = 0,
        chips_mod = 5,
        mult_mod = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
          vars = {
            card.ability.extra.chips,
            card.ability.extra.mult,
            card.ability.extra.chips_mod,
            card.ability.extra.mult_mod,
          }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            if next(context.poker_hands['High Card']) or next(context.poker_hands['Pair']) or next(context.poker_hands['Two Pair']) or next(context.poker_hands['Three of a Kind']) or next(context.poker_hands['Straight']) or next(context.poker_hands['Flush']) then 
                card.ability.extra.chips = card.ability.extra.chips + 5
                return {
                    message = "+5 Chips!",
                    chips = card.ability.extra.chips
                }
            end
            if next(context.poker_hands['Full House'])  or next(context.poker_hands['Four of a Kind'])  or next(context.poker_hands['Straight Flush']) then
                card.ability.extra.chips = card.ability.extra.mult + 2
                return {
                    message = "+2 Mult!",
                    mult = card.ability.extra.mult
                }
            end
        end
        SMODS.calculate_effect {
            card = card,
          }
    end
}
SMODS.Joker {
    key = 'gummibar',
    loc_txt = {
        name = 'Gummibar',
        text = {
           "When scoring hand contains a {C:attention}Two Pair,",
           "this Joker gains +3 {C:mult}Mult{}"
        }
    },
    config = {
        extra = {
            gain = 3,
            mult = 0
        }, 
    }, 
    atlas = 'sweet_jokers',
    pos = {
        x = 7, 
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
            chips = card.ability.extra.mult
          }
        end
        if context.joker_main and not context.before then
            return {
                mult = card.ability.extra.mult
            }
        end
        if context.before and context.full_hand then
            local pair_count = 0
            local rank_counts = {}
            for _, c in ipairs(context.full_hand) do
                local v = c.base.value
                rank_counts[v] = (rank_counts[v] or 0) + 1
            end

            for _, count in pairs(rank_counts) do
                if count == 2 then
                    pair_count = pair_count + 1
                end
            end

            if pair_count == 2 then
                card.ability.extra.mult = (card.ability.extra.mult or 0) + card.ability.extra.gain
                return {
                    message = "Beba bi duba duba yum yum!",
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end
}
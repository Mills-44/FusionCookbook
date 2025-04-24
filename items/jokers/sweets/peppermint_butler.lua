SMODS.Joker {
    key = 'peppermint_butler',
    loc_txt = {
        name = 'Peppermint Butler',
        text = {
           "If the scoring hand contains a {C:attention}Pair{},",
           "this Joker gains {C:chips}+#1#{} Chips (Total: {C:chips}#2#{})"
        }
    },
    config = {
        extra = {
            gain = 5,
            chips = 0
        }, 
    }, 
    atlas = 'peppermint_butler',
    pos = {
        x = 0, 
        y = 0 
    },
    cost = 4,
    rarity = 1,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { 
            vars = { 
                card.ability.extra.gain or 5,
                card.ability.extra.chips or 0
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
        return {
            chips = card.ability.extra.chips or 0
          }
        end
        if context.before and context.full_hand then
            local rank_counts = {}
            for _, c in ipairs(context.full_hand) do
                local v = c.base.value
                rank_counts[v] = (rank_counts[v] or 0) + 1
            end

            for _, count in pairs(rank_counts) do
                if count == 2 then
                    card.ability.extra.chips = (card.ability.extra.chips or 0) + (card.ability.extra.gain or 5)
                    return {
                        message = "Minty!",
                        colour = G.C.CHIPS,
                        card = card
                    }
                end
            end
        end
    end
}
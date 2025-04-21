SMODS.Joker {
    key = 'peppermint_butler',
    loc_txt = {
        name = 'Peppermint Butler',
        text = {
           "When scoring hand contains a {C:attention}Pair{},",
           "this Joker gains +5 {C:chips}Chips{}"
        }
    },
    config = {
        extra = {
            gain = 5,
            chips = 0
        }, 
    }, 
    atlas = 'sweet_jokers',
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
            chips = card.ability.extra.chips
          }
        end
        if context.before and context.scoring_name and (context.scoring_name == "") then
            if context.before and context.full_hand then
                local has_pair = false
                local rank_counts = {}
            
                for _, c in ipairs(context.full_hand) do
                    rank_counts[c.base.value] = (rank_counts[c.base.value] or 0) + 1
                end
            
                for _, count in pairs(rank_counts) do
                    if count == 2 then
                        has_pair = true
                        break
                    end
                end
            
                if has_pair then
                    card.ability.extra.chips = (card.ability.extra.chips or 0) + card.ability.extra.gain
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
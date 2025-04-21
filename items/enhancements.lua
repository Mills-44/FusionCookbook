
local candisimo = {
    key = "candisimo",
    loc_txt = {
        name = "Candisimo",
        text ={ 
            "If scored hand is a {C:attention}Flush or lower{}, gain {C:chips}+5{} chips, ",
            "If scored hand is a {C:attention}Full House or higher{}, gain {C:mult}+2{} mult"
        }
    },
    atlas = "enhancements",
    pos = {
        x = 0,
        y = 0
    },

    -- Runs when enhanced card is scored only
    calculate = function(self, card, context)
        if context.scoring_card and context.cardarea == G.play and context.full_hand then
            local handname = context.handname or ""

            -- Hands ranked Flush or below
            local flush_or_lower = {
                High_Card = true,
                Pair = true,
                Two_Pair = true,
                Three_of_a_Kind = true,
                Straight = true,
                Flush = true
            }
-- Gives chips 
            if flush_or_lower[handname] then
                return {
                    chips = 5,
                    message = "Sweet Boost!",
                    colour = G.C.CHIPS,
                    card = card
                }
            else
-- Will give multiplier instead               
                return {
                    mult = 2,
                    message = "Sugary Stack!",
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end,
    loc_vars = function(self, card)
        local chips = 0
        local mult = 0
    
        if card.ability and card.ability.extra then
            chips = card.ability.extra.candisimo_chips or 0
            mult = card.ability.extra.candisimo_mult or 0
        end
    
        return {
            vars = { chips, mult }
        }
    end
}


local cookiesimo = {
    key = "cookiesimo",
    loc_txt = {
        name = "Cookiesimo",
        text ={  "On score, triggers a random sweet surprise equal to the rank of card"
        }
    },
    atlas = "enhancements",
    pos = {
        x = 1,
        y = 0
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card and card.ability and card.ability.name or ""
            }
        }
    end,
    -- Runs when enhanced card is scored only
    calculate = function(self, card, context)
        if context.scoring_card and context.cardarea == G.play and context.full_hand then
            local rank = card:get_id() or 1
            local GAIN_TABLE = {
                { key = "chips", weight = 20, effect = function() return {chips = 5 * rank, message = "+"..(5 * rank).." Chips!", colour = G.C.CHIPS} end },
                { key = "mult", weight = 20, effect = function() return {mult = math.ceil(rank / 2), message = "+"..math.ceil(rank / 2).." Mult!", colour = G.C.MULT} end },
                { key = "money", weight = 10, effect = function() G.GAME.dollars = G.GAME.dollars + math.ceil(rank / 2); return {message = "$"..math.ceil(rank / 2).." Bonus!", colour = G.C.MONEY} end },
                { key = "hand_size", weight = 5, effect = function() G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1; return {message = "+1 Hand!", colour = G.C.FILTER} end },
                { key = "discard", weight = 10, effect = function() G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1; return {message = "+1 Discard!", colour = G.C.LBLUE} end },
                { key = "tag", weight = 8, effect = function() G.GAME.tag_pool:gain_random_tag(); return {message = "Free Tag!", colour = G.C.RARE} end },
                { key = "voucher", weight = 2, effect = function() G.GAME.voucher_pool:gain_random_voucher(); return {message = "Voucher Surprise!", colour = G.C.VOUCHER} end },
                { key = "tarot", weight = 5, effect = function() G.GAME.tarot_pool:add_random(); return {message = "Tarot Gift!", colour = G.C.TAROT} end },
                { key = "planet", weight = 5, effect = function() G.GAME.planet_pool:add_random(); return {message = "Planet Gift!", colour = G.C.PLANET} end },
                { key = "snack_cards", weight = 5, effect = function() SMODS.ConsumablePool:add_random(); return {message = "Snack Treat!", colour = G.C.CONSUMABLE} end }
            }

            local total_weight = 0
            for _, option in ipairs(GAIN_TABLE) do total_weight = total_weight + option.weight end

            local rand = pseudorandom(1, total_weight)
            local current = 0
            for _, option in ipairs(GAIN_TABLE) do
                current = current + option.weight
                if rand <= current then
                    local result = option.effect()
                    result.card = card
                    play_sound('generic1')
                    return result
                end
            end
        end
    end
}

return {candisimo, cookiesimo}


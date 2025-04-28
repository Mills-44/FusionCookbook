SMODS.Enhancement {
    object_type = "Enhancement",
    key = "candisimo",
    name = "Candisimo",
    atlas = 'candisimo',
    pos = { x = 0, y = 0 },
    config = { 
        extra = {
        chips = 5,
        mult = 2,
        }
},
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            vars = { 
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            local scoring_hand = G.FUNCS.get_poker_hand_info(G.play.cards)
             if scoring_hand == "High Card" or "Pair" or "Two Pair" or "Three of a Kind" or "Straight" or "Flush" then
                return {
                    message = "+5 Chips!",
                    colour = G.C.CHIPS,
                    chips = card.ability.chips + card.ability.bonus_gain,
                }
            end
            if scoring_hand == "Full House" or "Four of a Kind" or "Five of a Kind" or "Straight Flush" or "Royal Flush" or "Flush House" then
                return {
                    message = "+2 Mult!",
                    colour = G.C.MULT,
                    mult = card.ability.mult + card.ability.mult_gain,
                }
        end
    end
end
}
SMODS.Enhancement {
    object_type = "Enhancement",
    key = "cookiesimo",
    name = "Cookiesimo",
    atlas = "cookiesimo",
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            chips = 100,
            mult = 25,
            x_mult = 2,
            p_dollars = 5,
        }
    },
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
        return {
            card.ability.extra.x_mult,
            card.ability.extra.mult,
            card.ability.extra.chips,
            card.ability.extra.p_dollars
        }
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            local weighted_outcomes = {
                { outcome = "chips", weight = 30 },
                { outcome = "mult", weight = 20 },
                { outcome = "x_mult", weight = 15 },
                { outcome = "tarot", weight = 5 },
                { outcome = "spectral", weight = 5 },
                { outcome = "planet", weight = 5 },
                { outcome = "snack", weight = 5 },
                { outcome = "money", weight = 15 },
            }

            local function weighted_random_choice(tbl)
                local total_weight = 0
                for _, v in ipairs(tbl) do
                    total_weight = total_weight + v.weight
                end
                local rnd = math.random() * total_weight
                local cum_weight = 0
                for _, v in ipairs(tbl) do
                    cum_weight = cum_weight + v.weight
                    if rnd <= cum_weight then
                        return v.outcome
                    end
                end
            end

            local outcome = weighted_random_choice(weighted_outcomes)

            if outcome == "chips" then
                return { chips = card.ability.extra.chips }

            elseif outcome == "mult" then
                return { mult = card.ability.extra.mult }

            elseif outcome == "x_mult" then
                return { x_mult = card.ability.extra.x_mult }

            elseif outcome == "money" then
                ease_dollars(card.ability.extra.p_dollars)
                return { message = "+$"..tostring(card.ability.extra.p_dollars) }

            elseif outcome == "tarot" then
                local tarot = {
                    "c_fool", "c_magician", "c_high_priestess", "c_empress", "c_emperor",
                    "c_hierophant", "c_lovers", "c_chariot", "c_justice", "c_hermit",
                    "c_wheel_of_fortune", "c_strength", "c_hanged_man", "c_death",
                    "c_temperance", "c_devil", "c_tower", "c_star", "c_moon",
                    "c_sun", "c_judgement", "c_world",
                }
                local newcard = SMODS.add_card {
                    set = 'Tarot',
                    area = G.consumeables,
                    key = tarot[math.random(#tarot)]
                }
                if newcard then newcard:juice_up(0.4, 0.4) end

            elseif outcome == "spectral" then
                local spectral = {
                    "c_familiar", "c_grim", "c_ectoplasm", "c_wraith", "c_banshee",
                    "c_poltergeist", "c_spectre", "c_phantom", "c_apparition",
                    "c_haunt", "c_spook", "c_geist", "c_mills_munch"
                }
                local newcard = SMODS.add_card {
                    set = 'Spectral',
                    area = G.consumeables,
                    key = spectral[math.random(#spectral)]
                }
                if newcard then newcard:juice_up(0.4, 0.4) end

            elseif outcome == "snack" then
                local snack = {
                    "c_mills_biscoff", "c_mills_butterscotch", "c_mills_kinder_egg",
                    "c_mills_pretzel", "c_mills_cream_puff", "c_mills_bubblegum"
                }
                local newcard = SMODS.add_card {
                    set = 'Snack',
                    area = G.consumeables,
                    key = snack[math.random(#snack)]
                }
                if newcard then newcard:juice_up(0.4, 0.4) end

            elseif outcome == "planet" then
                local planet = {
                    "c_earth", "c_mars", "c_jupiter", "c_saturn", "c_venus",
                    "c_mercury", "c_neptune", "c_uranus", "c_pluto"
                }
                local newcard = SMODS.add_card {
                    set = 'Planet',
                    area = G.consumeables,
                    key = planet[math.random(#planet)]
                }
                if newcard then newcard:juice_up(0.4, 0.4) end
            end
        end
    end
}

SMODS.Enhancement {
    key = "cookiesimo",
    loc_txt = {
        name = "Cookiesimo",
        text = {
            "On score, trigger a {C:attention}sweet surprise{} based on",
            "the card's rank. Bonus includes mult, chips, money, or more!"
        }
    },
    atlas = "enhancements",
    pos = { x = 1, y = 0 },
    rarity = 2,

    config = {
        rewards = {
            { id = "chips", weight = 5 },
            { id = "mult", weight = 4 },
            { id = "money", weight = 3 },
            { id = "tarot", weight = 2 },
            { id = "snack", weight = 2 },
            { id = "spectral", weight = 1 },
            { id = "planet", weight = 2 }
        }
    },

    calculate = function(self, card, context)
        if not context or not context.scoring_card then return end
    
        local power = card:get_id() -- card rank (2–14)
        local pool = self.config.rewards
        local total_weight = 0
    
        for _, reward in ipairs(pool) do
            total_weight = total_weight + reward.weight
        end
    
        local roll = pseudorandom("cookiesimo", power) * total_weight
        local chosen = nil
        local accum = 0
    
        for _, reward in ipairs(pool) do
            accum = accum + reward.weight
            if roll <= accum then
                chosen = reward.id
                break
            end
        end
    
        if chosen == "chips" then
            return { chip_mod = power }
    
        elseif chosen == "mult" then
            return { mult_mod = math.ceil(power / 3) }
    
        elseif chosen == "money" then
            G.GAME.dollars = G.GAME.dollars + math.ceil(power / 2)
            G.hand_text:add({ text = "+$" .. math.ceil(power / 2), color = G.C.MONEY, scale = 1.2 })
    
        elseif chosen == "tarot" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local card = create_card("Tarot", G.consumeables, nil, nil, true, true)
                    if card then
                        G.consumeables:emplace(card)
                        card:start_materialize()
                    end
                    return true
                end
            }))
    
        elseif chosen == "snack" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local snack = create_card("Snack", G.consumeables, nil, nil, true, true, nil, "mills_snack_pack")
                    if snack then
                        G.consumeables:emplace(snack)
                        snack:start_materialize()
                    end
                    return true
                end
            }))
    
        elseif chosen == "spectral" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local spectral = create_card("Spectral", G.consumeables, nil, nil, true, true)
                    if spectral then
                        G.consumeables:emplace(spectral)
                        spectral:start_materialize()
                    end
                    return true
                end
            }))
    
        elseif chosen == "planet" then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local planet = create_card("Planet", G.consumeables, nil, nil, true, true)
                    if planet then
                        G.consumeables:emplace(planet)
                        planet:start_materialize()
                    end
                    return true
                end
            }))
        end
    end
}    
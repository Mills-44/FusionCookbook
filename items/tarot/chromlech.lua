SMODS.Consumable {
    object_type = "Consumable",
    key = 'chromlech',
    set = "Tarot",
    atlas = 'chromlech',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        max_highlighted = 2,
        unlock_condition = function()
            local function has_required_combo()
                local has_stone = false
                local has_bonus = false
                local has_wild = false
    
                local piles = {G.hand.cards, G.deck.cards, G.discard.cards}
                for _, pile in ipairs(piles) do
                    for _, card in ipairs(pile) do
                        if card.enhancement == "m_stone" then
                            has_stone = true
                        elseif card.enhancement == "m_bonus" then
                            has_bonus = true
                        elseif card.enhancement == "m_wild" then
                            has_wild = true
                        end
                    end
                end
    
                return has_stone and (has_bonus or has_wild)
            end
    
            return has_required_combo()
        end
    },
    pools = { 
        Tarot = true
    },
    cost = 3,
    unlocked = false,
    discovered = true,
    
    can_use = function(self, card)
        -- Only usable when hand is out (in play) or in shop
        if not G or not G.hand then return false end
        local highlighted = G.hand.highlighted or {}
        local ability = card.ability or {}
        local max_highlighted = ability.max_highlighted or 2

        return #highlighted <= max_highlighted and #highlighted > 0
    end,

    use = function(self, card, area, copier)
        local highlighted = G.hand.highlighted or {}
        if #highlighted > 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))

            for _, c in ipairs(highlighted) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                    func = function()
                        c:flip()
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for _, c in ipairs(highlighted) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                    func = function()
                        G.hand:remove_from_highlighted(c)
                        c:flip()
                        if MILLS.random_chance(.5) then
                            c:set_ability(G.P_CENTERS['m_mills_cob'], true, nil)
                        else 
                            c:set_ability(G.P_CENTERS['m_mills_bou'], true, nil)    
                        end
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end
}
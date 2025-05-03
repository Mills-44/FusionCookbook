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
        if #G.hand.highlighted > 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(v, 'm_wild') or
               SMODS.has_enhancement(v, 'm_stone') or
               SMODS.has_enhancement(v, 'm_bonus') then
                return true
            else return false
            end
        return true
        end
    end,
    
    use = function(self, card, area, copier)
        if #G.hand.highlighted > 2 then
            return false
        end
        
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for _, v in ipairs(G.hand.highlighted) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15,
                func = function()
                    if SMODS.has_enhancement(v, 'm_mult') then
                        v:set_ability ("m_mills_cinna",nil,true)
                    end

                    if SMODS.has_enhancement(v, 'm_bonus') then
                        v:set_ability ("m_mills_cob",nil,true)
                    end

                    if SMODS.has_enhancement(v, 'm_stone') then
                        if MILLS.random_chance(.5) then
                            v:set_ability('m_mills_cinna') -- Turns it to wild
                           else
                            v:set_ability('m_mills_cob')
                        end
                     end
                    return true
                end
            }))
        end
    end
}
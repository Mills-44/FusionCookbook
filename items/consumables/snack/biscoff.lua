---@type Consumable 
SMODS.Consumable {
    object_type = "Consumable",
    key = 'biscoff',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        max_highlighted = 2,
    },
    pools = { 
        Snack = true
     },
    cost = 3,
    weight = 10,
    unlocked = true,
    discovered = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
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
        if #highlighted == 0 then return end

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
                        c:set_ability(G.P_CENTERS['m_mills_candisimo'], true, nil)
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
    end
}

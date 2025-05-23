SMODS.Consumable  {
    object_type = "Consumable",
    key = 'whipping_cream',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 4,
        y = 2
    },
    config = {
        max_highlighted = 2,
        mod_conv = 'm_mills_whippisimo'
    },
    cost = 4,
    weight = 10,
    unlocked = true,
    pools = { 
        Snack = true
     },
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
                        c:set_ability(G.P_CENTERS['m_mills_whippisimo'], true, nil)
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end
}

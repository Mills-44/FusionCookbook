SMODS.Consumable {
    object_type = "Consumable",
    key = 'rock_candy',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 0,
        y = 2
    },
    config = {
        max_highlighted = 2,
        extra = {
            odd = 10
            } 
    },
    pools = { 
        Snack = true
    },
    weight = 5,
    cost = 4,
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
        if #G.hand.highlighted > 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(v, 'm_glass') or
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
                    if SMODS.has_enhancement(v, 'm_bonus') then
                        if MILLS.random_chance(.75) then
                            v:set_ability('m_mills_tempered') 
                           else
                            v:set_ability('m_mills_crack')
                        end
                    end
                    if SMODS.has_enhancement(v, 'm_glass') then
                        if MILLS.random_chance(.6) then
                            v:set_ability('m_mills_tempered') 
                           else
                            v:set_ability('m_mills_crack')
                        end
                     end
                    return true
                end
            }))
        end
    end
}

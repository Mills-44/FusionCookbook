SMODS.Consumable {
    object_type = "Consumable",
    key = 'blondwie',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 1,
        y = 0
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
    weight = 2,
    cost = 5,
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
            if SMODS.has_enhancement(v, 'm_gold') or
               SMODS.has_enhancement(v, 'm_mult') or
               SMODS.has_enhancement(v, 'm_lucky') then
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
                        if MILLS.random_chance(.7) then
                            v:set_ability('m_mills_rhondite') 
                           else
                            v:set_ability('m_mills_prize')
                        end
                    end
                    if SMODS.has_enhancement(v, 'm_lucky') then
                        if MILLS.random_chance(.7) then
                            v:set_ability('m_mills_prize') 
                           else
                            v:set_ability('m_mills_rhondite')
                        end
                     end
                    if SMODS.has_enhancement(v, 'm_gold') then
                     if MILLS.random_chance(.5) then
                        v:set_ability('m_mills_rhondite') 
                       else
                        v:set_ability('m_mills_prize')
                    end
                 end
                    return true
                end
            }))
        end
    end
}

SMODS.Consumable {
    object_type = "Consumable",
    key = 'take_5',
    set = "Snack",
    atlas = 'take_5',
    pos = {
        x = 0,
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
    
    can_use = function(self, card)
        if #G.hand.highlighted > 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(v, 'm_glass') or
               SMODS.has_enhancement(v, 'm_mult') or
               SMODS.has_enhancement(v, 'm_wild') then
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
                        if MILLS.random_chance(.80) then
                            v:set_ability('m_mills_power') 
                           else
                            v:set_ability('m_mills_stain')
                        end
                    end
                    if SMODS.has_enhancement(v, 'm_glass') then
                        if MILLS.random_chance(.65) then
                            v:set_ability('m_mills_stain') 
                           else
                            v:set_ability('m_mills_power')
                        end
                     end
                    if SMODS.has_enhancement(v, 'm_wild') then
                     if MILLS.random_chance(.5) then
                        v:set_ability('m_mills_stain') 
                       else
                        v:set_ability('m_mills_power')
                    end
                 end
                    return true
                end
            }))
        end
    end
}

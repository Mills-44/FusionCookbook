SMODS.Consumable {
    object_type = "Consumable",
    key = 'animal',
    set = "Tarot",
    atlas = 'animal',
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
        Tarot = true
     },
    cost = 3,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        if #G.hand.highlighted > 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(v, 'm_bonus') or
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
                    if SMODS.has_enhancement(v, 'm_bonus') then
                        if MILLS.random_chance(.6) then
                        v:set_ability ("m_mills_lots",nil,true)
                        else
                        v:set_ability ("m_mills_untamed",nil,true) 
                        end
                    end

                    if SMODS.has_enhancement(v, 'm_mult') then
                        if MILLS.random_chance(.7) then
                        v:set_ability ("m_mills_feral",nil,true)
                        else
                        v:set_ability ("m_mills_extra",nil,true) 
                        end
                    end

                    if SMODS.has_enhancement(v, 'm_wild') then
                        if MILLS.random_chance(.5) then
                            v:set_ability('m_mills_untamed') 
                           else
                            v:set_ability('m_mills_feral')
                        end
                     end
                    return true
                end
            }))
        end
    end
}

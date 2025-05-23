SMODS.Consumable {
    object_type = "Consumable",
    key = 'thermality',
    set = "Tarot",
    atlas = 'tarot',
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
         if #G.hand.highlighted ~= 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and 
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and 
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') then
                return true
            else return false
            end
        return true
        end
    end,
    
    use = function(self, card, area)     
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

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_lava",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_lav",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_power",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_water",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_wat",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_lots",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') then
                       if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_bou",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_boulder",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_granite",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end
                
                    return true 
                end
            }))
        end
    end
}

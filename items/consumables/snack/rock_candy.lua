SMODS.Consumable {
    object_type = "Consumable",
    key = 'cake_pop',
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
    cost = 4,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
         if #G.hand.highlighted ~= 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and  SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
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

                if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_tempered",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_temp",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_temp",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                   if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_ori",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_orichal",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_orichal",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_dia",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_diamond",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_diamond",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end
                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then                   
                        G.hand.highlighted[1]:set_ability ("m_mills_phil",nil,true)
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_phil",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end
                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') then
                     G.hand.highlighted[1]:set_ability ("m_mills_crack",nil,true)
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_crack",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                   G.hand.highlighted[1]:set_ability ("m_mills_lots",nil,true)
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_lots",nil,true)
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

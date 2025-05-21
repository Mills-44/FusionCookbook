SMODS.Consumable {
    object_type = "Consumable",
    key = 'choffle',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 2,
        y = 2
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
    cost = 4,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
         if #G.hand.highlighted ~= 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and  SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then
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
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                    if MILLS.random_chance(.35) then
                        G.hand.highlighted[1]:set_ability ("m_mills_ori",nil,true)
                    elseif MILLS.random_chance(.8) then
                        G.hand.highlighted[1]:set_ability ("m_mills_lots",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_orichal",nil,true)
                    elseif MILLS.random_chance(.65) then
                        G.hand.highlighted[2]:set_ability ("m_mills_lots",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                    if MILLS.random_chance(.65) then
                        G.hand.highlighted[1]:set_ability ("m_mills_scratch",nil,true)
                    elseif MILLS.random_chance(.7) then
                        G.hand.highlighted[1]:set_ability ("m_mills_lots",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_scra",nil,true)
                    elseif MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_lots",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
                    if MILLS.random_chance(.4) then
                        G.hand.highlighted[1]:set_ability ("m_mills_money",nil,true)
                    elseif MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_ori",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_orichal",nil,true)
                    elseif MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_mon",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then
                    if MILLS.random_chance(.8) then
                        G.hand.highlighted[1]:set_ability ("m_mills_seren",nil,true)
                    else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.6) then
                        G.hand.highlighted[2]:set_ability ("m_mills_seren",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end
                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
                    if MILLS.random_chance(.7) then
                        G.hand.highlighted[1]:set_ability ("m_mills_fortune",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.49) then
                        G.hand.highlighted[2]:set_ability ("m_mills_fortune",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[1]:set_ability ("m_mills_lots",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.25) then
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

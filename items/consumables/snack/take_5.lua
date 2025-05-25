SMODS.Consumable {
    object_type = "Consumable",
    key = 'take_5',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 3,
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
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    can_use = function(self, card)
         if #G.hand.highlighted ~= 2 then
            return false
        end
        
        for _, v in ipairs(G.hand.highlighted) do
            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and  SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
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
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                   if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_scratch",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_scra",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_scra",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_cry",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_crystal",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_crystal",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end
                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then                   
                        G.hand.highlighted[1]:set_ability ("m_mills_seren",nil,true)
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_seren",nil,true)
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

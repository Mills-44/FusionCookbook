SMODS.Consumable {
    object_type = "Consumable",
    key = 'cake_pop',
    set = "Snack",
    atlas = 'snack',
    pos = {
        x = 1,
        y = 1
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
            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and  SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') then
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

                if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_money",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_mon",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_mon",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
                   if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_electrum",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_elec",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_elec",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then
                     if MILLS.random_chance(.75) then
                        G.hand.highlighted[1]:set_ability ("m_mills_iron",nil,true)
                    else
                        G.hand.highlighted[1]:set_ability ("m_mills_ir",nil,true)
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_ir",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end
                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') then                   
                        G.hand.highlighted[1]:set_ability ("m_mills_titanium",nil,true)
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_titanium",nil,true)
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

                
                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
                   G.hand.highlighted[1]:set_ability ("m_mills_phil",nil,true)
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_phil",nil,true)
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

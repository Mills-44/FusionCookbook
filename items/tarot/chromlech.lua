SMODS.Consumable {
    object_type = "Consumable",
    key = 'chromlech',
    set = "Tarot",
    atlas = 'tarot',
    pos = {
        x = 1,
        y = 0
    },
     in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'ar1')
end,
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
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') or 
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') or
               SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
               SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult') then
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
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult') then
                    if MILLS.random_chance(.25) then
                        G.hand.highlighted[1]:set_ability ("m_mills_power",nil,true)
                    elseif MILLS.random_chance(.8) then
                        G.hand.highlighted[1]:set_ability ("m_mills_cinna",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_power",nil,true)
                    elseif MILLS.random_chance(.6) then
                        G.hand.highlighted[2]:set_ability ("m_mills_cinna",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                    if SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') then
                    if MILLS.random_chance(.7) then
                        G.hand.highlighted[1]:set_ability ("m_mills_cob",nil,true)
                    elseif MILLS.random_chance(.5) then
                        G.hand.highlighted[1]:set_ability ("m_mills_cinna",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.6) then
                        G.hand.highlighted[2]:set_ability ("m_mills_cinna",nil,true)
                    elseif MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_cob",nil,true)
                    else
                        G.hand.highlighted[2]:start_dissolve()
                    end
                end

                  if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') or 
                   SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
                   SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                    if MILLS.random_chance(.25) then
                        G.hand.highlighted[1]:set_ability ("m_mills_cob",nil,true)
                    elseif MILLS.random_chance(.7) then
                        G.hand.highlighted[1]:set_ability ("m_mills_bou",nil,true)
                        else
                        G.hand.highlighted[1]:start_dissolve()
                        end
                    if MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_cob",nil,true)
                    elseif MILLS.random_chance(.5) then
                        G.hand.highlighted[2]:set_ability ("m_mills_bou",nil,true)
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

---@diagnostic disable: duplicate-index
SMODS.Consumable {
    object_type = "Consumable",
    key = 'enh_fus',
    set = "Fusion",
    atlas = 'fusion',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        max_highlighted = 2,
    },
    pools = { 
        Fusion = true
     },
    cost = 10,
    unlocked = true,
    discovered = true,
    can_use = function(self, card)
        if #G.hand.highlighted ~= 2 then
            return false
        end
        for _, v in ipairs(G.hand.highlighted) do
            if not next(SMODS.get_enhancements(v)) then
                return false
            end
        end
        return true
    end,
    use = function(self, card, area, copier)
        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
           SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus') then
                G.hand.highlighted[1]:set_ability ("m_mills_lots",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end

            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
              or
              SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult') then
                G.hand.highlighted[1]:set_ability ("m_mills_extra",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end


            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
              or
              SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') then
              G.hand.highlighted[1]:set_ability ("m_mills_untamed",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

          if SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') then
                G.hand.highlighted[1]:set_ability ("m_mills_tempered",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end

            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
              or
              SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') then
                G.hand.highlighted[1]:set_ability ("m_mills_sapph",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end

         if SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') then
                G.hand.highlighted[1]:set_ability ("m_mills_cob",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end

            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
              or
              SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
                G.hand.highlighted[1]:set_ability ("m_mills_ori",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end

            if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_bonus')
              or
              SMODS.has_enhancement(G.hand.highlighted[1], 'm_bonus') and
              SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then
                G.hand.highlighted[1]:set_ability ("m_mills_scratch",nil,true)
                G.hand.highlighted[2]:start_dissolve()
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    return true
                    end}))
            end
         if SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult') then
              G.hand.highlighted[1]:set_ability ("m_mills_power",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult')
          or
          SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') then
            G.hand.highlighted[1]:set_ability ("m_mills_feral",nil,true)
            G.hand.highlighted[2]:start_dissolve()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.75,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                   end}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.00,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                end}))
        end

         if SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') then
              G.hand.highlighted[1]:set_ability ("m_mills_color",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult')
          or
          SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') then
            G.hand.highlighted[1]:set_ability ("m_mills_ruby",nil,true)
            G.hand.highlighted[2]:start_dissolve()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.75,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                   end}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.00,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                end}))
        end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') then
              G.hand.highlighted[1]:set_ability ("m_mills_cinna",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult')
          or
          SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
            G.hand.highlighted[1]:set_ability ("m_mills_rhondite",nil,true)
            G.hand.highlighted[2]:start_dissolve()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.75,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                   end}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.00,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                end}))
        end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_mult')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_mult') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then
              G.hand.highlighted[1]:set_ability ("m_mills_prize",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

          if SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild') then
              G.hand.highlighted[1]:start_dissolve()
              G.hand.highlighted[2]:start_dissolve()
              SMODS.add_card({key = "j_mills_monster"})
          end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_glass') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild')
          or
          SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_glass') then
            G.hand.highlighted[1]:set_ability ("m_mills_stain",nil,true)
            G.hand.highlighted[2]:start_dissolve()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.75,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                   end}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.00,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                end}))
        end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_steel') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_steel') then
              G.hand.highlighted[1]:set_ability ("m_mills_claws",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

          if SMODS.has_enhancement(G.hand.highlighted[1], 'm_stone') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild')
          or
          SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_stone') then
            G.hand.highlighted[1]:set_ability ("m_mills_bou",nil,true)
            G.hand.highlighted[2]:start_dissolve()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.75,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                   end}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.00,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                end}))
        end

        if SMODS.has_enhancement(G.hand.highlighted[1], 'm_gold') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild')
            or
            SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
            SMODS.has_enhancement(G.hand.highlighted[2], 'm_gold') then
              G.hand.highlighted[1]:set_ability ("m_mills_pig",nil,true)
              G.hand.highlighted[2]:start_dissolve()
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 0.75,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                     end}))
              G.E_MANAGER:add_event(Event({
                  trigger = 'after',
                  delay = 1.00,
                  func = function()
                  G.hand.highlighted[1]:flip()
                  return true
                  end}))
          end

          if SMODS.has_enhancement(G.hand.highlighted[1], 'm_lucky') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_wild')
          or
          SMODS.has_enhancement(G.hand.highlighted[1], 'm_wild') and
          SMODS.has_enhancement(G.hand.highlighted[2], 'm_lucky') then
            G.hand.highlighted[1]:set_ability ("m_mills_clover",nil,true)
            G.hand.highlighted[2]:start_dissolve()
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.75,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                   end}))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 1.00,
                func = function()
                G.hand.highlighted[1]:flip()
                return true
                end}))
        end
    end}




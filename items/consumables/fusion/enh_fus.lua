---@diagnostic disable: duplicate-index

--Fusing card go boioioing

SMODS.DrawStep({
key = "floating_sprite",
order = 59,
func = function(self)
    if self.ability.name == "c_mills_enh_fus" and (self.config.center.discovered or self.bypass_discovery_center) then
        local scale_mod = 0.05 + 0.05*math.sin(1.8*G.TIMERS.REAL) + 0.03*math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL))*math.pi*11)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^3
        local rotate_mod = 0.1*math.sin(1.219*G.TIMERS.REAL) + 0.07*math.sin((G.TIMERS.REAL)*math.pi*5)*(1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL)))^2

        self.children.floating_sprite.role.draw_major = self
        self.children.floating_sprite:draw_shader('dissolve',0, nil, nil, self.children.center,scale_mod, rotate_mod,nil, 0.1 + 0.03*math.sin(1.8*G.TIMERS.REAL),nil, 0.6)
        self.children.floating_sprite:draw_shader('dissolve', nil, nil, nil, self.children.center, scale_mod, rotate_mod)
    end
end
})

-- card itself

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
    shop_rate = 1.0,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
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
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.75,
                    func = function()
                    G.hand.highlighted[1]:flip()
                    G.hand.highlighted[2]:flip()
                    G.hand.highlighted[1]:juice_up(.3,.5)
                    G.hand.highlighted[2]:juice_up(.3,.5)
                    return true
                       end}))
                G.hand.highlighted[1]:set_ability ("m_mills_lots",nil,true)
                G.hand.highlighted[2]:start_dissolve()
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




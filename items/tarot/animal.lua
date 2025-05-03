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
        max_highlighted = 0,
        odd = 10
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
            if not SMODS.has_enhancement(v, "m_bonus", "m_mult", "m_wild") then
                return false
            end
        end
        return true
    end,
    use = function(self, card, area, copier)
        local highlighted = G.hand.highlighted or {}
        if #highlighted == 0 then return end

        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
            func = function()
                card:juice_up(0.3, 0.5)
                return true
            end
        }))

        for _, c in ipairs(highlighted) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.15,
                func = function()
                    if SMODS.has_enhancement(othercard,"m_bonus") then
                        othercard:set_ability ("m_mills_untamed",nil,true)
                     if SMODS.has_enhancement(othercard,"m_mult") then
                        othercard:set_ability ("m_mills_feral",nil,true)
                   if SMODS.has_enhancement(othercard,"m_steel") then
                       if pseudorandom('feralodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
                           othercard:set_ability ("m_mills_feral",nil,true)
                       end
                       if pseudorandom('untodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
                           othercard:set_ability ("m_mills_untamed",nil,true)
                       end

                    if othercard:set_ability ("m_mills_untamed",nil,true) or othercard:set_ability ("m_mills_feral",nil,true) then
                        c:set_ability(G.P_CENTERS[new_enhancement], true, nil)
                        c:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))
        end
    end
}

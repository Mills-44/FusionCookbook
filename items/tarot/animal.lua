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
                    local new_enhancement
                    if c.enhancement == "m_bonus" then
                        new_enhancement = "m_mills_untamed"
                    elseif c.enhancement == "m_mult" then
                        new_enhancement = "m_mills_feral"
                    elseif c.enhancement == "m_wild" then
                        new_enhancement = MILLS.random_chance(0.5) and "m_mills_untamed" or "m_mills_feral"
                    end

                    if new_enhancement then
                        c:set_ability(G.P_CENTERS[new_enhancement], true, nil)
                        c:juice_up(0.3, 0.3)
                    end
                    return true
                end
            }))
        end
    end
}
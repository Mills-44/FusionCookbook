SMODS.Consumable {
    object_type = "Consumable",
    key = 'global',
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
            if not SMODS.has_enhancement(v, "m_bonus") then
                return false
            end
        end
        return true
    end,
    use = function(self, card, area, copier)
        if #G.hand.highlighted == 2 then
            for _, othercard in ipairs(G.hand.highlighted) do
                othercard:set_ability ("m_mills_lots",nil,true)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.35,
                    func = function()
                    othercard:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.00,
                    func = function()
                    othercard:flip()
                    return true
                    end}))
            end
        end
    end}

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
        if #G.hand.highlighted == 2 then
            return true
        end
    end,
    use = function(self, card, area, copier)
        if #G.hand.highlighted == {'m_bonus', 'm_bonus'} then
            return {remove = true}
        end
    end}
    
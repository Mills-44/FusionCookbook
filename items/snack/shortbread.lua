-- consumables/custom/merge_sum_consumable.lua

SMODS.Consumable {
    object_type = "Consumable",
    key = 'shortbread',
    set = "Snack",
    atlas = 'shortbread',
    pos = { x = 0, y = 0 },
    config = {
        max_highlighted = 2,
    },
    pools = {
        Snack = true
    },
    cost = 4,
    unlocked = true,
    discovered = true,

    
    can_use = function(self)
        return #G.hand.highlighted == self.config.max_highlighted
    end,

    use = function(self, card, area)
        local selected = G.hand.highlighted
        if #selected ~= 2 then return end
        
        for i=1, #G.hand.highlighted do
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
            local card = G.hand.highlighted[i]
            card:flip()
            card:juice_up(0.3, 0.5)
            assert(SMODS.modify_rank(card, -1))
            card:flip()
            return true
        end
        }))
    end
end
}

-- consumables/custom/merge_sum_consumable.lua

SMODS.Consumable {
    object_type = "Consumable",
    key = 'shortbread',
    set = "Snack",
    atlas = 'snack',
    pos = { 
        x = 2, 
        y = 2 
    },
    config = {
        max_highlighted = 2,
    },
    pools = {
        Snack = true
    },
    cost = 3,
    weight = 15,
    unlocked = true,
    discovered = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
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

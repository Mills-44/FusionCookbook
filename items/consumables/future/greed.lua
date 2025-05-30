SMODS.Consumable {
    object_type = "Consumable",
    key = 'greed',
    set = "Future",
    atlas = 'future',
    pos = {
        x = 1,
        y = 0
    },
    config = {
        extra = {
            money = 75
        }
    },
    pools = { 
        Future = true
     },
    unlocked = true,
    discovered = true,
     loc_vars = function(self, info_queue, card)
        return {
        vars={
            card.ability.extra.money
        }
    }
end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area)
         G.E_MANAGER:add_event(Event({
            trigger = 'after', 
            delay = 0.4, 
            func = function()
                play_sound('mills_nice')
                ease_dollars(math.max(0,math.min((G.GAME.dollars * 2), card.ability.extra.money)))
                return true
            end
        }))
    end
}
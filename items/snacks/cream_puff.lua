SMODS.Consumable {
    key = 'cream_puff',
    set = 'Snack',
    loc_txt = {
        name = "Cream Puff",
        text = {
        "Boosts all {C:attention}Sweet Jokers{} by {C:enhancement}+20%{} stats",
        "{C:inactive}(Chips, Mult, XMult, etc)"
        }
    },
    config = {
        tag = "sweet"
    }, 
    atlas = 'snack_cards',
    pos = {
        x = 2,
        y = 0
    },
    cost = 3,
    discovered = true,
    unlocked = true,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local count = 0
                for _, j in ipairs(G.jokers.cards) do
                    if j.ability and j.ability.tags and j.ability.tags[self.config.tag] then
                        j.ability.perma_bonus = j.ability.perma_bonus or {}
                        local bonus = j.ability.perma_bonus
                        bonus.mult = math.floor((bonus.mult or 0) * 1.2 + 0.5)
                        bonus.x_mult = math.floor((bonus.x_mult or 0) * 1.2 + 0.5)
                        bonus.chips = math.floor((bonus.chips or 0) * 1.2 + 0.5)
                        j:juice_up(0.5)
                        count = count + 1
                    end
                end
                if count > 0 then
                    play_sound('tasty1')
                    G.hand_text:add({text = 'Sweet Boost!', scale = 1.2, color = G.C.MULT})
                else
                    G.hand_text:add({text = 'No Sweet Jokers!', scale = 1.0, color = G.C.RED})
                end
                return true
            end
        }))
    end
}
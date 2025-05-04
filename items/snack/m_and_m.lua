SMODS.Consumable {
    object_type = "Consumable",
    key = 'm_and_m',
    set = "Snack",
    atlas = 'm_and_m',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
        odd = 3
        }
    },
    pools = {
        Snack = true
    },
    cost = 4,
    unlocked = true,
    discovered = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {
            (G.GAME.probabilities.normal or 1), 
            card.ability.extra.odd
        }
    }
    end,

    can_use = function(self)
        return true
      end,

    use = function(self, card, area)
        if pseudorandom('spectralodd') < G.GAME.probabilities.normal / card.ability.extra.odd then
            return SMODS.create_card{
            set = 'Spectral'
            }
        elseif pseudorandom('spectralodd') > G.GAME.probabilities.normal / card.ability.extra.odd then
            return {
            message = 'Nope!'
            }
        end
    end
}
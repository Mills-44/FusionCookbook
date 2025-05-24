SMODS.Consumable {
    object_type = "Consumable",
    key = 'coin',
    set = "Future",
    atlas = 'tarot',
    pos = {
        x = 0,
        y = 0
    },
    config = {
        extra = {
            odd = 2
        }},
    pools = { 
        Future = true
     },
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
    return {
      vars = {
        (G.GAME.probabilities.normal or 1),
        card.ability.extra.odd
      }
    }
    end,
    can_use = function(self, card)
        return true
    end,
    use = function(self, card, area)
        local jokers = {}
          for k, v in ipairs(G.jokers.cards) do
            if not v.edition then 
                jokers[#jokers + 1] = v                
            end
          end
        if (pseudorandom('coin_odd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
            local joker = pseudorandom_element(jokers, pseudoseed('coin_joker'))
            local edition = pseudorandom_element(MILLS.base_editions, pseudoseed('choice'))
            joker:set_edition('e_' .. edition, true)
        else
            return {
                message = "Nope!",
                colour = G.C.MULT
            }
        end
    end
}
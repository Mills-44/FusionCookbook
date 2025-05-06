SMODS.Joker {
    key = 'peppermint_butler',
    config = {
      extra = {
        chips = 0,
        chips_mod = 5
      },
    },
    atlas = 'peppermint_butler',
    pos = {
      x = 0,
      y = 0
    },
    pools = {
      Sweet = true
    },
    rarity = 1,
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.chips_mod,
          card.ability.extra.chips,
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then    
        if next(context.poker_hands['Pair']) then
          card.ability.extra.chips = card.ability.extra.chips + 5
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('mills_minty')
            return true
          end
        })) 
      return {
        message = 'Minty!',
        colour = G.C.CHIPS,
        chips = card.ability.extra.chips,
        card = card
      }
    end
  end
end
}
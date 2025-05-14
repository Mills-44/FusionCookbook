SMODS.Joker {
    key = 'peppermint_butler',
    config = {
      extra = {
        chips = 0,
        chips_mod = 5
      },
    },
    atlas = 'sweet_jokers_1',
    pos = {
      x = 0,
      y = 1
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
      if context.joker_main or context.main_scoring then    
        if next(context.poker_hands['Pair']) then
          card.ability.extra.chips = card.ability.extra.chips + 5
        G.E_MANAGER:add_event(Event({
          func = function()
            play_sound('mills_minty')
            return true
          end
        })) 
    end
    return {
      message = 'Minty!',
      colour = G.C.CHIPS,
      chips = card.ability.extra.chips,
      card = card
    }
  end
end
}
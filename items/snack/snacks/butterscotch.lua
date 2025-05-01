SMODS.Consumable {
    key = 'butterscotch',
    set = 'Snack',
    atlas = 'butterscotch',
    pos = { x = 0, y = 0 },
    config = {},
    cost = 3,
    pools = { 
      Snack = true
   },
    unlocked = true,
    discovered = true,
  
    can_use = function(self)
      return true 
    end,
  
    use = function(self, card, area)
      local sweet_count = 0
      for _, v in ipairs(G.jokers.cards) do
        if MILLS.is_sweet(v) then
          sweet_count = sweet_count + 1
        end
      end
  
      local multiplier = 1 + (0.5 * sweet_count)
      local money_before = G.GAME.dollars or 0
      local total = math.floor(money_before * multiplier)
      ease_dollars(total) 
  
      G.E_MANAGER:add_event(Event({
        trigger = 'before', delay = 0,
        func = function()
          play_sound('tarot1')
          return true
        end
      }))
  
      SMODS.calculate_effect(
        card 
      )
    end
  }
  
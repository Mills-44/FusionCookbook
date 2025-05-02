SMODS.Consumable  {
  object_type = "Consumable",
    key = 'homeys_doney',
    set = "Snack",
    atlas = 'homeys_doney',
    pos = { x = 0, y = 0 },
    config = {},
    cost = 3,
    unlocked = true,
    discovered = true,
    pools = { 
      Snack = true
   },
  
    can_use = function(self)
      return true
    end,
  
    use = function(self, card, area)
      local add_hand = MILLS.random_chance(0.5)
      G.E_MANAGER:add_event(Event({
        trigger = 'before', delay = 0,
        func = function()
          if add_hand then
            ease_hands_played(1)
          else
            ease_discard(1)
          end
          play_sound('mills_doh')
          return true
        end
      }))
    end
  }
SMODS.Consumable {
    object_type = "Consumable",
    key = 'choffle',
    set = "Snack",
    atlas = 'choffle',
    pos = { x = 0, y = 0 },
    config = {
      max_highlighted = 2
    },
    cost = 3,
    pools = { 
      Snack = true
   },
    unlocked = true,
    discovered = true,
  
    can_use = function(self)
      return #G.hand.highlighted == self.config.max_highlighted
    end,
  
    use = function(self, card, area)
      local trig = G.hand.highlighted
      if #trig ~= 2 then return end
  
      local card1, card2 = trig[1], trig[2]
  
      local rank_index = function(c)
        local r = c:get_id().rank
        for i, v in ipairs(MILLS.base_ranks) do
          if v == r then return i end
        end
      end
  
      local index1, index2 = rank_index(card1), rank_index(card2)
      if not index1 or not index2 then return end
  
      local sum = index1 + index2
      local new_index = ((sum - 2) % (#MILLS.base_ranks - 1)) + 2 -- wrap to range 2-Ace (2 to 14)
      local new_rank = MILLS.base_ranks[new_index]
  
      for _, c in ipairs(trig) do c:destroy(true) end
  
      G.E_MANAGER:add_event(Event({
        trigger = 'before', delay = 0,
        func = function()
          local new_card = create_card(nil, G.hand, nil, nil, nil, nil, nil, new_rank)
          new_card:add_to_deck()
          G.hand:emplace(new_card)
          play_sound('tarot1')
          return true
        end
      }))
    end
  }
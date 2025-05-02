SMODS.Consumable  {
    object_type = "Consumable",
    key = 'cream_puff',
    set = "Snack",
    atlas = 'cream_puff',
    pos = { x = 0, y = 0 },
    config = {},
    cost = 3,
    pools = { 
      Snack = true
   },
    unlocked = true,
    discovered = true,
  
    can_use = function(self)
      return #G.jokers.cards > 0
    end,
  
    use = function(self, card, area)
      local boosted = false
  
      for _, joker in ipairs(G.jokers.cards) do
        local stats = { "chips", "mult", "x_mult", "bonus", "extra" }
        for _, stat in ipairs(stats) do
          local val = joker[stat]
          if type(val) == "number" then
            joker[stat] = math.floor(val * 1.2 + 0.5)
            boosted = true
          end
        end
      end
  
      if boosted then
        G.E_MANAGER:add_event(Event({
          trigger = 'before', delay = 0,
          func = function()
            for _, j in ipairs(G.jokers.cards) do
              j:juice_up(0.5, 0.25)
            end
            return true
          end
        }))
      end
    end
  }
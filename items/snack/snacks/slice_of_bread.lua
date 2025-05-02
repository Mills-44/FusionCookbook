SMODS.Consumable  {
  object_type = "Consumable",
  key = 'slice_of_bread',
  set = "Snack",
  atlas = 'slice_of_bread',
  pos = { x = 0, y = 0 },
  config = {},
  cost = 3,
  unlocked = true,
  discovered = true,
  pools = { 
    Snack = true
  },

  can_use = function(self)
    return #G.jokers.cards >= 2
  end,

  use = function(self, card, area)
    local jokers = {}
    for _, j in ipairs(G.jokers.cards) do
      if j.center and j.center.key then
        jokers[j.center.key] = j
      end
    end

    local combos = {
      {
        ingredients = {"barry", "stay_puft", "slice_of_bread"},
        result = "flayfluff_sub"
      },
      {
        ingredients = {"nutty_buddy", "wonka_bar", "slice_of_bread"},
        result = "golden_crunch"
      },
      {
        ingredients = {"jammin_jelly", "stay_puft", "slice_of_bread"},
        result = "gloopwich"
      },
      {
        ingredients = {"jammin_jelly", "nutty_buddy", "slice_of_bread"},
        result = "mr_pb_and_jelly"
      },
      {
        ingredients = {"barry", "wonka_bar", "slice_of_bread"},
        result = "everlasting_pollenstopper"
      }
    }

    for _, combo in ipairs(combos) do
      local found = true
      for _, part in ipairs(combo.ingredients) do
        if not jokers[part] then
          found = false
          break
        end
      end

      if found then
        G.E_MANAGER:add_event(Event({
          trigger = 'before', delay = 0,
          func = function()
            for _, part in ipairs(combo.ingredients) do
              if jokers[part] then
                jokers[part]:remove()
              end
            end
            local new_card = SMODS.create_card {
              type = 'Joker',
              id = combo.result,
              area = G.jokers
            }
            new_card:add_to_deck()
            G.jokers:emplace(new_card)
            return true
          end
        }))
        break
      end
    end
  end
} 

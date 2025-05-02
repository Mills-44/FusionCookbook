SMODS.Consumable  {
    object_type = "Consumable",
    key = 'kinder_egg',
    set = "Snack",
    atlas = 'kinder_egg',
    pos = { x = 0, y = 0 },
    config = {},
    cost = 5,
    unlocked = true,
    discovered = true,
    pools = { 
      Snack = true
   },
    can_use = function(self)
      return true
    end,
    use = function(self, card, area)
      G.E_MANAGER:add_event(Event({
        trigger = 'after', delay = 0.4,
        func = function()
          local sweet_key = MILLS.random_choice_from_pool({Sweet = true})
          if sweet_key and G.P_CENTERS[sweet_key] then
            local j_card = SMODS.create_card {
              type = 'Joker',
              key = sweet_key,
              area = G.jokers
            }
            j_card:add_to_deck()
            G.jokers:emplace(j_card)
            j_card:juice_up(0.3, 0.5)
            play_sound('mills_nice')
          else
            print("❌ No valid Sweet Joker found, got:", tostring(sweet_key))
          end
          return true
        end
      }))
    end
  }
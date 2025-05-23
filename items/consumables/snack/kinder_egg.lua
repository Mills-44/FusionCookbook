SMODS.Consumable  {
    object_type = "Consumable",
    key = 'kinder_egg',
    set = "Snack",
    atlas = 'kinder_egg',
    pos = { 
      x = 0, 
      y = 0 
    },
    config = {},
    cost = 4,
    weight = 5,
    unlocked = true,
    discovered = true,
    pools = { 
      Snack = true
   },
   set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Soda Enjoyer", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
   can_use = function(self, card)
    return #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers
  end,
    use = function(self, card, area)
      G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.4,
        func = function()
          local chosen_joker = pseudorandom_element(MILLS.SWEET_JOKERS, pseudoseed('choice'))
          play_sound('mills_nice')
          local kinder = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_'.. chosen_joker)    
          kinder:add_to_deck()
          G.jokers:emplace(kinder)
          card:juice_up(0.3, 0.5)
          return true
        end
      }))
    end
  }

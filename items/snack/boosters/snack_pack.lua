SMODS.Booster {
    object_type = "Booster",
    kind = "Snack",
    key = 'snack_pack',
    group_key = 'k_mills_snack_pack',
    atlas = 'snack_pack',
    pos = { 
        x = 0, 
        y = 0 
    },
    config = {
      extra = 4,
      choose = 1
    },
    weight = 1,
    cost = 4,
    discovered = true,
    draw_hand = true,  create_card = function(self, card)
      return create_card("Snack", G.pack_cards, nil, nil, true, true, nil, "mills_snack")
  end,
  ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, MILLS.COLORS.COOKIE)
      ease_background_colour({ new_colour =  MILLS.COLORS.COOKIE, special_colour = G.C.BLACK, contrast = 2 })
  end,
  loc_vars = function(self, info_queue, card)
      return { vars = { card.config.center.config.choose, card.ability.extra } }
  end,
  }
  
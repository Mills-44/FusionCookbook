-- These are the boosters made for the Snack packs each are simple builds of how you can make custom ones 
SMODS.Booster { 
  object_type = "Booster", -- Defines what the object is and puts it with all other boosters
    kind = "Snack", -- Makes all packs associated with the Consumable Type Snack
    key = 'snack_pack_mega',
    group_key = 'k_mills_snack_pack',  -- Groups all boosters together
    atlas = 'snack_pack_mega',
    pos = { 
        x = 0, 
        y = 0 
    },
    config = {
      extra = 5, -- 5 Choices to choose from
      choose = 2  -- Choose 2 to use
    },
    order = 3,
    weight = .55,
    cost = 8,
    discovered = true,
    draw_hand = true,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Mills", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
  --Vanilla usage of how to set up boosters just be aware of how to use create_card function
  ease_background_colour = function(self)
      ease_colour(G.C.DYN_UI.MAIN, MILLS.COLORS.COOKIE)
      ease_background_colour({ new_colour =  MILLS.COLORS.COOKIE, special_colour = G.C.BLACK, contrast = 2 })
  end,
  particles = function(self)
     G.booster_pack_sparkles = Particles(2, 2, 0, 0, {
                timer = 0.05,
                scale = 0.3,
                initialize = true,
                lifespan = 3,
                speed = 0.2,
                padding = -1,
                attach = G.ROOM_ATTACH,
                colours = {G.C.GOLD, G.C.BLACK},
                fill = true
            })
            G.booster_pack_sparkles.fade_alpha = 1
            G.booster_pack_sparkles:fade(1, 0)
  end,
  create_card = function(self, card)
      return create_card("Snack", G.pack_cards, nil, nil, true, true, nil, "mills_snack")
  end,
}
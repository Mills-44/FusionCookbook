SMODS.Joker {
    object_type = "Joker",
    key = 'flayfluff_sub',
    atlas = 'flayfluff_sub',
    pos = { x = 0, y = 0 },
    config = {},
    rarity = 3,
    unlocked = true,
    discovered = true,
    in_pool = function(self, args)
        return false
      end,
     set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Sandwich", 
        MILLS.COLORS.COOKIE, 
        G.C.WHITE, 
        1.2 )
        badges[#badges+1] = create_badge(
        "Barry B. + Stay Puft", 
        MILLS.COLORS.SANDWICH, 
        G.C.WHITE, 
        1.0 )
        badges[#badges+1] = create_badge(
        "Art: Mills", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,     
    calculate = function(self, card, context)
      if context.cardarea == G.jokers then
      if context.before then 
        local glass = false
        local wild = false

        for i = 1, #context.scoring_hand do
          local c_card = context.scoring_hand[i]
          if SMODS.has_enhancement(c_card, "m_glass") then glass = true end
          if SMODS.has_enhancement(c_card, "m_wild") then wild = true end
          if SMODS.has_enhancement(c_card, "m_mills_stain") then glass = true end
          if SMODS.has_enhancement(c_card, "m_mills_stain") then wild = true end
          if SMODS.has_enhancement(c_card, "m_mills_stan") then glass = true end
          if SMODS.has_enhancement(c_card, "m_mills_stan") then wild = true end
        end

        if glass and wild then
        G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.4, 
        func = function()
          local chosen_joker = pseudorandom_element(MILLS.SWEET_JOKERS, pseudoseed('choice'))
          play_sound('mills_jazz')
          local sweet = create_card("Joker", G.jokers, nil, nil, nil, nil, 'j_mills_'.. chosen_joker)  
          sweet:set_edition({negative = true})
          sweet:add_to_deck()
          G.jokers:emplace(sweet)
          card:juice_up(0.3, 0.5)
          return true
                end }))
        end
      end
    end
  end
}

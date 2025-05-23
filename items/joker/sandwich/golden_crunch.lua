SMODS.Joker {
    object_type = "Joker",
    key = 'mr_pb_and_jelly',
    atlas = 'mr_pb_and_jelly',
    pos = { x = 0, y = 0 },
    config = {},
    rarity = 3,
    unlocked = true,
    discovered = true,
    in_pool = function(self, args)
        return false
      end,
      
    calculate = function(self, card, context)
      if context.cardarea == G.jokers then
      if context.before then 
        local bonus = false
        local mult = false

        for i = 1, #context.scoring_hand do
          local c_card = context.scoring_hand[i]
          if SMODS.has_enhancement(c_card, "m_bonus") then bonus = true end
          if SMODS.has_enhancement(c_card, "m_mult") then mult = true end
          if SMODS.has_enhancement(c_card, "m_mills_extra") then bonus = true end
          if SMODS.has_enhancement(c_card, "m_mills_extra") then mult = true end
          if SMODS.has_enhancement(c_card, "m_mills_ex") then bonus = true end
          if SMODS.has_enhancement(c_card, "m_mills_ex") then mult = true end
        end

        if bonus and mult then
        G.E_MANAGER:add_event(Event({
        trigger = 'after', 
        delay = 0.4, 
        func = function()
          play_sound('mills_mrpb')
          local newcard = create_card('Snack', G.consumeables, nil, nil, nil, nil, nil, 'c_mills_' )
                    newcard:add_to_deck()
                    newcard:set_edition({negative = true})
                    G.consumeables:emplace(newcard)
                    newcard:juice_up(0.3, 0.5)  
                return true 
                end }))
        end
      end
    end
  end
}

SMODS.Joker {
    object_type = "Joker",
    key = 'gloopwich',
    atlas = 'gloopwich',
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
        local wild = false
        local mult = false

        for i = 1, #context.scoring_hand do
          local c_card = context.scoring_hand[i]
          if SMODS.has_enhancement(c_card, "m_wild") then wild = true end
          if SMODS.has_enhancement(c_card, "m_mult") then mult = true end
          if SMODS.has_enhancement(c_card, "m_mills_lava") then wild = true end
          if SMODS.has_enhancement(c_card, "m_mills_lava") then mult = true end
          if SMODS.has_enhancement(c_card, "m_mills_lav") then wild = true end
          if SMODS.has_enhancement(c_card, "m_mills_lav") then mult = true end
        end
        if wild and mult then
          local upgrade = G.play.cards
          local edition = 1
          if upgrade.edition then
          for i, v in ipairs(G.P_CENTER_POOLS.Edition) do
            if v.key == upgrade.edition.key then
              edition = i
              break
            end
          end
        end
      edition = edition + 1 
      if edition > #G.P_CENTER_POOLS.Edition then
			edition = edition - #G.P_CENTER_POOLS.Edition
		end
  end
end
end 
end
}

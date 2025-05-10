SMODS.Consumable {
    object_type = "Consumable",
    key = 'hot_tamale',
    set = "Snack",
    atlas = 'hot_tamale',
    pos = { x = 0, y = 0 },
    config = {},
    cost = 4,
    weight = 5,
    unlocked = true,
    discovered = true,
    pools = { 
      Snack = true
   },
  can_use = function(self, card)
		return #((G.jokers or {}).cards or {}) > 0
	end,
  use = function(self, card, area)
		for k, v in pairs(G.jokers.cards) do
				v.no_forced_edition = true
				v:set_edition({
                    edition = "foil",
                    immediate = true,
                    silent = true
                })
                if v:set_edition({ editon = "foil"}) == true then
                    v:set_edition({
                    edition = "holographic",
                    immediate = true,
                    silent = true
                })
                elseif v:set_edition({ editon = "holographic"}) == true then
                   v:set_edition({
                    edition = "polychrome",
                    immediate = true,
                    silent = true
                }) 
            else
                  v:set_edition({
                    edition = "negative",
                    immediate = true,
                    silent = true
                 })
                end
                end
				v.no_forced_edition = nil
		end
}

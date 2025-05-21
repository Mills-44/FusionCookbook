SMODS.Consumable  {
  object_type = "Consumable",
  key = 'slice_of_bread',
  set = "Snack",
  atlas = 'snack',
  pos = { 
	x = 4, 
	y = 2 
 },
  config = {},
  cost = 3,
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
  can_use = function(self)
      return true
    end, 
  use = function(self, card, area, copier)
        if G.jokers.play.center.key == 'j_mills_jammin_jelly' and
           G.jokers.play.center.key == 'j_mills_nutty_buddy' then
                G.jokers.play:start_dissolve()
                SMODS.add_card("j_mills_mr_pb_and_jelly")
            end
		end
}
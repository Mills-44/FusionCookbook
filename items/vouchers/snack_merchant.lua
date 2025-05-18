SMODS.Voucher {
    object_type = "Voucher",
    key = 'snack_merchant',
    atlas = 'snack_merchant',
    pos = {
        x = 0,
        y = 0
    },
    config = { rate_up = 2 },
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
		return { vars = { self.config.rate_up } }
	end,
  set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Mills", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.snack_rate = G.GAME.snack_rate * self.config.rate_up
				return true
			end,
		}))
	end,
}
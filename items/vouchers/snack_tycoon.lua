SMODS.Voucher {
    object_type = "Voucher",
    key = 'snack_tycoon',
    atlas = 'snack_tycoon',
    pos = {
        x = 0,
        y = 0
    },
    config = { rate_up = 4 },
    requires = { "v_mills_snack_merchant" },
    unlocked = true,
    discovered = true,
    loc_vars = function(self, info_queue, card)
		return { vars = { self.config.rate_up } }
	end,
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.snack_rate = G.GAME.snack_rate * (self.config.rate_up / 2)
				return true
			end,
		}))
	end,
}
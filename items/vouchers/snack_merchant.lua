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
    redeem = function(self)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.snack_rate = G.GAME.snack_rate * self.config.rate_up
				return true
			end,
		}))
	end,
}
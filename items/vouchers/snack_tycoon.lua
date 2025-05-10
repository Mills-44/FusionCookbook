SMODS.Voucher {
    object_type = "Voucher",
    key = 'snack_tycoon',
    atlas = 'snack_tycoon',
    pos = {
        x = 0,
        y = 0
    },
    config = { 
        extra = 16 / 4, 
        extra_disp = 4 
    },
    unlocked = true,
    discovered = true,
    requires = { "v_mills_snack_merchant" },
    loc_vars = function(self, info_queue, card)
		return { vars = { card and card.ability.extra_disp or self.config.extra_disp } }
	end,
    redeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate * (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
    unredeem = function(self, card)
		G.E_MANAGER:add_event(Event({
			func = function()
				G.GAME.tarot_rate = G.GAME.tarot_rate / (card and card.ability.extra or self.config.extra)
				return true
			end,
		}))
	end,
}
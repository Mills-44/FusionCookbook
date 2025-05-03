SMODS.Seal {
    key = 'donut',
    badge_colour = HEX("ff5a9d"),
    atlas = 'seals',
    pos = {
        x = 0,
        y = 0
    },
    calculate = function(self, card, context)
        if context.cardarea == "unscored" and context.main_scoring then
			for k, v in ipairs(context.scoring_hand) do
				v.mills_cookie_incompat = true
			end
            for k, v in ipairs(context.scoring_hand) do
				v.mills_cookie_incompat = true
			end
                G.E_MANAGER:add_event(Event({
                    func = function()
                            local add_hand = MILLS.random_chance(0.5)
                            G.E_MANAGER:add_event(Event({
                              trigger = 'before', delay = 0,
                              func = function()
                                if add_hand then
                                  ease_hands_played(1)
                                else
                                  ease_discard(1)
                                end
                                play_sound('mills_doh')
                                return true
                              end
                            }))
                        return true
                    end
                }))
            end
        end
}
SMODS.Joker {
key = 'missing',
config = {},
atlas = 'misc_jokers',
pos = {
    x = 1,
    y = 0
}, 
rarity = 3,
cost = 7,
unlocked = true, 
discovered = true, 
blueprint_compat = false,
eternal_compat = true,
perishable_compat = true,
loc_vars = function(self, info_queue, card)
      return {}
    end,
set_badges = function(self, card, badges)
    badges[#badges+1] = create_badge(
    "Art: Soda Enjoyer", 
    MILLS.COLORS.ART, 
    G.C.WHITE, 
    1.2 )
end,
calculate = function(self, card, context)
    if not G.GAME.missing_jokers then
			G.GAME.missing_jokers = {}
		end 
    local a = nil
	local c = nil
	local _p = nil
 if context.selling_card and context.card.ability.set == "Joker" then
    p = not not G.joker.cards
	a = G.joker.cards
	c = G.joker.cards
end
---@diagnostic disable-next-line: need-check-nil
    c:start_dissolve()
end
}
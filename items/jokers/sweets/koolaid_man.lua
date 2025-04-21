SMODS.Joker {
    key = 'koolaid_man',
    loc_txt = {
        name = 'Kool-Aid Man',
        text = {
            "When scoring hand contains a {C:attention}Three of a Kind{},",
           "this Joker gives {C:money}$4"
        }
    },
    config = {
        money = 4
    },
    rarity = 2,
    atlas = 'sweet_jokers',
    pos = {
        x = 2,
        y = 0
    },
    cost = 7,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.extra.money } }
	end,
    calculate = function(self, card, context)
        -- Trigger only once for the whole hand (context.before)
        if context.before and context.scoring_name == 'Three of a Kind' and context.scoring_hand then
            for _, c in ipairs(context.scoring_hand) do
                -- Schedule the change as an event so it's done safely
                G.E_MANAGER:add_event(Event({
                    func = function()
                        -- Optional visual feedback
                        c:juice_up(0.4, 0.4)
                        return true
                    end
                }))
            end
    
            return {
                money = card.ability.extra.money,
                message = "Oh Yeah!",
                colour = G.C.MONEY
            }
        end
    end    
}

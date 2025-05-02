SMODS.Joker {
	key = 'monster',
	config = { },
	rarity = 3,
	atlas = 'joker',
    in_pool = function(self, args) 
        return false
      end,
	pos = { x = 0, y = 0 },
	cost = 5,
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
	calculate = function(self, card, context)
        if context.before then
            for _,othercard in ipairs(context.scoring_hand) do
              if SMODS.has_enhancement(othercard,"m_steel") then
                othercard:set_ability ("m_mills_claws",nil,true)
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.50,
                    func = function()
                    othercard:flip()
                    return true
                       end}))
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 1.50,
                    func = function()
                    othercard:flip()
                    return true
                    end}))
                end
            end
        end
    end}
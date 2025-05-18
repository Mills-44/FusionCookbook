SMODS.Consumable  {
  object_type = "Consumable",
  key = 'slice_of_bread',
  set = "Snack",
  atlas = 'snack',
  pos = { 
	x = 5, 
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
  use = function(self, card, area)
    Sandwich = {
    fusions = {
      ['PB and J Sandwhich'] = {
			output = 'j_mills_mr_pb_and_jelly',
			ingredients = {
				'j_mills_jammin_jelly',
				'j_mills_nutty_buddy'
			}
		},
    }
    }
  function Sandwich.add_fusion(key, cost, output, ...)
	  local inputs = { ... }
	  Sandwich.fusions[key] = {output = output, ingredients = inputs}
  end
    function Sandwich.find_matching_recipe(items)
      if #items <= 0 then return nil end
      for k, v in pairs(Sandwich.fusions) do
		  local matches = 0
		  for _, w in ipairs(v.ingredients) do
			  for __, x in ipairs(items) do
				if x:gc().key == w then
					matches = matches + 1
					break
				end
			end
		end
		if matches >= #v.ingredients then
			return k
		end
	end
	return nil
end

function Sandwich.has_ingredients(key)
	if not Sandwich.fusions[key] then return false end
	local inputs = Sandwich.fusions[key].ingredients
	if #inputs <= 0 then Sandwich.fusions[key] = nil; return false end
	local acquired = 0
	for k, v in ipairs(inputs) do
		if #SMODS.find_card(v, true) > 0 then
			acquired = acquired + 1
		end
	end
	return acquired >= #inputs
end

function Sandwich.get_cards_for_recipe(key)
	if not Sandwich.fusions[key] then return false end
	local inputs = Sandwich.fusions[key].ingredients
	if #inputs <= 0 then Sandwich.fusions[key] = nil; return false end
	local acquired = 0
	local ingreds = {}
	for k, v in ipairs(inputs) do
		if #SMODS.find_card(v, true) > 0 then
			acquired = acquired + 1
			table.insert(ingreds, next(SMODS.find_card(v, true)))
		end
	end 
  end

  function fuse_cards(cards, output, fast)
	if fast then
		Q(function()
			play_sound('whoosh')
			for k, v in ipairs(cards) do
				G['mills_merge' .. k] = CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, {type = 'play', card_limit = 5})
				if v.area then
					v.area:remove_card(v)
				end
				G['jen_merge' .. k]:emplace(v)
			end
		return true end)
		delay(1.5)
		Q(function()
			play_sound('explosion_release1')
			for k, v in ipairs(cards) do
				v:flip()
				if G['jen_merge' .. k] then
					G['jen_merge' .. k]:remove_card(v)
					G['jen_merge' .. k]:remove()
					G['jen_merge' .. k] = nil
				end
				v:destroy(nil, true, nil, true)
			end
		return true end)
		Q(function() if output then
			if type(output) == 'function' then
				output()
			elseif type(output) == 'string' then
				local new_card = create_card(G.P_CENTERS[output].set,G.P_CENTERS[output].set == 'Joker' and G.jokers or G.consumeables, nil, nil, nil, nil, output, 'fusion')
				G.play:emplace(new_card)
				delay(1.5)
				Q(function()
					G.play:remove_card(new_card)
					new_card:add_to_deck()
					if new_card.ability.set == 'Joker' then
						G.jokers:emplace(new_card)
					else
						G.consumeables:emplace(new_card)
					end
				return true end)
			end
		end return true end)
	else
		Q(function()
			play_sound('whoosh')
			for k, v in ipairs(cards) do
				G['jen_merge' .. k] = CardArea(G.play.T.x, G.play.T.y, G.play.T.w, G.play.T.h, {type = 'play', card_limit = 5})
				if v.area then
					v.area:remove_card(v)
				end
				G['jen_merge' .. k]:emplace(v)
			end
		return true end)
		delay(1.5)
		Q(function()
			for k, v in ipairs(cards) do
				v:flip()
				if k ~= 1 then
					if G['jen_merge' .. k] then
						G['jen_merge' .. k]:remove_card(v)
						G['jen_merge' .. k]:remove()
						G['jen_merge' .. k] = nil
					end
					v:destroy(nil, true, nil, true)
				end
			end
		return true end)
		delay(0.5)
		local card
		Q(function()
			card = G.jen_merge1.cards[1]
			card:explode()
			Q(function() if card then card:remove() end if G.jen_merge1 then G.jen_merge1:remove(); G.jen_merge1 = nil; end return true end)
			Q(function() if output then
				if type(output) == 'function' then
					output()
				elseif type(output) == 'string' then
					local new_card = create_card(G.P_CENTERS[output].set,G.P_CENTERS[output].set == 'Joker' and G.jokers or G.consumeables, nil, nil, nil, nil, output, 'fusion')
					G.play:emplace(new_card)
					delay(1.5)
					Q(function()
						G.play:remove_card(new_card)
						new_card:add_to_deck()
						if new_card.ability.set == 'Joker' then
							G.jokers:emplace(new_card)
						else
							G.consumeables:emplace(new_card)
						end
					return true end)
				end
			end return true end)
		return true end)
	end
end

end
} 

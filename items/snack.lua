
SMODS.ConsumableType {
    object_type = "ConsumableType",
    key = 'Snack',
    default = 'c_mills_bubblegum',
    collection_rows = { 3,4 },
    primary_colour = HEX("e18a16"),
    secondary_colour = HEX("e18a16"),
    shop_rate = 1,
    loc_txt = {
        collection = 'Snack Cards',
        name = 'Snack',
        label = 'Snack',
    },
}
SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-biscoff",
    key = "biscoff",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'biscoff',
    cost = 3,
    order = 1,
    config = {max_highlighted = 2}, 
    loc_vars = function(self, info_queue, center)
        return {
            vars = {((
            center or {}).ability or {}).max_highlighted or 2
        }}
    end,
    can_use = function(self, card)
    -- Only usable when hand is out (in play) or in shop
    if not G or not G.hand then return false end
        local highlighted = G.hand.highlighted or {}
        local ability = card.ability or {}
        local max_highlighted = ability.max_highlighted or 2
            return #highlighted <= max_highlighted and #highlighted > 0
        end,
    use = function(self, card, area, copier)
        local highlighted = G.hand.highlighted or {}
        if #highlighted > 0 then
        G.E_MANAGER:add_event(Event({
            trigger = 'after', delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for _, c in ipairs(highlighted) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                        func = function()
                            c:flip()
                            c:juice_up(0.3, 0.3)
                            return true
                        end
                    }))
                end
                delay(0.2)
                for _, c in ipairs(highlighted) do
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.15,
                        func = function()
                            G.hand:remove_from_highlighted(c)
                            c:flip()
                            c:set_ability(G.P_CENTERS['m_mills_candisimo'], true, nil)
                            c:juice_up(0.3, 0.3)
                            play_sound('mills_')
                            return true
                        end
                    }))
                end
            end
        end,
    } 
SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-bubblegum",
    key = "bubblegum",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'bubblegum',
    cost = 3,
    order = 2,
    can_use = function(self)
        return true
    end,
    use = function(self, card)
        -- Helper function to count Gold cards
        local function count_gold_cards(...)
            local total = 0
            for _, zone in ipairs({...}) do
                for _, c in ipairs(zone.cards) do
                    if c.edition and c.edition.type == 'm_gold' then
                        total = total + 1
                    end
                end
            end
            return total
        end

        -- Count gold-edition cards in Deck, Hand, and Play area
        local gold_count = count_gold_cards(G.deck, G.hand, G.play)

        -- Reward dollars based on how many gold cards
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local reward = gold_count * 2
                ease_dollars(reward)
                return true
            end
        }))
    end,
}

SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-butterscotch",
    key = "butterscotch",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'butterscotch',
    cost = 3,
    order = 3,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        -- List of Sweet Joker keys
        local sweet_jokers = { 
            "j_mills_apple_of_jacks_eye",
            "j_mills_barry_b",
            "j_mills_gummibar",
            "j_mills_honey_nut_cheerios",
            "j_mills_jammin_jelly",
            "j_mills_koolaid_man",
            "j_mills_nutty_buddy",
            "j_mills_peppermint_butler",
            "j_mills_stay_puft"
        }

        local function is_sweet(joker)
            local key = joker.config and joker.config.center and joker.config.center.key
            if not key then return false end
            for _, sweet_key in ipairs(sweet_jokers) do
                if key == sweet_key then
                    return true
                end
            end
            return false
        end

        local sweet_count = 0
        for _, j in ipairs(G.jokers.cards) do
            if is_sweet(j) then
                sweet_count = sweet_count + 1
            end
        end

        local multiplier = 1 + (sweet_count * 0.5)

        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local old_money = G.GAME.dollars or 0
                local gained_money = math.floor(old_money * (multiplier - 1)) -- calculate only the extra money
                ease_dollars(gained_money)

                if G.EFFECTS then
                    G.EFFECTS.text({
                        text = "x"..multiplier.."!",
                        x = (G.GAME.dollars_UI and G.GAME.dollars_UI.x) or 0,
                        y = (G.GAME.dollars_UI and G.GAME.dollars_UI.y) or 0,
                        scale = 1.3,
                        color = G.C.MONEY
                    })
                end
                play_sound('tarot1') -- nice feedback
                return true
            end
        }))
    end,
}
SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-cream-puff",
    key = "cream_puff",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'cream_puff',
    cost = 3,
    order = 4,
    can_use = function(self)
        return true 
    end,
    use = function(self, card)
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                for _, j in ipairs(G.jokers.cards) do
                    if j.ability then
                        local function boost(key, round)
                            local val = j.ability[key]
                            if type(val) == "number" then
                                if round then
                                    j.ability[key] = math.floor(val * 1.2 + 0.5) -- Round for chips/mult
                                else
                                    j.ability[key] = val * 1.2 -- Keep decimal for x_mult
                                end
                                return true
                            end
                            return false
                        end
    
                        local changed = false
                        changed = boost("chips", true) or changed
                        changed = boost("mult", true) or changed
                        changed = boost("x_mult", false) or changed
    
                        if changed then
                            j:juice_up(0.5)
                        end
                    end
                end
                play_sound('tarot1')
                return true
            end
        }))
    end
}
SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-pretzel",
    key = "pretzel",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'pretzel',
    cost = 3,
    order = 5,
    config = { max_highlighted = 1 },
    loc_vars = function(self, info_queue, center)
        return {
            vars = {((center or {}).ability or {}).max_highlighted or 1}
        }
    end,
    can_use = function(self, card)
        if not G or not G.hand then return false end
        local highlighted = G.hand.highlighted or {}
        local ability = card.ability or {}
        local max_highlighted = ability.max_highlighted or 1
        return #highlighted <= max_highlighted and #highlighted > 0
    end,
    use = function(self, card, area, copier)
        local highlighted = G.hand.highlighted or {}
        if #highlighted > 0 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after', delay = 0.4,
                func = function()
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
            for _, c in ipairs(highlighted) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                    func = function()
                        c:flip()
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
            delay(0.2)
            for _, c in ipairs(highlighted) do
                G.E_MANAGER:add_event(Event({
                    trigger = 'after', delay = 0.15,
                    func = function()
                        G.hand:remove_from_highlighted(c)
                        c:flip()
                        c:set_ability(G.P_CENTERS['m_mills_cookiesimo'], true, nil)
                        c:juice_up(0.3, 0.3)
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-slice-of-bread",
    key = "slice_of_bread",
    pos = { x = 0, y = 0 },
    atlas = 'slice_of_bread',
    cost = 3,
    order = 6,
    can_use = function(self, card)
        return true 
    end,
    use = function(self, card)
        -- Define strict upgrade combos
        local upgrade_combos = {
            {
                requires = { "j_mills_barry_b", "j_mills_stay_puft" },
                result = "j_mills_flayfluff_sub"
            },
            {
                requires = { "j_mills_nutty_buddy", "j_mills_jammin_jelly" },
                result = "j_mills_mr_pb_and_jelly"
            },
            {
                requires = { "j_mills_barry_b", "j_mills_wonkas_chocolate_bar" },
                result = "j_mills_everlasting_pollenstopper"
            },
            {
                requires = { "j_mills_nutty_buddy", "j_mills_wonkas_chocolate_bar" },
                result = "j_mills_golden_crunch"
            },
            {
                requires = { "j_mills_stay_puft", "j_mills_jammin_jelly" },
                result = "j_mills_goopwhich"
            }
        }

        -- Build inventory
        local jokers_by_key = {}
        for _, j in ipairs(G.jokers.cards) do
            if j.config and j.config.center and j.config.center.key then
                jokers_by_key[j.config.center.key] = j
            end
        end

        -- Try fusion
        for _, combo in ipairs(upgrade_combos) do
            local joker1 = jokers_by_key[combo.requires[1]]
            local joker2 = jokers_by_key[combo.requires[2]]

            if joker1 and joker2 then
                -- Correctly remove jokers
                G.jokers:remove(joker1)
                G.jokers:remove(joker2)

                -- Remove slice of bread
                G.consumeables:remove(card)

                -- Spawn the upgraded Joker
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_joker = SMODS.add_card {
                            set = "Joker",
                            area = G.jokers,
                            key = combo.result
                        }
                        if new_joker then
                            new_joker:juice_up(0.4, 0.4)
                        end
                        return true
                    end
                }))

                return -- Done
            end
        end

        -- ❌ No combo found, remove slice only
        G.consumeables:remove(card)
    end
}
 SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-kinder-egg",
    key = "kinder_egg",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'kinder_egg',
    cost = 3,
    order = 7,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit or self.area == G.jokers
    end,
    use = function (self, card)
        local sweet_jokers = { 
            "j_mills_apple_of_jacks_eye",
            "j_mills_barry_b",
            "j_mills_gummibar",
            "j_mills_honey_nut_cheerios",
            "j_mills_jammin_jelly",
            "j_mills_koolaid_man",
            "j_mills_nutty_buddy",
            "j_mills_peppermint_butler",
            "j_mills_stay_puft"
        }
        local function simple_shuffle(t)
            for i = #t, 1, -1 do
                local j = love.math.random(i)
                t[i], t[j] = t[j], t[i]
            end
        end
        simple_shuffle(sweet_jokers)
        for i = 1, 1 do
            if #sweet_jokers > 0 then
                local sweet_key = table.remove(sweet_jokers)
                local newcard = SMODS.add_card {
                    set = 'Sweet',
                    area = G.Jokers,
                    key = sweet_key
                }
                if newcard then
                    newcard:juice_up(0.4, 0.4)
                end
            end
        end
    end,
}
SMODS.Consumable {
    object_type = "Consumable",
    set = "Snack",
    name = "mills-rye_chip",
    key = "rye_chip",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'rye_chip',
    cost = 3,
    order = 8,
    can_use = function(self)
        return true
    end,
    use = function(self, card)
        local available_snacks = {
            "c_mills_biscoff", 
            "c_mills_butterscotch", 
            "c_mills_kinder_egg",
            "c_mills_pretzel",
            "c_mills_cream_puff",
            "c_mills_bubblegum",
            "c_mills_homeys_doney"
        }
        
        local function simple_shuffle(t)
            for i = #t, 2, -1 do
                local j = love.math.random(i)
                t[i], t[j] = t[j], t[i]
            end
        end
        simple_shuffle(available_snacks)

        for i = 1, 2 do
            if #available_snacks > 0 then
                local snack_key = table.remove(available_snacks)
                local newcard = SMODS.add_card {
                    set = 'Snack',
                    area = G.consumeables,
                    key = snack_key
                }
                if newcard then
                    newcard:juice_up(0.4, 0.4)
                end
            end
        end
    end,
}
SMODS.Consumable{
    object_type = "Consumable",
    set = "Snack",
    name = "mills-homeys-doney",
    key = "homeys_doney",
    pos = {
        x = 0,
        y = 0
    },
    atlas = 'homeys_doney',
    cost = 3,
    order = 9, 
    discovered = true,
    unlocked = true,
    can_use = function(self)
        return true 
    end,
    use = function(self, card, area, copier) 
        G.E_MANAGER:add_event(Event({
            blocking = true,
            func = function()
                local buff_type = pseudorandom('homeys_doney', 2)
                sendDebugMessage("Homey's Doney triggered, roll: " .. tostring(buff_type), "mills")
    
                if buff_type == 1 then
                    ease_hands_played(1)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = '+1 Hand', colour = G.C.CHIPS})
                else
                    ease_discard(1)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = '+1 Discard', colour = G.C.MULT})
                end
                play_sound('mills_doh')
                return true
            end
        }))
    end,
}
SMODS.Booster {
    object_type = "Booster",
    key = "snack_pack",
    kind = "Snack",
    atlas = 'snack_pack',
    pos = {
         x = 0, 
         y = 0 
        },
    config = {
        extra = 4, 
        choose = 1 },
    cost = 4,
    order = 1,
    weight = 1,
    draw_hand = true,
    create_card = function(self, card)
        -- Get all consumables from the Snack set
        local snack_keys = {}
        for k, v in pairs(G.P_CENTERS) do
            if v.set == 'Snack' then
                table.insert(snack_keys, k)
            end
        end
         -- Randomly pick a snack key
    local random_key = snack_keys[math.random(#snack_keys)]
    -- Create a Snack card using that random key
    return create_card("Snack", G.pack_cards, nil, nil, true, true, nil, random_key)
end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Snack)
        ease_background_colour({ new_colour = G.C.SET.Snack, special_colours = true })
    end,

    -- Handle localized text variables
    loc_vars = function(self, info_queue, card)
        return { vars = {card.config.choose, G.P_CENTERS[card.config.center.key].name or ""} }
    end,

    -- Group key for organization
    group_key = "k_mills_snack_pack",
}

SMODS.Booster {
    object_type = "Booster",
    key = "snack_pack_jumbo",
    kind = "Snack",
    atlas = 'snack_pack_jumbo',
    pos = {
         x = 0, 
         y = 0 
        },
    config = {
        extra = 5, 
        choose = 1 },
    cost = 6,
    order = 1,
    weight = .8,
    draw_hand = true,
    create_card = function(self, card)
        -- Get all consumables from the Snack set
        local snack_keys = {}
        for k, v in pairs(G.P_CENTERS) do
            if v.set == 'Snack' then
                table.insert(snack_keys, k)
            end
        end
         -- Randomly pick a snack key
    local random_key = snack_keys[math.random(#snack_keys)]
    -- Create a Snack card using that random key
    return create_card("Snack", G.pack_cards, nil, nil, true, true, nil, random_key)
end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Snack)
        ease_background_colour({ new_colour = G.C.SET.Snack, special_colours = true })
    end,

    -- Handle localized text variables
    loc_vars = function(self, info_queue, card)
        return { vars = {card.config.choose, G.P_CENTERS[card.config.center.key].name or ""} }
    end,

    -- Group key for organization
    group_key = "k_mills_snack_pack",
}
SMODS.Booster {
    object_type = "Booster",
    key = "snack_pack_mega",
    kind = "Snack",
    atlas = 'snack_pack_mega',
    pos = {
         x = 0, 
         y = 0 
        },
    config = {
        extra = 6, 
        choose = 2 },
    cost = 8,
    order = 1,
    weight = .6,
    draw_hand = true,
    create_card = function(self, card)
        -- Get all consumables from the Snack set
        local snack_keys = {}
        for k, v in pairs(G.P_CENTERS) do
            if v.set == 'Snack' then
                table.insert(snack_keys, k)
            end
        end
         -- Randomly pick a snack key
    local random_key = snack_keys[math.random(#snack_keys)]
    -- Create a Snack card using that random key
    return create_card("Snack", G.pack_cards, nil, nil, true, true, nil, random_key)
end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.SET.Snack)
        ease_background_colour({ new_colour = G.C.SET.Snack, special_colours = true })
    end,

    -- Handle localized text variables
    loc_vars = function(self, info_queue, card)
        return { vars = {card.config.choose, G.P_CENTERS[card.config.center.key].name or ""} }
    end,

    -- Group key for organization
    group_key = "k_mills_snack_pack",
}

SMODS.Tag {
	object_type = "Tag",
	--atlas = 'nom',
	name = "mills-nomtag",
	pos = { x = 0, y = 0 },
	config = { type = "new_blind_choice" },
	key = "nomtag",
	min_ante = 2,
	loc_vars = function(self, info_queue)
		info_queue[#info_queue + 1] = { set = "Other", key = "p_mills_snack_pack", specific_vars = { 2, 6 } }
		return { vars = {} }
	end,
	apply = function(self, tag, context)
		if context.type == "new_blind_choice" then
			tag:yep("+", G.C.SECONDARY_SET.Code, function()
				local key = "p_mills_snack_pack_mega"
				local card = Card(
					G.play.T.x + G.play.T.w / 2 - G.CARD_W * 1.27 / 2,
					G.play.T.y + G.play.T.h / 2 - G.CARD_H * 1.27 / 2,
					G.CARD_W * 1.27,
					G.CARD_H * 1.27,
					G.P_CARDS.empty,
					G.P_CENTERS[key],
					{ bypass_discovery_center = true, bypass_discovery_ui = true }
				)
				card.cost = 0
				card.from_tag = true
				G.FUNCS.use_card({ config = { ref_table = card } })
				card:start_materialize()
				return true
			end)
			tag.triggered = true
			return true
		end
	end,
  in_pool = function()
		return false
	end
}
--––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––

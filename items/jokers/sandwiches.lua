SMODS.Joker {
    object_type = "Joker",
    name = "mills-gloopwich",
    key = "gloopwich",
    config = {},
    atlas = 'gloopwich',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 3,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, context)
        if context.scoring_hand and context.full_hand then
            local has_mult = false
            local has_wild = false

            for _, card in ipairs(context.full_hand) do 
                if card.ability then
                    if card.ability.mult then has_mult = true end
                    if card.ability.wild then has_wild = true end
                end
            end

            if has_wild and has_mult then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for _, card in ipairs(context.full_hand) do
                            local current = card.edition or {}
                            local next_edition = nil

                            --Edition Upgrade Logic
                            if not e.foil and not e.holo and not e.polychrome and not e.negative then
                                next_edition = { foil = true }
                            elseif e.foil and not e.holo and not e.negative and not e.polychrome then
                                next_edition = { holo = true }
                            elseif e.holo and not e.negative and not e.polychrome then
                                next_edition = { negative = true }
                            elseif e.negative and not e.polychrome then
                                next_edition = { polychrome = true }
                            end

                            if next_edition then
                                card:set_edition(next_edtion, true)
                                card:juice_up(0.5)
                            end
                        end
                        play_sound('talisman2', 1.05)
                        return true
                    end
                }))
            end 
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-everlasting_pollenstopper",
    key = "everlasting_pollenstopper",
    config = {},
    atlas = 'everlasting_pollenstopper',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 3,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, context)
        if context.scoring_hand and context.full_hand then
            local has_glass = false
            local has_lucky = false

            for _, card in ipairs(context.full_hand) do 
                if card.ability then
                    if card.ability.glass then has_glass = true end
                    if card.ability.lucky then has_lucky = true end
                end
            end
            if has_glass and has_lucky then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_card = create_card('Spectral', G.consumeables, nil, nil, true, true)
                        if new_card then
                            new_card:set_edition({ negative = true }, true)
                            G.consumeables:emplace(new_card)
                            new_card:start_materialize()
                            play_sound('talisman2', 1.1)
                        end
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-golden_cruch",
    key = "golden_crunch",
    config = {},
    atlas = 'golden_crunch',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 3,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, context)
        if context.scoring_hand and context.full_hand then
            local has_lucky = false
            local has_bonus = false

            for _, card in ipairs(context.full_hand) do 
                if card.ability then
                    if card.ability.lucky then has_lucky = true end
                    if card.ability.bonus then has_bonus = true end
                end
            end
            if has_lucky and has_bonus then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local seals = { "red", "blue", "gold", "purple" } 

                        for _, card in ipairs(context.full_hand) do
                            local seal = pseudorandom_element(seals, pseudoseed("golden_crunch", card))
                            card:set_seal(seal)
                            card:juice_up(0.5)
                        end

                        play_sound("talisman2", 1.1)
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-flayfluff_sub",
    key = "flayfluff_sub",
    config = {},
    atlas = 'flayfluff_sub',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 3,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, context)
        if context.scoring_hand and context.full_hand then
            local has_glass = false
            local has_wild = false

            for _, card in ipairs(context.full_hand) do 
                if card.ability then
                    if card.ability.glass then has_glass = true end
                    if card.ability.wild then has_wild = true end
                end
            end
            if has_glass and has_wild then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local new_joker = create_card("Joker", G.jokers, nil, nil, true, true)
                        if new_joker then
                            new_joker:set_edition({ negative = true }, true)
                            G.jokers:emplace(new_joker)
                            new_joker:start_materialize()
                            play_sound('talisman2', 1.1)
                        end
                        return true
                    end
                }))
            end
        end
    end
}
SMODS.Joker {
    object_type = "Joker",
    name = "mills-mr_pb_and_jelly",
    key = "mr_pb_and_jelly",
    config = {},
    atlas = 'mr_pb_and_jelly',
    pos = {
        x = 0,
        y = 0
    },
    rarity = 3,
    in_pool = function(self, args)
        return false
    end,
    unlocked = true, 
    discovered = true, 
    blueprint_compat = true, 
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, context)
        if context.scoring_hand and context.full_hand then
            local has_mult = false
            local has_bonus = false

            for _, card in ipairs(context.full_hand) do 
                if card.ability then
                    if card.ability.mult then has_mult = true end
                    if card.ability.bonus then has_bonus = true end
                end
            end
            if has_mult and has_bonus then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local snack_card = create_card("Snack", G.consumeables, nil, nil, true, true)
                        if snack_card then
                            snack_card:set_edition({ negative = true }, true)
                            G.consumeables:emplace(snack_card)
                            snack_card:start_materialize()
                            play_sound('talisman2', 1.15)
                        end
                        return true
                    end
                }))
            end
        end
    end
}

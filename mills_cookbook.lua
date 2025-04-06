
-- Atlas Creation for cards
SMODS.Atlas {
    key = "pepper_jokers",
    path = "pepper_jokers.png",
    px = 71, --Sizing of jokers in 1x
    py = 95
}
-- JOKERS
SMODS.Joker {
    key = 'pimento_pepper',
    loc_txt = {
        name = 'Pimento Pepper',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!" 
        }
    },
    config = {extra = {mult = 0}, levels = 0}, 
    rarity = 1,
    atlas = 'pepper_jokers',
    pos = {x = 6, y = 0 },
    cost = 4,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 3
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Tangy!',
                colour = G.C.MULT,
                mult_mod = 3,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                local new_card = G.jokers:add("anaheim_chile")
                    if new_card then
                        new_card.ability.extra.mult = card.ability.extra.mult or 0
                        new_card.ability.levels = card.ability.levels or 0
                    end
                G.jokers:remove(card)
                result.message = "Level Up!"
                result.colour = G.C.RARE
            end

            return result
        end
    end
}

SMODS.Joker {
    key = 'anaheim_chile',
    loc_txt = {
        name = 'Anaheim Chile',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!" 
        }
    },
    config = {extra = {mult = 0}, levels = 0}, 
    atlas = 'pepper_jokers',
    pos = {x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            card = card
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 5
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Piquant!',
                colour = G.C.MULT,
                mult_mod = 5,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                local new_card = G.jokers:add("jalapeno")
                    if new_card then
                        new_card.ability.extra.mult = card.ability.extra.mult or 0
                        new_card.ability.levels = card.ability.levels or 0
                    end
                G.jokers:remove(card)
                result.message = "Level Up!"
                result.colour = G.C.RARE
            end

            return result
        end
    end
}

SMODS.Joker {
    key = 'jalapeno',
    loc_txt = {
        name = 'Jalapeno',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!" 
        }
    },
    config = {extra = {mult = 0}, levels = 0}, 
    atlas = 'pepper_jokers',
    pos = {x = 2, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            card = card
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 7
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Spicy!',
                colour = G.C.MULT,
                mult_mod = 7,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                local new_card = G.jokers:add("cayenne")
                    if new_card then
                        new_card.ability.extra.mult = card.ability.extra.mult or 0
                        new_card.ability.levels = card.ability.levels or 0
                    end
                G.jokers:remove(card)
                result.message = "Level Up!"
                result.colour = G.C.RARE
            end

            return result
        end
    end
}

SMODS.Joker {
    key = 'cayenne',
    loc_txt = {
        name = 'Cayenne',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!" 
        }
    },
    config = {extra = {mult = 0}, levels = 0}, 
    atlas = 'pepper_jokers',
    pos = {x = 2, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            card = card
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 10
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Fiery!',
                colour = G.C.MULT,
                mult_mod = 10,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                local new_card = G.jokers:add("habanero")
                    if new_card then
                        new_card.ability.extra.mult = card.ability.extra.mult or 0
                        new_card.ability.levels = card.ability.levels or 0
                    end
                G.jokers:remove(card)
                result.message = "Level Up!"
                result.colour = G.C.RARE
            end

            return result
        end
    end
}

SMODS.Joker {
    key = 'habanero',
    loc_txt = {
        name = 'Habanero',
        text = {
           "When a {C:attention}Flush{} or {C:attention}Full House{} is played",
            "this Joker gains {C:mult}+#1#{} Mult",
            "Every {C:attention}2nd{} activation levels up Spicyness!" 
        }
    },
    config = {extra = {mult = 0}, levels = 0}, 
    atlas = 'pepper_jokers',
    pos = {x = 4, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            card = card
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.extra.mult = card.ability.extra.mult + 25
            card.ability.levels = (card.ability.levels or 0) + 1

            local result = {
                message = 'Sizziling!',
                colour = G.C.MULT,
                mult_mod = 25,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                local new_card = G.jokers:add("ghost_pepper")
                    if new_card then
                        new_card.ability.extra.mult = 100
                        new_card.ability.levels = 0
                    end
                G.jokers:remove(card)
                result.message = "Level Up!"
                result.colour = G.C.XMULT
            end

            return result
        end
    end
}

SMODS.Joker {
    key = 'ghost_pepper',
    loc_txt = {
        name = 'Ghost Pepper',
        text = {
           "Adds {C:mult}+100{} Mult and doubles your current Mult on {C:attention}Flush{} or {C:attention}Full House{}.",
            "Levels up after {C:attention}3{} infernos.",
            "Every {C:attention}2nd{} activation levels up Spicyness!" 
        }
    },
    config = {extra = {mult = 0}, levels = 0}, 
    atlas = 'pepper_jokers',
    pos = {x = 3, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            mult = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } },
            card = card
          }
        end

        if context.before and (context.poker_hands["Flush"] or context.poker_hands["Full House"]) then
            card.ability.levels = (card.ability.levels or 0) + 1
            local base_mult = G.GAME.round_reserve.mult
            local final_mult = (base_mult * 2) + 100

            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_mult(self, base_mult, final_mult, 0.5, 'easeOutCubic')
                    G.GAME.round_reserve.mult = final_mult
                    return true
                end
            }))

            local result = {
                message = 'Scorching!',
                colour = G.C.XMULT,
                mult_mod = final_mult - base_mult,
                card = card
            }

            if card.ability.levels >= 2 then
                card.ability.levels = 0
                local new_card = G.jokers:add("carolina_reaper")
                    if new_card then
                        new_card.ability.extra.mult = 0
                        new_card.ability.levels = 0
                    end
                G.jokers:remove(card)
                result.message = "Reaper Is Born!"
                result.colour = G.C.IMPORTANT
            end

            return result
        end
    end
}

SMODS.Joker {
    key = 'carolina_reaper',
    loc_txt = {
        name = 'Carolina Reaper',
        text = {
           "Applies {C:xmult}^2{} Mult to your total Mult each hand."
        }
    },
    config = {extra = {}, levels = 0}, 
    atlas = 'pepper_jokers',
    pos = {x = 5, y = 0 },
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = {"^2"} }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
        return {
            message = "^2",
            colour = G.C.XMULT,
            card = card
          }
        end

        if context.before then
            local base_mult = G.GAME.round_reserve.mult
            local final_mult = math.max(0, base_mult ^ 2)

            G.E_MANAGER:add_event(Event({
                func = function()
                    ease_mult(self, base_mult, final_mult, 0.5, 'easeOutCubic')
                    G.GAME.round_reserve.mult = final_mult
                    return true
                end
            }))
            
            local result = {
                message = ' Death -_- ',
                mult_mod = final_mult - base_mult,
                colour = G.C.XMULT,
                card = card
            }
        end
    end
}

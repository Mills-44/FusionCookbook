SMODS.Joker {
    key = 'ghost_pepper',
    config = {
        extra = {
            mult = 100,
            Xmult = 2
        }, 
        levels = 0
    },
    atlas = 'pepper_jokers',
    pos = { 
        x = 5, 
        y = 0 },
    soul_pos = { 
        x = 5, 
        y = 1 },
    rarity = 3,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    loc_txt = {
        name = 'Ghost Pepper',
        text = {
           "Gives {C:mult}+125{} Mult and doubles your current Mult,",
            "On {C:attention}Flush{} or {C:attention}Full Houses{} Level up and after {C:attention}5{} infernos.",
            "The {C:attention}5th{} level activates Pain!",
            "{C:inactive}Total Mult: {C:mult}+#2#{}",
            "{X:gold,C:blue} Art By gfsg "
        }
    },
    loc_vars = function(self, info_queue, card)
        local total = card.ability.extra.mult + (G.GAME and G.GAME.hands and G.GAME.hands.mult or 1) * (card.ability.extra.Xmult - 1)
        return { 
            vars = {
                card.ability.extra.mult or 125,
                math.floor(total)
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and not context.before then
            return {
                message = '+125 Mult!',
                colour = G.C.MULT,
                mult_mod = card.ability.extra.mult or 0,
                message2 = 'X2 Mult!',
                colour2 = G.C.MULT,
            }
        end
        if context.before and context.scoring_name and (context.scoring_name == "Flush" or context.scoring_name == "Full House") then
            card.ability.levels = (card.ability.levels or 0) + 1
            G.E_MANAGER:add_event(Event({
                func = function()
                    play_sound('mills_scorching')
                    return true
                end
            }))
            local result = {
                message = 'Scorching!',
                colour = G.C.MULT,
                card = card
            }
            if card.ability.levels >= 5 then
                card.ability.levels = 0
                G.E_MANAGER:add_event(Event({
                    func = function()
                        for i, c in ipairs(G.jokers.cards) do
                            if c == card then
                                table.remove(G.jokers.cards, i)
                                break
                            end
                        end
                        local newcard = SMODS.add_card {
                            set = 'Joker',
                            area = G.jokers,
                            key = 'j_mills_carolina_reaper'
                        }
                        newcard.ability.extra.mult = card.ability.extra.mult
                        return true
                    end
                }))
            end
        end
    end
}
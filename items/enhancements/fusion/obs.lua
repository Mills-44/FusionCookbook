
local oldstartdissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    if SMODS.has_enhancement(self, "m_mills_obs") then return nil end
    return oldstartdissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
end

local oldshatter = Card.shatter
function Card:shatter()
    if SMODS.has_enhancement(self, "m_mills_obs") then return nil end
    return oldshatter(self)
end


SMODS.Enhancement {
    key = "obs",
    name = "Obsidian",
    atlas = "enhanc_fus",
    replace_base_card = true,
    pos = {
    x = 5,
    y = 3
},
    config = {extra = {x_mult = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.x_mult}}
end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return { x_mult = card.ability.extra.x_mult }
        end
        
end
}

local oldstartdissolve = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
    if SMODS.has_enhancement(self, "m_mills_obsidian") then return nil end
    return oldstartdissolve(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
end

local oldshatter = Card.shatter
function Card:shatter()
    if SMODS.has_enhancement(self, "m_mills_obsidian") then return nil end
    return oldshatter(self)
end


SMODS.Enhancement {
    key = "obsidian",
    name = "Obsidian",
    atlas = "enhanc_fus",
    replace_base_card = true,
    no_suit = true,
    no_rank = true,
    always_scores = true,
    pos = {
    x = 5,
    y = 3
},
    in_pool = function(self, args)
        return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {x_mult = 2}},
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.x_mult}}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Glass + Stone", 
        MILLS.COLORS.FUSION, 
        G.C.WHITE, 
        1.0 )
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return { 
                x_mult = card.ability.extra.x_mult 
            }
        end
        
end
}
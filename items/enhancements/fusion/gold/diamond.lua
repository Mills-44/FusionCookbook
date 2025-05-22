SMODS.Enhancement {
    key = "diamond",
    atlas = "enhanc_fus",
    pos = {
    x = 6, 
    y = 3
},
in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {
        p_dollars = 0,
        odd = 3,
        odds = 8
    }},
    loc_vars = function(self, info_queue, card)
        return {
        vars={
        card.ability.extra.p_dollar,
        format_ui_value(G.GAME.dollars) or 0,
        (G.GAME.probabilities.normal or 1),
        card.ability.extra.odd,
        card.ability.extra.odds
    
    }}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Gold + Glass", 
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
       if (pseudorandom('dia_odd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
            return {
                dollars = (tonumber(format_ui_value(G.GAME.dollars))),
            }
            end
         if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and (pseudorandom('dia_odds') < G.GAME.probabilities.normal/card.ability.extra.odds) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = .3,
            func = function()
            card:shatter()
            return true
            end
        }))
        end
    end
end
}
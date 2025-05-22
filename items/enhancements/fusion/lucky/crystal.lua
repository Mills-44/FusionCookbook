SMODS.Enhancement {
    key = "crystal",
    atlas = "enhanc_fus",
    pos = {
    x = 7, 
    y = 3
},
in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {
        odd_good = 4,
        odd_bad = 10,
        odd_break = 2,
        p_dollars = 50
    }},
    loc_vars = function(self, info_queue, card)
        return {
        vars={
            (G.GAME.probabilities.normal or 1),
            card.ability.extra.odd_good,
            card.ability.extra.odd_bad,
            card.ability.extra.p_dollars,
            card.ability.extra.odd_break
        }}
end,
set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Lucky + Glass", 
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
             if (pseudorandom('crystal_odd_good') < G.GAME.probabilities.normal / card.ability.extra.odd_good) then
                return {
                    xmult = 2
                }
             end
             if (pseudorandom('crystal_odd_bad') < G.GAME.probabilities.normal / card.ability.extra.odd_bad) then
                return {
                    xmult = .5
                }             
            end
        end
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and (pseudorandom('crystal_odd_break') < G.GAME.probabilities.normal/card.ability.extra.odd_break) then
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = .3,
            func = function()
            card:shatter()
            return true
            end
        }))
        ease_dollars(50)
    end
end
}
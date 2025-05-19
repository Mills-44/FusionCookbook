SMODS.Enhancement {
    key = "dia",
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
        odd = 4,
        odds = 8
    }},
    loc_vars = function(self, info_queue, card)
        return {vars={
        card.ability.extra.p_dollar,
        format_ui_value(G.GAME.dollars) or 0,
        (G.GAME.probabilities.normal or 1),
        card.ability.extra.odd,
        card.ability.extra.odds
    
    }}
end,
    calculate = function(self, card, context)
          if context.cardarea and context.main_scoring == G.play then
            if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and (pseudorandom('glass') < G.GAME.probabilities.normal/card.ability.extra.odds) then
                return { 
                        remove = true 
                                    }
            end
            if (pseudorandom('dollarodd') < G.GAME.probabilities.normal / card.ability.extra.odd) then
                return {
                p_dollars = tonumber(format_ui_value(G.GAME.dollars)) or 0
                }
        
        end
    end
end
}
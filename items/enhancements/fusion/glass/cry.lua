SMODS.Enhancement {
    key = "cry",
    atlas = "enhanc_fus",
    pos = {
    x = 7, 
    y = 3
},
in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {
        odd = 5,
        odds = 10,
        oddy = 15,
        x_mult = 3,
        p_dollars = 50
    }},
    loc_vars = function(self, info_queue, card)
        return {vars={
            card.ability.extra.odd,
            card.ability.extra.odds,
            card.ability.extra.oddy,
            card.ability.extra.x_mult,
            card.ability.extra.p_dollars
        }}
end,
    calculate = function(self, card, context)
        
end
}
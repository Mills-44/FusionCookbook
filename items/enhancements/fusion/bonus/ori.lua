SMODS.Enhancement {
    key = "ori",
    atlas = 'enhanc_fus',
    pos = {
        x = 6, 
        y = 0
    },
    in_pool = function(self, args)
      return not args or not args.source or (args.source ~= 'sho' and args.source ~= 'sta')
end,
    config = {extra = {h_dollars = 5}},
    loc_vars = function(self, info_queue, card)
        return {
            vars={
            card.ability.extra.h_dollars, 
            format_ui_value(G.GAME.dollars)or 0
        }
    }
    end,
    set_badges = function(self, card, badges)
        badges[#badges+1] = create_badge(
        "Art: Rafaelly", 
        MILLS.COLORS.ART, 
        G.C.WHITE, 
        1.2 )
    end,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.main_scoring then
            return {
                chips = tonumber(format_ui_value(G.GAME.dollars)) or 0,
                card = card
            }
        end
            if context.individual and context.cardarea == G.hand and not context.end_of_round then
               return {
                dollars = card.ability.extra.h_dollars
            }
            end
        end
}